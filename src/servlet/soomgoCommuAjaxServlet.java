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

import dao.CommunityDao;
import dto.CommuPageNumDto;
import dto.CommuPostLikeViewCommentDto;
@WebServlet("/soomgoCommuAjaxServlet")
public class soomgoCommuAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("요청 들어옴?????");
		
		int pageNum = Integer.parseInt(request.getParameter("page_num"));
		System.out.println("page_num: " + pageNum);
		
		CommunityDao dao = new CommunityDao();
		ArrayList<CommuPageNumDto> list = null;
		
		try {
			list = dao.getPostListByPageNum(pageNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONArray array = new JSONArray();
		for(CommuPageNumDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("postIdx",dto.getPostIdx());
			obj.put("commuIdx",dto.getCommuIdx());
			obj.put("commuTitle", dto.getCommuTitle());
			obj.put("serviceIdx", dto.getServiceIdx());
			obj.put("serviceTitle", dto.getServiceTitle());
			obj.put("provinceIdx", dto.getTownIdx());
			obj.put("provinceName", dto.getTownName());
			obj.put("townIdx", dto.getTownIdx());
			obj.put("townName", dto.getTownName());
			obj.put("postTitle", dto.getPostTitle());
			obj.put("userName", dto.getUserName());
			obj.put("writeDate", dto.getWriteDate());
			obj.put("postContents", dto.getPostTitle());
			obj.put("postImg", dto.getPostImg());
			obj.put("postCommentsCount", dto.getPostCommentsCount());
			obj.put("postLikeCount", dto.getPostLikeCount());
			obj.put("postViewsCount", dto.getPostViewsCount());
			array.add(obj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(array);
		
	}
}
