package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.QnaDao;
import com.minimall.dto.QnaDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;


public class QnaDetailAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("euc-kr");
  		
		QnaDao qnadao=new QnaDao();
		QnaDto qnadto=new QnaDto();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		qnadao.setReadCountUpdate(num);
		qnadto=qnadao.getDetail(num);
		
	   	if(qnadto==null){
	   		System.out.println("�󼼺��� ����");
	   		return null;
	   	}
	   	System.out.println("�󼼺��� ����");
	   	
	   	request.setAttribute("qnadto", qnadto);
	   	
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("./qna_board_view.jsp");
  		return forward;

	 }
}