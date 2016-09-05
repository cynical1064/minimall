package com.minimall.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsSellerListAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsSellerListAction.java");
		
		request.setCharacterEncoding("euc-kr");
		String sellerId = request.getParameter("loginId");
		
		GoodsDao goodsDao = new GoodsDao();
		ArrayList<GoodsDto> goodsList = goodsDao.goodsSelectForSeller(sellerId);
		
		request.setAttribute("goodsList", goodsList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/goods/goodsSellerList.jsp");
		
		return forward;
	}

}
