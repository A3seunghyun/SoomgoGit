<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.EstimateOptionContentDao"%>
<%@page import="dto.EstimateOptionContentDto"%>
<%@page import="dao.EstimateQuestionDao"%>
<%@page import="dao.EstimateOptionDao"%>
<%@page import="dto.EstimateOptionDto"%>
<%@page import="dto.EstimateQuestionDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.EstimateServiceDto"%>
<%@page import="dao.EstimateServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 헤더 jquery
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
	
	try{
		users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
		
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
		}catch(Exception e){
			
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
	int serviceIdx = 19;
	try{ serviceIdx = (Integer) request.getAttribute("serviceIdx"); } catch(Exception e){ e.printStackTrace(); }
	
	EstimateServiceDao esDao = (EstimateServiceDao) request.getAttribute("esDao");
	EstimateServiceDto esDto = (EstimateServiceDto) request.getAttribute("esDto");;
	EstimateQuestionDao eqDao = (EstimateQuestionDao) request.getAttribute("eqDao");;
	ArrayList<EstimateQuestionDto> listQuestion = (ArrayList<EstimateQuestionDto>) request.getAttribute("listQuestion");;
	EstimateOptionDao eoDao = (EstimateOptionDao) request.getAttribute("eoDao");;
	ArrayList<EstimateOptionDto> listOption = (ArrayList<EstimateOptionDto>) request.getAttribute("listOption");;
	EstimateOptionContentDao eocDao = (EstimateOptionContentDao) request.getAttribute("eocDao");;
	
// 	//serviceDto, QuestionDao, OptionDao
// 	EstimateServiceDto esDto = (EstimateServiceDto) session.getAttribute("esDto");	
// 	EstimateQuestionDao eqDao = new EstimateQuestionDao();	 
// 	EstimateOptionDao eoDao = new EstimateOptionDao();
// 	EstimateOptionContentDao eocDao = new EstimateOptionContentDao();
// 	// serviceIdx에 해당하는 질문 list
// 	ArrayList<EstimateQuestionDto> listQuestion = (ArrayList<EstimateQuestionDto>)session.getAttribute("listQuestion");
// 	// serviceIdx에 해당하는 선택지 list
// 	ArrayList<EstimateOptionDto> listOption = (ArrayList<EstimateOptionDto>)session.getAttribute("listOption");	
// 	// getOptionContentByMultiIdx(serviceIdx, requestIdx);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sgRequest</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/esclear.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sgRequestSelect.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/js/sgRequestSelect.js"></script>
<!-- 헤더 시작 -->	
<script>
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
     	 if(g_user != 1){
     		location.href = "Gosu_join.jsp";
     		$(".header-total2").hide();
     		$(".header-total1").show();
     	 }else{
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
      
      if (users_idx==0){
    		alert("로그인이 필요합니다!");
    		location.href = "Login.jsp";
    	}
      
   });
