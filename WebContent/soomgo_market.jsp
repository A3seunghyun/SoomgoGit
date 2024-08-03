<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.MarketChatContentsDTO"%>
<%@page import="dto.MarketChatRoomListDTO"%>
<%@page import="dao.MarketChatBotDAO"%>
<%@page import="dto.MiddleCategoryDTO"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MarketProductListDAO"%>
<%@page import="dto.MarketProductListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%!	// 'declaration' : 메서드 정의 -------------> _jsp.java 에서 얘 위치를 확인 = "_jspService() 메서드 바깥에."
		public String m3(int price) {
			DecimalFormat decFormat = new DecimalFormat("###,###");
			return decFormat.format(price);
		}
	%>
	
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
	
    <%
    	int categoryIdx = 1;
    	int pageNum = 1;
    	try {
	    	categoryIdx = Integer.parseInt(request.getParameter("category_idx"));
	    	pageNum = Integer.parseInt(request.getParameter("page"));
    	} catch (Exception e) { }
    	
    	int startNum, endNum;
    	int lastPageNum;
    	
    	MarketProductListDAO mplDao = new MarketProductListDAO();
    	ArrayList<MarketProductListDTO> mpl = mplDao.marketList(categoryIdx, pageNum);
    	
    	CategoryDAO cateDao = new CategoryDAO();
    	ArrayList<CategoryDTO> category = cateDao.catelist();
    	ArrayList<MiddleCategoryDTO> middleCategory = cateDao.middleCateList(categoryIdx);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 마켓 메인페이지 -승현</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/soomgo_market.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	
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
	<script type="text/javascript">
		$(function () {
			$(".filter-dropdown-menu").hide();
			$(".keyword-box").hide();
			
			$(".form-control").focus(function () {
				$(".keyword-box").show();
			});
			
			$(".keyword-title").click(function () {
				let inputText = $(this).text();
				$(".form-control").val(inputText);
				location.href = "SoomgoMarketSearchListServlet?title="+inputText;
			})
			
			
			
			$("html").click(function (e) {
				if(!$(e.target).is(".keyword-box, .form-control")){
					$(".keyword-box").hide();
				}
			})
			
			
			$("#title-filter > ul > li:nth-child(<%=categoryIdx%>)").addClass("active");
			if(<%=categoryIdx%> >=9 && <%=categoryIdx%> <=11){
				swal("준비중입니다.");
			}
			
			$("#title-filter ul li").click(function () {
				if($("#title-filter ul li").hasClass("active") == true){
					$("#title-filter ul li").removeClass("active");
				}
				$(this).addClass("active");
				
			})

			$(".category").click(function () {
				let idx = $(this).attr("idx");
				location.href = "/SoomgoGit/SoomgoMarketServlet?category_idx="+idx;
			
			})

			
			$("#category-filter ul li").click(function () {
				if($("#category-filter ul li").hasClass("active") == true){
					$("#category-filter ul li").removeClass("active");
				}
				$(this).addClass("active");
			})
			$("#product-list-filter > span").click(function () {
				$(".filter-dropdown-menu").toggle();
			})
			
			$(".dropdown-item").click(function () {
				if($(".dropdown-item").hasClass("active") == true){
					$(".dropdown-item").removeClass("active");
				}
				$(this).addClass("active");
				let menuVal = $(this).text();
				$("#product-list-filter > span").text(menuVal);
				$(".filter-dropdown-menu").hide();
			})
			
			$(".form-control").on("keyup",function (e) {
				if( e.code == 'Enter'){
					var searchVal = $(this).val();
					location.href = "SoomgoMarketSearchListServlet?title="+searchVal;
				}
			})
			
			$(window).scroll(function() {
				if($(window).scrollTop() + $(window).height() == $(document).height()) {
					console.log("페이지 맨아래 도달! 무한스크롤 실행!");
					draw_new_board_list(++page_num);
				}
// 				if($(window).scrollTop() + $(window).height() >= $(document).height() - 5) {
//         			console.log("페이지 맨아래 도달! 무한스크롤 실행! page_num : " + page_num);
//         			draw_new_board_list(++page_num);
//     			}
			});
			
			
		})
		
		function comma(num) {
			num = String(num);
			return num.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}
		
		let page_num = <%=pageNum%>;
		let category_idx = <%=categoryIdx%>;
		function draw_new_board_list(page) {
			$.ajax({
				type: 'get',
				data: {page_num : page_num, category_idx: category_idx},
				dataType: "json",
				url: "AjaxSoomgoMarketScrollServlet",
				success: function (res) {
					console.log("성공");
					for(let i = 0; i <= res.length-1; i++){
						let str = "<article class=\"product-list-item\">"+
						"<a class=\"product-list-item-a\" href=\"SoomgoMarketDetailServlet?market_idx=" + res[i].market_idx + "&market_title=" + res[i].title + "\">"+
						"<div class=\"product-list-item-image\">"+
						"<article class=\"preview-image\">"+
						"<div class=\"image-wrap\">"+
						"<img src=\""+res[i].imgUrl+"\">"+
						"</div>"+
						"</article>"+
						"</div>"+
						"<div class=\"product-list-service-name\">"+
						"<span>"+res[i].title+"</span>"+
						"</div>"+
						"<div class=\"product-list-item-title\">"+
						"<div class=\"item-title-collapsed\">"+
						"<div class=\"item-title-line-clamp\">"+
						"<h3>"+res[i].marketName+"</h3>"+
						"</div>"+
						"</div>"+
						"</div>"+
						"<div class=\"product-list-item-price\">"+
						"<strong>" + comma(res[i].marketMinPrice) + "원 ~</strong>"+
						"</div>"+
						"<div class=\"product-list-provider-review\">"+
						"<span class=\"review-star-icon\">"+
						"<svg width=\"14\" height=\"14\" viewBox=\"0 0 14 14\" xmlns=\"http://www.w3.org/2000/svg\">"+
						"<path d=\"m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596\" fill=\"#FFCE21\" fill-rule=\"evenodd\"></path>"+
						"</svg>"+
						"</span>"+
						"<span class=\"review-avg\">"+res[i].marketAvg+"</span>"+
						"<span class=\"review-count\">("+res[i].marketCount+")</span>"+
						"</div>"+
						"</a>"+
						"</article>";
						$(".product-list").append(str);
					}
					
				},
				error: function (r, s, e) {
					alert("[에러] code:" + r.status + ", message:" + r.responseText + ", error:"+e)
				}
			});
		}
	</script>
