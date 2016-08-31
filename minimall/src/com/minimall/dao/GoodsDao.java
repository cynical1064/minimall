package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	GoodsDto 
	
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
		
		
		
		//goodsDto.getG_id();
	}
	
}
