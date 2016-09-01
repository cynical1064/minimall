package com.minimall.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.inter.ActionInterFace;
import com.minimall.action.GoodsInsertPro;
import com.minimall.action.QnaAddAction;
import com.minimall.forward.ActionForward;

@WebServlet("/QController")
public class QController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public QController() {
        super();
    }
	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("03 doPro() QController.java");

		String RequestURI=request.getRequestURI();					//전체경로 추출
		String contextPath=request.getContextPath();			  	// /Qna/QnaAddAction.qn
		String command=RequestURI.substring(contextPath.length());	//전체 문자열 중에서 인덱스 이후의 문자열
		System.out.println(RequestURI + "<-- RequestURI QController.java");
		System.out.println(contextPath + "<-- contextPath QController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() QController.java");
		System.out.println(command + "<-- command QController.java");
		System.out.println("----------QController.java----------------");
		System.out.println();
	
		ActionForward forward = null;
		ActionInterFace action = null;
		
		if(command.equals("/Qna/QnaAddWrite.qn")){
	    	System.out.println("04_01 조건문 내 /Qna/QnaAddWrite.qn QController.java");
	    	forward = new ActionForward();		//주소값이 담겨있음
	    	forward.setRedirect(false);
	    	forward.setPath("/qna_board/qna_board_write.jsp");
	    	forward.toString();
		} else if(command.equals("/Qna/QnaList.qn")){
	    	System.out.println("04_01 조건문 내 /Qna/QnaList.qn QController.java");
	    	forward = new ActionForward();		//주소값이 담겨있음
	    	forward.setRedirect(true);
	    	forward.setPath("/qna_board/qna_list.jsp");
	    	forward.toString();
		} else if(command.equals("/Qna/QnaAddAction.qn")){
	    	System.out.println("04_03 조건문 내 /Qna/QnaAddAction.qn QController.java");
			action = new QnaAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			};
		}
		
		if(forward != null){			//널이 아니면 다시 조건문으로 돌아감
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());	//리다이렉트
				//             /OracleM02OracleMember/ginsert/g_insert_form.ksmart
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());	
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 이동경로] QController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01 doGet() QController.java");
		doPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("02 doPost() QController.java");
		doPro(request, response);
	}
}