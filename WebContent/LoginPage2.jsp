-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>

    <%
    	//MemberDao mDao = new MemberDao();
    
    	String paramEmail = request.getParameter("email");
    	String paramPw = request.getParameter("pw");
    	//boolean result = mDao.loginCheck(paramId, paramPw);
    	
    	String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "soomgo";
		String pw = "soomgo";
    	
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
    	
    	String sql = "SELECT COUNT(*) FROM USERS WHERE email = ? AND pw = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, paramEmail);
		pstmt.setString(2, paramPw);
    	
		ResultSet rs =pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		if (result == 1){					// 로그인 성공시
%>
			<script>alert("로그인되었습니다.")</script>
<%
		}else{							// 로그인 실패시
%>
			<script>alert("다시 로그인 해주세요."); location.href = "Login.jsp";</script>
<% 		
		}
%>