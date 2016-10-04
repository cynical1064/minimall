package com.minimall.action.member;

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

		//���ϵ� �����ü�� �޾� 
		if(chkMember != null){
			
			System.out.println("�α��� ����");
			
			System.out.println(chkMember.getm_name());
			System.out.println(chkMember.getm_level());
			
			String loginLevel = chkMember.getm_level();
			String loginName = chkMember.getm_name();
			String loginId = chkMember.getm_id();
			//��ü�ȿ� ��� ���� ������ ���
			 
			session.setAttribute("loginLevel", loginLevel);
			session.setAttribute("loginName", loginName);
			session.setAttribute("loginId", loginId);
			session.setAttribute("loginChk", 2);
			//���ǿ����� ����
		}else{
			
			System.out.println("�α��� ����");
			session.setAttribute("loginChk", 1);

		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getHeader("referer"));
		return forward;
	}

}
