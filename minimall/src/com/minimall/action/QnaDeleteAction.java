package com.minimall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.QnaDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;


public class QnaDeleteAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 
				ActionForward forward = new ActionForward();
				request.setCharacterEncoding("euc-kr");
				
			   	boolean result=false;
			   	boolean usercheck=false;
			   	int num=Integer.parseInt(request.getParameter("num"));
			   	
			   	QnaDao qnadao=new QnaDao();
			   	usercheck=qnadao.isBoardWriter(num, request.getParameter("qna_pass"));
			   	
			   	if(usercheck==false){
			   		response.setContentType("text/html;charset=euc-kr");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('������ ������ �����ϴ�.');");
			   		out.println("location.href='/Qna/QnaList.qn';");
			   		out.println("</script>");
			   		out.close();
			   		return null;
			   	}
			   	
			   	result=qnadao.qnaDelete(num);
			   	if(result==false){
			   		System.out.println("�Խ��� ���� ����");
			   		return null;
			   	}
			   	
			   	System.out.println("�Խ��� ���� ����");
			   	forward.setRedirect(true);
		   		forward.setPath("/Qna/QnaList.qn");
		   		return forward;
			 }
}
