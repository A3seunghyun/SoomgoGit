 	package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.Search_emailDao;
import dto.Search_emailDto;

@WebServlet("/SearchEmailServlet")
public class SearchEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // 데이터베이스 연결 정보
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String DB_USER = "soomgo";
    private static final String DB_PASSWORD = "soomgo";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        String phone = request.getParameter("phone");

        String sql = "SELECT name, email FROM users WHERE phone = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, phone);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                JSONObject jsonResponse = new JSONObject();
                
                if (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    jsonResponse.put("status", "success");
                    jsonResponse.put("name", name);
                    jsonResponse.put("email", email);
                } else {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "없는 회원 정보 입니다.");
                }
                
                response.getWriter().write(jsonResponse.toJSONString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "서버 오류가 발생했습니다.");
            response.getWriter().write(jsonResponse.toJSONString());
        }
    }
}