package com.minimall.action.goods;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minimall.dao.GoodsDao;
import com.minimall.dto.GoodsDto;
import com.minimall.forward.ActionForward;
import com.minimall.inter.ActionInterFace;

public class GoodsDForUpdateAction implements ActionInterFace {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("01 execute() GoodsDForUpdateAction.java");
		
		request.setCharacterEncoding("UTF-8");
		String gCode = request.getParameter("gCode");
		System.out.println(gCode + " : GoodsDForUpdateAction.java");
		
		GoodsDao goodsDao = new GoodsDao();
		GoodsDto goodsDto = goodsDao.goodsSelectByGcode(gCode);

		//¿ÃπÃ¡ˆ
		File file = new File(goodsDto.getG_image());
		BufferedImage image = ImageIO.read(file);
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image,"png",baos);
		baos.flush();
		byte[] imageInByteArray = baos.toByteArray();
		baos.close();
		String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
		
		request.setAttribute("goodsDto", goodsDto);
		request.setAttribute("b64", b64);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/goods/goodsUpdateForm.jsp");
		
		return forward;
	}

}
