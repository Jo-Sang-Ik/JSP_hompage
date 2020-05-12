package com.plantshop.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipcodeDBBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private ZipcodeDBBean() {}
	
	private static ZipcodeDBBean instance = new ZipcodeDBBean();
	
	public static ZipcodeDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/plantshop");
		return ds.getConnection();
	}
	
	private void close(Connection conn, PreparedStatement st, ResultSet rs) {
		if(rs != null) try {rs.close();} catch(Exception e) { e.printStackTrace();}
		if(st != null) try {st.close();} catch(Exception e) { e.printStackTrace();}
		if(conn != null) try {conn.close();} catch(Exception e) { e.printStackTrace();}
	}
	
//	**************************************************************
	
	public List<ZipcodeDataBean> getZipcodeList(String searchAddr) {
		List<ZipcodeDataBean> zipcodeList = new ArrayList<ZipcodeDataBean>();
		
		try {
			conn = this.getConnection();
			sql = "select * from zipcode where dong like '%"+searchAddr+"%'";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeDataBean zipcode = new ZipcodeDataBean();
				zipcode.setSeq(rs.getInt("seq"));
				zipcode.setZipcode(rs.getString("zipcode"));
				zipcode.setSido(rs.getString("sido"));
				zipcode.setGugun(rs.getString("gugun"));
				zipcode.setDong(rs.getString("dong"));
				zipcode.setBunji(rs.getString("bunji"));
				
				zipcodeList.add(zipcode);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, rs);
		}
		
		return zipcodeList;
		
	}
	
}
