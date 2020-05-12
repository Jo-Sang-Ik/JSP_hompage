package com.plantshop.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDBBean {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private ProductDBBean () {};
	
	private static ProductDBBean instance = new ProductDBBean();
	
	public static ProductDBBean getInstance() {
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
	
	// index.jsp - 베스트 셀러
	public List<ProductDataBean> getProductList_orderBy_desc(String order) {
		List<ProductDataBean> productList = new ArrayList<ProductDataBean>();
		try {
			conn = this.getConnection();
			stmt = conn.createStatement();
			// order by 오류로인해 Statement 객체 이용
			String sql = "select * from product where selling='y' order by " + order + " desc limit 0, 12";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProductDataBean product = new ProductDataBean();
				product.setId(rs.getInt("id"));
				product.setCategory(rs.getString("category"));
				product.setWname(rs.getString("wname"));
				product.setPname(rs.getString("pname"));
				product.setSname(rs.getString("sname"));
				product.setPrice(rs.getInt("price"));
				product.setDownprice(rs.getInt("downprice"));
				product.setInputdate(rs.getString("inputdate"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setSmall_img(rs.getString("small"));
				product.setImg1(rs.getString("img1"));
				product.setImg2(rs.getString("img2"));
				product.setImg3(rs.getString("img3"));
				product.setImg4(rs.getString("img4"));
				product.setSalecount(rs.getInt("salecount"));
				product.setMditem(rs.getString("mditem"));
				product.setSelling(rs.getString("selling"));
				
				productList.add(product);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getProductList_orderBy_desc() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return productList;
	}
	
	// index.jsp - 카테고리 별
	public List<ProductDataBean> getProductList_category(String category) {
		List<ProductDataBean> productList = new ArrayList<ProductDataBean>();
		try {
			conn = this.getConnection();
			
			// order by 오류로인해 Statement 객체 이용
			String sql = "select * from product where category like '" + category + "%' limit  0, 12";
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProductDataBean product = new ProductDataBean();
				product.setId(rs.getInt("id"));
				product.setCategory(rs.getString("category"));
				product.setWname(rs.getString("wname"));
				product.setPname(rs.getString("pname"));
				product.setSname(rs.getString("sname"));
				product.setPrice(rs.getInt("price"));
				product.setDownprice(rs.getInt("downprice"));
				product.setInputdate(rs.getString("inputdate"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setSmall_img(rs.getString("small"));
				product.setImg1(rs.getString("img1"));
				product.setImg2(rs.getString("img2"));
				product.setImg3(rs.getString("img3"));
				product.setImg4(rs.getString("img4"));
				product.setSalecount(rs.getInt("salecount"));
				product.setMditem(rs.getString("mditem"));
				product.setSelling(rs.getString("selling"));
				
				productList.add(product);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getProductList_category() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return productList;
	}
	
	// 상품 갯수 받기
	public int getProductCountCondition(String condition) {
		int cnt = -1;
		try {
			conn = getConnection();
			sql = "select count(*) as count from product" + condition; //DB로 부터 상품이 총 몇개인지 받아줌
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count");
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getProductCountCondition() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return cnt;
	}
	
	// 상품 조건 보기 
	public List<ProductDataBean> getProductListCondition(String condition, int startRow, int pageSize) {
		List<ProductDataBean> productList = new ArrayList<ProductDataBean>();
		try {
			conn = this.getConnection();
			
			sql = "select * from product " + condition + " limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); // 1-1, 4-1 = 0, 3 / 0번 부터 3개
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDataBean product = new ProductDataBean();
				product.setId(rs.getInt("id"));
				product.setCategory(rs.getString("category"));
				product.setWname(rs.getString("wname"));
				product.setPname(rs.getString("pname"));
				product.setSname(rs.getString("sname"));
				product.setPrice(rs.getInt("price"));
				product.setDownprice(rs.getInt("downprice"));
				product.setInputdate(rs.getString("inputdate"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setSmall_img(rs.getString("small"));
				product.setImg1(rs.getString("img1"));
				product.setImg2(rs.getString("img2"));
				product.setImg3(rs.getString("img3"));
				product.setImg4(rs.getString("img4"));
				product.setSalecount(rs.getInt("salecount"));
				product.setMditem(rs.getString("mditem"));
				product.setSelling(rs.getString("selling"));
				
				productList.add(product);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getProductListCondition() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return productList;
	}
	
	// 상품 디테일 보기 - product_detail.jsp
	public ProductDataBean getProduct(int id) {
		ProductDataBean product = null;
		try {
			conn = this.getConnection();
			sql = "select * from product where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductDataBean();
				product.setId(rs.getInt("id"));
				product.setCategory(rs.getString("category"));
				product.setWname(rs.getString("wname"));
				product.setPname(rs.getString("pname"));
				product.setSname(rs.getString("sname"));
				product.setPrice(rs.getInt("price"));
				product.setDownprice(rs.getInt("downprice"));
				product.setInputdate(rs.getString("inputdate"));
				product.setStock(rs.getInt("stock"));
				product.setDescription(rs.getString("description"));
				product.setSmall_img(rs.getString("small"));
				product.setImg1(rs.getString("img1"));
				product.setImg2(rs.getString("img2"));
				product.setImg3(rs.getString("img3"));
				product.setImg4(rs.getString("img4"));
				product.setSalecount(rs.getInt("salecount"));
				product.setMditem(rs.getString("mditem"));
				product.setSelling(rs.getString("selling"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getProduct() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return product;
	}
	
	public int insertProduct(ProductDataBean article) {
		int check = -1;
		try {
			conn = this.getConnection();
			sql = "select ifnull(max(id), 0)+1 as maxid from product where category=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getCategory());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int maxId = rs.getInt(1);
				System.out.println("진입 :" + maxId);
				
				sql = "insert into product(id, category, wname, pname, sname, price, downprice, inputdate, stock, "
						+ "small, description, img1, img2, img3, img4, mditem, selling)"; 
				sql += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, maxId);
				pstmt.setString(2, article.getCategory());
				pstmt.setString(3, article.getWname());
				pstmt.setString(4, article.getPname());
				pstmt.setString(5, article.getSname());
				pstmt.setInt(6, article.getPrice());
				pstmt.setInt(7, article.getDownprice()); 
				pstmt.setString(8, article.getInputdate());
				pstmt.setInt(9, article.getStock());
				pstmt.setString(10, article.getSmall_img());
				pstmt.setString(11, article.getDescription());
				pstmt.setString(12, article.getImg1());
				pstmt.setString(13, article.getImg2());
				pstmt.setString(14, article.getImg3());
				pstmt.setString(15, article.getImg4());
				pstmt.setString(16, article.getMditem());
				pstmt.setString(17, article.getSelling());
				check = pstmt.executeUpdate();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> insertProduct() 메소드 에러");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return check;
	}
	
	// 상품 수정
	public int updateProduct(ProductDataBean article) {
		int check = -1;
		try {
			conn = this.getConnection();
			System.out.println(article);
			sql = "update product set wname=?, pname=?, sname=?, price=?, downprice=?, stock=?, small=?, description=?,"
					+ " img1=?, img2=?, img3=?, img4=?, mditem=?, selling=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWname());
			pstmt.setString(2, article.getPname());
			pstmt.setString(3, article.getSname());
			pstmt.setInt(4, article.getPrice());
			pstmt.setInt(5, article.getDownprice()); 
			pstmt.setInt(6, article.getStock());
			pstmt.setString(7, article.getSmall_img());
			pstmt.setString(8, article.getDescription());
			pstmt.setString(9, article.getImg1());
			pstmt.setString(10, article.getImg2());
			pstmt.setString(11, article.getImg3());
			pstmt.setString(12, article.getImg4());
			pstmt.setString(13, article.getMditem());
			pstmt.setString(14, article.getSelling());
			pstmt.setInt(15, article.getId());
			
			check = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> updateProduct() 메소드 에러");
		} finally {
			this.close(conn, pstmt);
		}
		
		return check;
	}
	
}
