package com.minimall.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dao.OrderDao;
import com.minimall.dto.GoodsDto;
import com.minimall.dto.OrderDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderListOneAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute() OrderListOneAction.java");
		String mId = (String)request.getAttribute("mId");
		System.out.println(mId + "<-- mId OrderListOne.java");
		OrderDao odao = new OrderDao();
		ArrayList<OrderDto> orderListOne = odao.orderListOne(mId);
		
		request.setAttribute("orderListOne", orderListOne);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/order/OrderListOne.jsp");
		
		return forward;
	}

}
