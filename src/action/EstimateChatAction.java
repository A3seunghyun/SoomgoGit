package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EstimateCategoryDao;
import dao.EstimateMidCategoryDao;
import dao.EstimateServiceDao;
import dto.EstimateCategoryDto;
import dto.EstimateMidCategoryDto;

public class EstimateChatAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryIdx = 1;
		try {
			categoryIdx = Integer.parseInt(request.getParameter("categoryIdx"));
			System.out.println("카테idx : "+categoryIdx);
		} catch(Exception e) {
			System.out.println("cate idx catch");
		}
		
		EstimateCategoryDao ecDao = null;
		ArrayList<EstimateCategoryDto> listCategory = null;
		EstimateMidCategoryDao mDao = null;
		ArrayList<EstimateMidCategoryDto> listMidCategory = null;
		EstimateServiceDao esDao = null;
		
		try {
			ecDao = new EstimateCategoryDao();
			listCategory = ecDao.getCategoryListAll();
			mDao = new EstimateMidCategoryDao();
			listMidCategory = mDao.getMidCategoryByCategoryIdx(categoryIdx);
			esDao = new EstimateServiceDao();
		} catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("categoryIdx", categoryIdx);
		request.setAttribute("ecDao", ecDao);
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("mDao", mDao);
		request.setAttribute("listMidCategory", listMidCategory);
		request.setAttribute("esDao", esDao);
		
		request.getRequestDispatcher("sgRequestMain.jsp").forward(request,response);
	}

}
