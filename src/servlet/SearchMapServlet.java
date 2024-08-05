package servlet;

import java.io.IOException;
import java.util.List; // List를 사용하기 위해 추가
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.Gosu_profile_portfolio_innerDao;
import dao.Search_profile_mapDao;
import dto.Search_profile_map_innerDto;

@WebServlet("/SearchMapServlet")
public class SearchMapServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("POST 요청이 들어옴");
        int u_idx = Integer.parseInt(request.getParameter("users_idx"));
        System.out.println("서버에 들어온 데이터 users_idx: " + u_idx);

        int u_idx1 = 0;
        try {
            u_idx1 = Integer.parseInt(request.getParameter("users_idx"));
            System.out.println("서버에 들어온 데이터 users_idx: " + u_idx1);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid users_idx parameter");
            return;
        }
        
        Search_profile_map_innerDto users_idx = null;
        try {
            Search_profile_mapDao dao = new Search_profile_mapDao();
            users_idx = (Search_profile_map_innerDto) dao.getSeachProfileMapInner(u_idx1);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving portfolio");
            return;
        }
        	

        JSONObject jsonResponse = new JSONObject();
        
        if(users_idx != null) {
        jsonResponse.put("users_idx", users_idx.getUsers_idx());
        jsonResponse.put("name", users_idx.getName());
        jsonResponse.put("career", users_idx.getCareer());
        jsonResponse.put("explain", users_idx.getExplain());
        jsonResponse.put("f_img", users_idx.getF_img());
        jsonResponse.put("r_count", users_idx.getR_count());
        jsonResponse.put("r_avg", users_idx.getR_avg());
        jsonResponse.put("t_count", users_idx.getT_count());
        }
        else {
		      response.sendError(HttpServletResponse.SC_NOT_FOUND, "Portfolio not found");
		      return;
		}

        // JSON 배열을 응답으로 설정합니다.
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toJSONString());
    }
}