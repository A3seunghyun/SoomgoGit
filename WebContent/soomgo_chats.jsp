<%@page import="dto.ChatRoomListDTO"%>
<%@page import="dao.ChatRoomListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! public String onoff(String onoff){
	    	if(onoff.equals("1")){
		    	return "접속중";
	    	} else {
	    		return "1시간 전 접속";
	    	}
	    }
    
    	public char roomImg(String input){
    		char str = input.charAt(0);
    		return str;
    	}
	%>
    
    <%
    	int usersIdx = 3;
    	
    	ChatRoomListDAO dao = new ChatRoomListDAO();
	
		ArrayList<ChatRoomListDTO> roomlist = dao.getChatRoomList(usersIdx);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 채팅 -승현</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/soomgo_chats.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function() {
			$("#center-section").hide();
			$(".no-chat").hide();
			$(".search-bar-input-group-append").hide();
			$(".clear-btn").hide();
			
			$(".chat-filter-item").click(function() {
				
				if($(".chat-filter-item").hasClass("selected") == true) {
					$(".chat-filter-item").removeClass("selected");
				}
				
				$(this).addClass("selected");
				
			});
			
			$(".form-control").focus(function() {
				$(".global-search-bar-input-group").css({"background-color":"rgb(255, 255, 255)","border":"1px solid rgb(0, 199, 174)"})
				$(".form-control").css("background-color","rgb(255, 255, 255)")
				
			});
			
			$(".form-control").blur(function() {
				$(".global-search-bar-input-group").css({"background-color":"rgb(242, 242, 242)","border":"0px none"})
				$(".form-control").css("background-color","rgb(242, 242, 242)")
			});
			
			$(".form-control").keyup(function() {
				
				let text = $(this).val();
				
				if(text.length > 0){
					$(".search-bar-input-group-append").show();
				} else {
					$(".search-bar-input-group-append").hide();
				}
			})
			
			$(".search-bar-input-group-append").click(function() {
				$(".form-control").val("");
				$(".search-bar-input-group-append").hide();
			})
			
			$(window).scroll(function() {
				let sc = $(this).scrollTop();
				if(sc==0){
					$("#center-section").hide();
				} else {
					$("#center-section").show();
				}
			})
			
			$(".search-text-input").keyup(function() {
				
				$(".chat-list > li").hide();
				
				var search_text = $(this).val();
				
				var search_output = $(".user-status-title:contains('"+search_text+"')");
				
				$(".help-block").text('"'+search_text+'"에 해당하는');
				
				if(search_text.length == 0){
					$(".chat-list > li").show();
					$(".no-chat").hide();
				} else if(search_output.length){
					$(search_output).closest("li").show();
					$(".no-chat").hide();
				} else {
					$(".no-chat").show();
				}
			});
			
			$(".search-text-input").keyup(function() {
				
				let text = $(this).val();
				
				if(text.length > 0){
					$(".clear-btn").show();
				} else {
					$(".clear-btn").hide();
				}
			})
			
			$(".chat-list > li").click(function () {
				location.href
			})
			
			
			$(".clear-btn").click(function() {
				$(".search-text-input").val("");
				$(".chat-list > li").show();
				$(".no-chat").hide();
				$(".clear-btn").hide();
			})
			
			$(".chat-list > li").on("click", function() {
				let chatroomIdx = $(this).attr("idx").trim();
				location.href = "<%=request.getContextPath()%>/ChatRoomServlet?chatroomIdx=" + chatroomIdx;
			});
		});
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
								<a>
									<img src="https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
								</a>
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
		<div id="app-body" class="center">
			<div class="chat-list-container">
				<div class="page-header">
					<div class="page-header-container center">
						<section class="page-header-title">
							<h3>채팅</h3>
							<a class="chat-list-edit-button">편집</a>
						</section>
						<section class="page-header-info">
							<div class="chat-search-input">
								<div class="input-group">
									<div class="input-group-prepend">
										<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjNzM3MzczIiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTMwMSAtMjMzKSB0cmFuc2xhdGUoMjg1IDIyMikgdHJhbnNsYXRlKDE2IDExKSB0cmFuc2xhdGUoMSAxKSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjYuNjExIiBjeT0iNi42MTEiIHI9IjUuODYxIi8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTE1LjI1IDE1LjI1TDExLjAwNyAxMS4wMDciLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
									</div>
									<div class="input-flex-group">
										<input type="search" class="search-text-input" placeholder="이름과 서비스를 검색하세요">
										<button type="button" class="clear-btn">
											<i class="clear-icon"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="chat-filter">
								<div class="chat-filter-wrapper">
									<ul class="chat-filter">
										<li class="chat-filter-item selected" style="margin-left: 0px;">전체</li>
										<li class="chat-filter-item">안 읽음</li>
										<li class="chat-filter-item">즐겨찾기</li>
										<li class="chat-filter-item">고용</li>
									</ul>
								</div>
							</div>
						</section>
					</div>
				</div>
				<div class="page-body">
					<div class="page-body-container center">
					<div class="no-chat">
						<article>
							<i>
								<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI4MSIgaGVpZ2h0PSI4MCIgdmlld0JveD0iMCAwIDgxIDgwIj4KICAgIDxkZWZzPgogICAgICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iM2hqZ2szNWZtYSIgeDE9IjAlIiB4Mj0iMTAwJSIgeTE9IjUwJSIgeTI9IjUwJSI+CiAgICAgICAgICAgIDxzdG9wIG9mZnNldD0iMCUiIHN0b3AtY29sb3I9IiMwMEM3QUUiLz4KICAgICAgICAgICAgPHN0b3Agb2Zmc2V0PSIxMDAlIiBzdG9wLWNvbG9yPSIjNENDOEU1Ii8+CiAgICAgICAgPC9saW5lYXJHcmFkaWVudD4KICAgIDwvZGVmcz4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTU0NSAtNDEwKSB0cmFuc2xhdGUoMzc1IDEzOSkgdHJhbnNsYXRlKDEwMSAyNzEpIHRyYW5zbGF0ZSg2OSkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSI0MC41IiBjeT0iNDAiIHI9IjQwIiBmaWxsPSJ1cmwoIzNoamdrMzVmbWEpIiBmaWxsLW9wYWNpdHk9Ii41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNi41IDY0TDY0LjUgNjQgNjQuNSAxNiAxNi41IDE2eiIvPgogICAgICAgICAgICAgICAgICAgICAgICA8ZyBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBkPSJNNDEuNSAyMS4zOTRjMCAxLjEwNS0uODk1IDItMiAyLS42NjkgMC0xLjI5My0uMzM0LTEuNjY0LS44OUwzNi4xNjcgMjBIMTcuNWMtMS42NTcgMC0zLTEuMzQzLTMtM1YzYzAtMS42NTcgMS4zNDMtMyAzLTNoMjFjMS42NTcgMCAzIDEuMzQzIDMgM3YxOC4zOTR6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxOS41IDI0KSIvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzhGRTRFNCIgZD0iTTI4LjUgMzAuNDc2YzAgMS4xMDQtLjg5NSAyLTIgMi0uNTk0IDAtMS4xNTYtLjI2NC0xLjUzNi0uNzJsLTIuOTM2LTMuNTIzSDMuNWMtMS42NTcgMC0zLTEuMzQzLTMtM3YtMTRjMC0xLjY1NyAxLjM0My0zIDMtM2gyMmMxLjY1NyAwIDMgMS4zNDMgMyAzdjE5LjI0M3oiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE5LjUgMjQpIG1hdHJpeCgtMSAwIDAgMSAyOSAwKSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
							</i>
							<h3>결과를 찾을 수 없습니다</h3>
							<p class="help-block"></p>
							<p class="help-block1">결과를 찾을 수 없습니다.</p>
						</article>
					</div>
						<ul class="chat-list">
							<%
								for(ChatRoomListDTO dto : roomlist){
							%>
							<li idx=<%=dto.getChatRoomIdx() %>>
								<div class="chat-item">
									<div class="chat-item-wrapper">
										<div class="chat-info">
											<div class="chat-main-info">
												<div class="user-info-wrapper">
													<div class="user-profile-picture">
														<div class="user-profile-picture-img">
															<% if(dto.getfImg().equals("기본이미지")) { %>
																<p><%=roomImg(dto.getChatRoomName()) %></p>
															<% } else { %>
																<img src="<%=dto.getfImg() %>">
															<% } %>
														</div>
													</div>
													<div class="user-info">
														<div class="user-status-wrapper">
															<div class="user-status">
																<h5 class="user-status-title"><%=dto.getChatRoomName() %></h5>
															</div>
															<div class="active-status">
																<span class="status-icon"></span>
																<span class="prisma-typography-body1"><%=onoff(dto.getGosuOnOff()) %></span>
															</div>
														</div>
														<div class="service-info">
															<span class="prisma-typography-body2"><%=dto.getGosuServiceTitle() %> ∙ <%=dto.getGosuServiceTown() %></span>
														</div>
													</div>
												</div>
												<div class="chat-msg-wrapper">
													<p class="prisma-typography-body3"><%=dto.getGosuExplain() %></p>
													<div class="notice">
														<span class="prisma-typography-body3"></span>
													</div>
													<div class="chat-msg-info">
														<div class="dot"></div>
														<span class="prisma-typography-body4"><%=dto.getChatDate() %></span>
													</div>
												</div>
											</div>
											<hr class="divider">
											<div class="chat-sub-info">
												<p class="prisma-typography-body5">총 600,000원 부터~</p>
											</div>
										</div>
									</div>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
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
	</div>
</body>
</html>