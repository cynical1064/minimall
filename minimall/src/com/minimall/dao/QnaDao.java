package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.minimall.dto.QnaDto;

public class QnaDao {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public QnaDao() {
		try {
			Context init = new InitialContext();
			System.out.println(init + "<-- init QnaDao() ");
			ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle2");
		} catch(Exception e) {
			System.out.println("DB������� :" + e);
			return;
		}
	}
	
	//�� ���
	public boolean boardInsert(QnaDto qna){
		
		int num = 0;
		String sql = "";
		
		int result = 0;
		boolean re = false;
		try{
			con = ds.getConnection();
			System.out.println(con + "<-- con boardInsert() QnaDAO.java");
			pstmt=con.prepareStatement("select max(qna_no) from qna_board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			sql="insert into QNA_BOARD (QNA_NO,QNA_SUBJECT,M_ID,QNA_CONTENT,QNA_SECRET,QNA_CATEGORY,QNA_DATE) values (?,?,?,?,?,?,sysdate);";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, qna.getQna_secret());
			pstmt.setString(3, qna.getM_id());
			pstmt.setString(4, qna.getQna_content());
			pstmt.setString(5, qna.getQna_secret());
			pstmt.setString(6, qna.getQna_category());
			
			result=pstmt.executeUpdate();
			if(result==0){
				re = false;
			}else {
				re = true;
			}
		}catch(Exception ex){
			System.out.println("boardInsert ���� : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return re;
	}
}