package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Gosu_zimDao;
import dto.Gosu_zimDto;
import dto.Gosu_zim_count1Dto;

public class GosuZimAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int users_idx = -1;
	
	try {
		users_idx = Integer.parseInt(request.getParameter("users_idx"));
	}catch(Exception e) {
		e.printStackTrace();
	}
	ArrayList<Gosu_zimDto> zdto = null;
	ArrayList<Gosu_zim_count1Dto> zcdto = null;
	
	Gosu_zimDao gzDao= new Gosu_zimDao();
	
	try {
		zdto = gzDao.getGosuZim(users_idx);
		zcdto = gzDao.getGosuZimCount1(users_idx);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	request.setAttribute("zdto", zdto);
	request.setAttribute("zcdto", zcdto);
	
	request.getRequestDispatcher("Gosu.zim.jsp").forward(request, response);
	}
}
