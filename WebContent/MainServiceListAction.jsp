<%@page import="dto.CommuServiceList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommuServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");  // get방식은 안썯됨 post방식은 한글깨져서 쓰는거
    
    CommuServiceDao dao = new CommuServiceDao();
    
    String searchString = request.getParameter("searchText");
  
    
    if(searchString != null && !searchString.trim().isEmpty()) {
   					// searchString의 	 문자열 앞뒤 공백제거       문자열의 길이가 0인경우에 true 리턴
    	ArrayList<CommuServiceList> sList = dao.getServiceList(searchString);
    	
    	
    	if(sList.isEmpty()) { 
    		out.println("<p>'" + searchString + "'에 대한 검색 결과가 없습니다</p>");
    	} else {
    		for(CommuServiceList service : sList) {
    			out.println("<p>" + service + "</p>");
    		}
    	}
    } else {
    	out.println("<p>검색어를 입력하세요</p>");
    }
%>
<script>
// 	값이 제대로 안뜸 null값 나옴
	let searchString = "<%=searchString%>";
	alert(searchString);
	if(searchString){
		location.href="soomgo_main.jsp?searchString=" + searchString;
	}
</script>