</script>
<!-- 헤더 끝 -->	
</head>
<body>
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
									<a href = "sgRequestMain.jsp">
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
									<a href = "soomgoCommu.jsp">
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
									<a href = "soomgoCommu.jsp">
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
									<a href = "soomgoCommu.jsp">
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
	<!-- 중심구조 start -->
	<div id="main_body" class="">
		<!-- 서비스 헤더 start-->
		<section id="header_container" class="">
			<!-- 서비스 -->
			<div id="title_wrapper" class="">
				<span class="form_title"><h1><%=esDto.getTitle()%></h1></span>
				<button class="info_button btn">
					<img src="/SoomgoGit/img/icon/img_icon_bang.PNG"/>
				</button>
			</div>
			<!-- 진행도 -->
			<div id="progress_wrapper" class="">
				<progress id="progress" value="0" min="0" max="100"></progress>
				<p id="progress_percent">0%</p>
			</div>
		</section>
		<!-- 서비스 헤더 end -->
		<!-- 견적요청 start -->
		<div id="form_wrapper" class="">
			<ul class="form_massage">
				<li id="service_infor_message">
					<!-- 정보 message -->
					<div class="message_info message">
						<p class="content">
							몇 가지 정보만 알려주시면<br/>
							<span class="bold">평균 4개 이상</span>의 견적을 받을 수 있어요.
						</p>
					</div>
				<li>
				<!-- 1번 질문 -->
				<%
					int listSize = listQuestion.size();
					for(EstimateQuestionDto qDto : listQuestion) {
					int currentIdx = qDto.getRequestIdx()-1;	
				%>
				<li id="question_<%=currentIdx%>" class="questions message_wrapper">
					<div class=" message">
						<p class="content title"><span><%=qDto.getContents()%></span></p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
							    <!-- 선택지0 -->
							    <%
							        int currentRequestIdx = qDto.getRequestIdx();
							        ArrayList<EstimateOptionContentDto> eocList = eocDao.getOptionContentByMultiIdx(serviceIdx, currentRequestIdx);
							        int firstOptionType = eocList.get(0).getOptionType();    
							        if (firstOptionType <= 4) { // answer_wrapper 밑의 ul 추가 위해 첫 optionType 구분
							    %>
							        <ul>
							            <%
							                for (EstimateOptionContentDto ocDto : eocList) {
							                    int oType = ocDto.getOptionType();
							                    int numberIdx = ocDto.getOptionNumber() - 1;
							                    String[] ocContent = ocDto.getContents().split("\\(");
							                    switch (oType) {
							                        case 1: // checkbox_
							            %>
							                        <li id="checkbox_wrapper_<%= numberIdx %>" class="answer type<%= oType %>">
							                            <div>
							                                <input id="checkbox_<%= numberIdx %>" type="checkbox" class="input_checkbox" value="포장이사"/>
							                                <label for="checkbox_<%= numberIdx %>" class="checkbox_label">
							                                    <div class="checkbox_icon">
							                                        <img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
							                                    </div>
							                                    <div class="text_area">
							                                        <div class="text">
							                                            <%= ocContent[0].trim() %>
							                                            <span style="display: none;">(고수 미제공)</span>
							                                        </div>
							                                        <div class="text_comment"><%= ocContent[1].replace(")", "").trim() %></div>
							                                    </div>
							                                </label>
							                            </div>
							                        </li>
							                        <%
							                            break;
							                        case 2: // checkboxWithText
							                            // Implement case 2 logic here
							                            break;
							                        case 3: // radio
							                        %>
							                        <!-- 선택지 0 -->
							                        <li id="radio_wrapper_<%= numberIdx %>" class="answer radio_answer type<%= oType %>">
							                            <div class="radio_wrapper">
							                                <input id="radio_<%= numberIdx %>" type="radio" class="input_radio" value="네"/>
							                                <label for="radio_<%= numberIdx %>" class="circle_label">
							                                    <div class="icon_circle radio_icon">
							                                        <img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
							                                    </div> 
							                                    <div class="text_area">
							                                        <div class="text checked">
							                                            <%= ocContent[0] %>
							                                            <span style="display:none;">(고수 미제공)</span>
							                                        </div>
							                                    </div>
							                                </label>
							                            </div>
							                        </li>            
							                        <%
							                            break;
							                        case 4: // radioWithText
							                            // Implement case 4 logic here
							                            break;
							                        default:
							                            oType = ocDto.getOptionType();
							                        %>
							                            <div>오류 ! --<%= oType %>-- 현재 oType</div>
							                        <%
							                            break;
							                    }
							                }
							            %>
							        </ul>
							        <%
							        } else { // ul이 없는 경우
							            for (EstimateOptionContentDto ocDto : eocList) {
							                int oType = ocDto.getOptionType();
							                int numberIdx = ocDto.getOptionNumber() - 1;
							                switch (oType) {
							                    case 5: // textarea
							                    %>
							                    <div class="text_wrapper text_field_wrapper">
							                        <textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_field"></textarea>
							                        <p class="validation">
							                            <span class="input_length">0</span>/255자
							                        </p>
							                    </div>
							                    <%
							                        break;
							                    case 6: // dateButton
							                        // Implement case 6 logic here
							                        break;
							                    case 7: // townButton
							                        // Implement case 7 logic here
							                        break;
							                    case 8: // image
							                    %>
							                    <div class="form_wrapper">
							                        <div id="img_card_0" class="upload_img_card">
							                            <div class="image_wrapper">
							                                <div class="image_thumbnail_wrapper">
							                                    <img src="/SoomgoGit/img/icon/img_gosuprof_1.webp" class="img_thumbnail"/>
							                                </div>
							                                <div class="text_form">
							                                    <textarea placeholder="사진을 설명해주세요.(선택)" class="input_text form_control text_length" rows="2" wrap="soft" maxlength="100"></textarea>
							                                </div>
							                            </div>
							                            <div class="text_footer">
							                                <span class="input_length_text">
							                                    <span class="input_length">0</span><span>/100자</span>
							                                </span>
							                                <button class="delete_btn">삭제</button>
							                            </div>    
							                        </div>
							                        <input id="file_input_11" class="file_input" type="file" accept="image/*">
							                        <input name="request_picture" class="file_input">
							                        <label for="file_input_11" class="upload_label">
							                            <button class="upload_btn">
							                                <div class="img_plus">
							                                    <img src="/SoomgoGit/img/icon/img_icon_plus_black.PNG">
							                                </div>
							                                사진추가
							                            </button>
							                        </label>
							                    </div>
							                    <%
							                        break;
							                    case 9: // loginOrEndding
							                    %>
							                    <div class="button_wrapper login_btn">
							                        <button class="btn btn_kakao btn_social">
							                            <img src="/SoomgoGit/img/icon/img_icon_kakao.svg">
							                            <span>카카오로 시작하기</span>
							                        </button>
							                        <button class="btn btn_naver btn_social">
							                            <img src="/SoomgoGit/img/icon/img_icon_naver_white.svg">
							                            <span>네이버로 시작하기</span>
							                        </button>
							                        <button class="btn btn_sg">이메일로 시작하기</button>
							                    </div>
							                    <%
							                        break;
							                    case 10: // countButton
							                        // Implement case 10 logic here
							                        break;
							                    default:
							                    %>
							                    <div>
							                        옵션 타입 오류 : 옵션--<%= oType %>--으로 잡힘 
							                    </div>
							                    <%
							                        break;
							                }
							            } // for(OptionContentDto ocDto : eocList)
							        }
							        %>
							    <!-- 선택지0 end -->
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 답변 -->
				<li id="answer_<%=currentIdx%>" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_0">수정</button>
					</div>
				</li>
				<!-- 답변 end -->
				<%
					}	// for(QuestionDto qDto : listQuestion)
				%>
				<li id="question_0" class="questions message_wrapper">
					<div class=" message">
						<p class="content title"><span>어떤 서비스를 원하시나요?</span></p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"	/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														포장이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고수가 전부 포장 및 정리/귀중품 제외</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														반포장이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고수와 함께 포장/고수는 큰 짐 배치만</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon"> 
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														일반이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고객이 전부 포장 및 정리/고수는 짐 운반만</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														보관이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">이삿짐 보관 후 입주일에 맞춰 운반</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 1번질문 end-->
				<!-- 1번답변 -->
				<li id="answer_0" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_0">수정</button>
					</div>
				</li>
				<!-- 1번답변 end-->
				<!-- 2번질문 -->
				<li id="question_1" class="questions message_wrapper">
