package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderInsertProAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		System.out.println("execute() OrderInsertPro.java");
		
		request.getParameter("amount");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("");
		
		return forward;
	}

}
