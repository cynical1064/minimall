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

public class GoodsDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	PreparedStatement pstmt_select;
	ResultSet rs;
	GoodsDto goodsDto;
	ArrayList<GoodsDto> goodsList = new ArrayList<GoodsDto>();
	
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

	//상품 전체 SELECT
	public ArrayList<GoodsDto> goodsSelectAll() throws SQLException {
		System.out.println("02 goodsSelectAll() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//goods테이블의 전체 데이터를 가져오는 select 쿼리문 입니다.
		String sql = "SELECT g_code, g_name, g_id, g_cate, g_sangse, g_price, g_date, g_agree FROM goods";
		pstmt = conn.prepareStatement(sql);
		System.out.println(pstmt + " : pstmt goodsSelectAll() GoodsDao.java");
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			goodsDto = new GoodsDto();
			goodsDto.setG_code(rs.getString("g_code"));
			goodsDto.setG_name(rs.getString("g_name"));
			goodsDto.setG_id(rs.getString("g_id"));
			goodsDto.setG_cate(rs.getString("g_cate"));
			goodsDto.setG_sangse(rs.getString("g_sangse"));
			goodsDto.setG_price(rs.getInt("g_price"));
			goodsDto.setG_date(rs.getString("g_date"));
			goodsDto.setG_agree(rs.getString("g_agree").charAt(0));
			
			goodsList.add(goodsDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return goodsList;
	}
	
	//구매자를 위한 select! 상품 중 승인여부가 Y인 것만 가져오기 
	public ArrayList<GoodsDto> goodsSelectForCustom() throws SQLException {
		System.out.println("03 goodsSelectForCustom() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//goods테이블의 전체 데이터 중 승인여부가 'Y' 인 것만 가져오는 select 쿼리문 입니다.
		String sql = "SELECT g_code, g_name, g_id, g_cate, g_sangse, g_price, g_date FROM goods";
		sql += " WHERE g_agree LIKE 'Y'";
		pstmt = conn.prepareStatement(sql);
		System.out.println(pstmt + " : pstmt goodsSelectForCustom() GoodsDao.java");
		rs = pstmt.executeQuery();
		System.out.println("쿼리 실행 후");
		
		while(rs.next()) {
			goodsDto = new GoodsDto();
			goodsDto.setG_code(rs.getString("g_code"));
			System.out.println(goodsDto.getG_code());
			goodsDto.setG_name(rs.getString("g_name"));
			goodsDto.setG_id(rs.getString("g_id"));
			goodsDto.setG_cate(rs.getString("g_cate"));
			goodsDto.setG_sangse(rs.getString("g_sangse"));
			goodsDto.setG_price(rs.getInt("g_price"));
			goodsDto.setG_date(rs.getString("g_date"));
			
			goodsList.add(goodsDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return goodsList;
	}
	
}
