package com.plantshop.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDBBean {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private ReviewDBBean () {};
	
	private static ReviewDBBean instance = new ReviewDBBean();
	
	public static ReviewDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/plantshop");
		return ds.getConnection(); 
	}
	
	private void close(Connection conn, Statement st) {
		if(st != null) try {st.close();} catch(Exception e) { e.printStackTrace();}
		if(conn != null) try {conn.close();} catch(Exception e) { e.printStackTrace();}
	}
	
	private void close(Connection conn, Statement st, ResultSet rs) {
		if(rs != null) try {rs.close();} catch(Exception e) { e.printStackTrace();}
		if(st != null) try {st.close();} catch(Exception e) { e.printStackTrace();}
		if(conn != null) try {conn.close();} catch(Exception e) { e.printStackTrace();}
	}
	
//	**************************************************************
	// SQL 문
	
	public int getReviewCount(int pid) {
		int cnt = -1;
		try {
			conn = this.getConnection();
			sql = "select count(*) as count from review where pid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getReviewCount() 메소드 오류");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	public int insertReview(ReviewDataBean article) {
		int check = -1;
		try {
			conn = this.getConnection();
			sql = "insert into review(name, inputdate, subject, content, pid) values(?, ?, ?, ?, ?)"; // auto_increment사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getName());
			pstmt.setString(2, article.getInputdate());
			pstmt.setString(3, article.getSubject()); 
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getPid());
			check = pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getReviewCount() 메소드 오류");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	public List<ReviewDataBean> getReviewList(int pid, int startRow, int pageSize) {
		List<ReviewDataBean> reviewList = new ArrayList<ReviewDataBean>();
		try {
			conn = this.getConnection();
			sql = "select * from review where pid="+pid+" order by id limit ?, ?"; // 몇번부터 몇개, limit는 0번부터 시작 // p.188 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); // 1-1, 4-1
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewDataBean review = new ReviewDataBean();
				review.setId(rs.getInt("id"));
				review.setName(rs.getString("name"));
				review.setInputdate(rs.getString("inputdate"));
				review.setSubject(rs.getString("subject"));
				review.setContent(rs.getString("content"));
				review.setPid(rs.getInt("pid"));
				
				reviewList.add(review);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getReviewList() 메소드 오류");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return reviewList;
	}
	
	
}
