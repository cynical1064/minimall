package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.action.OrderInsertProAction;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public OController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException {
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws SecurityException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(requestURI);
		System.out.println(contextPath + " contextPath GoodsController.java");
		System.out.println(contextPath.length());
		System.out.println(command + " command GoodsController.java");
		System.out.println();
		
		ActionForward forward = null;
		ActionInterFace action = null;
		
		if(command.equals("/Oin/order_insert_form.oo")){
			System.out.println("���ǹ� �� /Oin/order_insert_form.oo Ocontroller.java");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/order/order_insert_form.jsp");
			forward.toString();			
		}else if(command.equals("/Oin/order_insert_pro.oo")){
			System.out.println("���ǹ� �� /Oin/order_insert_pro.oo OController.java");
			action = new OrderInsertProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Oli/order_list.oo")){
			System.out.println("���ǹ� �� /Oli/order_list.oo OController.java");
			action = new OrderlistPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				
				response.sendRedirect(forward.getPath());
			}else{
				
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp �̵����]  BoardFrontController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}
	}
}