package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.minimall.dto.GoodsDto;
import com.minimall.dto.OrderDto;

public class OrderDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	PreparedStatement pstmt_select;
	GoodsDto goodsDto;
	ResultSet rs;
	
	public OrderDao() {
		try {
			Context init = new InitialContext();
			System.out.println(init + " : init GoodsDao.java");
			ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle2");
		} catch(NamingException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	public void OrderInsert(OrderDto o) {
		String sql=null;
		try{
			
			conn = ds.getConnection();
			sql="insert into orders values(?,?,?,sysdate,?,?,?,'입금예정')";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o.getO_no());
			pstmt.setString(2, o.getG_id());
			pstmt.setString(3, o.getM_id());
			pstmt.setString(5, o.getG_code());
			pstmt.setInt(6, o.getO_count());
			pstmt.setInt(7, o.getO_total());
						
			
			pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
	}
	
	public void OrderList(OrderDto o) throws SQLException{
		String sql = null;
		conn = ds.getConnection();
		sql = "select * from orders";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto = new OrderDto();
			
			goodsList.add(goodsDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return goodsList;
	}
}
