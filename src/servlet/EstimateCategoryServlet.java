package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EstimateServiceDao;
import dto.EstimateServiceDto;


@WebServlet("/CategoryServlet")
public class EstimateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int categoryIdx = Integer.parseInt(request.getParameter("categoryIdx"));
		
		EstimateServiceDao sDao = new EstimateServiceDao();	
		EstimateServiceDto sDto = null;
		try {
			sDto = sDao.getServiceByCategoryIdx(categoryIdx);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// sgRequestMain.jsp 로 이동
		HttpSession session = request.getSession();
		session.setAttribute("sDto", sDto);
		RequestDispatcher rd = request.getRequestDispatcher("sgRequestMain.jsp");
		rd.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
