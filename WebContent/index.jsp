<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP AJAX</title>
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		$("#msg").keyup(function () {
			$("#result").html("");
			var id = $("#msg").val();
			$.ajax({
				type : "GET",
				async: false,
				url : "/WebProject1/UserSearchServlet",
				dataType: "json",
				data : {userName: id},
				
				success : function (data) {
					var innerHtml = "<table>";
					
						innerHtml += "<tr>";
		                innerHtml += "<th>이름</th>";
		                innerHtml += "<th>나이</th>";
		                innerHtml += "<th>성별</th>";
		                innerHtml += "<th>이메일</th>";
		                innerHtml += "</tr>";
		                
					$.each(data.result, function(index, user) {
						
						innerHtml += "<tr>";
						innerHtml += "<td>"+ user.name + "</td>";
						innerHtml += "<td>"+ user.age + "</td>";
						innerHtml += "<td>"+ user.gender + "</td>";
						innerHtml += "<td>"+ user.email + "</td>";
						innerHtml += "</tr>";
					})
						
					innerHtml += "</table>";
					$("#result").html(innerHtml);
				},
				
				error : function () {
					consol.log("error");
				}
				
			})
		})
	})
	
</script>
</head>
<body>
<br>
	<h1>Ajax테스트하기</h1>
	<form name="myform">
		<input type="text" id="msg">
	</form>
	<div id="result">
	
	</div>
	
</body>
</html>