package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Gosu_zimDao;
import dto.Gosu_zimDto;
import dto.Gosu_zim_count1Dto;

@WebServlet("/GosuzimServlet")
public class GosuzimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String id = "soomgo";
	    String pw = "pass1234";

	    HttpSession session = request.getSession(); // usersLoginServlet Session값을 꺼내는(참조) 코드
	    int gUsers_idx = (int) session.getAttribute("users_idx"); // 세션에서 값을 가져오기

	    Connection conn = null;

	    try {
	        // 데이터베이스 드라이버 로드
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, id, pw);

	        // Gosu_zimDao 객체 생성 및 메서드 호출
	        Gosu_zimDao gzdao = new Gosu_zimDao();
	        ArrayList<Gosu_zimDto> list = gzdao.getGosuZim(gUsers_idx);
	        ArrayList<Gosu_zim_count1Dto> list1 = gzdao.getGosuZimCount1(gUsers_idx);

	        // request에 속성 저장
	        request.setAttribute("list", list);
	        request.setAttribute("list1", list1);
	        
	        // RequestDispatcher를 사용하여 JSP로 포워딩
	        RequestDispatcher rd = request.getRequestDispatcher("Gosu.zim.jsp");
	        rd.forward(request, response);
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        throw new ServletException(e); // 적절한 예외 처리를 위해 ServletException으로 감싸서 던짐
	    } catch (Exception e) {
			e.printStackTrace();
		} finally {
	        // 자원 정리
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
}
