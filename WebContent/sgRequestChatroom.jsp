<%@page import="dto.ChatContentsDTO"%>
<%@page import="dto.GosuServiceTownDTO"%>
<%@page import="dto.GosuInforDTO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="dao.ChatRoomDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int chatroom_idx = 1;
	int users_idx = 21;
	int my_idx = 1;
	
	try{
		String servletType = request.getAttribute("servletType").toString();
		if(servletType.equals("chatContentsServlet")){	// 채팅 내역 servlet으로 올려서 저장하고 돌려받을 때
			System.out.println("채팅 갱신 중");
		} else if(servletType.equals("chatroomServlet")) {	// 채팅방 클릭해서 들어왔을  때
			System.out.println("채팅방 클릭");
			// 내 idx
			my_idx = Integer.parseInt(request.getAttribute("my_idx").toString());
			// 상대방 idx
			users_idx = Integer.parseInt(request.getAttribute("users_idx").toString());
	 		// 채팅방 idx 
	 		chatroom_idx = Integer.parseInt(request.getAttribute("chatroom_idx").toString());
	 		
		}
	} catch(Exception e){
		System.out.println("catch catch");
	}
	
	// 채팅방 idx 해당하는 채팅 내역 리스트
	UsersDAO uDAO = new UsersDAO(); 
	GosuInforDTO gDTO = uDAO.getGosuInfoByUsersIdx(users_idx);
	GosuServiceTownDTO gsDTO = uDAO.getGosuServiceTown(users_idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 채팅방 -승현</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sgRequestChatroom.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	$(function() {
// 		 상단 검색바 여기부터-----------------------------------------------------------------------------------------------------------------------------------------
		$("#center-section").hide();
		$(".tab-pane2").hide();
		
		$(".form-control").focus(function() {
			$(".global-search-bar-input-group").css({"background-color":"rgb(255, 255, 255)","border":"1px solid rgb(0, 199, 174)"});
			$(".form-control").css("background-color","rgb(255, 255, 255)");
			
		});
		
		$(".form-control").blur(function() {
			$(".global-search-bar-input-group").css({"background-color":"rgb(242, 242, 242)","border":"0px none"});
			$(".form-control").css("background-color","rgb(242, 242, 242)");
		});
		
		$(".form-control").keyup(function() {
			
			let text = $(this).val();
			
			if(text.length > 0){
				$(".search-bar-input-group-append").show();
			} else {
				$(".search-bar-input-group-append").hide();
			}
		});
		
		$(".search-bar-input-group-append").click(function() {
			$(".form-control").val("");
			$(".search-bar-input-group-append").hide();
		});
		
		$(window).scroll(function() {
			let sc = $(this).scrollTop();
			if(sc==0){
				$("#center-section").hide();
			} else {
				$("#center-section").show();
			}
		});
// 		상단 검색바 여기까지-----------------------------------------------------------------------------------------------------------------------------------------
		$(".dropdown-menu").hide();
		$(".sort-dropdown-menu").hide();
		
		$(".dropdown-toggle-btn").click(function() {
			$(".dropdown-menu").toggle();
		});
		
		$(".sort-dropdown-toggle").click(function() {
			$(".sort-dropdown-menu").toggle();
		});
		
		$(".view-ilst").hover(function() {
			$(this).css("color","rgb(225, 225, 225)");
		}, function() {
			$(this).css("color","rgb(115, 115, 115)");			
		});
		
		$(".sort-dropdown-item").mousedown(function() {
			let itemName = $(this).text();
			$(".current-sort").text(itemName);
			
			if($(".sort-dropdown-item").hasClass("active") == true){
				$(".sort-dropdown-item").removeClass("active");
			}
			$(this).addClass("active");
		});
		
		$(".sort-dropdown-item").mouseup(function() {
			$(".sort-dropdown-menu").hide();
		});
		
		$(".selector-wrapper").click(function() {
			if($(this).hasClass("selected") == true){
				$(this).removeClass("selected");
				$(this).find(".chk-img").removeClass("checked");
			} else{
				$(this).addClass("selected");
				$(this).find(".chk-img").addClass("checked");
			}
			
		});
		
		$(".dropdown-item").hover(function() {
			$(this).css({"color":"rgb(255, 255, 255)","background-color":"rgb(0, 199, 174)"});
		},function(){
			$(this).css({"color":"rgb(50, 50, 50)","background-color":"rgba(0, 0, 0, 0)"});
		});
		
		$(".dropdown-item").click(function () {
			$(".dropdown-menu").hide();
		});
		
		$(".review-write-btn").hover(function() {
			$(this).css("color","rgb(9, 174, 154)");
		},function(){
			$(this).css("color","rgb(0, 199, 174)");
		});
		
			let chk = false;
		$(".quick-btn").click(function () {
			chk = !chk;
			if(chk){
				$(this).find("#favorites").attr("src","data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCI+CiAgICAgICAgPGcgZmlsbD0iIzAwQzdBRSIgc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTE5LjYxMiA1LjY4OGMtLjg4OC0uODg5LTIuMDkzLTEuMzg4LTMuMzUtMS4zODgtMS4yNTYgMC0yLjQ2MS41LTMuMzUgMS4zODhMMTIgNi42MDFsLS45MTMtLjkxM2MtMS44NS0xLjg1LTQuODUtMS44NS02LjcgMC0xLjg1IDEuODUtMS44NSA0Ljg1IDAgNi43bC45MTMuOTEyTDEyIDIwbDYuNy02LjcuOTEyLS45MTNDMjAuNTAxIDExLjUgMjEgMTAuMjk0IDIxIDkuMDM3YzAtMS4yNTYtLjUtMi40Ni0xLjM4OC0zLjM0OXoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMTM1IC0xMjcwKSB0cmFuc2xhdGUoNTAgMTIxOSkgdHJhbnNsYXRlKDc5MCAzNCkgdHJhbnNsYXRlKDI5NSAxNykiLz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==");
			} else {
				$(this).find("#favorites").attr("src","data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjMzIzMjMyIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTE5LjYxMiA1LjY4OGMtLjg4OC0uODg5LTIuMDkzLTEuMzg4LTMuMzUtMS4zODgtMS4yNTYgMC0yLjQ2MS41LTMuMzUgMS4zODhMMTIgNi42MDFsLS45MTMtLjkxM2MtMS44NS0xLjg1LTQuODUtMS44NS02LjcgMC0xLjg1IDEuODUtMS44NSA0Ljg1IDAgNi43bC45MTMuOTEyTDEyIDIwbDYuNy02LjcuOTEyLS45MTNDMjAuNTAxIDExLjUgMjEgMTAuMjk0IDIxIDkuMDM3YzAtMS4yNTYtLjUtMi40Ni0xLjM4OC0zLjM0OXoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0yNDMgLTQ0MCkgdHJhbnNsYXRlKDUwIDQyMykgdHJhbnNsYXRlKDU4IDE2KSB0cmFuc2xhdGUoMTM1IDEpIi8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=");
			}
		});
		
		$(".message-input-form-control").focus(function() {
			$(this).css({"border":"2px solid rgb(134, 214, 204)","box-shadow":"rgba(0, 199, 174, 0.1) 0px 0px 0px 1.296px"});
		});
		
		$(".message-input-form-control").blur(function() {
			$(this).css({"border":"1px solid rgb(173, 219, 213)","box-shadow":"rgba(0, 199, 174, 0.06) 0px 0px 0px 0.741798px"});
		})
		
		$(".message-input-form-control").keyup(function() {
			let text = $(this).val();
			
			if(text.length > 0){
				$(".message-input-placeholder").hide();
			} else {
				$(".message-input-placeholder").show();
			}
		});
		
		$(".nav-item").click(function () {
			if($(".nav-link").hasClass("active") == true){
				$(".nav-link").removeClass("active")
			} 
			
			$(this).find(".nav-link").addClass("active")
		});
		
		$("#header-profile").click(function () {
			$(".tab-pane1").show();
			$(".tab-pane2").hide();
		});
		
		$("#header-detail").click(function () {
			$(".tab-pane1").hide();
			$(".tab-pane2").show();
		});
		
		$(".side-seet-section").scroll(function() {
			let here = $(this).scrollTop();
			let info = $(".profile-provider-info").position().top;
			let media = $(".profile-media").position().top;
			let review = $(".profile-review").position().top;
			let qna = $(".profile-qna").position().top;
			
			if(info <= here){
				$(".sticky-nav-about").css("border-bottom","2px solid rgb(50, 50, 50)");	
				$(".sticky-nav-photos").css("border-bottom","0px solid rgb(50, 50, 50)");	
				$(".sticky-nav-rwviews").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-FAQ").css("border-bottom","0px solid rgb(50, 50, 50)");
			}
			
			if(media <= here){
				$(".sticky-nav-about").css("border-bottom","0px solid rgb(50, 50, 50)");	
				$(".sticky-nav-photos").css("border-bottom","2px solid rgb(50, 50, 50)");	
				$(".sticky-nav-rwviews").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-FAQ").css("border-bottom","0px solid rgb(50, 50, 50)");
			}
			
			if(review <= here){
				$(".sticky-nav-about").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-photos").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-rwviews").css("border-bottom","2px solid rgb(50, 50, 50)");
				$(".sticky-nav-FAQ").css("border-bottom","0px solid rgb(50, 50, 50)");
			}
			
			if(qna <= here){
				$(".sticky-nav-about").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-photos").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-rwviews").css("border-bottom","0px solid rgb(50, 50, 50)");
				$(".sticky-nav-FAQ").css("border-bottom","2px solid rgb(50, 50, 50)");
			}
		})
		
		$(".sticky-nav-about").click(function() {
			$(".side-seet-section").scrollTop($(".profile-provider-info").position().top);
		})
		
		$(".sticky-nav-photos").click(function() {
			$(".side-seet-section").scrollTop($(".profile-media").position().top);
		})
		
		$(".sticky-nav-rwviews").click(function () {
			$(".side-seet-section").scrollTop($(".profile-review-list").position().top);
		})
		
		$(".sticky-nav-FAQ").click(function () {
			$(".side-seet-section").scrollTop($(".profile-qna > ul").position().top);
		})
		
		/* 파일 및 채팅 입력 event */
		$(".message-input-form-control").on("keyup",function(key) {
			if(key.keyCode==13){
				$("#user-chat-form").submit();
			}
		});
		
	})
	
	</script>
