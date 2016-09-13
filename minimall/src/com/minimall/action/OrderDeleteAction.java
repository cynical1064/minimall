package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.OrderDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderDeleteAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		
		OrderDao odao = new OrderDao();
		odao.OrderDelete(oNo);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/Oli/orderListOne.oo");
			
		return forward;
	}

}
