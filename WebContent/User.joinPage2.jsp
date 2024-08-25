<%@page import="dao.UsersjoinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- <%
    	String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pw = request.getParameter("pw");
        	
        UsersjoinDao ujDao = new UsersjoinDao();
        ujDao.registerMember(name, email, pw);
    %> --%>
<script>
	alert("가입되었습니다. 로그인해주세요.");
	location.href = "Login.jsp";
</script>