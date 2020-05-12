package com.plantshop.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.plantshop.product.ProductDataBean;

public class CartDBBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String sql = null;
	
	private CartDBBean() {}
	
	private static CartDBBean instance = new CartDBBean();
	
	public static CartDBBean getInstance() {
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
	
	// 장바구니 물건 넣기
	public int insertCart(String login_id, int qty, ProductDataBean product) {
		int check = -1; 
		try {
			conn = this.getConnection();
			// maxCartNo 생성
			sql = "select ifnull(max(cartno), 0)+1 from cart where uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int maxCartNo = rs.getInt(1);
				
				// 상품번호가 cart 테이블에 존재하는지  여부를 확인 // - 상품명이 같아도 cart에 넣을 수 있게 db_pid로 구분
				sql = "select * from cart where pid=? and uid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, product.getId());
				pstmt.setString(2, login_id);
				rs2 = pstmt.executeQuery();
				
				if(rs2.next()) { // 상품번호가 cart 테이블에 존재한다면 수량만 수정함 
					sql = "update cart set quantity=quantity+? where pid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, qty);
					pstmt.setInt(2, rs2.getInt("pid"));
					
					check = pstmt.executeUpdate(); 
				} else { // 상품명이 cart 테이블에 존재하지 않는 다면 추가함
					sql = "insert into cart(cartno, uid, pid, pname, sname, quantity, price, small) values(?, ?, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, maxCartNo);
					pstmt.setString(2, login_id);
					pstmt.setInt(3, product.getId());
					pstmt.setString(4, product.getPname());
					pstmt.setString(5, product.getSname());
					pstmt.setInt(6, qty);
					
					// 할인가가 없으면 정가로 카트에 담기
					if(product.getDownprice() == 0) {
						pstmt.setInt(7, product.getPrice());	
					} else {
						pstmt.setInt(7, product.getDownprice());
					}
					
					pstmt.setString(8, product.getSmall_img());
					
					check = pstmt.executeUpdate();
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("---> insertCart() 오류");
		}
		
		return check;
	}
	
	// 장바구니 물건 삭제
	public int deleteCart(String uid, int pid) {
		int check = -1;
		try {
			conn = this.getConnection();
			sql = "delete from cart where pid=? and uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, uid);
			check = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt);
		}
		
		return check;
	}
	
	// 장바구니 리스트 얻기
	public List<CartDataBean> getCartList(String uid, int pid) {
		List<CartDataBean> cartList = new ArrayList<CartDataBean>();
		try {
			conn = this.getConnection();
			if(pid != 0) { // 장바구니에서 상품하나만 가져오기
				sql = "select * from cart where pid=? and uid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				pstmt.setString(2, uid);
				
			} else { // 장바구니에서 모든 상품 가져오기
				sql = "select * from cart where uid=?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDataBean cart = new CartDataBean();
				cart.setCartno(rs.getInt("cartno"));
				cart.setUid(rs.getString("uid"));
				cart.setPid(rs.getInt("pid"));
				cart.setPname(rs.getString("pname"));
				cart.setSname(rs.getString("sname"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setPrice(rs.getInt("price"));
				cart.setSmall(rs.getString("small"));
				
				cartList.add(cart);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return cartList;
	}
	
	// 장바구니 수정
	public int updateCart(int quantity, int pid, String uid) {
		int check = -1;
		try {
			conn = this.getConnection();
			sql = "update cart set quantity=? where pid=? and uid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, pid);
			pstmt.setString(3, uid);
			check = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt);
		}
		
		return check;
	}
}
