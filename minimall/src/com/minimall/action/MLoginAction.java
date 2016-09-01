package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minimall.dao.MemberDao;
import com.minimall.dto.MemberDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class MLoginAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		
		String mId = request.getParameter("mId"); 
		String mPw = request.getParameter("mPw");
		 
		MemberDao dao = new MemberDao();
		MemberDto chkMember = dao.userCheck(mId, mPw);
		//리턴된 멤버객체를 받아
		if(chkMember != null){
			
			System.out.println("로그인 성공");
			
			System.out.println(chkMember.getm_name());
			System.out.println(chkMember.getm_level());
			
			String loginLevel = chkMember.getm_level();
			String loginName = chkMember.getm_name();
			//객체안에 담긴 값을 변수에 담고
			
			session.setAttribute("loginLevel", loginLevel);
			session.setAttribute("loginName", loginName);
			//세션영역에 셋팅
		}else{
			
			System.out.println("로그인 실패");
			
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/index.jsp");
		return forward;
	}

}
