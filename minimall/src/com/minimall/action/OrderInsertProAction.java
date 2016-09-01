package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.OrderDao;
import com.minimall.dto.OrderDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderInsertProAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		System.out.println("execute() OrderInsertProAction.java");
		
		request.setCharacterEncoding("euc-kr");
		String gName = request.getParameter("gName");
		String gId = request.getParameter("gId");
		String mId = request.getParameter("mId");
		String gCode = request.getParameter("gCode");
		int oCount = Integer.parseInt(request.getParameter("oCount"));
		int oTotal = Integer.parseInt(request.getParameter("oTotal"));
		System.out.println(gName);
		System.out.println(gId);
		System.out.println(mId);
		System.out.println(gCode);
		System.out.println(oCount);
		System.out.println(oTotal);
		
		OrderDto odto = new OrderDto();
		odto.setM_id(gName);
		odto.setG_id(gId);
		odto.setM_id(mId);
		odto.setG_code(gCode);
		odto.setO_count(oCount);
		odto.setO_total(oTotal);
		
		OrderDao odao = new OrderDao();
		odao.OrderInsert(odto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		
		return forward;
	}

}
