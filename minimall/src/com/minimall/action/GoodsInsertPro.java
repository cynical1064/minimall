package com.minimall.action;

import java.awt.Image;
import java.awt.List;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.BufferedReader;
import java.io.File;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsInsertPro implements ActionInterFace {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsInsertPro.java");
		
		request.setCharacterEncoding("euc-kr");
		
		String gId = request.getParameter("gId");
		String gName = request.getParameter("gName");
		String gCate = request.getParameter("gCate");
		int gPrice = Integer.parseInt(request.getParameter("gPrice"));
		String gSangse = request.getParameter("gSangse");
		String gImageName = request.getParameter("myImage");
		//byte[] gImage = request.getParameter("myImage").getBytes();
		
		System.out.println(gId + " : gId GoodsInsertPro.java");
		System.out.println(gName + " : gName GoodsInsertPro.java");
		System.out.println(gCate + " : gCate GoodsInsertPro.java");
		System.out.println(gPrice + " : gPrice GoodsInsertPro.java");
		System.out.println(gSangse + " : gSangse GoodsInsertPro.java");
		System.out.println(gImageName + " : gImage GoodsInsertPro.java");
		
		File imgPath = new File(gImageName);
		BufferedImage bufferedImage = ImageIO.read(imgPath);
		
		WritableRaster raster = bufferedImage.getRaster();
		DataBufferByte data  = (DataBufferByte) raster.getDataBuffer();
		System.out.println(data.getData());

		GoodsDto goodsDto = new GoodsDto();
		goodsDto.setG_id(gId);
		goodsDto.setG_name(gName);
		goodsDto.setG_cate(gCate);
		goodsDto.setG_price(gPrice);
		goodsDto.setG_sangse(gSangse);
		
		GoodsDao goodsDao = new GoodsDao();
		goodsDao.goodsInsert(goodsDto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/index.jsp");
		
		return forward;
	}
	
}
