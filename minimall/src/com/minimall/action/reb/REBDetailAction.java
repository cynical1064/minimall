package com.minimall.action.reb;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.REBDao;
import com.minimall.dto.REBDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class REBDetailAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("UTF-8");
  		
		REBDao rebdao=new REBDao();
		REBDto rebdto=new REBDto();
	   	
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		rebdao.setReadCountUpdate(num);
		rebdto=rebdao.getDetail(num);
		
	   	if(rebdto == null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   		
	   	}else{
	   		
	   		System.out.println("상세보기 성공");
			System.out.println(rebdto.getReb_no());
		   	request.setAttribute("qnadto", rebdto);
		   	System.out.println(rebdto + ": qnadto");
		   	
		   	ActionForward forward = new ActionForward();
		   	forward.setRedirect(false);
	  		forward.setPath("/reBoard/reBoardView.jsp");
	  		return forward;
	   	}
	   	

	 }
}
