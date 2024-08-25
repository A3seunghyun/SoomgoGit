<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		// 영현이 헤더
		int users_idx = 0;
		String users_idx_param = request.getParameter("users_idx");
		
		if (users_idx_param != null && !users_idx_param.trim().isEmpty()) {
			try {
				users_idx = Integer.parseInt(users_idx_param);
			} catch (NumberFormatException e) {
		        // 예외 처리: 잘못된 형식의 숫자가 들어온 경우 기본값 0을 사용
				users_idx = 0;
			}
		}
		
		ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
		ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
		
		HttpSession hs = request.getSession();
		
		try {
			users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
			
			Soomgo_headerDao shdao = new Soomgo_headerDao();
			SoomgoHeader = shdao.getSoomgoHeader(users_idx);
			SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
			
			} catch(Exception e){
				
		}
	
		// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
		Integer isgosu = (Integer) hs.getAttribute("isgosu");
		
		if (isgosu == null) {	
		// 고수일때 실행할 메서드
		isgosu = 2; // 기본값 2
		}//else{
		// 고수아닐때 일반회원일때 실행할 메서드
		// }
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고 마켓 상품 완료화면 -승현</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="css/soomgo_market.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
		$(function () {
			swal({
				title: "상품 등록 완료!",
				text: "메인 페이지로 이동합니다!",
				icon: "success",
				button: "확인",
			}).then(function () {
				location.href = "Controller?command=market_list";
			})
			
		})
	</script>
	
	<script> <!--헤더 jquery 시작 -->
		$(function(){
			$(".usermenu-dropdown").hide();
			$(".usermenu3-dropdown").hide();
			$(".header-total1").hide();
			$(".header-total2").hide();
	        
			$(".right-section-div2").click(function(){
				var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
				var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
				
				$(".usermenu-dropdown").toggle();
				
				if ($(".right-section-div2-2-img").attr("src") === img1) {
					$(".right-section-div2-2-img").attr("src", img2);
				} else {
					$(".right-section-div2-2-img").attr("src", img1);
				}
			});
	
			$(".right3-section-div2").click(function(){
				var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
				var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
	    
				$(".usermenu3-dropdown").toggle();
				
				if ($(".right3-section-div2-2-img").attr("src") === img1) {
					$(".right3-section-div2-2-img").attr("src", img2);
				} else {
					$(".right3-section-div2-2-img").attr("src", img1);
				}
			});
			
			$(".usermenu-dropdown-div2-button").click(function(){
				if(g_user != 0){
					$(".header-total1").hide();
					$(".header-total2").show();
	        	}else{
	        		$(".header-total1").show();
	        		$(".header-total2").hide();
					location.href = "Gosu_join.jsp";
				}
			});
			
			$(".usermenu3-dropdown-div2-button").click(function(){
				$(".header-total1").show();
				$(".header-total2").hide(); 
			});
	        
			let users_idx = <%=users_idx%>; 
			//alert(users_idx);
	       
			let g_user = <%=isgosu%>
			
			$(document).ready(function(){
				if(g_user == 0){
					$(".header-total").hide();
					$(".header-total1").show();
					$(".header-total2").hide();
				} else if(g_user == 1) {
					$(".header-total").hide();
					$(".header-total1").hide();
					$(".header-total2").show();
				}
			});
			
			$(".usermenu-dropdown-div3-button").click(function(){
				$(".header-total").show();
				$(".header-total1").hide();
				$(".header-total2").hide();
			});
	       
			$(".usermenu-dropdown-div2-button").click(function(){
				if(g_user != 1) {
					location.href = "Gosu_join.jsp";
					$(".header-total2").hide();
					$(".header-total1").show();
				} else {
					$(".header-total2").show();
					$(".header-total1").hide();
				}
			});	
	       
			$(function(){
				$(".usermenu-dropdown-div3-button").click(function(){
				$.ajax({
					type: "POST",
					url: "LogoutServlet", // 로그아웃을 처리하는 서블릿 URL
					success: function(data) {
						// 로그아웃 성공 시 처리할 코드
						// 예를 들어 세션 무효화 후 화면 처리 등을 할 수 있음
						console.log("로그아웃 성공");
						$(".header-total").show();
						$(".header-total1").hide();
						$(".header-total2").hide();
					},
					error: function() {
						// 에러 발생 시 처리할 코드
						console.error("로그아웃 에러");
					}
				});
			});
		});
	});
	</script> <!--헤더 jquery 끝 -->
</head>
<body>

</body>
</html>