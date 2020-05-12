package com.plantshop.freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FreeBoardDBBean {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private FreeBoardDBBean () {}
	
	private static FreeBoardDBBean instance = new FreeBoardDBBean();
	
	public static FreeBoardDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/plantshop");
		return ds.getConnection();
	}
	
	private void close(Connection conn, PreparedStatement st) {
		if(st != null) try {st.close();} catch(Exception e) { e.printStackTrace();}
		if(conn != null) try {conn.close();} catch(Exception e) { e.printStackTrace();}
	}
	
	private void close(Connection conn, PreparedStatement st, ResultSet rs) {
		if(rs != null) try {rs.close();} catch(Exception e) { e.printStackTrace();}
		if(st != null) try {st.close();} catch(Exception e) { e.printStackTrace();}
		if(conn != null) try {conn.close();} catch(Exception e) { e.printStackTrace();}
	}
	
//	**************************************************************
	
	// Q&A 글이 있는지 확인
	public Boolean getFreeBoardCheck(FreeBoardDataBean article) {
		Boolean flag = false;
		try {
			conn = this.getConnection();
			sql =  "select * from freeboard where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			} else {
				flag = false;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoardCheck() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return  flag;
	}
	
	// Q&A 전체글의 수를 획득	
	public int getFreeBoardAllCount() {
		int cnt = 0;
		try {
			conn = this.getConnection();
			sql = "select count(*) as count from freeboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count"); 
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoardCount() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	// Q&A 검색어에 따른 전체글의 수를 획득
	public int getFreeBoardConditionCount(String condition) {
		int cnt = 0;
		try {
			conn = this.getConnection();
			sql = "select count(*) as count from freeboard " + condition;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count"); 
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoardCount() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	// Q&A 글 쓰기
	public int writeFreeBoard(FreeBoardDataBean article) {
		int check = -1;
		int id = -1;
		try {
			conn = this.getConnection();
			
			sql = "select ifnull(max(id), 0)+1 as maxid from freeboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int maxId = rs.getInt("maxid");
				
				sql = "insert into freeboard(id, name, password, email, subject, content, inputdate, masterid)"
						+ " values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, maxId);
				pstmt.setString(2, article.getName());
				pstmt.setString(3, article.getPassword());
				pstmt.setString(4, article.getEmail());
				pstmt.setString(5, article.getSubject());
				pstmt.setString(6, article.getContent());
				pstmt.setString(7, article.getInputdate());
				pstmt.setInt(8, maxId);
				
				check = pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> insertFreeBoard() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	// Q&A 댓글 쓰기
	public int replyWriteFreeBoard(FreeBoardDataBean article) {
		int check1 = -1;
		int check2 = -1;
		int replyNum = article.getReplynum();
		int step = article.getStep();
		try {
			conn = this.getConnection();
			
			sql = "select ifnull(max(id), 0)+1 as maxid from freeboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println("\n************* 댓글 ***************\n" + article);
			
			if(rs.next()) {
				int maxId = rs.getInt("maxid");
				
				// 답글일 때, num가 0이 아닐 때, masterid는 원글(제목글)에 대한 값임. 
				pstmt = conn.prepareStatement("update freeboard set replynum=replynum + 1 where masterid = ? and replynum > ?");
				pstmt.setInt(1, article.getMasterid());
				pstmt.setInt(2, replyNum);
				check1 = pstmt.executeUpdate();
				
				System.out.println("업데이트 : " + check1 + "\n***********\n");
				replyNum += 1;
				step += 1;
				
				if(check1 >= 0) {
					sql = "insert into freeboard(id, name, password, email, subject, content, inputdate, masterid, replynum, step)" 
							 + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, maxId);
					pstmt.setString(2, article.getName());
					pstmt.setString(3, article.getPassword());
					pstmt.setString(4, article.getEmail());
					pstmt.setString(5, article.getSubject());
					pstmt.setString(6, article.getContent());
					pstmt.setString(7, article.getInputdate());
					pstmt.setInt(8, article.getMasterid()); // 원글
					pstmt.setInt(9, replyNum); // 댓글 번호
					pstmt.setInt(10, step); // 댓글 단계
					check2 = pstmt.executeUpdate();
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> replyWriteFreeBoard() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check2;
	}
	
	// Q&A 글 수정
	public int updateFreeBoard(FreeBoardDataBean article) {
		int check = -1; 
		try {
			conn = this.getConnection();
			sql = "update freeboard set name=?, email=?, subject=?, content=? where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getId());
			pstmt.setString(6, article.getPassword());
			
			check = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> updateFreeBoard() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	// Q&A 글 삭제
	public int deleteFreeBoard(FreeBoardDataBean article) {
		int check = -1;
		try {
			conn = this.getConnection();
			sql = "delete from freeboard where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article.getId());
			pstmt.setString(2, article.getPassword());
			
			check = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> deleteFreeBoard() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	// Q&A 글 자세히 보기 
	public FreeBoardDataBean getFreeBoard(int id) {
		FreeBoardDataBean freeBoard = new FreeBoardDataBean();
		try {
			conn = this.getConnection();
			sql = "update freeboard set readcount = readcount+1 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
			sql = "select * from freeboard where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				freeBoard.setId(rs.getInt("id"));
				freeBoard.setName(rs.getString("name"));
				freeBoard.setPassword(rs.getString("password"));
				freeBoard.setEmail(rs.getString("email"));
				freeBoard.setSubject(rs.getString("subject"));
				freeBoard.setContent(rs.getString("content"));
				freeBoard.setInputdate(rs.getString("inputdate"));
				freeBoard.setMasterid(rs.getInt("masterid"));
				freeBoard.setReadcount(rs.getInt("readcount"));
				freeBoard.setReplynum(rs.getInt("replynum"));
				freeBoard.setStep(rs.getInt("step"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoard() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return freeBoard;
	}
	
	// Q&A 전체 글 획득	
	public List<FreeBoardDataBean> getFreeBoardList(int startRow, int pageSize){
		List<FreeBoardDataBean> freeBoardList = new ArrayList<FreeBoardDataBean>();
		try {
			conn = this.getConnection();
			sql = "select * from freeboard order by masterid desc, replynum asc, step asc limit ?, ?"; // 몇번부터 몇개, limit는 0번부터 시작 // p.188
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FreeBoardDataBean freeBoard = new FreeBoardDataBean();
				freeBoard.setId(rs.getInt("id"));
				freeBoard.setName(rs.getString("name"));
				freeBoard.setPassword(rs.getString("password"));
				freeBoard.setEmail(rs.getString("email"));
				freeBoard.setSubject(rs.getString("subject"));
				freeBoard.setContent(rs.getString("content"));
				freeBoard.setInputdate(rs.getString("inputdate"));
				freeBoard.setMasterid(rs.getInt("masterid"));
				freeBoard.setReadcount(rs.getInt("readcount"));
				freeBoard.setReplynum(rs.getInt("replynum"));
				freeBoard.setStep(rs.getInt("step"));
				
				freeBoardList.add(freeBoard);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoardList() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return freeBoardList;
	}
	
	// Q&A 검색어에 따른 전체 글 획득
	public List<FreeBoardDataBean> getFreeBoardSearch(String condition, int startRow, int pageSize) {
		List<FreeBoardDataBean> freeBoardList = new ArrayList<FreeBoardDataBean>();
		try {
			conn = this.getConnection();
			sql = "select * from freeboard " + condition + " order by masterid desc, replynum, step, id limit ?, ?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FreeBoardDataBean freeBoard = new FreeBoardDataBean();
				freeBoard.setId(rs.getInt("id"));
				freeBoard.setName(rs.getString("name"));
				freeBoard.setPassword(rs.getString("password"));
				freeBoard.setEmail(rs.getString("email"));
				freeBoard.setSubject(rs.getString("subject"));
				freeBoard.setContent(rs.getString("content"));
				freeBoard.setInputdate(rs.getString("inputdate"));
				freeBoard.setMasterid(rs.getInt("masterid"));
				freeBoard.setReadcount(rs.getInt("readcount"));
				freeBoard.setReplynum(rs.getInt("replynum"));
				freeBoard.setStep(rs.getInt("step"));
				
				freeBoardList.add(freeBoard);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getFreeBoardSearch() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return freeBoardList;
	}
	
}
