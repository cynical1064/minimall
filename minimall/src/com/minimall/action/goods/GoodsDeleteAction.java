package com.minimall.action.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsDeleteAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsDeleteAction.java");
		
		request.setCharacterEncoding("UTF-8");
		
		String gCode = request.getParameter("gCode");
		System.out.println(gCode + " : gCode GoodsInsertPro.java");
		
		GoodsDao goodsDao = new GoodsDao();
		goodsDao.goodsDeleteByGcode(gCode);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/Glist/goodsSellerList.go");
		
		return forward;
	}

}
