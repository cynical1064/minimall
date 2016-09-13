package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.minimall.dao.OrderDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class OrderDeleteAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		String mPw = request.getParameter("mPw");
		String loginPw = (String)session.getAttribute("mPw");
		
		ActionForward forward = new ActionForward();
		
		if(mPw != loginPw) {
			
			session.setAttribute("goodsChk", 1);
			
		}else{
			
			OrderDao odao = new OrderDao();
			odao.OrderDelete(oNo);
						
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/Oli/orderListOne.oo");
				
		}
		
		return forward;
		
	}
	
}
