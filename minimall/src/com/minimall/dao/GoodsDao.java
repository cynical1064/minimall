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
			System.out.println("DB ���� ����");
			e.printStackTrace();
		}
	}
	
	//��ǰ ���
	public void goodsInsert(GoodsDto goodsDto) throws SQLException {
		System.out.println("01 goodsInsert() GoodsDao.java");
		
		conn = ds.getConnection();
		
		String g_code = "gcode_1";
		String temp = "gcode_";
		
		//g_code �� ������ ����(���� ū ����)�� �������� ���� select ������ �Դϴ�.
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
		
		//result�� ����ִ� ���ڿ� temp�� ����ִ� "gcode_" ���ڿ��� ��ħ.
		g_code = temp + result;
		System.out.println(g_code + " : g_code goodsInsert() GoodsDao.java");
		
		//goods���̺� ��ǰ�� ����ϴ� insert ������ �Դϴ�.
		String sql = "INSERT INTO goods";
		sql += " VALUES(?,?,?,?,?,?,sysdate,'N',?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, g_code);
		pstmt.setString(2, goodsDto.getG_name());
		pstmt.setString(3, goodsDto.getG_id());
		pstmt.setString(4, goodsDto.getG_cate());
		pstmt.setString(5, goodsDto.getG_sangse());
		pstmt.setInt(6, goodsDto.getG_price());
		pstmt.setBytes(7, goodsDto.getG_image());
		System.out.println(pstmt + " : pstmt goodsInsert() GoodsDao.java");
		
		int getResult = pstmt.executeUpdate();
		if(getResult != 0) {
			System.out.println("INSERT ����!");
		} else {
			System.out.println("INSERT ����!");
		}
		pstmt.close();
		conn.close();
	}

	//��ǰ ��ü SELECT
	public ArrayList<GoodsDto> goodsSelectAll() throws SQLException {
		System.out.println("02 goodsSelectAll() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//goods���̺��� ��ü �����͸� �������� select ������ �Դϴ�.
		String sql = "SELECT g_code, g_name, g_id, g_cate, g_sangse, g_price, g_date, g_agree FROM goods";
		pstmt = conn.prepareStatement(sql);
		System.out.println(pstmt + " : pstmt goodsSelectAll() GoodsDao.java");
		rs = pstmt.executeQuery();
		
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
			goodsDto.setG_agree(rs.getString("g_agree").charAt(0));
			
			goodsList.add(goodsDto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return goodsList;
	}
	
	//�����ڸ� ���� select! ��ǰ �� ���ο��ΰ� Y�� �͸� ��������
	public ArrayList<GoodsDto> goodsSelectForCustom() throws SQLException {
		System.out.println("03 goodsSelectForCustom() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//goods���̺��� ��ü ������ �� ���ο��ΰ� 'Y' �� �͸� �������� select ������ �Դϴ�.
		String sql = "SELECT g_code, g_name, g_id, g_cate, g_sangse, g_price, g_date FROM goods";
		sql += " WHERE g_agree LIKE 'Y'";
		pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		System.out.println(pstmt + " : pstmt goodsSelectForCustom() GoodsDao.java");
		rs = pstmt.executeQuery();
		
		rs.last();
		int rowCount = rs.getRow();
		rs.beforeFirst();
		if(rowCount == 0) {
			return null;
		}
		
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

	//�����ڰ� ��ǰ ���ο��θ� üũ�ϸ� ���� Y�� �ٲ��ִ� �޼��� �Դϴ�.
	public void goodsCheckAgree(String[] gCodeArray) throws SQLException {
		System.out.println("04 goodsCheckAgree() GoodsDao.java");
		System.out.println(gCodeArray + " : gCodeArray goodsCheckAgree() GoodsDao.java");
		
		conn = ds.getConnection();
		
		int result = 0;
		
		//�����ڰ� üũ�� ���ο��� �÷��� �� N�� Y�� �ٲ��ִ� UPDATE ������ �Դϴ�.
		String sql = "UPDATE goods SET";
		sql += " g_agree=? WHERE g_code=?";
		for(int i=0; i<gCodeArray.length; i++) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setString(2, gCodeArray[i]);
			result += pstmt.executeUpdate();
		}
		
		System.out.println(result + " : �� UPDATE");
		
		pstmt.close();
		conn.close();
	}
	
	//�����ڰ� ������ �� ���� ��ǰ�� �������� �޼��� �Դϴ�.
	public GoodsDto goodsSelectByGcode(String gCode) throws SQLException {
		System.out.println("05 goodsSelectByGcode() GoodsDao.java");
		System.out.println(gCode + " : gCode goodsSelectByGcode() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//g_code�� gCode ���� �ش��ϴ� �� �� ��ǰ �����͸� �������� select ������ �Դϴ�.
		String sql = "SELECT g_code, g_name, g_cate, g_sangse, g_id, g_price FROM goods";
		sql += " WHERE g_code=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, gCode);
		System.out.println(pstmt + " : pstmt goodsSelectAll() GoodsDao.java");
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			goodsDto = new GoodsDto();
			goodsDto.setG_code(rs.getString("g_code"));
			System.out.println(goodsDto.getG_code());
			goodsDto.setG_name(rs.getString("g_name"));
			goodsDto.setG_cate(rs.getString("g_cate"));
			goodsDto.setG_sangse(rs.getString("g_sangse"));
			goodsDto.setG_id(rs.getString("g_id"));
			goodsDto.setG_price(rs.getInt("g_price"));
		}
		rs.close();
		pstmt.close();
		conn.close();
			
		return goodsDto;
	}

	//�Ǹ��ڰ� ����� ��ǰ�� �������� �޼��� �Դϴ�.
	public ArrayList<GoodsDto> goodsSelectForSeller(String sellerId) throws SQLException {
		System.out.println("06 goodsSelectForSeller() GoodsDao.java");
		System.out.println(sellerId + " : sellerId goodsSelectForSeller() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//goods���̺��� ������ �� �Ǹ��� ���̵� �ش��ϴ� �͸� �������� select ������ �Դϴ�.
		String sql = "SELECT g_code, g_name, g_cate, g_sangse, g_price, g_date FROM goods";
		sql += " WHERE g_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sellerId);
		System.out.println(pstmt + " : pstmt goodsSelectForSeller() GoodsDao.java");
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			goodsDto = new GoodsDto();
			goodsDto.setG_code(rs.getString("g_code"));
			System.out.println(goodsDto.getG_code());
			goodsDto.setG_name(rs.getString("g_name"));
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

	//�Ǹ��ڰ� ������ gcode�� �ش��ϴ� �����͸� ������Ʈ�ϴ� �޼��� �Դϴ�.
	public void goodsUpdateByGcode(GoodsDto goodsDto) throws SQLException {
		System.out.println("07 goodsUpdateByGcode() GoodsDao.java");
		System.out.println(goodsDto + " : gCode goodsUpdateByGcode() GoodsDao.java");
		
		conn = ds.getConnection();
		
		//gcode�� �ش��ϴ� �����͸� �Է��� ���� ���� �����ϴ� update ������ �Դϴ�.
		String sql = "UPDATE goods SET";
		sql += " g_name=?, g_cate=?, g_sangse=?, g_price=?";
		sql += " WHERE g_code=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, goodsDto.getG_name());
		pstmt.setString(2, goodsDto.getG_cate());
		pstmt.setString(3, goodsDto.getG_sangse());
		pstmt.setInt(4, goodsDto.getG_price());
		pstmt.setString(5, goodsDto.getG_code());
		System.out.println(pstmt + " : pstmt goodsUpdateByGcode() GoodsDao.java");
		
		int result = pstmt.executeUpdate();
		if(result != 0) {
			System.out.println("UPDATE ����!");
		} else {
			System.out.println("UPDATE ����!");
		}
		pstmt.close();
		conn.close();
	}

}
