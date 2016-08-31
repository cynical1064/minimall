package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.MemberDao;
import com.minimall.dto.MemberDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class MemberInsertAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mId = request.getParameter(arg0);
		
		MemberDto m = new MemberDto();
		MemberDao mDao = new MemberDao();
		
		m.setm_id(mId);
		
		mDao.insertMember(m);	
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath(path);
		
		return forward;
	}

}
