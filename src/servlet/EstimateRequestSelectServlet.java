package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EstimateOptionDao;
import dao.EstimateQuestionDao;
import dao.EstimateServiceDao;
import dto.EstimateOptionDto;
import dto.EstimateQuestionDto;
import dto.EstimateServiceDto;

@WebServlet("/EstimateRequestSelectServlet")
public class EstimateRequestSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
		try {

			EstimateServiceDao sDao = new EstimateServiceDao();   
			EstimateServiceDto sDto = sDao.getServiceByServiceIdx(serviceIdx); 
			
			EstimateQuestionDao qDao = new EstimateQuestionDao();
			ArrayList<EstimateQuestionDto> listQuestion = qDao.getQuestionByServiceIdx(serviceIdx);
			
			EstimateOptionDao oDao = new EstimateOptionDao();
			ArrayList<EstimateOptionDto> listOption = oDao.getOptionByServiceIdx(serviceIdx);
			
//			sgRequestSelect.jsp 로 이동
			HttpSession session = request.getSession();
			session.setAttribute("sDto", sDto);
			session.setAttribute("qDao", qDao);
			session.setAttribute("oDao", oDao);
			session.setAttribute("listQuestion", listQuestion);
			session.setAttribute("listOption", listOption);
			RequestDispatcher rd = request.getRequestDispatcher("sgRequestSelect.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) { e.printStackTrace(); }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
