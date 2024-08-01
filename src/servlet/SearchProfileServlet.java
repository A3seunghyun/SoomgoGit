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

import dao.Gosu_profileDao;
import dao.Search_profile_1Dao;
import dto.Search_profile_3Dto;

@WebServlet("/SearchProfileServlet")
public class SearchProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("get 요청이 들어옴");

	        int pageNum = Integer.parseInt(request.getParameter("page_num"));
	        System.out.println("pageNum :" + pageNum);

	        Search_profile_1Dao Spado = new Search_profile_1Dao();
	        ArrayList<Search_profile_3Dto> list = null;

	        try {
	            list = Spado.getSeachprofilePageNum(pageNum);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        JSONArray array = new JSONArray();
	        for (Search_profile_3Dto spdto : list) {
	            JSONObject obj = new JSONObject();
	            obj.put("users_idx", spdto.getUsers_idx());
	            obj.put("name", spdto.getName());
	            obj.put("career", spdto.getCareer());
	            obj.put("f_img", spdto.getF_img());
	            obj.put("intro", spdto.getIntro());
	            obj.put("score", spdto.getScore());
	            obj.put("c_review", spdto.getC_review());
	            obj.put("c_transaction", spdto.getC_transaction());
	            array.add(obj);
	        }

	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter writer = response.getWriter();
	        writer.print(array);
	    }
	}
