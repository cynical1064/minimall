package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsAdminChkAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsAdminChkAction.java");
		
		GoodsDao goodsDao = new GoodsDao();
		goodsDao.goodsCheckAgree();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/goods/goodsAdminList.jsp");
		
		return forward;
	}

}
