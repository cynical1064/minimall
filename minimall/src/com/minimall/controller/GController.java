package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.action.GoodsCustomListAction;
import com.minimall.action.GoodsInsertPro;
import com.minimall.action.GoodsListAction;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/GController")
public class GController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doGet() GController.java");
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("02 doPost() GController.java");
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("03 doProcess() GController.java");
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		System.out.println(RequestURI + "<-- RequestURI GController.java");
		System.out.println(contextPath + "<-- contextPath GController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() GController.java");
		System.out.println(command + "<-- command GController.java");
		System.out.println("----------GController.java----------------");
		System.out.println();
		
		ActionForward forward = null;
		ActionInterFace action = null;
		
		if(command.equals("/Gin/goodsInsertForm.go")) {
			System.out.println("03_01 /Gin/goodsInsertForm.go");
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/goods/goodsInsertForm.jsp");
			
		} else if(command.equals("/Gin/goodsInsertPro.go")) {
			System.out.println("03_02 /Gin/goodsInsertPro.go");
			
			action = new GoodsInsertPro();
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Glist/goodsAdminList.go")) {
			System.out.println("03_03 /Glist/goodsAdminList.go");
			
			action = new GoodsListAction();
			
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/Glist/goodsCustomList.go")) {
			System.out.println("03_04 /Glist/goodsCustomList.go");
			
			action = new GoodsCustomListAction();
			
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
}
