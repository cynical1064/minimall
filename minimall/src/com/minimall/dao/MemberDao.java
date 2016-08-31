package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.minimall.dto.MemberDto;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


public class MemberDao {
	
	DataSource ds;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public MemberDao() {
		
		try{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("jdbc/Oracle2");
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
	public MemberDto userCheck(String id, String pw) throws SQLException{
		String sql=null;	
		MemberDto m = null;
		try{
			con = ds.getConnection();
			sql="select * from member where m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				String memberpw=rs.getString("m_pw");
				
				if(memberpw.equals(pw)){	
					
					String m_level = rs.getString("m_level");
					String m_name = rs.getString("m_name");
					 //rs에담긴 level과 name을 변수에 담아놓음
					System.out.println(m_level);		
					System.out.println(m_name);
					
					m= new MemberDto();
					//멤버 객체를 생성하고
					//변수에 담아놓은 값들을 셋팅하고
					//멤버 객체를 리턴
					m.setm_level(m_level);
					m.setm_name(m_name);					
					
					System.out.println(m.hashCode());				
					
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
		
		return m;		
		
	}
}
