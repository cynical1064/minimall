package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;


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

		ActionForward forward = null;		
		ActionInterFace action = null;
		
		if(cutUrl.equals("/Min/mInsert.mo")){
			
			System.out.println("����1�б�");
			forward = new ActionForward();//��ü���� �ϰ� �������� ������ ��ü�� �Ҵ��Ѵ�.
			forward.setRedirect(false);//���������(�����������°�/ȭ���̵������Ѱ� �ּҺ������ ȭ�鸸 �������°͵� ������)
			forward.setPath("/member/mInsertForm.jsp");
			
			if(forward != null){
				if(forward.isRedirect()){
					
					response.sendRedirect(forward.getPath());
					
				}else{
					
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					System.out.println(forward.getPath() + "<--- forward.getPath()[jsp �̵����]  BoardFrontController.java");
					System.out.println();
					
					dispatcher.forward(request, response);				
					
				}
			}
		}
	}
}
