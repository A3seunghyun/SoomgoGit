package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.MarketProductListDAO;
import dto.CategoryDTO;
import dto.MarketProductListCountDTO;
import dto.MarketProductListDTO;
import dto.MiddleCategoryDTO;

public class MarketProductListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int categoryIdx = 1; // 기본값 설정
		int pageNum = 1;	// 기본값 설정

		try {
		    String categoryIdxParam = request.getParameter("category_idx");
		    if (categoryIdxParam != null) {
		        categoryIdx = Integer.parseInt(categoryIdxParam);
		    }
		} catch (NumberFormatException e) { }
		
		System.out.println("카테고리 IDX : " + categoryIdx);
		
		ArrayList<MarketProductListCountDTO> mplCount = null;
		ArrayList<MarketProductListDTO> mpl = null;
		ArrayList<CategoryDTO> category = null;
		ArrayList<MiddleCategoryDTO> middleCategory = null;
		
		MarketProductListDAO mplDao = new MarketProductListDAO();
		CategoryDAO cateDao = new CategoryDAO();
		
		try {
			mplCount = mplDao.marketProductCount(categoryIdx);
			mpl = mplDao.marketList(categoryIdx, pageNum);
			category = cateDao.catelist();
			middleCategory = cateDao.middleCateList(categoryIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("categoryidx", categoryIdx);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("mplCount", mplCount);
		request.setAttribute("mpl", mpl);
		request.setAttribute("category", category);
		request.setAttribute("middleCategory", middleCategory);
		
		request.getRequestDispatcher("soomgo_market.jsp").forward(request, response);
		
	}

}
