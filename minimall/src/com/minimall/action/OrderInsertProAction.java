package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dto.OrderDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderInsertProAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		System.out.println("execute() OrderInsertPro.java");
		
		String mId = request.getParameter("m_id");
		String gId = request.getParameter("g_id");
		int oCount = Integer.parseInt(request.getParameter("o_count"));
		int oTotal = Integer.parseInt(request.getParameter("o_total"));
		
		OrderDto odto = new OrderDto();
		odto.setM_id(mId);
		odto.setG_id(gId);
		odto.setO_count(oCount);
		odto.setO_total(oTotal);
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		
		return forward;
	}

}
