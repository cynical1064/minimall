package com.minimall.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.REBoardDAO;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

 public class REBListAction implements ActionInterFace {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println("����Ʈ executeȣ�� net.board.action.BoardListAction"); 
		 
		REBoardDAO boarddao=new REBoardDAO();
		List boardlist=new ArrayList();
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=boarddao.getListCount(); //�� ����Ʈ ���� �޾ƿ�
		boardlist = boarddao.getBoardList(page,limit); //����Ʈ�� �޾ƿ�
		
		//�� ������ ��
 		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��
 		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		//���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
		int endpage = startpage+10-1;

 		if (endpage> maxpage) endpage= maxpage;

 		
 		request.setAttribute("page", page); //���� ������ ��
 		request.setAttribute("maxpage", maxpage); //�ִ� ������ ��
 		request.setAttribute("startpage", startpage); //���� �������� ǥ���� ù ������ ��
 		request.setAttribute("endpage", endpage); //���� �������� ǥ���� �� ������ ��
		request.setAttribute("listcount",listcount); //�� ��
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("reBoard/reBoardList.jsp");
 		return forward;
	 }
 }