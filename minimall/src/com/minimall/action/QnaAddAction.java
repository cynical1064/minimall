package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dto.QnaDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class QnaAddAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute qnaAddAction.java");
		QnaDto qnadto = new QnaDto();
		
		return null;
	}

}
