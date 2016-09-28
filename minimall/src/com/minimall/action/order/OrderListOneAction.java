package com.minimall.action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minimall.dao.GoodsDao;
import com.minimall.dao.OrderDao;
import com.minimall.dto.GoodsDto;
import com.minimall.dto.OrderDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderListOneAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute() orderListOneAction.java");
		HttpSession session = request.getSession();		
		String mId = (String)session.getAttribute("loginId");
		System.out.println(mId + "<-- mId OrderListOne.java");
		/*GoodsDao gdao = new GoodsDao();
		ArrayList<GoodsDto> goodsList = gdao.goodsSelectForCustom();*/
		OrderDao odao = new OrderDao();
		ArrayList<OrderDto> orderListOne = odao.orderListOne(mId);
		
		//request.setAttribute("goodsList", goodsList);
		request.setAttribute("orderListOne", orderListOne);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/order/orderListOne.jsp");
		
		return forward;
	}

}
