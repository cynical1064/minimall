package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.action.*;

import com.minimall.forward.ActionForward;
import com.sun.corba.se.spi.orbutil.fsm.Action;

 public class REBController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 //Servlet ����������Ŭ ���ظ� Ȯ�� ���� �����ڸ޼��� ����
   public REBController() {
        super();
		System.out.println("01 BoardFrontController ������ �޼���  ");
		System.out.println();
   }
   
   	public void destroy(){
		 System.out.println("09 destroy()�޼���  !!!!!!!");
		 System.out.println();

	 }
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 	System.out.println("04 doGet()�޼��� request  => "+ request);
		 	System.out.println("04 doGet()�޼��� response  => "+ response);
		 	System.out.println();
			doProcess(request,response);
	}  	
			
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
	 	System.out.println("05 doPost()�޼��� request  => "+ request);
	 	System.out.println("05 doPost()�޼��� response  => "+ response);
	 	System.out.println();
		doProcess(request,response);
	}
			
			
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 System.out.println("06 doProcess ȣ�� BoardFrontController.java");
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 System.out.println(RequestURI + "<-- RequestURI BoardFrontController.java");
		 System.out.println(contextPath + "<-- contextPath BoardFrontController.java");
		 System.out.println(contextPath.length() + "<-- contextPath.length() BoardFrontController.java");
		 System.out.println(command + "<-- command BoardFrontController.java");
		 System.out.println("----------BoardFrontController.java----------------");
		 System.out.println();
		 ActionForward forward=null;
		 Action action=null;
		
		if(command.equals("/board/BoardWrite.reb")){
			
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./qna_board_write.jsp");
		}else if(command.equals("/board/BoardReplyAction.reb")){
			action = new REBReplyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardDelete.reb")){
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./qna_board_delete.jsp");
		}else if(command.equals("/board/BoardModify.reb")){
			action = new REBModifyView();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
	 	}else if(command.equals("/board/BoardAddAction.reb")){
			action  = new REBAddAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardReplyView.reb")){
			action = new REBReplyView();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardModifyAction.reb")){
			action = new REBModifyAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardDeleteAction.reb")){
			action = new REBDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardList.reb")){
			
			action = new REBListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardDetailAction.reb")){
			action = new REBDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
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