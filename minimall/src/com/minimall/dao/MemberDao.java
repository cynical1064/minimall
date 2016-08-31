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
}
