package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.QnaDao;
import com.minimall.dto.QnaDto;

import com.minimall.forward.ActionForward;

public class QnaReqplyView {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
		 	QnaDao qnadao=new QnaDao();
		 	QnaDto qnadto=new QnaDto();
	   		
	   		int num=Integer.parseInt(request.getParameter("num"));
	   		
	   		qnadto=qnadao.getDetail(num);
	   		
	   		if(qnadto==null){
	   			System.out.println("답장 페이지 이동 실패");
	   			return null;
	   		}
	   		System.out.println("답장 페이지 이동 완료");
	   		
	   		request.setAttribute("qnadto", qnadto);
	   		
	   		forward.setRedirect(false);
	   		forward.setPath("./qna_reply.jsp");
	   		return forward;
		}
}
