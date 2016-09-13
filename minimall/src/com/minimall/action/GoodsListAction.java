package com.minimall.action;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;

import org.apache.tomcat.util.codec.binary.Base64;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsListAction implements ActionInterFace {
	GoodsDto goodsDto;
	ArrayList<String> imageList = new ArrayList<String>();
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsListAction.java");
		
		GoodsDao goodsDao = new GoodsDao();
		ArrayList<GoodsDto> goodsList = goodsDao.goodsSelectAll();
		
		for(int i=0; i<goodsList.size(); i++) {
			goodsDto = goodsList.get(i);
			byte[] imageByte = goodsDto.getG_image();
			
			BufferedImage bufferedImage = null;
			InputStream inputStream = new ByteArrayInputStream(imageByte);
			bufferedImage = ImageIO.read(inputStream);
			//System.out.println(bufferedImage);
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			ImageIO.write(bufferedImage, "png", byteArrayOutputStream);
			byteArrayOutputStream.flush();
			byteArrayOutputStream.close();
			String base64Image = DatatypeConverter.printBase64Binary(imageByte);
			
			imageList.add(base64Image);
			/*
			byte[] encodeBase64 = Base64.encodeBase64(imageByte);
			String base64Encoded = new String(encodeBase64, "UTF-8");
			System.out.println(base64Encoded);
			imageList.add(base64Encoded);*/
		}
		
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("imageList", imageList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/goods/goodsAdminList.jsp");
		
		return forward;
	}
	
}
