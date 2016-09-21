package com.minimall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minimall.dao.MemberDao;
import com.minimall.dao.QnaDao;
import com.minimall.dto.MemberDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;


public class QnaDeleteAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 
				ActionForward forward = new ActionForward();
				request.setCharacterEncoding("UTF-8");
				
			   	boolean result=false;
			   	boolean usercheck=false;
			   	int num=Integer.parseInt(request.getParameter("num"));
			   	HttpSession session = request.getSession();
			   	
			   	//QnaDao qnadao=new QnaDao();
			   	//usercheck=qnadao.isBoardWriter(num, request.getParameter("qna_pass"));
			   	
			   	String id = (String)session.getAttribute("loginId");
			    String pw = request.getParameter("qna_pass");
			   	
			   	MemberDao memberdao = new MemberDao();
			   	MemberDto boardchk = memberdao.userCheck(id, pw);
			   	
			   	if(boardchk == null){
			   		response.setContentType("text/html;charset=UTF-8");
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
