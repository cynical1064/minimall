package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minimall.action.MLoginAction;
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
			
			System.out.println("조건1분기");
			forward = new ActionForward();//객체생성 하고 참조값을 포워드 객체에 할당한다.
			forward.setRedirect(false);//포워드상태(값을가지고가는것/화면이동을위한것 주소변경없이 화면만 가져가는것도 포워드)
			forward.setPath("/member/mInsertForm.jsp");
			
			
		}else if(cutUrl.equals("/mLogin/mLogin.mo")){
			System.out.println("로그인 처리 조건");
			
			try{
				
				action = new MLoginAction();
				forward = action.execute(request, response);
				
			}catch(Exception e){
				
				e.printStackTrace();
				
			}
			
		}else if(cutUrl.equals("/logout/logout.mo")){
			System.out.println("로그아웃 처리");
			
			HttpSession session=request.getSession();
			session.invalidate();
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/index.jsp");
			
		}
		
		if(forward != null){
			if(forward.isRedirect()){
				
				response.sendRedirect(forward.getPath());
				
			}else{
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 이동경로]  BoardFrontController.java");
				System.out.println();
				
				dispatcher.forward(request, response);				
				
			}
		}
	}
}
