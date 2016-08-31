package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.minimall.dto.MemberDto;


public class MemberDao {
	
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public MemberDao() {
		
		try{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("jdbc/OracleDB");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	//회원가입
	public void insertMember(MemberDto m) throws SQLException{
		String sql=null;
		try{
			
			con = ds.getConnection();
			sql="insert into member values(?,?,?,?,?, sysdate,?)";
			
			pstmt.setString(1, m.getm_id());
			pstmt.setString(2, m.getm_pw());
			pstmt.setString(3, m.getm_level());
			pstmt.setString(4, m.getm_name());
			pstmt.setString(5, m.getm_email());
			pstmt.setString(6, m.getm_addr());
			
			pstmt.executeUpdate();
		
		}catch(Exception e){
			e.printStackTrace();
		}	finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}		
	}
	//로그인 체크
	public int userCheck(String id, String pw) throws SQLException{
		String sql=null;
		int x=-1;
		
		try{
			con = ds.getConnection();
			sql="select M_PW from member where M_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				
				String memberpw=rs.getString("M_PW");
				
				if(memberpw.equals(pw)){
					x=1;
				}else{
					x=0;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}	finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception ex) {}
		}
		
		return x;
	}
}
