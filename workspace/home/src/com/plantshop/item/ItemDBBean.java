package com.plantshop.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ItemDBBean {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private ItemDBBean () {};
	
	private static ItemDBBean instance = new ItemDBBean();
	
	public static ItemDBBean getInstance() {
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
	
	public List<ItemDataBean> getItemList(int id) {
		List<ItemDataBean> itemList = new ArrayList<ItemDataBean>(); 
		try {
			conn = this.getConnection();
			sql = "select * from item where orderid=" + id + " order by itemno";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDataBean item = new ItemDataBean();
				item.setOrderid(rs.getInt("orderid"));
				item.setItemno(rs.getInt("itemno"));
				item.setProductid(rs.getInt("productid"));
				item.setPname(rs.getString("pname"));
				item.setQuantity(rs.getInt("quantity"));
				item.setPrice(rs.getInt("price"));
				
				itemList.add(item);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("--> getItemList() 메소드 오류!");
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return itemList;
	}
}