<!-- 					<div class="message"> -->
<!-- 						<p class="content"> -->
<!-- 							<span class="title">이사 날짜를 선택해주세요.</span> -->
<!-- 						</p> -->
<!-- 						<div class="answer_sheet"> -->
<!-- 							<div class=answer_wrapper> -->
<!-- 								<div class="button_wrapper"> -->
<!-- 									<button class="btn button btn_primary">날짜 선택하기</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="message">
						<p class="content">
							<span class="title">이사 날짜를 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_depart"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 2번질문 end -->
				<!-- 2번답변 -->
				<li id="answer_1" class="message_wrapper my_answer answers">
					<div class="answer_message message"> 
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_1">수정</button>
					</div>
				</li>
				<!-- 2번답변 end -->
				<!-- 3번질문 -->
				<li id="question_2" class="questions message_wrapper">
<!-- 					<div class="message"> -->
<!-- 						<p class="content"> -->
<!-- 							<span class="title">출발 지역을 선택해주세요.</span> -->
<!-- 						</p> -->
<!-- 						<div class="answer_sheet"> -->
<!-- 							<div class=answer_wrapper> -->
<!-- 								<div class="button_wrapper"> -->
<!-- 									<button class="btn button btn_primary">지역 선택</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="message">
						<p class="content">
							<span class="title">출발 지역을 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_depart"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 3번질문 end -->
				<!-- 3번답변 -->
				<li id="answer_2" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_2">수정</button>
					</div>
				</li>
				<!-- 3번답변 end -->
				<!-- 4번질문 -->
				<li id="question_3" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지 층수를 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_field"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 4번질문 end -->
				<!-- 4번답변 -->
				<li id="answer_3" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_3">수정</button>
					</div>
				</li>
				<!-- 4번답변 end -->
				<!-- 5번질문 -->
				<li id="question_4" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지에 엘레베이터가 있나요?</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<!--선택지 영역-->
								<ul class="pick_answer">
									<!-- 선택지 1 -->
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														네.
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<!-- 선택지 2 -->					
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													아니오.
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 5번질문 end -->
				<!-- 5번답변 -->
				<li id="answer_4" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_4">수정</button>
					</div>
				</li>
				<!-- 5번답변 end -->
				<!-- 6번 질문 -->
				<li id="question_5" class="questions message_wrapper">
					<div class=" message">
						<p class="content title">
							<span>옮길 가전 제품을 선택해주세요.</span>
							<span class="subtitle"><br>내용과 다르면 비용이 추가될 수 있어요.</span>
						</p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														없음
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														냉장고
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														김치냉장고
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div> 
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														세탁기/건조기
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
									<!-- 선택지4 -->
									<li id="checkbox_wrapper_4" class="answer">
										<div>
											<input id="checkbox_4" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_4" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														에어컨
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지4 end-->
									<!-- 선택지5 -->
									<li id="checkbox_wrapper_5" class="answer">
										<div>
											<input id="checkbox_5" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_5" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														TV/모니터
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지5 end-->
									<!-- 선택지6 -->
									<li id="checkbox_wrapper_6" class="answer">
										<div>
											<input id="checkbox_6" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_6" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														PC/노트북
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지6 end-->
									<!-- 선택지7 -->
									<li id="checkbox_wrapper_7" class="answer">
										<div>
											<input id="checkbox_7" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_7" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														전자레인지
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지7 end-->
									<!-- 선택지8 -->
									<li id="checkbox_wrapper_8" class="answer">
										<div>
											<input id="checkbox_8" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_8" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														정수기
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지8 end-->
									<!-- 선택지9 -->
									<li id="checkbox_wrapper_9" class="answer">
										<div>
											<input id="checkbox_9" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_9" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														비데
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지9 end-->
									<!-- 선택지10 -->
									<li id="checkbox_wrapper_10" class="answer">
										<div>
											<input id="checkbox_10" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_10" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														기타
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지10 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 6번 질문 end-->
				<!-- 6번답변 -->
				<li id="answer_5" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"></span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_5">수정</button>
					</div>
				</li>
				<!-- 6번답변 end -->
				<!-- 7번 질문 -->
				<li id="question_6" class="questions message_wrapper">
					<div class=" message">
						<p class="content title">
							<span>옮길 가구를 선택해주세요.</span>
							<span class="subtitle"><br>내용과 다르면 비용이 추가될 수 있어요.</span>
						</p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														없음
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														침대
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														소파
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														책상/테이블
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
									<!-- 선택지4 -->
									<li id="checkbox_wrapper_4" class="answer">
										<div>
											<input id="checkbox_4" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_4" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														의자
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지4 end-->
									<!-- 선택지5 -->
									<li id="checkbox_wrapper_5" class="answer">
										<div>
											<input id="checkbox_5" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_5" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														수납장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지5 end-->
									<!-- 선택지6 -->
									<li id="checkbox_wrapper_6" class="answer">
										<div>
											<input id="checkbox_6" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_6" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														책장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지6 end-->
									<!-- 선택지7 -->
									<li id="checkbox_wrapper_7" class="answer">
										<div>
											<input id="checkbox_7" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_7" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														진열장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지7 end-->
									<!-- 선택지8 -->
									<li id="checkbox_wrapper_8" class="answer">
										<div>
											<input id="checkbox_8" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_8" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														옷장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지8 end-->
									<!-- 선택지9 -->
									<li id="checkbox_wrapper_9" class="answer">
										<div>
											<input id="checkbox_9" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_9" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														화장대
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지9 end-->
									<!-- 선택지10 -->
									<li id="checkbox_wrapper_10" class="answer">
										<div>
											<input id="checkbox_10" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_10" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														피아노
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지10 end-->
									<!-- 선택지11 -->
									<li id="checkbox_wrapper_11" class="answer">
										<div>
											<input id="checkbox_11" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_11" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="/SoomgoGit/img/icon/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														기타
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지11 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 7번 질문 end-->
				<!-- 7번답변 -->
				<li id="answer_6" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_6">수정</button>
					</div>
				</li>
				<!-- 7번답변 end -->
				<!-- 8번질문 -->
				<li id="question_7" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">이삿짐 사진이 있으면 첨부해주세요.</span>
							<span class="subtitle"><br>더 정확한 견적을 받을 수 있어요.	</span>
						</p>
						<div class="answer_sheet">
							<div class="answer_wrapper">
								<div class="form_wrapper">
									<div imd="img_card_0" class="upload_img_card">
										<div class="image_wrapper">
											<div class="image_thumbnail_wrapper">
												<img src="/SoomgoGit/img/icon/img_icon_plus_black.PNG" class="img_thumbnail"/>
											</div>
											<div class="text_form">
												<textarea placeholder="사진을 설명해주세요.(선택)" class="input_text form_control text_length" rows="2" wrap="soft" maxlength="100"></textarea>
											</div>
										</div>
										<div class="text_footer">
											<span class="input_length_text">
												<span class="input_length">0</span><span>/100자</span>
											</span>
											<button class="delete_btn"">삭제</button>
										</div>	
									</div>
									<input id="file_input_11" class="file_input" type="file" accept="image/*">
									<input nane="request_picture" class="file_input">
									<label for="file_input_11" class="uplopad_label">
										<button class="upload_btn">
											<div class="img_plus"">
												<img src="/SoomgoGit/img/icon/img_icon_plus_black.PNG">
											</div>
											사진추가
										</button>
									</label>
								</div>
							</div>
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit btn_primary ">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 8번질문 end -->
				<!-- 8번답변 -->
				<li id="answer_7" class="message_wrapper my_answer answers">
					<div class="answer_image">
						<img src="/SoomgoGit/img/icon/img_icon_plus_black.PNG" alt="첨부이미지-0" class="my_image">
					</div>
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_7">수정</button>
					</div>
				</li>
				<!-- 8번답변 end -->
				<!-- 9번질문 -->
				<li id="question_8" class="questions message_wrapper">
