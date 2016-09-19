package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsDetailAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsDeleteAction.java");
		
		request.setCharacterEncoding("euc-kr");
		
		String gCode = request.getParameter("gCode");
		System.out.println(gCode + " : gCode GoodsInsertPro.java");
		
		GoodsDao goodsDao = new GoodsDao();
		GoodsDto goodsDto = goodsDao.goodsSelectByGcode(gCode);
		request.setAttribute("goods", goodsDto);
		
		ActionForward forward = new ActionForward();
    	forward.setRedirect(false);
    	forward.setPath("/goods/goodsDetail.jsp");
		
		return forward;
	}

}
