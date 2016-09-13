package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.REBoardDAO;
import com.minimall.dto.REBoardDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class REBModifyView implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("euc-kr");
	   		
			REBoardDAO boarddao=new REBoardDAO();
		   	REBoardDto boarddata=new REBoardDto();
		   	
			int num=Integer.parseInt(request.getParameter("num"));
		   	boarddata=boarddao.getDetail(num);
		   	
		   	if(boarddata==null){
		   		System.out.println("(수정)상세보기 실패");
		   		return null;
		   	}
		   	System.out.println("(수정)상세보기 성공");
		   	
		   	request.setAttribute("boarddata", boarddata);
		   	forward.setRedirect(false);
	   		forward.setPath(request.getContextPath() + "/reBoard/reBoardModify.jsp");
	   		return forward;
	 }
}