<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		// 헤더
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
	<title>sgMovcln</title>
	<link rel="stylesheet" href="css/sgNationgosuMovcln.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
<!-- 전체 div -->
<div id="app" class="">
	<header class = "header-total"> <!-- 헤더 HTML 시작 -->
		<div class = "header-inner">
			<section class = "header-section1">
				<div class = "header-div1">
					<div class = "header-div1-1">
						<div class = "header-div1-1-logo">
							<a href = "https://soomgo.com/">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span" id = "serarch_profile">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span">커뮤니티</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
					<div class = "right-section">
						<nav class = "right-section-nav">
							<ul class = "right-section-nav-ul">
								<li class = "right-section-nav-li">
									<a href = "Login.jsp">
										<span class = "right-section-nav-li-span">로그인</span>
									</a>
								</li>
								<li class = "right-section-nav-li1">
									<a href = "User.join.jsp">
										<span class = "right-section-nav-li-span">회원가입</span>
									</a>
								</li>
							</ul>
						</nav>
						<button type = "button" class = "btn-signup">
							<a href = "Gosu_join.jsp" class = "btn-a">고수가입</a>
						</button>
					</div>
				</div>
			</section>
		</div>
	</header>
	<header class = "header-total1">
		<div class = "header-inner">
			<section class = "header-section1">
				<div class = "header-div1">
					<div class = "header-div1-1">
						<div class = "header-div1-1-logo">
							<a href = "https://soomgo.com/">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "">
										<span class = "header-nav-li-span">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span">커뮤니티</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
					<div class = "center-section">
						<div class = "center-section-desktop">
							<form class = "center-section-form">
								<div class = "center-section-form-div1">
									<div class = "center-section-form-div2">
										<img class = "center-section-form-div2-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
									</div>
									<input type = "text" class = "center-section-form-div2-input" placeholder="어떤 서비스가 필요하세요?" autocomplete="off">
								</div>
							</form>
						</div>
					</div>
					<div class = "right-section">
						<nav class = "right-section-nav">
							<ul class = "right-section-nav-ul">
								<li class = "right-section-nav-li3">
									<a href = "">
										<span class = "right-section-nav-li-span">받은견적</span>
									</a>
								</li>
								<li class = "right-section-nav-li1">
									<a href = "">
										<span class = "right-section-nav-li-span">채팅</span>
									</a>
									<span class = "right-section-nav-li-span1">148</span>
								</li>
							</ul>
						</nav>
						<div class = "right-section-div1">
							<button type = "button" class = "right-section-div1-button">
								<span class = "right-section-div1-span">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
									</svg>
								</span>
							</button>
						</div>
						<% 
							if (SoomgoHeader != null && !SoomgoHeader.isEmpty()) {
								for(Soomgo_headerDto shdto : SoomgoHeader){ 
						%>
						<div class = "right-section-div2-outter">
							<div class = "right-section-div2">
								<div class = "right-section-div2-1">
									<div class = "right-section-div2-2">
										<img src = "<%=shdto.getF_img() %>">
									</div>
								</div>
								<img class = "right-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
							</div>
							<div class = "usermenu-dropdown">
								<div class = "usermenu-dropdown-div1">
									<h4 class = "usermenu-dropdown-div1-font"><%=shdto.getName()%> 고객님</h4>
								</div>
								<ul class = "usermenu-dropdown-ul">
									<li class = "usermenu-dropdown-li">
										<a href = "">
											<div class = "usermenu-dropdown-li-font">받은 견적</div>
										</a>
									</li>
									<li class = "usermenu-dropdown-li">
										<a href = "">
											<div class = "usermenu-dropdown-li-font">마이페이지</div>
										</a>
									</li>
								</ul>
								<div class = "usermenu-dropdown-div2">
									<button type = "button" class = "usermenu-dropdown-div2-button">
										<img class = "usermenu-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
											고수전환
									</button>
								</div>
								<div class = "usermenu-dropdown-div3">
									<a href = "soomgo_main.jsp">
										<button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
									</a>
								</div>
							</div>
						</div>
						<% 
								} 
							}
						%>
					</div>
				</div>
			</section>
		</div>
	</header>
	<header class = "header-total2">
		<div class = "header-inner">
			<section class = "header-section1">
				<div class = "header-div1">
					<div class = "header-div1-1">
						<div class = "header-div1-1-logo">
							<a href = "https://soomgo.com/">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "">
										<span class = "header-nav-li-span">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span">커뮤니티</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
					<div class = "right3-section">
						<nav class = "right3-section-nav">
							<ul class = "right3-section-nav-ul">
								<li class = "right3-section-nav-li3">
									<a href = "">
										<span class = "right3-section-nav-li-span">받은견적</span>
									</a>
								</li>
								<li class = "right3-section-nav-li1">
									<a href = "">
										<span class = "right3-section-nav-li-span">바로견적</span>
									</a>
								</li>
								<li class = "right3-section-nav-li1">
									<a href = "">
										<span class = "right3-section-nav-li-span">채팅</span>
									</a>
								</li>
								<li class = "right3-section-nav-li1">
									<a href = "">
										<span class = "right3-section-nav-li-span">프로필</span>
									</a>
								</li>
							</ul>
						</nav>
						<a href= "" class = "right3-section-cash-outter">
							<span class = "right3-section-cash-span1">
								<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
									<g fill="none" fill-rule="evenodd">
										<path fill="none" d="M0 0h20v20H0z"></path>
										<path d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z" fill="#FFBF0D"></path>
										<path d="M7.916 7.341a3.312 3.312 0 0 1 2.316-.912 3.32 3.32 0 0 1 2.293.974.714.714 0 1 0 1.005-1.015A4.75 4.75 0 0 0 10.25 5a4.74 4.74 0 0 0-3.313 1.301 5.066 5.066 0 0 0-1.562 3.264 5.124 5.124 0 0 0 .989 3.49 4.806 4.806 0 0 0 3.038 1.878 4.703 4.703 0 0 0 3.467-.773c.325-.224.62-.486.879-.778a.714.714 0 1 0-1.069-.948 3.453 3.453 0 0 1-.621.55 3.274 3.274 0 0 1-2.416.541 3.377 3.377 0 0 1-2.133-1.323 3.695 3.695 0 0 1-.71-2.517A3.637 3.637 0 0 1 7.915 7.34z" stroke="#FFF" stroke-width=".833" fill="#FFF"></path>
									</g>
								</svg>
							</span>
						</a>
						<div class = "right3-section-div1">
							<button type = "button" class = "right3-section-div1-button">
								<span class = "right3-section-div1-span">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
									</svg>
								</span>
							</button>
						</div>
						<% 
						if (SoomgoHeader2 != null && !SoomgoHeader2.isEmpty()) {
							for(Soomgo_header2Dto sh2dto : SoomgoHeader2){ 
						%>
						<div class = "right3-section-div2-outter">
							<div class = "right3-section-div2">
								<div class = "right3-section-div2-1">
									<div class = "right3-section-div2-2">
										<img src = "<%=sh2dto.getF_img()%>" width = "30px;" height = "30px;">
									</div>
								</div>
								<img class = "right3-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
							</div>
							<div class = "usermenu3-dropdown">
								<div class = "usermenu3-dropdown-div1">
									<h4 class = "usermenu3-dropdown-div1-font"><%=sh2dto.getName() %> 고객님</h4>
									<a class = "usermenu3-dropdown-div1-a">
										<div class = "usermenu3-dropdown-div1-a-1">
											<span class = "usermenu3-dropdown-div1-a-1-span1">
												<img class = "usermenu3-dropdown-div1-a-1-span1-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo=">
												평점 <%=sh2dto.getAvg_score() %>.0
											</span>
											<span class = "usermenu3-dropdown-div1-a-1-span2"></span>
											<span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review() %>개</span>
										</div>
									</a>
								</div>
								<ul class = "usermenu3-dropdown-ul">
									<li class = "usermenu3-dropdown-li">
										<a href = "">
											<div class = "usermenu3-dropdown-li-font">받은 견적</div>
										</a>
									</li>
									<li class = "usermenu3-dropdown-li">
										<a href = "">
											<div class = "usermenu3-dropdown-li-font">마이페이지</div>
										</a>
									</li>
								</ul>
								<div class = "usermenu3-dropdown-div2">
									<button type = "button" class = "usermenu3-dropdown-div2-button">
										<img class = "usermenu3-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
										고객전환
									</button>
								</div>
								<div class = "usermenu3-dropdown-div3">
									<a href = "Seach.profile2.jsp">
										<button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
									</a>
								</div>
							</div>
						</div>
						<%
								}
							}
						%>
					</div>
				</div>
			</section>
		</div>
	</header> <!-- 헤더 HTML 끝 -->
	<!-- 중심 전체 -->
	<div id="main_body" class="">
		<!-- 중심부 -->
		<div id="main_container" class="">
			<!-- 헤더:맞춤견적요청 start-->
			<div id="" class=" cont_w cont_p">
			
			<!-- 헤더:맞춤견적요청 end-->
			</div>
			<!-- 지역 서비스 추천 고수 start-->
			<div id="" class=" cont_w cont_p">
				<div id="gosu_rec">
					<h2 class="h2_1">
						<p>서울 지역</p>
						<p>
							<span>이사/입주 청소업체 추천 고수</span>
							<span class="que"><img src="img/soomgo/img_icon_question.svg"/></span>
						</p>
					</h2>
					<ol class="now_service">
						<li class="now_li"><a href="">숨고</a></li>
						<li class="now_li"><a href="">서울</a></li>
						<li class="now_li">이사/입주 청소업체</li>
					</ol>
				</div>
				<!-- 추천 고수 목록 시작 -->
				<ul id="rec_list">
					<!-- 리스트 시작 -->
					<li>
						<div class=" gosu_container">
							<!-- 좌측부 -->
							<div class=" gosu_img">
								<div class="img_con">
									<img src="img/soomgo/img_gosuprof_1.webp"/>
								</div>
							</div>
							<!-- 우측부 -->
							<div class="gosu_r_sec">
								<h5 class="gosu_name">강무진</h5>
								<!-- 별점 -->
								<div class="score">
									<ul class="star_rate">
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
									</ul>
									<strong>4.9</strong>
									<span>(406)</span>
								</div>
								<!-- 설명부 -->
								<div class="list_box">
									<!-- 설명 -->
									<ul class=" explain_box">
										<!-- 위 -->
										<li class="text_exp">
											<img class="icon_1"src="img/soomgo/img_icon_rightuparrow.svg"/>
											<span>활동지수 108</span>											
										</li>
										<!-- 아래 -->
										<li class="text_exp review_exp">
											<img class="icon_1" src="img/soomgo/img_icon_speechbubble.svg"/>
											<span>사장님 너무 너무 친절하시구 합리적인 가격으로 아주 깨끗하게 청소 마무리 해주셨습니다 손도 빠르시고 엄청 베테랑이세요 ㅠㅠ!!!!!!!!!! 다음번에도 청소 문의 꼭 연락 드릴게요 고생많으셨어요 사장님 😭
											</span>	
										</li>
									</ul>
									<!-- 버튼 -->
									<div class="prof_btn">
										<a href="">프로필 확인</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- 리스트 종료 -->
					<!-- 리스트 시작 -->
					<li>
						<div class=" gosu_container">
							<!-- 좌측부 -->
							<div class=" gosu_img">
								<div class="img_con">
									<img src="img/soomgo/img_gosuprof_2.webp"/>
								</div>
							</div>
							<!-- 우측부 -->
							<div class="gosu_r_sec">
								<h5 class="gosu_name">오민호</h5>
								<!-- 별점 -->
								<div class="score">
									<ul class="star_rate">
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
									</ul>
									<strong>4.8</strong>
									<span>(2,138)</span>
								</div>
								<!-- 설명부 -->
								<div class="list_box">
									<!-- 설명 -->
									<ul class=" explain_box">
										<!-- 위 -->
										<li class="text_exp">
											<img class="icon_1"src="img/soomgo/img_icon_rightuparrow.svg"/>
											<span>활동지수 60</span>											
										</li>
										<!-- 아래 -->
										<li class="text_exp review_exp">
											<img class="icon_1" src="img/soomgo/img_icon_speechbubble.svg"/>
											<span>시간 조율과 깨끗하게 감사해요
											</span>	
										</li>
									</ul>
									<!-- 버튼 -->
									<div class="prof_btn">
										<a href="">프로필 확인</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- 리스트 종료 -->
					<!-- 리스트 시작 -->
					<li>
						<div class=" gosu_container">
							<!-- 좌측부 -->
							<div class=" gosu_img">
								<div class="img_con">
									<img src="img/soomgo/img_gosuprof_3.webp"/>
								</div>
							</div>
							<!-- 우측부 -->
							<div class="gosu_r_sec">
								<h5 class="gosu_name">전현자</h5>
								<!-- 별점 -->
								<div class="score">
									<ul class="star_rate">
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
									</ul>
									<strong>5.0</strong>
									<span>(184)</span>
								</div>
								<!-- 설명부 -->
								<div class="list_box">
									<!-- 설명 -->
									<ul class=" explain_box">
										<!-- 위 -->
										<li class="text_exp">
											<img class="icon_1"src="img/soomgo/img_icon_rightuparrow.svg"/>
											<span>활동지수 5</span>											
										</li>
										<!-- 아래 -->
										<li class="text_exp review_exp">
											<img class="icon_1" src="img/soomgo/img_icon_speechbubble.svg"/>
											<span>저희 상황 고려해주시고 양해해주셔서 감사드립니다
											</span>	
										</li>
									</ul>
									<!-- 버튼 -->
									<div class="prof_btn">
										<a href="">프로필 확인</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- 리스트 종료 -->
					<!-- 리스트 시작 -->
					<li>
						<div class=" gosu_container">
							<!-- 좌측부 -->
							<div class=" gosu_img">
								<div class="img_con">
									<img src="img/soomgo/img_gosuprof_4.webp"/>
								</div>
							</div>
							<!-- 우측부 -->
							<div class="gosu_r_sec">
								<h5 class="gosu_name">이정호</h5>
								<!-- 별점 -->
								<div class="score">
									<ul class="star_rate">
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
									</ul>
									<strong>4.8</strong>
									<span>(34)</span>
								</div>
								<!-- 설명부 -->
								<div class="list_box">
									<!-- 설명 -->
									<ul class=" explain_box">
										<!-- 위 -->
										<li class="text_exp">
											<img class="icon_1"src="img/soomgo/img_icon_rightuparrow.svg"/>
											<span>활동지수 5</span>											
										</li>
										<!-- 아래 -->
										<li class="text_exp review_exp">
											<img class="icon_1" src="img/soomgo/img_icon_speechbubble.svg"/>
											<span>시간내 끝났고, 청소도 잘 해주셨습니다. 
											</span>	
										</li>
									</ul>
									<!-- 버튼 -->
									<div class="prof_btn">
										<a href="">프로필 확인</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- 리스트 종료 -->
					<!-- 리스트 시작 -->
					<li>
						<div class=" gosu_container">
							<!-- 좌측부 -->
							<div class=" gosu_img">
								<div class="img_con">
									<img src="img/soomgo/img_gosuprof_5.webp"/>
								</div>
							</div>
							<!-- 우측부 -->
							<div class="gosu_r_sec">
								<h5 class="gosu_name">신왕선</h5>
								<!-- 별점 -->
								<div class="score">
									<ul class="star_rate">
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
										<li class="star fl">
											<img src="img/soomgo/img_icon_star_full.svg"/>
										</li>
									</ul>
									<strong>4.9</strong>
									<span>(231)</span>
								</div>
								<!-- 설명부 -->
								<div class="list_box">
									<!-- 설명 -->
									<ul class=" explain_box">
										<!-- 위 -->
										<li class="text_exp">
											<img class="icon_1"src="img/soomgo/img_icon_rightuparrow.svg"/>
											<span>활동지수 1</span>											
										</li>
										<!-- 아래 -->
										<li class="text_exp review_exp">
											<img class="icon_1" src="img/soomgo/img_icon_speechbubble.svg"/>
											<span>새로 인테리어한 건물 입주청소를 부탁드렸는데, 정말 꼼꼼하게 안보이는 공간까지 다 깔끔히 해주셨어요~! 실력도 가격도 모두 너무 만족스러워요~ 팀 모두 여성분으로 다같이 즐겁게 일하시는 것 같아 앞으로 사업도 기분좋게 시작될것 같은 기분이에요~^^ 정말 감사드리구요~ 앞으로도 계속 잘되시면 좋겠습니다~~!
											</span>	
										</li>
									</ul>
									<!-- 버튼 -->
									<div class="prof_btn">
										<a href="">프로필 확인</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<!-- 리스트 종료 -->
				</ul>
				<!-- 추천 고수 목록 종료 -->
			</div>
			<!-- 지역 서비스 추천 고수 end -->
			<!-- 지역 서비스 고수 포트폴리오 start-->
			<div id="" class=" cont_w cont_p">
				<div id="gosu_rec" class="padding_1">
					<h2 class="h2_1">
						<p>서울 지역</p>
						<p>
							<span>이사/입주 청소업체 고수 포트폴리오</span>
						</p>
					</h2>
					<ol class="now_service">
						<li class="now_li"><a href="">숨고</a></li>
						<li class="now_li"><a href="">서울</a></li>
						<li class="now_li">이사/입주 청소업체</li>
					</ol>
				</div>
				<!-- 포트폴리오 목록 start -->
				<div class="portfolio">
					<!-- 왼쪽으로 버튼 -->
					<button class="btn_l port_btn">
					</button>
					<div class="port_container">
						<div class="port_list">
							<!-- 포트폴리오 리스트 start -->
							<!-- 포폴 start -->
							<div>
								<div class="port_box">
									<a class="port_img">
										<div class="i_image">
											<img src="img/soomgo/img_portfolio_1.webp"/>
										</div>
										<div class="i_text">
											<h3>⭐️이사청소는 이렇게 진행되요⭐️</h3>
											<p>이사/입주 청소업체</p>
										</div>
									</a>
									<a class="port_text">
										<div class="port_thum">
											<img class="thum_img" src="img/soomgo/img_portfolio_1_thum.webp"/>
										</div>
										<span class="port_creater">삐까번쩍홈케어...</span>
									</a>
								</div>
							</div>
							<!-- 포폴 end -->
							<!-- 포폴 start -->
							<div>
								<div class="port_box">
									<a class="port_img">
										<div class="i_image">
											<img src="img/soomgo/img_portfolio_2.webp"/>
										</div>
										<div class="i_text">
											<h3>⭐️이사청소는 이렇게 진행돼요⭐️</h3>
											<p>이사/입주 청소업체</p>
										</div>
									</a>
									<a class="port_text">
										<div class="port_thum">
											<img class="thum_img" src="img/soomgo/img_portfolio_2_thum.webp"/>
										</div>
										<span class="port_creater">⭕️청소다움⭕️...</span>
									</a>
								</div>
							</div>
							<!-- 포폴 end -->
							<!-- 포폴 start -->
							<div>
								<div class="port_box">
									<a class="port_img">
										<div class="i_image">
											<img src="img/soomgo/img_portfolio_3.webp"/>
										</div>
										<div class="i_text">
											<h3>강서구입주청소</h3>
											<p>이사/입주 청소업체</p>
										</div>
									</a>
									<a class="port_text">
										<div class="port_thum">
											<img class="thum_img" src="img/soomgo/img_portfolio_3_thum.webp"/>
										</div>
										<span class="port_creater">⭕️청소다움⭕️...</span>
									</a>
								</div>
							</div>
							<!-- 포폴 end -->
							<!-- 포폴 start -->
							<div>
								<div class="port_box">
									<a class="port_img">
										<div class="i_image">
											<img src="img/soomgo/img_portfolio_4.webp"/>
										</div>
										<div class="i_text">
											<h3>목동 쓰레기집 특수청소</h3>
											<p>이사/입주 청소업체</p>
										</div>
									</a>
									<a class="port_text">
										<div class="port_thum">
											<img src="img/soomgo/img_portfolio_4_thum.webp"/>
										</div>
										<span class="port_creater">데일리클린⭐5.....</span>
									</a>
								</div>
							</div>
							<!-- 포폴 end --><!-- 포폴 start -->
							<div>
								<div class="port_box">
									<a class="port_img">
										<div class="i_image">
											<img src="img/soomgo/img_portfolio_4.webp"/>
										</div>
										<div class="i_text">
											<h3>목동 쓰레기집 특수청소</h3>
											<p>이사/입주 청소업체</p>
										</div>
									</a>
									<a class="port_text">
										<div class="port_thum">
											<img src="img/soomgo/img_portfolio_4_thum.webp"/>
										</div>
										<span class="port_creater">데일리클린⭐5.....</span>
									</a>
								</div>
							</div>
							<!-- 포폴 end -->
							<!-- 포트폴리오 리스트 end -->
						</div>
					</div>
					<!-- 오른쪽으로 버튼 -->
					<button class="btn_r port_btn">
					</button>
				</div>
				<!-- 포트폴리오 목록 end -->
				<div class="more_port">
					<a href="" class="more_btn">포트폴리오 더보기</a>
				</div>
			</div>
			<!-- 지역 서비스 고수 포트폴리오 end-->
			<!-- 서비스 예상견적 start-->
			<div class=" cont_w cont_p estimate">
				<h3>이사/입주 청소업체<br/>예상견적은?</h3>
				<div class="img_esti">
					<img src="img/soomgo/img_estimate.svg"/>
				</div>
				<a>예상금액 확인</a>
			</div>
			<!-- 서비스 예상견적 end-->
			<!-- 고수에게 묻다 start-->
			<div class="cont_p section_qna">
				<h3>고수에게 묻다</h3>
				<p>고수님들께 자주 묻는 질문과 답변을 살펴보세요</p>
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>신축 아파트 입주청소는 꼭 해야 하나요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								신축 아파트 입주 청소는 공사 중에 쌓인 먼지와 오염물, 보이지 않는 유해 물질까지 제거하는 청소입니다. 
								신축 아파트에는 아토피성피부염과 천식을 유발하는 포름알데히드, 두통과 구토, 중추신경계 장애를 일으킬 수 있는 휘발성 유기화합물 등이 검출될 수 있어 노약자나 아이에게 주의가 요구됩니다. 
								신축 아파트가 눈으로 보기에 깨끗해 보이더라도 건강을 생각하여 
								<a href="https://soomgo.com/search/pro/%EC%9D%B4%EC%82%AC-%EC%9E%85%EC%A3%BC-%EC%B2%AD%EC%86%8C-%EC%97%85%EC%B2%B4/address/%ED%99%88-%EB%A6%AC%EB%B9%99--%EC%B2%AD%EC%86%8C-%EC%97%85%EC%B2%B4" target="">
									전문 업체의 이사/입주 청소서비스
								</a>
								를 받는 것이 좋습니다.&nbsp;&nbsp;
							</p>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소 과정은 어떻게 진행되나요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								이사/입주 청소는 이전 거주자의 각종 오염이나 신축 공사 유해 물질을 말끔히 제거하는 청소로 다음과 같이 진행됩니다.
							</p>
							<ol class="li_num">
								<li>수납장 분리 청소, 창틀 청소</li>
								<li>화장실과 배수구 청소</li>
								<li>베란다 청소</li>
								<li>벽면 및 몰딩 청소</li>
								<li>주방 및 환풍기 청소</li>
								<li>바닥 청소</li>
							</ol>
							<p>
							오염 정도나 주택 환경에 따라 차이가 있지만, 일반적으로 32평 아파트를 3인이 청소할 경우 약 7시간 정도 소요됩니다. 성수기의 경우 이삿날 2~4주 이전에 미리 예약을 해야 원하는 날짜에 서비스를 이용할 수 있습니다.
							</p>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소 비용은 얼마인가요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								숨고에서 거래되는 
								<a href="https://soomgo.com/prices/%EC%9D%B4%EC%82%AC-%EC%9E%85%EC%A3%BC-%EC%B2%AD%EC%86%8C-%EC%97%85%EC%B2%B4" target="">
									이사/입주 청소의 평균 비용
								</a>
								은 청소 당 249,000원입니다. 이사/입주 청소의 평균적인 평당 가격은 약 10,000원입니다. 
								이사/입주 청소 가격은 면적(평수), 건물 종류(아파트, 빌라, 오피스텔, 주택 등) 방과 화장실, 베란다의 개수에 따라 결정됩니다. 
								곰팡이 제거, 얼룩이나 페인트 제거, 새집증후군이나 냄새 제거 등 추가로 원하는 서비스가 있다면 가격이 높아질 수 있습니다. 
								경우에 따라 줄눈 시공을 추가할 수 있습니다. 통상적으로 아파트 면적에 따른 이사/입주 청소 가격은 다음과 같습니다.
							</p>
							<ol class="li_num">
								<li>18평형 아파트: 185,000원</li>
								<li>24평형 아파트: 249,000원</li>
								<li>32평형 아파트: 346,000원</li>
								<li>40평형 이상 아파트: 480,000원 이상</li>
							</ol>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소 준비물은 무엇인가요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								이사/입주 청소를 셀프로 한다면 용도별 세제와 청소기, 빗자루, 청소용 솔, 수세미와 걸레, 고무장갑 등의 도구와 양동이나 대야를 준비해야 합니다. 
								높은 곳을 청소할 수 있는 긴 솔과 딛고 올라설 수 있는 의자를 준비하면 더욱 좋습니다. 쓰레기가 많이 발생하므로 용량이 큰 쓰레기봉투를 준비하는 것이 좋습니다. 
							</p>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소는 시간이 얼마나 소요되나요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								이사/입주 청소는 이전 거주자의 각종 오염이나 신축 공사 유해 물질을 말끔히 제거하는 청소입니다.  오염 정도나 주택 환경에 따라 차이가 있지만, 일반적으로 32평 아파트를 3인이 청소할 경우 약 7시간 정도 소요됩니다. 
								성수기의 경우 이삿날 2~4주 이전에 미리 예약을 해야 원하는 날짜에 서비스를 이용할 수 있습니다.   
							</p>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소업체 선택 시 무엇을 체크하나요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								이사, 입주청소 업체를 선정할 때는 다음의 사항을 확인해야 합니다. 
								우수한 청소업체의 경우 이삿날 2~4주 이전에 미리 예약을 해야 원하는 날짜에 서비스를 이용할 수 있습니다.     
							</p>
							<ol class="li_num">
								<li>비용이 합리적인가?</li>
								<li>청소 범위는 어디까지인가?</li>
								<li>어떠한 청소 도구를 사용하는가?</li>
								<li>청소 인원이 몇 명인가?</li>
								<li>불만족 시 A/S는 진행하는가?</li>
							</ol>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
				<!-- qna_box start -->
				<div class="qna_container">
					<h3>이사, 입주 청소를 셀프로 해도 되나요?</h3>
					<div class="qna_box">
						<div class="qna_textbox">
							<p class="qna_text">
								이사/입주청소는 이전 거주자의 각종 오염이나 신축 공사 유해 물질을 말끔히 제거하는 청소입니다. 신축 아파트에는 아토피성피부염과 천식을 유발하는 포름알데히드, 두통과 구토, 중추신경계 장애를 일으킬 수 있는 휘발성 유기화합물 등이 검출될 수 있어 노약자나 아이에게 주의가 요구됩니다. 
								신축 아파트가 눈으로 보기에 깨끗해 보이더라도 건강을 생각하여   
								<a href="https://soomgo.com/search/pro/%EC%9D%B4%EC%82%AC-%EC%9E%85%EC%A3%BC-%EC%B2%AD%EC%86%8C-%EC%97%85%EC%B2%B4/address/%ED%99%88-%EB%A6%AC%EB%B9%99--%EC%B2%AD%EC%86%8C-%EC%97%85%EC%B2%B4" target="">
									전문업체의 이사/입주청소 서비스
								</a>
								를 받는 것이 좋습니다.&nbsp;&nbsp;   
							</p>
						</div>
						<button class="qna_btn">더보기</button>
					</div>
				</div>
				<!-- qna_box end -->
			</div>
			<!-- 고수에게 묻다 end-->
			<!-- 고수 고용하기 start-->
			<div class=" hire_section">
				<div class=" hire_container cont_w cont_p">
					<h3>숨고에서 딱 맞는 고수를 고용하세요</h3>
					<div class=" hire_imgs_box">
						<!-- 아이템 start -->
						<div class="hire_box">
							<!-- img 박스 -->
							<div class="hire_img">
								<img src="img/soomgo/img_hire_img1.svg">
							</div>
							<!-- 텍스트 -->
							<div class="hire_img_text">
								<!-- 소제목 -->
								<h4>한번에 쉽게</h4>
								<!-- 내용 -->
								<p>
									발품 팔 필요없이 한 번 요청으로 딱 맞는 고수를 찾아드려요.
								</p>
							</div>
						</div>
						<!-- 아이템 end -->
						<!-- 아이템 start -->
						<div class="hire_box">
							<!-- img 박스 -->
							<div class="hire_img">
								<img src="img/soomgo/img_hire_img2.svg">
							</div>
							<!-- 텍스트 -->
							<div class="hire_img_text">
								<!-- 소제목 -->
								<h4>한 눈에 비교</h4>
								<!-- 내용 -->
								<p>
									여러 고수의 프로필, 견적, 고객리뷰를 쉽게 비교하고 선택하세요.
								</p>
							</div>
						</div>
						<!-- 아이템 end -->
						<!-- 아이템 start -->
						<div class="hire_box">
							<!-- img 박스 -->
							<div class="hire_img">
								<img src="img/soomgo/img_hire_img3.svg">
							</div>
							<!-- 텍스트 -->
							<div class="hire_img_text">
								<!-- 소제목 -->
								<h4>안전한 거래</h4>
								<!-- 내용 -->
								<p>
									숨고페이로 안심하고 서비스 대금을 결제하세요.
								</p>
							</div>
						</div>
						<!-- 아이템 end -->
					</div>
					<a>고수 고용하기</a>
				</div>
			</div>
			<!-- 고수 고용하기 end-->
			<!-- 연관 기능/링크 -->
			<div class=" cont_w cont_p">
				<div class="associate_function">
					<!-- 상자 -->
					<div class="funcion_container cont_p">	
						<h3>관련 서비스<br/>예상금액
						</h3>
						<div class="function_box">
							<!-- a태그 상자 start-->
							<div class="a_box">
								<a href=""> 도배 시공 예상견적 </a>
								<a href=""> 국내 이사 예상견적 </a>
								<a href=""> 폐기물 처리 예상견적 </a>
								<a href=""> 수도 관련 설치 및 수리 예상견적 </a>
								<a href=""> 문 설치 및 수리 예상견적 </a>
								<a href=""> 벽걸이TV 설치 및 철거 예상견적 </a>
								<a href=""> 집청소 도우미 예상견적 </a>
								<a href=""> 해충방역 예상견적 </a>
								<a href=""> 간판 제작 예상견적 </a>
								<a href=""> 사무실/상업공간 청소업체 예상견적 </a>
								<a href=""> 펫 시터(주인 집에서) 예상견적 </a>
								<a href=""> 가전제품 청소 예상견적 </a>
							</div>	
							<!--a 더보기 버튼 -->
							<button>더보기</button>
						</div>
					</div>
					<!-- 상자 end-->
					<!-- 상자 -->
					<div class="funcion_container cont_p">	
						<h3>서울<br/>인기 서비스
						</h3>
						<div class="function_box">
							<!-- a태그 상자 start-->
							<div class="a_box">
								<a href=""> 영어 과외 요청하기 </a>
								<a href=""> 에어컨 설치 및 수리 요청하기 </a>
								<a href=""> 원룸/소형 이사 요청하기 </a>
								<a href=""> 도배 시공 요청하기 </a>
								<a href=""> 에어컨 청소 요청하기 </a>
								<a href=""> 퍼스널트레이닝(PT) 요청하기 </a>
								<a href=""> 용달/화물 운송 요청하기 </a>
								<a href=""> 국내 이사 요청하기 </a>
								<a href=""> 욕실/화장실 리모델링 요청하기 </a>
								<a href=""> 정리수납 컨설팅 요청하기 </a>
								<a href=""> 도배장판 시공 요청하기 </a>
								<a href=""> 거주 청소업체 요청하기 </a>
								<a href=""> 폐기물 처리 요청하기 </a>
								<a href=""> 집 인테리어 요청하기 </a>
								<a href=""> 전기배선 설치 및 수리 요청하기 </a>
							</div>	
							<!--a 더보기 버튼 -->
							<button>더보기</button>
						</div>
					</div>
					<!-- 상자 end-->
					<!-- 상자 -->
					<div class="funcion_container cont_p">	
						<h3>서울<br/>추천 고수
						</h3>
						<div class="function_box">
							<!-- a태그 상자 start-->
							<div class="a_box">
								<a href=""> 내 주변 영어 과외  </a>
								<a href=""> 내 주변 에어컨 설치 및 수리  </a>
								<a href=""> 내 주변 원룸/소형 이사  </a>
								<a href=""> 내 주변 도배 시공  </a>
								<a href=""> 내 주변 에어컨 청소  </a>
								<a href=""> 내 주변 퍼스널트레이닝(PT)  </a>
								<a href=""> 내 주변 용달/화물 운송  </a>
								<a href=""> 내 주변 국내 이사  </a>
								<a href=""> 내 주변 욕실/화장실 리모델링  </a>
								<a href=""> 내 주변 정리수납 컨설팅  </a>
								<a href=""> 내 주변 도배장판 시공  </a>
								<a href=""> 내 주변 거주 청소업체  </a>
								<a href=""> 내 주변 폐기물 처리  </a>
								<a href=""> 내 주변 집 인테리어  </a>
								<a href=""> 내 주변 전기배선 설치 및 수리  </a>
							</div>	
							<!--a 더보기 버튼 -->
							<button>더보기</button>
						</div>
					</div>
					<!-- 상자 end-->
					<!-- 상자 -->
					<div class="funcion_container cont_p">	
						<h3>주변 지역<br/>고수찾기
						</h3>
						<div class="function_box">
							<!-- a태그 상자 start-->
							<div class="a_box">
								<a href=""> 강남구 고수찾기  </a>
								<a href=""> 마포구 고수찾기  </a>
								<a href=""> 성동구 고수찾기  </a>
								<a href=""> 서초구 고수찾기  </a> 
								<a href=""> 관악구 고수찾기  </a>
								<a href=""> 동대문구 고수찾기  </a>
								<a href=""> 강서구 고수찾기  </a>
								<a href=""> 구로구 고수찾기  </a>
								<a href=""> 광진구 고수찾기  </a>
								<a href=""> 서대문구 고수찾기  </a>
								<a href=""> 중랑구 고수찾기  </a> 
								<a href=""> 은평구 고수찾기  </a>
								<a href=""> 양천구 고수찾기  </a> 
								<a href=""> 영등포구 고수찾기  </a>
								<a href=""> 용산구 고수찾기  </a>
							</div>	
							<!--a 더보기 버튼 -->
							<button>더보기</button>
						</div>
					</div>
					<!-- 상자 end-->
				</div>
			</div>
			<!-- 연관 기능/링크 end-->
			
		</div>
	</div>
	
	<!-- 하단바 -->
	<div id = "under-box" class="center">
        <div id = "under-1" class = "center">
            <div id = "under-1-1" class = "center">
                <div id = "phone-number" class = "center">
                    <p class ="p-number">1599-5319</p>
                </div>
            
                <div id = "operating-time" class = "center">
                    <p class= "operating-time-p">평일 10:00 - 18:00</p>
                    <p class= "operating-time-p">(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</p>
                </div>
                
                <div id = "store-box" class = "center">
                    <div id ="app-store" class ="center">
                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
                            <div id = "app-img" class = "center">
                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" width = "26px" height = "20px" class = "app-img">
                            </div>

                            <div id = "app-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
                                APP STORE
                            </div>
                        </a>
                    </div>

                    <div id ="play-store" class ="center">
                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
                            <div id = "play-store-img" class = "center">
                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" width = "26px" height = "20px" class = "play-store-img">
                            </div>

                            <div id = "play-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
                                PLAY STORE
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div id = "under-1-2" class = "center">
                <div id = "Introduction-to-hiding" class =  "center">
                    <ul>
                        <li class = "under-title">숨고소개</li>
                        <li><a href = "https://soomgo.com/about" class = "under-title-link">회사소개</a></li>
                        <li><a href ="https://www.soomgo.team/career" class = "under-title-link">채용안내</a></li>
                        <li><a href = "https://blog.soomgo.com/"  class = "under-title-link">팀블로그</a></li>
                    </ul>
                </div>

                <div id = "Customer-information" class = "center">
                    <ul>
                        <li class = "under-title">고객안내</li>
                        <li><a href ="https://soomgo.com/how-it-works"  class = "under-title-link">이용안내</a></li>
                        <li><a href ="https://soomgo.com/safety"  class = "under-title-link">안전정책</a></li>
                        <li><a href ="https://soomgo.com/prices"  class = "under-title-link">예상금액</a></li>
                        <li><a href ="https://soomgo.com/search/pro/review_count"  class = "under-title-link">고수찾기</a></li>
                        <li><a href ="https://help.soomgo.com/hc/ko/articles/360056329911--24-04-22-%EC%A0%81%EC%9A%A9-%EC%88%A8%EA%B3%A0%EB%B3%B4%EC%A6%9D-%EC%9D%B4%EC%9A%A9%EC%95%BD%EA%B4%80" class = "under-title-link">숨고보증</a></li>
                        <li><a href ="https://soomgo.com/questions/" class = "under-title-link">고수에게묻다</a></li>
                    </ul>
                </div>

                <div id ="Master-Guide" class= "center">
                    <ul>
                        <li class = "under-title">고수안내</li>
                        <li><a href = "https://soomgo.com/how-soomgo-works"  class = "under-title-link">이용안내</a></li>
                        <li><a href = "https://help.soomgo.com/hc/ko/categories/115001218027"  class = "under-title-link">고수가이드</a></li>
                        <li><a href = "https://soomgo.com/pro"  class = "under-title-link">고수가입</a></li>
                    </ul>
                </div>

                <div id = "customer-service-center" class = "center">
                    <ul>
                        <li class = "under-title">고객센터</li>
                        <li><a href = "https://help.soomgo.com/hc/ko/categories/360002081551-%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD" class = "under-title-link">공지사항</a></li>
                        <li><a href = "https://help.soomgo.com/hc/ko"  class = "under-title-link">자주묻는질문</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id = "under-2" class = "center">
            <div id = "under-2-1" class = "center">
                <div id = "under-2-1-1" class ="center">
                    <a href = "https://soomgo.com/terms/usage/2023-12-28" class = "text-term">이용약관</a>
                </div>

                <div id = "under-2-1-2" class ="center">
                    <a href = "https://soomgo.com/terms/privacy/2024-04-17" class = "text-term">개인정보처리방침</a>
                </div>

                <div id = "under-2-1-3" class = "center">
                    <a href = "https://soomgo.com/terms/location/2023-02-15" class = "text-term">위치기반 서비스 이용약관</a>
                </div>

                <div id = "under-2-1-4" class = "center">
                    <a href = "https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208822325" class = "text-term">사업자 정보확인</a>
                </div>
            </div>

            <div id = "under-2-2" class = "center">
                <span class ="under-2-2-text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 
                    의무와 책임은 거래당사자에게 있습니다.</span>
            </div>

            <ul id = "under-2-3" class = "center">
                <li class = "under-2-3-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li>
                <li class = "under-2-3-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li>
                <li class = "under-2-3-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li>
                <li class = "under-2-3-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li>
            </ul>

            <div id = "under-2-4" class = "center">
                <div id = "under-2-4-1" class = "center">
                    <a href = "https://www.facebook.com/SoomgoKorea/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg">
                    </a>
                </div>

                <div id = "under-2-4-2" class = "center">
                    <a href = "https://www.instagram.com/soomgo_official/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg">
                    </a>
                </div>

                <div id = "under-2-4-3" class = "center">
                    <a href = "https://blog.naver.com/brave_mobile_mkt">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg">
                    </a>
                </div>

                <div id = "under-2-4-4" class = "center">
                    <a href = "https://post.naver.com/brave_mobile_mkt?isHome=1">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg">
                    </a>
                </div>

                <div id = "under-2-4-5" class = "center">
                    <a href = "https://news.soomgo.com/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg">
                    </a>
                </div>
            </div>
       	 </div>
	<!-- 하단바 종료 -->
 	</div>
</div>
</body>
</html>