</head>
<body>
	<div id="app" class="center">
		<div id="header">
			<div id="app-header" class="center">
				<div id="global-navigation-bar" class="center">
					<div id="desktop-header" class="center">
						<div id="left-section">
							<div id="logo">
								<a><img src="https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg"></a>
							</div>
							<nav>
								<ul id="nav-left-list">
									<li class="nav-left-section-item"><span>견적요청</span></li>
									<li class="nav-left-section-item left-item-margin"><span>고수찾기</span></li>
									<li class="nav-left-section-item left-item-margin"><span>마켓</span></li>
									<li class="nav-left-section-item left-item-margin"><span>커뮤니티</span></li>
								</ul>
							</nav>
						</div>
						<div id=center-section>
							<div id="service-searcher-desktop">
								<form id="global-search-bar">
									<div class="global-search-bar-input-group">
										<div class="search-bar-input-group-prepend">
											<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="input-group-prepend-img">
										</div>
										<input class="form-control" placeholder="어떤 서비스가 필요하세요?">
										<div class="search-bar-input-group-append">
											<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiPgogICAgICAgICAgICA8Y2lyY2xlIGZpbGw9IiNDNUM1QzUiIGN4PSI5IiBjeT0iOSIgcj0iOSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS13aWR0aD0iMS41IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im02IDYgNi4wMDUgNi4wMDZNMTIuMDA1IDYgNiAxMi4wMDYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" class="input-group-append-img">
										</div>
									</div>
								</form>
							</div>
						</div>
						<div id="right-section">
							<nav>
								<ul id="nav-right-list">
									<li class="nav-right-section-item"><span>로그인</span></li>
									<li class="nav-right-section-item right-item-margin"><span>회원가입</span></li>
								</ul>
							</nav>
							<button>
								<a>고수가입</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div><!-- 헤더 -->
		<div id="app-body">
			<div class="chat-room">
				<div class="vue-portal-target"></div>
				<div class="vue-portal-target"></div>
				<div class="vue-portal-target"></div>
				<div class="chat-room-row">
					<section class="chatbody-section">
						<div class="chat-header">
							<div>
								<div class="chat-room-header">
									<div class="info-area">
										<button type="button" class="back-btn">
											<img src="">
										</button>
										<div class="info-section">
											<div class="info-section-base">
												<div class="partner-name"><%= gDTO.getName() %></div>
											</div>
											<p class="react-time">
											 평균 <span class="react-time-highlight">2시간</span> 이내 응답 
											</p>
										</div>
										<div class="quick-btn-container">
											<button type="button" class="quick-btn">
												<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjMzIzMjMyIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTIwIDE1Ljk4djIuNDA4Yy4wMDEuNDUyLS4xODguODg0LS41MjIgMS4xOS0uMzM0LjMwNS0uNzgxLjQ1Ni0xLjIzMi40MTUtMi40NzYtLjI2OC00Ljg1NC0xLjExMi02Ljk0My0yLjQ2NC0xLjk0NC0xLjIzMy0zLjU5Mi0yLjg3OC00LjgyNy00LjgxOC0xLjM2LTIuMDk0LTIuMjA1LTQuNDc5LTIuNDctNi45Ni0uMDQtLjQ1LjExLS44OTUuNDE1LTEuMjI4LjMwNC0uMzMzLjczNS0uNTIyIDEuMTg2LS41MjNoMi40MTRjLjgwNy0uMDA4IDEuNDk2LjU4MyAxLjYwOSAxLjM4MS4wNDIuMzE3LjA5OC42MzEuMTcuOTQyLjEwMS40NDYuMjMyLjg4NS4zOTMgMS4zMTQuMjIxLjU4Ny4wOCAxLjI0OC0uMzYyIDEuNjk0bC0xLjAyMiAxLjAyYzEuMTQ1IDIuMDEgMi44MTMgMy42NzQgNC44MjcgNC44MTdsMS4wMjItMS4wMmMuNDQ2LS40NCAxLjExLS41ODEgMS42OTctLjM2LjczLjI3MSAxLjQ4OC40NiAyLjI2LjU2MS44MS4xMTQgMS40MDUuODE1IDEuMzg0IDEuNjN6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTk5IC00NDApIHRyYW5zbGF0ZSg1MCA0MjMpIHRyYW5zbGF0ZSg1OCAxNikgdHJhbnNsYXRlKDkxIDEpIi8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
											</button>
											<button type="button" class="quick-btn">
												<img id="favorites" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjMzIzMjMyIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTE5LjYxMiA1LjY4OGMtLjg4OC0uODg5LTIuMDkzLTEuMzg4LTMuMzUtMS4zODgtMS4yNTYgMC0yLjQ2MS41LTMuMzUgMS4zODhMMTIgNi42MDFsLS45MTMtLjkxM2MtMS44NS0xLjg1LTQuODUtMS44NS02LjcgMC0xLjg1IDEuODUtMS44NSA0Ljg1IDAgNi43bC45MTMuOTEyTDEyIDIwbDYuNy02LjcuOTEyLS45MTNDMjAuNTAxIDExLjUgMjEgMTAuMjk0IDIxIDkuMDM3YzAtMS4yNTYtLjUtMi40Ni0xLjM4OC0zLjM0OXoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0yNDMgLTQ0MCkgdHJhbnNsYXRlKDUwIDQyMykgdHJhbnNsYXRlKDU4IDE2KSB0cmFuc2xhdGUoMTM1IDEpIi8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
											</button>
											<div class="dropdown-btn-group">
												<button type="button" class="dropdown-toggle-btn">
													<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzMyMzIzMiIgc3Ryb2tlPSIjMzIzMjMyIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0yODcgLTQ0MCkgdHJhbnNsYXRlKDUwIDQyMykgdHJhbnNsYXRlKDU4IDE2KSB0cmFuc2xhdGUoMTc5IDEpIHRyYW5zbGF0ZSgxMSA0KSI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxIiBjeT0iOCIgcj0iMSIvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNpcmNsZSBjeD0iMSIgY3k9IjEiIHI9IjEiLz4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjEiIGN5PSIxNSIgcj0iMSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
												</button>
												<ul class="dropdown-menu">
													<li class="presentation"><a class="dropdown-item">내가 보낸 요청서 보기</a></li>
													<li class="presentation"><a class="dropdown-item">신고하기</a></li>
													<li class="presentation"><a class="dropdown-item">채팅방 나가기</a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="button-area">
										<div>
											<div class="transaction-btn">
												<button type="button" class="pay-btn">거래하기</button>
											</div>
										</div>
										<div>
											<div class="photo-review-btn">
												<button type="button" class="review-write-btn">리뷰 작성</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="chat-messages">
							<div class="chat-messages-body" style="height: 100%;">
								<div style="max-height: 731px">
									<div class="chat-contents-container">
										<ul>
											<!-- 일반 메시지 출력 -->
											<%
												System.out.println("챗룸idx:"+ chatroom_idx);
												ChatRoomDAO crDAO = new ChatRoomDAO();
												ArrayList<ChatContentsDTO> crDTO = crDAO.getChatContentsByChatRoom(chatroom_idx);
												String con_date = crDTO.get(0).getCon_date();
										        String date = con_date.split(" ")[0];
										        String[] detail_date = date.split("-");
											%>
											<li class="chat-date">
												<div class="date">
													<div><%= detail_date[0] %>년 <%= detail_date[1] %>월 <%= detail_date[2] %>일</div>
												</div>
											</li>
											<% 
											for(ChatContentsDTO ccDTO : crDTO) { 
												if(ccDTO.getUsers_idx() != my_idx){	// 상대방의 채팅
											%>
											<li class="is-quote-msg">
												<div class="message-box">
													<div class="user-profile-img">
														<div class="chat-user-profile-picture">
															<div class="image">
																<img src="<%= uDAO.getGosuInfoByUsersIdx(users_idx).getF_img() %>">
															</div>
														</div>
													</div>
													<div class="message-body">
														<div class="quote-message">
															<div class="quote-message-box">
																<div class="sub-title"><%= ccDTO.getContents() %></div>
															</div>
															<p class="message-status">
																<% 
																	String chat_time = ccDTO.getCon_date().split(" ")[1];
																	String hourMinute = chat_time.substring(0, 5);
																	int time_hour = Integer.parseInt(hourMinute.split(":")[0]);
																	int time_min = Integer.parseInt(hourMinute.split(":")[0]);
																	if(time_hour < 12){
																%>
																<span>오전 <%= hourMinute %></span>
																<% } else { %>
																<span>오후 <%= time_hour - 12 %>:<%= time_min %></span>
																<% } %>
															</p>
														</div>
													</div>
												</div>
											</li>
											<%	} else { // 내 채팅 %>	
											<li class="is-quote-msg my-chat-li">
												<div class="message-box">
													<div class="message-body">
														<div class="quote-message"><p class="message-status">
																<% 
																	String chat_time = ccDTO.getCon_date().split(" ")[1];
																	String hourMinute = chat_time.substring(0, 5);
																	int time_hour = Integer.parseInt(hourMinute.split(":")[0]);
																	int time_min = Integer.parseInt(hourMinute.split(":")[1]);
																	if(time_hour < 12){
																%>
																<span>오전 <%= hourMinute %></span>
																<% } else { %>
																<span>오후 <%= time_hour - 12 %>:<%= time_min %></span>
																<% } %>
															</p>
															<div class="quote-message-box">
																<div class="sub-title"><%= ccDTO.getContents() %></div>
															</div>
														</div>
													</div>
													<div class="user-profile-img right-position">
														<div class="chat-user-profile-picture">
															<div class="image">
																<img src="<%= uDAO.getGosuInfoByUsersIdx(users_idx).getF_img() %>">
															</div>
														</div>
													</div>
												</div>
											</li>
											<% } 
											} // for(ChatContentsDTO ccDTO : crDTO) 종료 
											%>
											<!-- 일반 메시지 출력 end -->
											<!-- 고수가 견적 보내기 클릭 시 -->
											<li class="is-quote-msg">
												<div class="message-box">
													<div class="user-profile-img">
														<div class="chat-user-profile-picture">
															<div class="image">
																<img src="<%= uDAO.getGosuInfoByUsersIdx(users_idx).getF_img() %>">
															</div>
														</div>
													</div>
													<div class="message-body">
														<div class="quote-message">
															<div class="quote-message-box">
																<div class="system-title">
																	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjMzIzMjMyIj4KICAgICAgICA8cmVjdCB3aWR0aD0iMTYuNSIgaGVpZ2h0PSIxNi41IiB4PSIxLjc1IiB5PSIxLjc1IiBzdHJva2Utd2lkdGg9IjEuNSIgcng9IjQiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMzIzMjMyIiBzdHJva2Utd2lkdGg9Ii41IiBkPSJNMTIuMzY0IDEyLjkzNmwuNjEyLTIuNzIyaC0xLjI3MWwuNjU5IDIuNzIyek05LjUxIDkuMzE2aDEuMDhsLS41My0yLjI1Ni0uNTUgMi4yNTV6bS0xLjcyNyAzLjY1N2wuNjYtMi43NTlINy4xN2wuNjEyIDIuNzZ6TTUuMTA4IDkuMzE1aC44MjhsLS43MzItMy4xNjdjLS4xMi0uNTg3LjktLjc5IDEuMDMyLS4xNjhsLjczMiAzLjMzNWgxLjY5bC43OTItMy4yMjdjLjEzMi0uNjIzIDEuMTE1LS42MzUgMS4yNi4wMTNsLjc3OSAzLjIxNGgxLjY5bC43NjgtMy4zNThjLjEyLS41ODggMS4xMDQtLjM4NC45Ni4xOGwtLjc0MyAzLjE3OGguODAzYy4yNjQgMCAuMzk2LjIwNC4zOTYuNDU1IDAgLjI2NC0uMTMyLjQ0NC0uMzg0LjQ0NGgtMS4wMmwtLjgxNSAzLjQ5Yy0uMjA0LjkzNS0xLjI4My45NDgtMS41LjAxMmwtLjg0LTMuNTAySDkuMjgzbC0uODUyIDMuNTAyYy0uMTkxLjkyMy0xLjI4My45MjMtMS40NzUuMDI1bC0uODE1LTMuNTI3SDUuMTA4Yy0uMjUxIDAtLjQwOC0uMTkyLS40MDgtLjQ1NiAwLS4yNTIuMTQ0LS40NDMuNDA4LS40NDNoMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
																	<span>견적서</span>
																</div>
																<div class="sub-title"><%= my_idx %> 고객님 안녕하세요. 요청서에 따른 예상금액입니다.</div>
																<hr>
																<div class="service-info">
																	<span class="label">서비스</span>
																	<span class="value"><%= my_idx  %></span>
																</div>
																<div class="price-info">
																	<span class="label">예상금액</span>
																	<span class="value" style="font-size: 16px; font-weight:700;">총 250,000원 부터~</span>
																</div>
																<hr>
																<div class="guide">
																	<span class="guide-icon">💬</span>
																	<span class="guide-text">견적금액에 대해 궁금한 점을 채팅으로 물어보세요.</span>
																</div>
																<a class="cta">
																	고수 프로필 보기
																	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxOFYxOEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTExLjUgMTNMNy41IDkgMTEuNSA1IiB0cmFuc2Zvcm09Im1hdHJpeCgtMSAwIDAgMSAxOSAwKSIvPgogICAgPC9nPgo8L3N2Zz4K">
																</a>
															</div>
															<p class="message-status">
																<span>오전 10:05</span>
															</p>
														</div>
													</div>
												</div>
											</li>
											<!-- 고수가 견적 보내기 클릭 시 end -->
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="chat-message-input">
							<div class="message-input-form">
								<!-- 채팅 입력 form -->
								<form id="user-chat-form" action="SaveChatServlet" method="post" style="display:flex; width:100%">
									<div class="col-auto1">
										<div class="file-attach-btn-container">
											<ul class="chat-function-buttons">
												<li class="add-file">
													<input type="file" accept="image" id="my-file" name="my-file" style="display:none;"/>
													<label for="my-file"><img style="cursor:pointer" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj4KICAgICAgICA8ZyBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS13aWR0aD0iMS41Ij4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNOC41IDBIMS43NUMuNzg0IDAgMCAuODA2IDAgMS44djEyLjRjMCAuOTk0Ljc4NCAxLjggMS43NSAxLjhoMTAuNWMuOTY2IDAgMS43NS0uODA2IDEuNzUtMS44VjEzTTcuNSA4TDMuNSA4TTkuNSAxMS41TDMuNSAxMS41TTYgNC41TDQuMjk1IDQuNSAzLjUgNC41eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEzMjcgLTE5NikgdHJhbnNsYXRlKDEzMTUgMTc5KSB0cmFuc2xhdGUoMTIgMTcpIHRyYW5zbGF0ZSg0IDMpIHRyYW5zbGF0ZSgwIDEpIi8+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTExLjUgMi4ydjYuMDVjMCAxLjUxOSAxLjIzMSAyLjc1IDIuNzUgMi43NVMxNyA5Ljc2OSAxNyA4LjI1VjEuMzc1QzE3IC42MTUgMTYuMzg0IDAgMTUuNjI1IDBjLS43NiAwLTEuMzc1LjYxNi0xLjM3NSAxLjM3NVY4LjI1aDAiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMzI3IC0xOTYpIHRyYW5zbGF0ZSgxMzE1IDE3OSkgdHJhbnNsYXRlKDEyIDE3KSB0cmFuc2xhdGUoNCAzKSBtYXRyaXgoLTEgMCAwIDEgMjguNSAwKSIvPgogICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg=="></label>
												</li>
											</ul>
										</div>
									</div>
									<div class="col">
										<div class="message-input-placeholder">
											<p>메시지를 입력하세요.</p>
										</div>
										<input type="hidden" name="chatroom_idx" value="<%=chatroom_idx%>"/>
										<input type="hidden" name="my_idx" value="<%=my_idx%>"/>
										<textarea rows="1" name="my_chatting" class="message-input-form-control"></textarea>
									</div>
									<div class="col-auto2">
										<input type="file" class="img-fluid-submit-btn" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzMCIgaGVpZ2h0PSIzMCIgdmlld0JveD0iMCAwIDMwIDMwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTc1OCAtMTkzKSB0cmFuc2xhdGUoNTAgMTc5KSB0cmFuc2xhdGUoNzA4IDE0KSI+CiAgICAgICAgICAgICAgICAgICAgPGNpcmNsZSBjeD0iMTUiIGN5PSIxNSIgcj0iMTQuMjUiLz4KICAgICAgICAgICAgICAgICAgICA8ZyBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMCA2TDYgMCAxMiA2TTYgLjVMNiAxNS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg5IDcpIi8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/>
									</div>
								</form>
								<!-- 채팅 입력 form end -->
							</div>
						</div>
					</section>
					<!-- 측면 패널 : 고수 정보 -->
					<section class="side-seet-section" id="side-seet-section">
						<div class="chat-aside-container">
							<div class="provider-profile">
								<div class="tabs-container">
									<div class="card-header">
										<ul class="card-header-pills">
											<li class="nav-item">
												<a class="nav-link active" id="header-profile">고수 프로필</a>
											</li>
											<li class="nav-item">
												<a class="nav-link" id="header-detail">거래 상세정보</a>
											</li>
										</ul>
									</div>
									<div class="tab-content">
										<div class="tab-pane1">
											<div class="profile-wrapper">
												<div class="profile-body">
													<div class="observer-container">
														<div class="scroll-trigger-area"></div>
													</div>
													<div class="profile-overview">
														<div class="profile-header">
															<div class="backdrop"></div>
														</div>
														<div class="thumb">
															<div class="user-profile-picture">
																<div class="is-square" style="background-image: url(<%= gDTO.getF_img() %>);"></div>
															</div>
														</div>
														<div class="info">
															<div class="info-section-header">
																<!--  고수 닉네임 -->
																<h1 class="profile-nickname"><%= gDTO.getName() %></h1>
															</div>
															<div class="info-section-sub-header">
																<div class="info-section-category"><%= gsDTO.getService_title() %></div>
																	<!--  고수 지역/이동/설명 -->
																	<div class="info-section-address"> <%= gsDTO.getProvince_name() %>시 <%= gsDTO.getTown_name() %> / ? 이동가능</div>
																	<div class="info-section-introduce"><%= gDTO.getExplain() %> </div>
															</div>
															<div class="detail-info">
																<div class="badges">
																	<div class="badge-item"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik00IDcuNjI1IDYuODggMTEgMTIgNSIgc3Ryb2tlPSIjMkRDMjYxIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=">본인인증</div>
																	<div class="badge-item"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik00IDcuNjI1IDYuODggMTEgMTIgNSIgc3Ryb2tlPSIjMkRDMjYxIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=">사업자등록증</div>
																</div>
																<div class="statistics-info">
																	<div class="statistics-info-item">
																		<div class="statistics-info-item-header">고용</div>
																		<div class="statistics-info-item-contents">115회</div>
																	</div>
																	<div class="statistics-info-item review-info">
																		<div class="statistics-info-item-header review-info">리뷰</div>
																		<div class="statistics-info-item-contents">
																			<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
																			<span class="review-avg">4.7</span>
																			<span class="review-count">(61)</span>
																		</div>
																	</div>
																	<div class="statistics-info-item">
																		<div class="statistics-info-item-header">총 경력</div>
																		<div class="statistics-info-item-contents">15년</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="background-block"></div>
													<ul class="sticky-nav">
														<li class="sticky-nav-about"><span>고수정보</span></li>
														<li class="sticky-nav-photos"><span>사진/동영상</span></li>
														<li class="sticky-nav-rwviews"><span>리뷰 61</span></li>
														<li class="sticky-nav-FAQ"><span>질문답변</span></li>
													</ul>
													<div class="observer-container" id="observer-container">
														<section id="about">
															<div class="profile-provider-info">
																<div class="profile-provider-info-title">
																	<h2>고수정보</h2>
																</div>
																<ul>
																	<li class="business-size">직원수 5명</li>
																	<li class="active-time"> 연락 가능 시간 : 오전 6시 - 오후 9시 </li>
																	<li class="payment">현금결제 가능</li>
																	<li class="tax-invoice"> 세금계산서 발행 가능 </li>
																</ul>
															</div>
															<div class="profile-service-desc">
																<h2>서비스 상세설명</h2>
																<div class="description">
																20년 이상 현장경력 노하우에  한국인  팀으로 구성되어있습니다
																	<div class="gradient"></div>
																</div>
															</div>
															<div class="profile-service-list">
																<h2>제공 서비스</h2>
																<div class="view">
																	<ul class="view-ul">
																		<li class="view-ilst"> 가정이사(투룸 이상) </li>
																		<li class="view-ilst"> 짐 보관 </li>
																	</ul>
																</div>																
															</div>
															<div class="profile-career">
																<h2>경력</h2>
																<div class="profile-career-header">
																	<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xMi42OCAzYzIuMTMzIDAgMy44OTggMS41NSAzLjg5OCAzLjUxMmwtLjAwMS40OTloNC4yODNjLjMyMSAwIC41ODcuMjQyLjYzMy41NTZsLjAwNy4wOTZ2MTEuNjg1YzAgLjM2LS4yODYuNjUyLS42NC42NTJIMy4xNGEuNjQ2LjY0NiAwIDAgMS0uNjQtLjY1MlY3LjY2M2MwLS4zNi4yODYtLjY1MS42NC0uNjUxbDQuMjgyLS4wMDF2LS40OTljMC0xLjkgMS42NTMtMy40MTIgMy42OTMtMy41MDdMMTEuMzIgM3pNNy45MTQgMTQuODM0SDMuNzc5djMuODYySDIwLjIydi0zLjg2MmgtNC4xMzV2Ljg1M2MwIC4zNi0uMjg2LjY1MS0uNjQuNjUxYS42NDQuNjQ0IDAgMCAxLS42MzItLjU1NWwtLjAwNy0uMDk2LS4wMDEtLjg1M0g5LjE5NHYuODUzYzAgLjM2LS4yODYuNjUxLS42NC42NTFhLjY0NC42NDQgMCAwIDEtLjYzMy0uNTU1bC0uMDA2LS4wOTYtLjAwMS0uODUzek0yMC4yMiA4LjMxNUgzLjc4bC0uMDAxIDUuMjE1aDQuMTM1di0uODUyYzAtLjM2LjI4Ny0uNjUyLjY0LS42NTIuMzIyIDAgLjU4OC4yNDEuNjMzLjU1NmwuMDA3LjA5NnYuODUyaDUuNjExdi0uODUyYzAtLjM2LjI4Ny0uNjUyLjY0LS42NTIuMzIyIDAgLjU4OC4yNDEuNjM0LjU1NmwuMDA2LjA5NnYuODUyaDQuMTM1VjguMzE1em0tNy41NC00LjAxMWgtMS4zNmMtMS40NjUgMC0yLjYxOCAxLjAxMi0yLjYxOCAyLjIwOHYuNWg2LjU5NnYtLjVjMC0xLjE0OC0xLjA2My0yLjEyNy0yLjQ0NC0yLjIwM2wtLjE3NC0uMDA1eiIgZmlsbD0iIzAwQzdBRSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
																	<h3>총 경력 15년</h3>
																</div>
																<div class="profile-career-item-wrap"></div>
															</div>
														</section>
														<section id="reservation"></section>
														<section id="portfolio"></section>
														<section id="photos">
															<div class="profile-media">
																<h2>사진 및 동영상</h2>
																<div class="image-list-viewer">
																	<ul class="image-list-viewer-row">
																		<li class="viewer-row-col">
																			<div class="viewer-row-col-thumbnail" style="background-image: url(https://static.cdn.soomgo.com/upload/media/8b6b7a94-7693-406e-869c-32280bd4c618.jpg?h=320&w=320&webp=1);"></div>
																		</li>
																		<li class="viewer-row-col">
																			<div class="viewer-row-col-thumbnail" style="background-image: url(https://static.cdn.soomgo.com/upload/media/27ff6b33-700d-48ce-a117-01d059e5b4ce.jpg?h=320&w=320&webp=1);"></div>
																		</li>
																		<li class="viewer-row-col">
																			<div class="viewer-row-col-thumbnail" style="background-image: url(https://static.cdn.soomgo.com/upload/media/9d3e764c-de5d-4880-a479-50298dce60ab.jpg?h=320&w=320&webp=1);"></div>
																		</li>
																	</ul>
																</div>
															</div>
														</section>
														<section class="reviews">
															<div class="profile-review">
																<h2>리뷰</h2>
																<div class="profile-review-list">
																	<div>
																		<div class="summary">
																			<div class="summary-avg">4.7</div>
																			<div class="summary-info">
																				<ul class="summary-info-star-rate">
																					<li><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"></li>
																					<li><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"></li>
																					<li><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"></li>
																					<li><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"></li>
																					<li><img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-half.svg"></li>
																				</ul>
																				<div class="summary-info-review-count">61개 리뷰</div>
																			</div>
																		</div>
																		<hr>
																	</div>
																	<ul class="list-container">
																		<li class="selector-wrapper selected">
																			<img class="chk-img">
																			<span class="text">사진 리뷰</span>
																		</li>
																		<li class="selector-wrapper">
																			<img class="chk-img">
																			<span class="text">거래인증 리뷰</span>
																		</li>
																		<div class="sort-wrapper">
																			<div class="sort-dropdown">
																				<button type="button" class="sort-dropdown-toggle"><span class="current-sort">최신순</span></button>
																				<ul class="sort-dropdown-menu">
																					<li class="sort-item"><a class="sort-dropdown-item active">최신순</a></li>
																					<li class="sort-item"><a class="sort-dropdown-item">별점 높은 순</a></li>
																					<li class="sort-item"><a class="sort-dropdown-item">별점 낮은 순</a></li>
																				</ul>
																			</div>
																		</div>
																	</ul>
																	<div>
																		<ul class="review-container">
																			<li id="1608943">
																				<article class="profile-review-item">
																					<section class="profile-review-meta">
																						<span class="author">장**</span>
																						<div class="profile-review-item-badge"></div>
																					</section>
																					<section class="profile-review-images">
																							<div class="review-image-list-viewer">
																								<ul class="review-image-list">
																									<li class="review-image-list-item">
																										<img src="https://static.cdn.soomgo.com/upload/review/9f0ff2fa-e095-4e95-9bcf-ef7bc14e8178.jpg?h=320&w=320&webp=1">
																									</li>
																								</ul>
																							</div>
																					</section>
																					<section class="service-score">
																						<p>가정이사(투룸 이상)</p>
																						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
																						5.0
																					</section>
																					<div class="line-clamp">
																						<div class="line-clamp-content">
																							<p class="review-text">여러분 고민말고 여기서 하세요 이렇게 빠르고 최선을 다해주시는곳 드물것같네요 이사 여러번 했는데 이번은 정말 만족했습니다 열악한 상황속에서도 최고의 결과물을 주셨고 안해주셔도 되는 서비스들도 해주셔서 정말 감동받았어요 최고입니다. 사장님 다음 이사때도 뵐께요 번창하세요</p>
																						</div>
																						<button type="button" class="line-clamp-btn">
																							<span>더보기</span>
																						</button>
																					</div>
																					<section class="evaluation">
																						<div class="badge-wrap">
																							<span class="badge-secondary">꼼꼼하고 세심하게 진행해주세요</span>
																							<span class="badge-secondary">완성도가 무척 높아요</span>
																							<span class="badge-secondary">작업속도가 빨라요</span>
																						</div>
																					</section>
																					<section class="review-footer">
																						<div class="review-footer-contents">
																							<span class="review-footer-date">2024. 05. 04</span>
																						</div>
																					</section>
																				</article>
																			</li>
																			<li id="1604314">
																				<article class="profile-review-item">
																					<section class="profile-review-meta">
																						<span class="author">우**</span>
																						<div class="profile-review-item-badge"></div>
																					</section>
																					<section class="profile-review-images">
																							<div class="review-image-list-viewer">
																								<ul class="review-image-list">
																									<li class="review-image-list-item">
																										<img src="https://static.cdn.soomgo.com/upload/review/c638493f-c139-4680-a592-b43d86cf000d.jpg?h=320&w=320&webp=1">
																									</li>
																									<li class="review-image-list-item">
																										<img src="https://static.cdn.soomgo.com/upload/review/3a89d376-c5dc-4b43-b8cd-da46c2a6723d.jpg?h=320&w=320&webp=1">
																									</li>
																								</ul>
																							</div>
																					</section>
																					<section class="service-score">
																						<p>가정이사(투룸 이상)</p>
																						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
																						5.0
																					</section>
																					<div class="line-clamp">
																						<div class="line-clamp-content">
																							<p class="review-text">지난달 이사했는데 친절하고 꼼꼼히 작업해주셔서 매우 만족스러웠습니다. 방문견적할때 합리적 금액을 제시해서 바로 계약했습니다. 방문견적을 내신분도 이삿날 와서 같이 일했고, 직원들이전문성있게 꼼꼼히 확인하면서 해주는게 좋았습니다. 주방이모님도 묵묵히 일하신 분이었는데  깔끔하게 작업하셔서 따로 손댈 필요가 없을 정도입니다. 이번에 편하게 이사해서 너무 좋았고, 다음에도 또 부탁하고 싶은 업체예요. 잘되는집 2호점 많이 번창하세요.</p>
																						</div>
																						<button type="button" class="line-clamp-btn">
																							<span>더보기</span>
																						</button>
																					</div>
																					<section class="evaluation">
																						<div class="badge-wrap">
																							<span class="badge-secondary">비용이 합리적이에요</span>
																							<span class="badge-secondary">꼼꼼하고 세심하게 진행해주세요</span>
																							<span class="badge-secondary">완성도가 무척 높아요</span>
																						</div>
																					</section>
																					<section class="review-footer">
																						<div class="review-footer-contents">
																							<span class="review-footer-date">2024. 05. 02</span>
																						</div>
																					</section>
																				</article>
																			</li>
																			<li id="1515193">
																				<article class="profile-review-item">
																					<section class="profile-review-meta">
																						<span class="author">뚱**</span>
																						<div class="profile-review-item-badge"></div>
																					</section>
																					<section class="service-score">
																						<p>가정이사(투룸 이상)</p>
																						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
																						5.0
																					</section>
																					<div class="line-clamp">
																						<div class="line-clamp-content">
																							<p class="review-text">이정도일줄 몰랐습니다
