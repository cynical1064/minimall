package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	ArrayList<OrderDto> orderList = new ArrayList<OrderDto>();
	ArrayList<OrderDto> orderListOne = new ArrayList<OrderDto>();
	
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
	
	//구매화면 메서드
	public void OrderInsert(OrderDto odto) throws SQLException {
		System.out.println("OrderInsert OrderDao.java");
		
		conn = ds.getConnection();		
		int o_no = 0;
		
		pstmt_select = conn.prepareStatement("SELECT MAX(o_no) FROM orders");
		System.out.println(pstmt_select + " : pstmt_select orderInsert() OrderDao.java");
		rs = pstmt_select.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt(1) + 1;
		}
		
		rs.close();
		pstmt_select.close();
		
		o_no = result;
		System.out.println(o_no + " : o_no OrderInsert() OrderDao.java");
		
		
		try{
			
			String sql=null;
			conn = ds.getConnection();
			sql="insert into orders values(?,?,?,sysdate,?,?,?,'입금예정')";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o_no);
			pstmt.setString(2, odto.getM_id());
			pstmt.setString(3, odto.getG_id());
			pstmt.setString(4, odto.getG_code());
			pstmt.setInt(5, odto.getO_count());
			pstmt.setInt(6, odto.getO_total());		
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
	
	//주문리스트 조회 메서드
	public ArrayList<OrderDto> orderSelectAll() throws SQLException{
		System.out.println("orderSelectAll OrderDao.java");
		String sql = null;
		conn = ds.getConnection();
		sql = "select o_no, m_id, g_id, o_date, g_code, o_count, o_total, o_state from orders";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto oDto = new OrderDto();
			oDto.setO_no(rs.getInt("o_no"));
			oDto.setM_id(rs.getString("m_id"));
			oDto.setG_id(rs.getString("g_id"));
			oDto.setO_date(rs.getString("o_date"));
			oDto.setG_code(rs.getString("g_code"));
			oDto.setO_count(rs.getInt("o_count"));
			oDto.setO_total(rs.getInt("o_total"));
			oDto.setO_state(rs.getString("o_state"));
			
			orderList.add(oDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return orderList;
	}
	
	//구매자 조회 리스트 메서드
	public ArrayList<OrderDto> orderListOne(String mId) throws SQLException {
		System.out.println("orderListOne OrderDao.java");
		String sql = null;
		conn = ds.getConnection();
		sql = "select o_no, m_id, g_id, o_date, g_code, o_count, o_total, o_state from orders where m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mId);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			OrderDto oDto = new OrderDto();
			oDto.setO_no(rs.getInt("o_no"));
			oDto.setM_id(rs.getString("m_id"));
			oDto.setG_id(rs.getString("g_id"));
			oDto.setO_date(rs.getString("o_date"));
			oDto.setG_code(rs.getString("g_code"));
			oDto.setO_count(rs.getInt("o_count"));
			oDto.setO_total(rs.getInt("o_total"));
			oDto.setO_state(rs.getString("o_state"));
			
			orderListOne.add(oDto);
		}
		rs.close();
		pstmt.close();
		rs.close();
		
		return orderListOne;
	}
	
	//주문취소 메서드
	public void OrderDelete(OrderDto order) throws SQLException{
		System.out.println("OrderDelete OrderDao.java");
		String sql = null;
		conn = ds.getConnection();
		sql = "delete o_no, m_id, g_id, o_date, g_code, o_count, o_total, o_state from orders where o_no = ?";
		pstmt = conn.prepareStatement(sql);
		
	}
}
