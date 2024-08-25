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


import dao.Gosu_join_selectDao;
import dto.Gosu_join_select1Dto;

@WebServlet("/GosuJoinServlet")
public class GosuJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	System.out.println("post 요청이 들어왔습니다.");
		 	 try {
		            int list_idx = Integer.parseInt(request.getParameter("list_idx"));
		            System.out.println("list_idx = " + list_idx);

		            Gosu_join_selectDao dao = new Gosu_join_selectDao();
		            ArrayList<Gosu_join_select1Dto> list = dao.getGosuJoinSelect1(list_idx);

		            JSONArray jsonArray = new JSONArray();
		            for (Gosu_join_select1Dto dto : list) {
		                JSONObject jsonObject = new JSONObject();
		                jsonObject.put("service_idx", dto.getService_idx());
		                jsonObject.put("title", dto.getTitle());
		                jsonObject.put("middle_category_idx", dto.getMiddle_category_idx());
		                jsonArray.add(jsonObject);
		            }

		            response.setContentType("application/json; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.print(jsonArray);
		            out.flush();
		        } catch (Exception e) {
		            e.printStackTrace();
		            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		            response.getWriter().write(e.getMessage());
		        }
		 	 
		 	try {
		 		System.out.println("post 요청이 들어왔습니다.");
	            String serIdxParam = request.getParameter("service_idx");
	            if (serIdxParam != null && !serIdxParam.isEmpty()) {
	                int ser_idx = Integer.parseInt(serIdxParam);
	                System.out.println("service_idx = " + ser_idx);
	                // service_idx와 관련된 추가 로직을 여기서 수행합니다.
	            } else {
	                System.out.println("service_idx가 전달되지 않았습니다.");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}