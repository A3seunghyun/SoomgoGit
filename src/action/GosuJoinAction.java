package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Gosu_join_selectDao;
import dto.Gosu_join_selectDto;

public class GosuJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int category_idx = 0;
		
		try {
			category_idx = Integer.parseInt(request.getParameter("category_idx"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		ArrayList<Gosu_join_selectDto> jsdto = null;
		
		Gosu_join_selectDao gjsDao = new Gosu_join_selectDao();
		
		try {
			jsdto = gjsDao.getGosuJoinSelect(category_idx);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("jsdto", jsdto);
		
		request.getRequestDispatcher("Gosu_join_select.jsp").forward(request, response);
	}
	

}
