package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EstimateOptionContentDao;
import dao.EstimateOptionDao;
import dao.EstimateQuestionDao;
import dao.EstimateServiceDao;
import dto.EstimateOptionDto;
import dto.EstimateQuestionDto;
import dto.EstimateServiceDto;

public class RequestSelectAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int serviceIdx = 19;
		EstimateServiceDao esDao = null;
		EstimateServiceDto esDto = null;
		EstimateQuestionDao eqDao = null;
		ArrayList<EstimateQuestionDto> listQuestion = null;
		EstimateOptionDao eoDao = null;
		ArrayList<EstimateOptionDto> listOption = null;
		EstimateOptionContentDao eocDao = null;
		
		try {
			serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));

			esDao = new EstimateServiceDao();   
			esDto = esDao.getServiceByServiceIdx(serviceIdx); 
			eqDao = new EstimateQuestionDao();
			listQuestion = eqDao.getQuestionByServiceIdx(serviceIdx);
			eoDao = new EstimateOptionDao();
			listOption = eoDao.getOptionByServiceIdx(serviceIdx);
			eocDao = new EstimateOptionContentDao();
		} catch (Exception e) { e.printStackTrace(); }
		
		System.out.println("serviceIdx : " + serviceIdx);
		
		request.setAttribute("esDao", esDao);
		request.setAttribute("esDto", esDto);
		request.setAttribute("eqDao", eqDao);
		request.setAttribute("eoDao", eoDao);
		request.setAttribute("eocDao", eocDao);
		request.setAttribute("listQuestion", listQuestion);
		request.setAttribute("listOption", listOption);
		request.getRequestDispatcher("sgRequestSelect.jsp").forward(request, response);
		
	}

}
