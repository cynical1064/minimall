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
	public void OrderInsert(OrderDto order) throws SQLException {
		System.out.println("OrderInsert OrderDao.java");
		
		int o_no = 0;
		
		//g_code 중 마지막 숫자(가장 큰 숫자)를 가져오기 위한 select 쿼리문 입니다.
		pstmt_select = conn.prepareStatement("SELECT MAX(o_no) FROM orders");
		System.out.println(pstmt_select + " : pstmt_select orderInsert() OrderDao.java");
		rs = pstmt_select.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt(1);
			System.out.println(result + " : result orderInsert() OrdersDao.java");
			result = result + 1;
		}
		rs.close();
		pstmt_select.close();
		
		//result에 담겨있는 숫자와 temp에 담겨있는 "gcode_" 문자열을 합침.
		o_no = result;
		System.out.println(o_no + " : o_no OrderInsert() OrderDao.java");
		
		
		try{
			
			String sql=null;
			conn = ds.getConnection();
			sql="insert into orders values(?,?,?,sysdate,?,?,?,'입금예정')";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, o_no);
			pstmt.setString(2, order.getG_id());
			pstmt.setString(3, order.getM_id());
			pstmt.setString(4, order.getG_code());
			pstmt.setInt(5, order.getO_count());
			pstmt.setInt(6, order.getO_total());
						
			
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
		sql = "select * from orders";
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
			
			orderList.add(oDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return orderList;
	}
	
	public void OrderDelete(OrderDto order) throws SQLException{
		System.out.println("OrderDelete OrderDao.java");
		String sql = null;
		conn = ds.getConnection();
		sql = "delete * from orders where o_no = ?";
		pstmt = conn.prepareStatement(sql);
		
	}
}
