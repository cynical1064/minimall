package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsInsertPro implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsInsertPro.java");
		
		request.setCharacterEncoding("euc-kr");
		request.getParameter("gId");
		request.getParameter("gName");
		request.getParameter("gCate");
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("");
		
		return forward;
	}
	
}
