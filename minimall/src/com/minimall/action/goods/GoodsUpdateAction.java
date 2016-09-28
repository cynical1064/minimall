package com.minimall.action.goods;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsUpdateAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsUpdateAction.java");
		
		request.setCharacterEncoding("UTF-8");
		String gCode = request.getParameter("gCode");
		String gName = request.getParameter("gName");
		String gCate = request.getParameter("gCate");
		int gPrice = Integer.parseInt(request.getParameter("gPrice"));
		String gSangse = request.getParameter("gSangse");
		System.out.println(gCode + " : GoodsUpdateAction.java");
		System.out.println(gName + " : gName GoodsUpdateAction.java");
		System.out.println(gCate + " : gCate GoodsUpdateAction.java");
		System.out.println(gPrice + " : gPrice GoodsUpdateAction.java");
		System.out.println(gSangse + " : gSangse GoodsUpdateAction.java");
		
		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setG_code(gCode);
		goodsDto.setG_name(gName);
		goodsDto.setG_cate(gCate);
		goodsDto.setG_price(gPrice);
		goodsDto.setG_sangse(gSangse);

		GoodsDao goodsDao = new GoodsDao();
		goodsDao.goodsUpdateByGcode(goodsDto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/Glist/goodsSellerList.go");
		return forward;
	}

}
