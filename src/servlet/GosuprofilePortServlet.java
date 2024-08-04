package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Gosu_profile_portfolio_innerDao;
import dto.Gosu_profile_portfolio_innerDto;
import jdk.nashorn.api.scripting.JSObject;

@WebServlet("/GosuprofilePortServlet")
public class GosuprofilePortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 요청 들어옴");
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		System.out.println("서버에 들어온 데이터 p_idx : " + p_idx);
		
		
		        int p_idx1 = 0;
		        
		        try {
		            p_idx1 = Integer.parseInt(request.getParameter("p_idx"));
		            System.out.println("서버에 들어온 데이터 p_idx : " + p_idx1);
		        } catch (NumberFormatException e) {
		            e.printStackTrace();
		            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid p_idx parameter");
		            return;
		        }

		        Gosu_profile_portfolio_innerDto portfolio_idx = null;
		        try {
		            Gosu_profile_portfolio_innerDao dao = new Gosu_profile_portfolio_innerDao();
		            portfolio_idx = dao.getGosuprofilePortfolioInner(p_idx1);
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving portfolio");
		            return;
		        }

		        JSONObject jsonResponse = new JSONObject();
		        if (portfolio_idx != null) {
		            jsonResponse.put("portfolio_idx", portfolio_idx.getPortfolio_idx());
		            jsonResponse.put("users_idx", portfolio_idx.getUsers_idx());
		            jsonResponse.put("p_title", portfolio_idx.getP_title());
		            jsonResponse.put("service_amount", portfolio_idx.getService_amount());
		            jsonResponse.put("work_year", portfolio_idx.getWork_year());
		            jsonResponse.put("name", portfolio_idx.getName());
		            jsonResponse.put("f_img", portfolio_idx.getF_img());
		            jsonResponse.put("s_title", portfolio_idx.getS_title());
		            jsonResponse.put("town_name", portfolio_idx.getTown_name());
		            jsonResponse.put("province_name", portfolio_idx.getProvince_name());
		            jsonResponse.put("contents", portfolio_idx.getContents());
		        } else {
		            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Portfolio not found");
		            return;
		        }

		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(jsonResponse.toString());
		    }
		}