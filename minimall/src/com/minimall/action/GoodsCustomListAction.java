package com.minimall.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsCustomListAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsCustomListAction.java");
		
		GoodsDto goodsDto = new GoodsDto();
		GoodsDao goodsDao = new GoodsDao();
		ArrayList<GoodsDto> goodsList = goodsDao.goodsSelectForCustom();
		
		ArrayList<String> b64Array = new ArrayList<String>();
		
		String path = request.getServletContext().getRealPath("goodsImage");
		ArrayList<String> gImageType = new ArrayList<String>();
		for(int i=0; i<goodsList.size(); i++) {
			goodsDto = goodsList.get(i);
			//ÀÌ¹ÌÁö
			File file = new File(path + "/" + goodsDto.getG_image());
			BufferedImage image = ImageIO.read(file);
			String type = goodsDto.getG_image().substring(goodsDto.getG_image().lastIndexOf(".") + 1);
			System.out.println(type + " : type GoodsInsertPro.java");
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image,type,baos);
			baos.flush();
			byte[] imageInByteArray = baos.toByteArray();
			baos.close();
			String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
			
			b64Array.add(b64);
			gImageType.add(type);
		}
		if(gImageType != null) {
			request.setAttribute("gImageType", gImageType);
		}
		
		System.out.println(goodsList.size());
		System.out.println(b64Array.size());
		
		request.setAttribute("goodsList", goodsList);
		request.setAttribute("b64", b64Array);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/goods/goodsCustomList.jsp");
		
		return forward;
	}

}
