package com.minimall.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsDForUpdateAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsDForUpdateAction.java");
		
		request.setCharacterEncoding("euc-kr");
		String gCode = request.getParameter("gCode");
		System.out.println(gCode + " : GoodsDForUpdateAction.java");
		
		GoodsDao goodsDao = new GoodsDao();
		ArrayList<GoodsDto> goodsDto = goodsDao.goodsSelectByGcode(gCode);
		
		request.setAttribute("goodsDto", goodsDto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/goods/goodsUpdateForm.jsp");
		
		return forward;
	}

}
