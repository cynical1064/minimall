package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.MemberDao;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class MLoginAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDao dao = new MemberDao();
		int chkMember = dao.userCheck(mId, mPw);
		
		if(chkMember==1){
			System.out.println("로그인 성공");
			
		}else{
			System.out.println("로그인 실패");
			
		}
		
		return null;
	}

}
