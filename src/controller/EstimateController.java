package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CategoryServiceListAction;
import action.EstimateChatAction;
import action.EstimateListAction;
import action.RegionListAction;
import action.RequestSelectAction;

@WebServlet("/EstimateController")
public class EstimateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		System.out.println("현재 command = " + command);
		Action action = null;

		switch(command) {
		case "category_list": action = new CategoryServiceListAction(); break;
		case "request_select" : action = new RequestSelectAction(); break;
		case "estimate_list" : action = new EstimateListAction(); break;
		case "estimate_chat" : action = new EstimateChatAction(); break;
		case "region_list" : action = new RegionListAction(); break;
		case "region_select" : action = new RequestSelectAction(); break;
		}
		
		action.execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
