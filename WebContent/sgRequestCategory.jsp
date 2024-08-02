<%@page import="dto.EstimateCategoryDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.EstimateCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EstimateCategoryDao cDao = new EstimateCategoryDao();
	ArrayList<EstimateCategoryDto> listCategory = cDao.getCategoryListAll();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 선택 페이지</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function() {
			$("td").click	(function() {
				let categoryIdx = $(this).parent().find(".categoryIdx").text();
				location.href = "sgRequestMain.jsp?categoryIdx=" + categoryIdx;
			});
		})
	</script>
	<style>
		table { border-collapse: collapse; }
		td, th { border: 1px solid grey; padding: 8px; }
		td{ cursor: pointer; }
	</style>
</head>
<body>
	<table>
		<tr>
			<th>카테고리 번호</th>
			<th>카테고리 이름</th>
			<th>이동</th>
		</tr>
			<%
				for(EstimateCategoryDto dto : listCategory ) {
			%>
			<tr>
				<td class="categoryIdx"><%= dto.getCategoryIdx() %></td>
				<td><%= dto.getTitle() %></td>
				<td><img src = "<%= dto.getThumbnail() %>"/></td>
			</tr>
			<%
				}
			%>
	</table>
</body>
</html>