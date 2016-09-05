package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.QnaDao;
import com.minimall.dto.QnaDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class QnaReplyAction implements ActionInterFace {
		 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 throws Exception{
			 	request.setCharacterEncoding("euc-kr");
			 	ActionForward forward = new ActionForward();
			 	
			 	QnaDao qnadao=new QnaDao();
			 	QnaDto qnadto=new QnaDto();
		   		int result=0;
		   		
		   		qnadto.setQna_subject(request.getParameter("QNA_SUBJECT"));
		   		qnadto.setM_id(request.getParameter("M_ID"));
		   		qnadto.setQna_content(request.getParameter("QNA_CONTENT"));
		   		qnadto.setQna_secret(request.getParameter("QNA_SECRET"));
		   		qnadto.setQna_category(request.getParameter("QNA_CATEGORY"));
		   		
		   		result=qnadao.boardReply(qnadto);
		   		if(result==0){
		   			System.out.println("답장 실패");
		   			return null;
		   		}
		   		System.out.println("답장 완료");
		   		
		   		forward.setRedirect(true);
		   		forward.setPath(request.getContextPath() + "/Qna/QnaList.qn?num="+result);
		   		return forward;
 		}
}
