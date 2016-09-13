package com.minimall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.REBoardDAO;
import com.minimall.dto.REBoardDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class REBAddAction implements ActionInterFace {
	
	
	@Override
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		REBoardDAO boarddao=new REBoardDAO();
	   	REBoardDto boarddata=new REBoardDto();
	   	ActionForward forward=new ActionForward();
	   	
		String realFolder="";
   		String saveFolder="boardupload";
   		
   		int fileSize=5*1024*1024;
   
   		
   		//realFolder=request.getRealPath(saveFolder);
   		
   		realFolder=request.getServletContext().getRealPath(saveFolder);
   		System.out.println(realFolder + "<-- realFolder execute메서드 BoardAddAction.java");
   		boolean result=false;
   		System.out.println("!! ");
   		try{   		System.out.println("!! 2");

   			
   			MultipartRequest multi=null;
   			
   			multi=new MultipartRequest(request,
   					realFolder,
   					fileSize,
   					"euc-kr",
   					new DefaultFileRenamePolicy());
   			System.out.println("!! 3");
   			boarddata.setBOARD_NAME(multi.getParameter("BOARD_NAME"));
   			boarddata.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
	   		boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
	   		boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
	   		boarddata.setBOARD_FILE(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
	   		System.out.println(boarddata.getBOARD_NAME());
	   		System.out.println(multi.getFilesystemName((String)multi.getFileNames().nextElement()) + "<-- setBOARD_FILE(파라메터 값)");
	   		
	   		result=boarddao.boardInsert(boarddata);
	   		
	   		if(result==false){
	   			System.out.println("게시판 등록 실패");
	   			return null;
	   		}
	   		System.out.println("게시판 등록 완료");
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("/board/BoardList.reb");
	   		return forward;
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}