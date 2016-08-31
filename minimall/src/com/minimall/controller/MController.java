package com.minimall.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Mcontroller")
public class MController extends HttpServlet {	

    public MController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet Mcontroller.java");
		doPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost Mcontroller.java");
		doPro(request, response);
	}
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPro Mcontroller.java");
		
		String fullUrl = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cutUrl = fullUrl.substring( request.getContextPath().length());
		
		System.out.println(cutUrl);
		
		if(cutUrl.equals("/Min/mInsert.mo")){
			
			System.out.println("조건1분기");
			
		}
	}
}