<!-- 					<div class="message"> -->
<!-- 						<p class="content"> -->
<!-- 							<span class="title">도착 지역을 선택해주세요.</span> -->
<!-- 						</p> -->
<!-- 						<div class="answer_sheet"> -->
<!-- 							<div class=answer_wrapper> -->
<!-- 								<div class="button_wrapper"> -->
<!-- 									<button class="btn button btn_primary">지역 선택</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="message">
						<p class="content">
							<span class="title">도착 지역을 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_depart"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 9번질문 end -->
				<!-- 9번답변 -->
				<li id="answer_8" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_8">수정</button>
					</div>
				</li>
				<!-- 9번답변 end -->
				<!-- 10번질문 -->
				<li id="question_9" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">도착지 층수를 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_depart"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 10번질문 end -->
				<!-- 10번답변 -->
				<li id="answer_9" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_9">수정</button>
					</div>
				</li>
				<!-- 10번답변 end -->
				<!-- 11번질문 -->
				<li id="question_10" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지에 엘레베이터가 있나요?</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<!--선택지 영역-->
								<ul class="pick_answer">
									<!-- 선택지 1 -->
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														네.
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<!-- 선택지 2 -->					
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													아니오.
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 11번질문 end -->
				<!-- 11번답변 -->
				<li id="answer_10" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_10">수정</button>
					</div>
				</li>
				<!-- 11번답변 end -->
				<!-- 12번질문 -->
				<li id="question_11" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">도착지 실평수와 거주 인원수를 알려주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.15평 / 2명" maxlength="255" class="textarea_field text_length" name="room_area"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 12번질문 end -->
				<!-- 12번답변 -->
				<li id="answer_11" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_11">수정</button>
					</div>
				</li>
				<!-- 12번답변 end -->
				<!-- 13번질문 -->
				<li id="question_12" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">이사 관련 요청사항을 알려주세요!</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<ul class="pick_answer">
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														고수와 상담 시 논의할게요
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="/SoomgoGit/img/icon/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													지금 작성할게요
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
										<div class="extra_wrapper text">
											<textarea placeholder="세부 짐 항목, 특별 요청 등 자유롭게 남겨주세요." rows="2" wrap="soft" class="form_control text_length" maxlength="255"></textarea>
											<span class="text_counter">
												<span class="input_length">0</span>/255자
											</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 13번질문 end-->
				<!-- 13번답변-->
				<li id="answer_12" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> 답변입력 </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_12">수정</button>
					</div>
				</li>
				<!-- 13번 답변 end -->
				<!-- 견적요청생성 -->
				<li id="last_login" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">고수에게 견적 보내기</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary btn_last">메인으로 이동</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 견적요청생성 end-->
			</ul>
		</div>
		<!-- 견적요청 end -->	
		<!-- 답변 저장 영역 -->
		<script>
			$(function() {
				$(document).on("click",".btn_last", function(){
					let jsonAnswer = {};
					$(".my_answer").each(function(index){
						let key = index + 1;
						let value =  $(this).find(".answer_text").text().replace(/(\r\n|\n|\r)/gm, ',');
						jsonAnswer[key] = value;
					})
					let jsonAnswerString = JSON.stringify(jsonAnswer, null, 2);
						
					$.ajax({
		                url: '/EstimateAnswerServlet?userIDx=<%=users_idx%>&serviceIdx=<%=serviceIdx%>'
		                , type: 'POST'
		                , contentType: 'text/plain'
		                , data: jsonAnswerString
		                , success: function(response) {
		                    console.log('JSON 전송 성공', response);
		                }
		                , error: function(jqXHR, textStatus, errorThrown) {
		                    console.error('Json 전송 실패', textStatus, errorThrown);
		                }
			        });
					 
				})
				
			})
		</script>
		<!-- 답변 저장 영역 -->
		<!-- modal 서비스안내 -->
		<div class="modal_wrapper modal_hidden">
			<div class="service_info">
				<div class="modal_header">
					<h2 class="title">서비스안내</h2>
					<button class="btn modal_close_btn">
						<img src="/SoomgoGit/img/icon/img_icon_exit.PNG" class="close_img"/>
					</button>
				</div>
				<div class="modal_content">
					<div class="request_service_info">
						<div class="service_section">
							<h2 class="service_name"><%=esDto.getTitle()%></h2>
							<div class="review_rate">
								<ul class="star_rate">
									<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
									<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
									<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
									<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
									<li><img src="/SoomgoGit/img/icon/img_icon_star_half.svg"></li>
								</ul>
								<span class="rate">4.8</span>
							</div>
							<div class="service_data">
								<div class="data provider">
									<div class="data_wrapper_left">
										<p class="count">6,083</p>
										<h3 class="title">활동 고수</h3>
									</div>
								</div>
								<span class="divider""></span>
								<div class="data request">
									<p class="count">314,197</p>
									<h3 class="title">누적 요청서</h3>
								</div>
								<span class="divider""></span>
								<div class="data review">
									<div class="data_wrapper_right">
										<p class="count">9,934</p>
										<h3 class="title">리뷰 수</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="discription_section">
							<h2 class="title"><%=esDto.getTitle()%> 고수를 만나보세요!</h2>
							<p class="discription">이삿짐센터는 많은데, 어떤 업체를 선택해야 할지 고민되시죠? 다양한 숨고 이사 후기를 비교해보세요.
								새벽이사부터 이삿짐 단기보관까지 원하는 이사 서비스를 받아보실 수 있어요. 요청서를 작성하시고, 합리적인 가격으로 쉽고 빠르게 가정 이사를 진행해보세요!
							</p>
						</div>
					</div>
					<div class="request_provider_list">
						<h2 class="title"><%=esDto.getTitle()%> 인기 고수</h2>
						<p class="discription">6,083명의 <%=esDto.getTitle()%> 고수가 기다리고 있어요!</p>
						<ul class="pro_list">
							<li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="/SoomgoGit/img/icon/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="/SoomgoGit/img/icon/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="/SoomgoGit/img/icon/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="/SoomgoGit/img/icon/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 일을 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="request_service_review">
						<h2 class="title">숨고 고객의<br><%=esDto.getTitle()%> 후기</h2>
						<div class="update_date">업데이트 2024.06.24</div>
						<ul class="review_list">
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										세번 이용했던 업체 중에 가장 신속하고 꼼꼼하고 친절하셨습니다.
										만족스러운 과정이었습니다.
									</div>
								</div>
							</li>
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										작업속도가 빨라서 좋았습니다! 덕분에 빠르게 일을 마칠 수 있었습니다. 감사합니다!
									</div>
								</div>
							</li>
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
											<li><img src="/SoomgoGit/img/icon/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										작업속도가 빨라서 좋았습니다! 덕분에 빠르게 일을 마칠 수 있었습니다. 감사합니다!
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- modal 서비스안내 end-->
	</div>
	<!-- 중심구조 end -->
</div>
</body>
</html>