package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.User_LoginDto;

@WebServlet("/LoginUserServlet")
public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
		
		HttpSession hs = request.getSession();
		
		String email = request.getParameter("email");
		String user_pw = request.getParameter("pw");
		
		
		try {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);
		
		String sql = "SELECT users_idx, isgosu " + 
				"FROM users " + 
				"WHERE email = ? " + 
				"AND pw = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, user_pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int users_idx = rs.getInt(1);
			int isgosu = rs.getInt(2);
			
			
			hs.setAttribute("users_idx", users_idx);
			hs.setAttribute("isgosu", isgosu);
			
			System.out.println("로그인됨");
			
			//RequestDispatcher rd = request.getRequestDispatcher("/GosuzimServlet");
			RequestDispatcher rd = request.getRequestDispatcher("Seach.profile.jsp");
			rd.forward(request, response);
		} else {
			
			request.setAttribute("error", true);
			System.out.println("로그인 실패");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response); // forword() 메서드를 통해 request,response를 전달한다.
		}
			
				
		rs.close();
				pstmt.close();
				conn.close();
		} catch(SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}
	}

		
