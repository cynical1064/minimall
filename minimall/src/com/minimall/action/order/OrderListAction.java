package com.minimall.action.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.OrderDao;
import com.minimall.dto.OrderDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderListAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute OrderListAction.java");
		
		OrderDao odao = new OrderDao();
		ArrayList<OrderDto> orderList = odao.orderSelectAll();
		
		request.setAttribute("orderList", orderList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/order/orderList.jsp");
		
		return forward;
	}

}