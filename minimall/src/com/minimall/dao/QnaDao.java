package com.minimall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.minimall.dto.QnaDto;

public class QnaDao {
	DataSource ds;
	Connection con;
	PreparedStatement pstmtSelect;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public QnaDao() {
		try {
			Context init = new InitialContext();
			System.out.println(init + " : QnaDao.java");
			ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle2");
		} catch(NamingException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}
	
	//글 내용 보기.
		public QnaDto getDetail(int num) throws Exception{
			
			QnaDto qnadto = null;
			try{
				con = ds.getConnection();
				pstmt = con.prepareStatement(
						"select * from QNA_BOARD where QNA_NO = ?");
				pstmt.setInt(1, num);
				
				rs= pstmt.executeQuery();
				
				if(rs.next()){
					qnadto = new QnaDto();
					qnadto.setQna_no(rs.getInt("qna_no"));				
					qnadto.setQna_subject(rs.getString("qna_subject"));
					qnadto.setM_id(rs.getString("m_id"));
					qnadto.setQna_content(rs.getString("qna_content"));
					qnadto.setQna_secret(rs.getString("qna_secret"));
					qnadto.setQna_category(rs.getString("qna_category"));
					qnadto.setQna_date(rs.getDate("qna_date"));
					qnadto.setQna_readcount(rs.getInt("qna_readcount"));
				}
				return qnadto;
			}catch(Exception ex){
				System.out.println("getDetail 에러 : " + ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return null;
		}
	
	//조회수 업데이트
		public void setReadCountUpdate(int num) throws Exception{
			
			String sql="update QNA_BOARD set QNA_READCOUNT = QNA_READCOUNT+1 where QNA_NO = "+num;
			
			try{
				con = ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.executeUpdate();
			}catch(SQLException ex){
				System.out.println("setReadCountUpdate 에러 : "+ex);
			}finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(con!=null) con.close();
				} catch(Exception ex){
				}	
			}
		}
	//글 등록
	public boolean boardInsert(QnaDto qna){
		
		int num = 0;
		String sql = "";
		
		int result = 0;
		boolean re = false;
		try{
			con = ds.getConnection();
			
			System.out.println(con + "<-- con boardInsert() QnaDAO.java");
			pstmtSelect=con.prepareStatement("select max(qna_no) from qna_board");
			rs = pstmtSelect.executeQuery();
			
			if(rs.next()) {
				num =rs.getInt(1)+1;
			} else {
				num=1;
			}
			System.out.println(num + " : num");
			pstmtSelect.close();
			
			if(qna.getQna_secret() == null) {
				qna.setQna_secret("n");
			} else {
				qna.setQna_secret("y");
			}
			
			sql="insert into QNA_BOARD (QNA_NO,QNA_SUBJECT,M_ID,QNA_CONTENT,QNA_SECRET,QNA_CATEGORY,QNA_DATE) values (?,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num+1);
			pstmt.setString(2, qna.getQna_subject());
			//pstmt.setString(3, qna.getM_id());
			pstmt.setString(3, "id001");
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
			System.out.println("boardInsert 에러 : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return re;
	}
}
