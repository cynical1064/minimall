package com.minimall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.*;

public class REBDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("euc-kr");
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	
	   	REBoardDAO boarddao=new REBoardDAO();
	   	usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('������ ������ �����ϴ�.');");
	   		out.println("location.href='./BoardList.reb';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	
	   	result=boarddao.boardDelete(num);
	   	if(result==false){
	   		System.out.println("�Խ��� ���� ����");
	   		return null;
	   	}
	   	
	   	System.out.println("�Խ��� ���� ����");
	   	forward.setRedirect(true);
   		forward.setPath("./BoardList.reb");
   		return forward;
	 }
}