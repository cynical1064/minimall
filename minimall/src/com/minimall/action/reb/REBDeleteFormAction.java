package com.minimall.action.reb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class REBDeleteFormAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute QnaDeleteFormAction.java");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String gCode = request.getParameter("gCode");
	
		request.setAttribute("num", num);
		request.setAttribute("id", id);
		request.setAttribute("gCode", gCode);

		ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("/reBoard/reBoardDelete.jsp");

		return forward;
	}

}
