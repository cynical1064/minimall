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

public class GoodsDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	PreparedStatement pstmt_select;
	GoodsDto goodsDto;
	ResultSet rs;
	
	public GoodsDao() {
		try {
			Context init = new InitialContext();
			System.out.println(init + " : init GoodsDao.java");
			ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle2");
		} catch(NamingException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	//상품 등록
	public void goodsInsert(GoodsDto goodsDto) throws SQLException {
		System.out.println("01 goodsInsert() GoodsDao.java");
		
		conn = ds.getConnection();
		
		String g_code = "gcode_1";
		String temp = "gcode_";
		
		//g_code 중 마지막 숫자(가장 큰 숫자)를 가져오기 위한 select 쿼리문 입니다.
		pstmt_select = conn.prepareStatement("SELECT MAX(substr(g_code,7)) FROM goods");
		System.out.println(pstmt_select + " : pstmt_select goodsInsert() GoodsDao.java");
		rs = pstmt_select.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt(1);
			System.out.println(result + " : result goodsInsert() GoodsDao.java");
			result = result + 1;
		}
		rs.close();
		pstmt_select.close();
		
		//result에 담겨있는 숫자와 temp에 담겨있는 "gcode_" 문자열을 합침.
		g_code = temp + result;
		System.out.println(g_code + " : g_code goodsInsert() GoodsDao.java");
		
		//goods테이블에 상품을 등록하는 insert 쿼리문 입니다.
		String sql = "INSERT INTO goods";
		sql += " VALUES(?,?,?,?,?,?,sysdate,'N')";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, g_code);
		pstmt.setString(2, goodsDto.getG_name());
		pstmt.setString(3, goodsDto.getG_id());
		pstmt.setString(4, goodsDto.getG_cate());
		pstmt.setString(5, goodsDto.getG_sangse());
		pstmt.setInt(6, goodsDto.getG_price());
		System.out.println(pstmt + " : pstmt goodsInsert() GoodsDao.java");
		
		int getResult = pstmt.executeUpdate();
		if(getResult != 0) {
			System.out.println("INSERT 성공!");
		} else {
			System.out.println("INSERT 실패!");
		}
		pstmt.close();
		conn.close();
	}
	
}
