package com.minimall.action.reb;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.REBoardDAO;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class REBDeleteAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	
	   	REBoardDAO boarddao=new REBoardDAO();
	   	usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=UTF-8");
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
   		forward.setPath(request.getContextPath() + "/board/BoardList.reb");
   		return forward;
	 }
}