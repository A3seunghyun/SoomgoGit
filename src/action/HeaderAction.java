package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Soomgo_headerDao;
import dto.Soomgo_header2Dto;
import dto.Soomgo_headerDto;

public class HeaderAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int users_idx = 0;
		
		try {
			users_idx = Integer.parseInt(request.getParameter("users_idx"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		ArrayList<Soomgo_headerDto> shdto = null;
		ArrayList<Soomgo_header2Dto> sh2dto = null;
		
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		
		try {
			shdto = shdao.getSoomgoHeader(users_idx);
			sh2dto = shdao.getSoomgoHeader2(users_idx);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("shdto", shdto);
		request.setAttribute("sh2dto", sh2dto);
	}

}