</head>
<body>
	<header class = "header-total"> <!-- 헤더 HTML 시작 -->
		<div class = "header-inner">
			<section class = "header-section1">
				<div class = "header-div1">
					<div class = "header-div1-1">
						<div class = "header-div1-1-logo">
							<a href = "soomgo_main.jsp">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "sgRequestMain.jsp" >
										<span class = "header-nav-li-span" style = "color : black;">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span" id = "serarch_profile" style = "color : black;">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span" style = "color : black;">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span" style = "color : black;">커뮤니티</span>
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
							<a href = "soomgo_main.jsp">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "sgRequestMain.jsp">
										<span class = "header-nav-li-span" style = "color : black;">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span" style = "color : black;">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span" style = "color : black;">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span" style = "color : black;">커뮤니티</span>
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
							<a href = "soomgo_main.jsp">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
								<li class = "header-nav-li">
									<a href = "sgRequestMain.jsp">
										<span class = "header-nav-li-span" style = "color : black;">견적요청</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "Seach.profile.jsp">
										<span class = "header-nav-li-span" style = "color : black;">고수찾기</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span" style = "color : black;">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
										<span class = "header-nav-li-span" style = "color : black;">커뮤니티</span>
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
	</header> <!-- 헤더 HTML 끝 -->
	<div id="app-body">
		<div id="market-title" class="center">
			<span>마켓</span>
		</div>
		<div id="top-section" class="center">
			<div id="keyword-search">
				<div id="search-area" class="fl">
					<div class="input-wrap">
						<div class="input-group">
							<div class="input-group-prepend">
								<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMSkiIHN0cm9rZT0iI0M1QzVDNSIgc3Ryb2tlLXdpZHRoPSIxLjUiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBjeD0iNi42MTEiIGN5PSI2LjYxMSIgcj0iNS44NjEiLz4KICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNS4yNSAxNS4yNS00LjI0My00LjI0MyIvPgogICAgPC9nPgo8L3N2Zz4K" class="search-icon">
							</div>
							<input type="text" class="form-control" placeholder="원하는 상품을 검색해보세요">
						</div>
						<div class="keyword-box">
							<ul>
								<li class="title">추천 서비스</li>
								<li class="keyword-title">피트니스</li>
								<li class="keyword-title">디자인 외주</li>
								<li class="keyword-title">음악이론/보컬</li>
								<li class="keyword-title">웨딩</li>
								<li class="keyword-title">취업 준비</li>
								<li class="keyword-title">입주/집 청소</li>
								<li class="keyword-title">가전/가구 청소</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="title-filter" class="center">
				<ul>
				<%
					for(CategoryDTO dto : category){
				%>
					<li class="category" idx="<%=dto.getCategoryIdx()%>"><a><%=dto.getCategoryTitle() %></a></li>
				<%
					}
				%>	
				</ul>
			</div>
		</div>
		<div id="main-page" class="center">
			<div id="category-filter" class="fl">
				<ul>
					<li class="active"><a>전체</a></li>
					<%
						for(MiddleCategoryDTO dto : middleCategory){
					%>
					<li><a><%=dto.getTitle() %></a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div id="sub-page" class="fl">
				<div id="filter-controller">
					<button type="button">
						<img src="img/area_fillter_btn.svg">지역
					</button>
				</div>
				<div id="product-list-top">
					<div id="product-total-count">
					<%
					int count = 0;
					for(MarketProductListDTO dto : mpl) {
						count++;			
					}
					%>
						<strong><%=count %></strong><span>개 서비스</span>
					</div>
					<div id="product-list-filter">
						<span>추천순</span>
					</div>
					<ul	class="filter-dropdown-menu">
						<li class="sort-item">
							<a class="dropdown-item active">추천순</a>
						</li>
						<li class="sort-item">
							<a class="dropdown-item">인기순</a>
						</li>
						<li class="sort-item">
							<a class="dropdown-item">최신순</a>
						</li>
						<li class="sort-item">
							<a class="dropdown-item">평점순</a>
						</li>
						<li class="sort-item">
							<a class="dropdown-item">리뷰 많은순</a>
						</li>
					</ul>
				</div>
				<div class="product-list">
					<%
 						for(MarketProductListDTO dto : mpl) {
 					%>
					<article class="product-list-item">
						<a class="product-list-item-a" href="SoomgoMarketDetailServlet?market_idx=<%=dto.getMarket_idx()%>&market_title=<%=dto.getMarketName()%>" >
							<div class="product-list-item-image">
								<article class="preview-image">
									<div class="image-wrap">
										<img src="<%=dto.getImgUrl() %>">
									</div>
								</article>
							</div>
							<div class="product-list-service-name">
								<span><%=dto.getTitle() %></span>
							</div>
							<div class="product-list-item-title">
								<div class="item-title-collapsed">
									<div class="item-title-line-clamp">
										<h3><%=dto.getMarketName() %></h3>
									</div>
								</div>
							</div>
							<div class="product-list-item-price">
								<strong><%=m3(dto.getMarketMinPrice()) %>원 ~</strong>
							</div>
							<div class="product-list-provider-review">
								<span class="review-star-icon">
									<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    									<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
									</svg>
								</span>
								<span class="review-avg"><%=dto.getMarketAvg() %></span>
								<span class="review-count">(<%=dto.getMarketCount() %>)</span>
							</div>
						</a>
					</article>
					<%
 						}
					%>
				</div>
			</div>
		</div>
	</div>
	<div style ="clear:both;"></div>
	<div id="app-footer" class="center">
		<div id="footer-container" class="center">
			<div id="col-content">
				<p id="col-content-text">1599-5319</p>
				<p id="col-content-text-middle">
					평일 10:00 - 18:00<br/>
					(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)
				</p>
				<a class="footer-download" style="margin-right: 8px;">
					<img src="https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" class="footer-download-img">
					APP STORE 
				</a>
				<a class="footer-download">
					<img src="https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" class="footer-download-img">
					PLAY STORE 
				</a>
			</div>
			<div id="col-content-right">
				<ul id="content-list">
					<li class="content-list">
						<span class="content-list-category">숨고소개</span>
						<div>
							<a class="content-list-text">회사소개</a>
							<a class="content-list-text">채용안내</a>
							<a class="content-list-text">팀블로그</a>
						</div>
					</li>
					<li class="content-list">
						<span class="content-list-category">고객안내</span>
						<div>
							<a class="content-list-text">이용안내</a>
							<a class="content-list-text">안전정책</a>
							<a class="content-list-text">예상금액</a>
							<a class="content-list-text">고수찾기</a>
							<a class="content-list-text">숨고보증</a>
							<a class="content-list-text">고수에게묻다</a>
						</div>
					</li>
					<li class="content-list">
						<span class="content-list-category">고수안내</span>
						<div>
							<a class="content-list-text">이용안내</a>
							<a class="content-list-text">고수가이드</a>
							<a class="content-list-text">고수가입</a>
						</div>
					</li>
					<li class="content-list">
						<span class="content-list-category">고객센터</span>
						<div>
							<a class="content-list-text">공지사항</a>
							<a class="content-list-text">자주묻는질문</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="footer-container-row" class="center">
			<div id="footer-container-row-term">
				<div class="row-term-content">
					<div class="row-term-list">
						<div class="row-term-list-terms-group" style="margin-right: 30px;">
							<a class="terms-text" style="margin-right: 30px;">이용약관</a>
							<a class="terms-text">개인정보처리방침</a>
						</div>
						<div class="row-term-list-terms-group">
							<a class="terms-text" style="margin-right: 30px;">위치기반 서비스 이용약관</a>
							<a class="terms-text">사업자 정보확인</a>
						</div>
					</div>
					<div class="row-term-list">
						<span class="terms-text-span">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span>
					</div>
					<ul class="row-term-content-guide">
						<li class="content-guide-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li>
						<li class="content-guide-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li>
						<li class="content-guide-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li>
						<li class="content-guide-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li>
					</ul>
				</div>
				<div class="row-term-content-badge">
					<a class="footer-badge">
						<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg" class="footer-badge-img">
					</a>
					<a class="footer-badge">
						<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg" class="footer-badge-img">
					</a>
					<a class="footer-badge">
						<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg" class="footer-badge-img">
					</a>
					<a class="footer-badge">
						<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg" class="footer-badge-img">
					</a>
					<a class="footer-badge">
						<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg" class="footer-badge-img">
					</a>
				</div>
			</div>
		</div>
	</div>
		
<!-- 마켓 채팅 문의하기 시작 -->
	<%
		int usersIdx = 21;
	
		MarketChatBotDAO mDao = new MarketChatBotDAO();
	
		ArrayList<MarketChatRoomListDTO> roomList = mDao.getMarketChatRoomList(usersIdx);
		ArrayList<MarketChatContentsDTO> contentsList = new ArrayList<MarketChatContentsDTO>();
	%>
	
	<script type="text/javascript">
		$(function () {
			$("#chatWindow").hide();
			$("#chatList").hide();
			$(".market-chat-btn").click(function name() {
				$("#chatList").fadeToggle("slow");
			})
			
			$("#backButton").click(function () {
				$("#chatWindow").hide();
				$("#chatList").show();
			})
			
			$("#closeChatListButton, #closeChatWindowButton").click(function () {
				$("#chatWindow, #chatList").fadeOut("slow");
			})
			
			function func_on_message(e) {
				let you = "<div class=\"message bot\">" +
	 			"<div class=\"avatar\"><img src=\"img/chat_soomgo.png\" style=\"width: 40px; height: 40px;\"></div>" +
	 			"<div class=\"text\">" + e.data + "</div>" +
				"</div>";
				$(".chat-body").append(you);
				$(".chat-body").scrollTop($(".chat-body")[0].scrollHeight);
				
				const Toast = Swal.mixin({
	                toast: true,
	                position: 'top-end',
	                showConfirmButton: false,
	                timer: 1500,
 	                timerProgressBar: true,
	                didOpen: (toast) => {
	                    toast.addEventListener('mouseenter', Swal.stopTimer)
	                    toast.addEventListener('mouseleave', Swal.resumeTimer)
	                }
	            })
	            
				Toast.fire({
	                icon: 'info',
	                title: e.data
	            })
			}
			
			function func_on_error(e) {
				alert("Error!");
			}
			
			let webSocket = new WebSocket("ws://localhost:9095/SoomgoGit/marketBroadcasting");
			
			webSocket.onmessage = func_on_message;
			webSocket.onerror = func_on_error;
			
			$("#chat-content").keypress(function (key) {
				
				if(key.keyCode == 13){
					let content = $(this).val();
					let roomIdx = $(".chat-body").attr("idx");
					let data = {"roomIdx":roomIdx, "usersIdx":<%=usersIdx%>, "content":content};
					
					webSocket.send(JSON.stringify(data));	// 배열을 JSON 문자열로 변환하여 전송
					
					$(this).val("");	// 입력 필드 초기화
					
					// 채팅 메시지 업데이트
					let me = "<div class=\"message user\">" +
	     						"<div class=\"text\">"+content+"</div>" +
	 						"</div>";
					$(".chat-body").append(me);
					$(".chat-body").scrollTop($(".chat-body")[0].scrollHeight);
				}
			})
			
		})
		
		function openChat(roomIdx) {
			
			$.ajax({
				type: "post",
				data: {roomIdx: roomIdx},
				url: "AjaxSoomgoMarketChatServlet",
				success: function (res) {
					if(res.length > 0){
						console.log("채팅 내용 있음 성공");
						$(".chat-body").attr("idx", res[0].roomIdx)
						let a = $(".chat-body").attr("idx");
						
						$(".chat-body").html("");
						for(let i = 0; i <= res.length-1; i++){
							let you = "<div class=\"message bot\">" +
			                 			"<div class=\"avatar\"><img src=\"img/chat_soomgo.png\" style=\"width: 40px; height: 40px;\"></div>" +
			                 			"<div class=\"text\">"+res[i].contents+"</div>" +
			             			"</div>";
			             			
			             	let me = "<div class=\"message user\">" +
			                 			"<div class=\"text\">"+res[i].contents+"</div>" +
			             			"</div>";
							if(res[i].usersIdx != <%=usersIdx%>){
								$(".chat-body").append(you);
							} else {
								$(".chat-body").append(me);
							}
							
							$(".chat-body").scrollTop($(".chat-body")[0].scrollHeight);
						}
					} else {
						console.log("채팅 내용 없음 성공");
						$(".chat-body").attr("idx", res.roomIdx);
					}
				},
				error: function (r, s, e) {
					alert("[에러] code:" + r.status + ", message:" + r.responseText + ", error:"+e);
				}
				
			});
			
			$("#chatWindow").show();
			$("#chatList").hide();
		}
		
	</script>

	<button type="button" class="market-chat-btn">
		<svg data-v-eec0a5dc="" data-v-808f0f30="" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4.43183 10.5534C4.50302 6.7072 7.82667 3.5448 12.0001 3.5448C16.1736 3.5448 19.4972 6.70722 19.5684 10.5535C19.487 10.5419 19.4039 10.5359 19.3193 10.5359H18.4993C16.9806 10.5359 15.7493 11.7671 15.7493 13.2859V14.3584C15.7493 15.8772 16.9806 17.1084 18.4993 17.1084H19.3193C19.4043 17.1084 19.4878 17.1024 19.5696 17.0907V18.0053C19.5696 18.6957 19.0099 19.2553 18.3196 19.2553H15.8292C15.6038 18.2507 14.7065 17.5 13.6338 17.5C12.3911 17.5 11.3838 18.5074 11.3838 19.75C11.3838 20.9926 12.3911 22 13.6338 22C14.5151 22 15.2781 21.4933 15.6473 20.7553H18.3196C19.8384 20.7553 21.0696 19.5241 21.0696 18.0053V10.6795C21.0696 5.87324 16.9706 2.0448 12.0001 2.0448C7.02964 2.0448 2.93066 5.87324 2.93066 10.6795V15.3584C2.93066 16.3249 3.71417 17.1084 4.68066 17.1084H5.50066C7.01945 17.1084 8.25066 15.8772 8.25066 14.3584V13.2859C8.25066 11.7671 7.01945 10.5359 5.50066 10.5359H4.68066C4.59619 10.5359 4.51311 10.5419 4.43183 10.5534Z" fill="white"></path></svg>
		<span class="market-chat-title">CHAT</span>
	</button>
	<div id="chatApp">
	    <div id="chatList" class="chat-list">
	        <div class="chat-list-header">
	            <span>채팅방 목록</span>
	            <button id="closeChatListButton" class="closeButton">X</button>
	        </div>
			<!--채팅방 idx-->
			<%for(MarketChatRoomListDTO mcrlDto : roomList) { %>
		        <div class="chat-room" onclick="openChat(<%=mcrlDto.getChatRoomIdx()%>)">
			        <% if(mcrlDto.getGosuFimg().equals("기본이미지")){%>
		           	 	<img src="img/요청사람이미지.svg">
		            <% } else { %>
		           		<img src=<%=mcrlDto.getGosuFimg() %>>
		            <% } %>
		            <span><%=mcrlDto.getGosuName() %></span>
		        </div>
	        <% } %>
	        <!-- 채팅방 추가 -->
	    </div>
	
	    <div id="chatWindow" class="chat-window">
	        <div class="chat-header">
	            <button id="backButton">뒤로</button>
	            <span>실시간 마켓 문의하기</span>
	            <button id="closeChatWindowButton" class="closeButton">X</button>
	        </div>
	        <div class="chat-body">
	        <!-- 채팅 내용 -->
	        </div>
	        <div class="chat-footer">
	            <input type="text" id="chat-content" placeholder="메시지를 입력하세요...">
	        </div>
	    </div>
	</div>
<!-- 마켓 채팅 문의하기 끝 -->
</body>
</html>