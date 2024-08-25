package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.MarketProductListDAO;
import dto.MarketProductListDTO;

@WebServlet("/AjaxSoomgoMarketScrollServlet")
public class AjaxSoomgoMarketScrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET 요청이 들어옴.");
		
		int pageNum = Integer.parseInt(request.getParameter("page_num"));
		int cateIdx = Integer.parseInt(request.getParameter("category_idx"));
		
		System.out.println("page_num : " + pageNum);
		System.out.println("category_idx : " + cateIdx);
		
		MarketProductListDAO mDao = new MarketProductListDAO();
		ArrayList<MarketProductListDTO> list = null;
		
		try {
			list = mDao.marketList(pageNum, cateIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		for(MarketProductListDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("market_idx", dto.getMarket_idx());
			obj.put("imgUrl", dto.getImgUrl());
			obj.put("title", dto.getTitle());
			obj.put("marketName", dto.getMarketName());
			obj.put("marketMinPrice", dto.getMarketMinPrice());
			obj.put("marketAvg", dto.getMarketAvg());
			obj.put("marketCount", dto.getMarketCount());
			array.add(obj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(array);
	}


}
