<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 마켓 상품 완료화면 -승현</title>
<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="css/soomgo_market.css">
	<link rel="stylesheet" href="css/clear.css">
<!-- 	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function () {
			
			swal({
				title: "상품 등록 완료!",
				text: "메인 페이지로 이동합니다!",
				icon: "success",
				button: "확인",
			}).then(function () {
				location.href = "soomgo_market.jsp?category_idx=1";
			})
			
		})
	</script>
</head>
<body>

</body>
</html>