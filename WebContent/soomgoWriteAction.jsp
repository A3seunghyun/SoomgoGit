<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("utf-8");   // POST방식에서의 한글깨짐 방지.

    	int loginUserIdx = 19;   // 가정. (테스트)
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	Integer serviceIdx = null;   // test.
    	Integer townIdx = null;    // test.                                                       ")
    	int commuIdx = Integer.parseInt(request.getParameter("commuIdx"));

    	CommunityDao pwDao = new CommunityDao();
    	int newPostIdx = pwDao.postWrite(loginUserIdx, title, content, serviceIdx, townIdx, commuIdx);
    %>
<script>
	alert("등록되었습니다");
	location.href = "soomgoQnA_Post.jsp?post_idx=<%=newPostIdx%>";   // to the ssangsse page.
</script>