너무 일들 잘하시고
한마디로 미친 원팀!
이라고 해도 될까요?~~
60년 가까이 살면서
적지않게 이사를 해봤지만
지금껏 이팀이 최고였습니다!</p>
																						</div>
																						<button type="button" class="line-clamp-btn">
																							<span>더보기</span>
																						</button>
																					</div>
																					<section class="evaluation">
																						<div class="badge-wrap">
																							<span class="badge-secondary">비용이 합리적이에요</span>
																							<span class="badge-secondary">꼼꼼하고 세심하게 진행해주세요</span>
																							<span class="badge-secondary">작업속도가 빨라요</span>
																						</div>
																					</section>
																					<section class="review-footer">
																						<div class="review-footer-contents">
																							<span class="review-footer-date">2024. 03. 06</span>
																						</div>
																					</section>
																				</article>
																			</li>
																		</ul>
																		<div class="profile-more-button">
																			<button type="button" class="profile-more-btn center">리뷰 더보기
																				<span class="profile-more-btn-icon"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="rgb(0, 199, 174)"></path>
																					</svg>
																				</span>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														</section>
														<section class="FAQ">
															<div class="profile-qna">
																<h2>질문답변</h2>
																<ul>
																	<li>
																		<div class="question">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
																		<div class="answer">
																			<div class="collapsed-text-line">
																				<div class="collapsed-text-wrapper">
																					<p>방문견적을 우선으로하구요 물량 이 많지않으시면  사진으로도가능하구요 견적본후 계약금  보내주시면됩니다</p>
																				</div>
																			</div>
																		</div>
																	</li>
																	<li>
																		<div class="question">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
																		<div class="answer">
																			<div class="collapsed-text-line">
																				<div class="collapsed-text-wrapper">
																					<p>우선 가구들은 카바나담요로포장해드리구요 포장이사를 기본으로합니다 당일날 도착지가짐이빠지고 들어갈경우 주방및 바닥청소는 어느정도 해드립니다</p>
																				</div>
																			</div>
																		</div>
																	</li>
																	<li>
																		<div class="question">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
																		<div class="answer">
																			<div class="collapsed-text-line">
																				<div class="collapsed-text-wrapper">
																					<p>5톤기준 남자3명주방이모1명이기본이구요짐이 많으시거나하신면 인원 이더들어갑니다</p>
																				</div>
																			</div>
																		</div>
																	</li>
																	<li>
																		<div class="question">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
																		<div class="answer">
																			<div class="collapsed-text-line">
																				<div class="collapsed-text-wrapper">
																					<p>현장 경험이 15년 됐습니다 걱정 안하셔도됩니다 5톤 기준에 마무리하면7시간정도 소유 됩니다</p>
																				</div>
																			</div>
																		</div>
																	</li>
																	<li>
																		<div class="question">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
																		<div class="answer">
																			<div class="collapsed-text-line">
																				<div class="collapsed-text-wrapper">
																					<p>AS금액이 100만원 이하시면 헌금처리해드리구요 이상 이시면 보험 처리해드립니다</p>
																				</div>
																			</div>
																		</div>
																	</li>
																</ul>
															</div>
														</section>
														<section id="community" style="display: none;"></section>
														<section id="activity" style="display: none;"></section>
														<section>
															<div class="profile-additional-info">
																<button type="button" class="additional-info-btn"><span>사업자 정보 확인</span></button>
															</div>
														</section>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-pane2">
											<div class="chat-side-soomgo-pay">
												<div class="soomgo-pay-detail-body">
													<div class="no-item">
														<article class="no-items">
															<i><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4MCIgaGVpZ2h0PSI4MCIgdmlld0JveD0iMCAwIDgwIDgwIj4KICAgIDxkZWZzPgogICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iN2d6dnV4azU0YSIgeDE9IjAlIiB4Mj0iMTAwJSIgeTE9IjUwJSIgeTI9IjUwJSI+CiAgICAgICAgICAgIDxzdG9wIG9mZnNldD0iMCUiIHN0b3AtY29sb3I9IiMwMEM3QUUiLz4KICAgICAgICAgICAgPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdG9wLWNvbG9yPSIjNENDOEU1Ii8+CiAgICAgICAgPC9saW5lYXJHcmFkaWVudD4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxwYXRoIGZpbGw9IiNGMkYyRjIiIGQ9Ik0wIDBIMTE3MFY5NjBIMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC05MjIgLTM4OSkiLz4KICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZD0iTTc1MSA3MkgxMTcxVjk2MEg3NTF6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtOTIyIC0zODkpIi8+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTkyMiAtMzg5KSB0cmFuc2xhdGUoODU0IDM4OSkgdHJhbnNsYXRlKDY4KSI+CiAgICAgICAgICAgICAgICAgICAgPGNpcmNsZSBjeD0iNDAiIGN5PSI0MCIgcj0iNDAiIGZpbGw9InVybCgjN2d6dnV4azU0YSkiIGZpbGwtb3BhY2l0eT0iLjUiIGZpbGwtcnVsZT0ibm9uemVybyIvPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNiA2NEw2NCA2NCA2NCAxNiAxNiAxNnoiLz4KICAgICAgICAgICAgICAgICAgICA8ZyBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIzIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyNCAyOCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8cmVjdCB3aWR0aD0iMzIiIGhlaWdodD0iMjQiIHJ4PSIzIi8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0wIDcuNUwzMiA3LjVNNiAxMi41TDEyIDEyLjUiLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="></i>
															<h3>상세내역이 없습니다.</h3>
															<p class="help-block">빠르고 안전한 숨고페이로<br/>안심하고 거래하세요!</p>
															<footer class="footer-buttons">
																<button type="button" class="footer-button">숨고페이 안전결제</button>
															</footer>
														</article>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</body>
</html>