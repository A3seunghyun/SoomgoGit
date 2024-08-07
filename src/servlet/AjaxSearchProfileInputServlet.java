package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.Search_profile_1Dao;
import dto.Search_profile_1Dto;

@WebServlet("/AjaxSearchProfileInputServlet")
public class AjaxSearchProfileInputServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("post 요청이 들어왔습니다.");
        
        String name = request.getParameter("Name");
        System.out.println("Received Name: " + name);
        
        Search_profile_1Dao Spdao = new Search_profile_1Dao();
        ArrayList<Search_profile_1Dto> list = null;
        
        try {
        	list = Spdao.getSeachprofileKeypress(name);
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        JSONArray array = new JSONArray();
        for (Search_profile_1Dto spdto : list) {
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
        
        JSONObject result = new JSONObject();
        result.put("status", "success");
        result.put("data", array);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(result.toString());
    }
}