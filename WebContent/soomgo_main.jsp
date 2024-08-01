<%@page import="dao.CommuNoticeDao"%>
<%@page import="dto.CommuServiceList"%>
<%@page import="dao.CommuServiceDao"%>
<%@page import="dto.CommuNoticeDto"%>
<%@page import="dto.CommuMainRandomGosuDto"%>
<%@page import="dao.CommuMainDao"%>
<%@page import="dto.CommuCategoryDto"%>
<%@page import="dao.CommuCategoryDao"%>
<%@page import="dto.CommuMainPostActionDto"%>
<%@page import="dto.CommuMainpostListDto"%>
<%@page import="dao.CommuPostListDao"%>
<%@page import="dto.CommuGosuKnowhowPostListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommuGosuKnowhowPostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!// <%!   --> 메서드를 정의 할 수 있는 공간 
	String convStr(String name) {		
		int length = name.length();			// 이름의 길이를 구함
		String ret = "" + name.charAt(0);	// 변수 ret에 이름첫글자를 담음
		for(int i=1; i<=length-1; i++) {	// 이름 길이 만큼 for문을 돌리면서 이름의 첫글자를 제외한 나머지 이름의 길이만큼 *을 추가함  -> 아래의 유저이름이 들어갈 공간에 메서드호출후 (dto.get이름)을 넣어줌
			ret += "*";						
		}
		return ret;
	}%>
<%
	int userIdx = 19;		//일단 userIdx 22번으로 로그인후 바꾸기 (22번기준으로 db만들어놓음)

	CommuGosuKnowhowPostDao gDao = new CommuGosuKnowhowPostDao();

	//메인페이지 고수노하우 최근작성 순 상위 2개 포스트 뿌리기
	ArrayList<CommuGosuKnowhowPostListDto> mainList = gDao.getGkhPostList();
	
	// 메인페이지 게시글 최근작성 순 상위 3개 포스트 뿌리기
	CommuPostListDao pDao = new CommuPostListDao();
	ArrayList<CommuMainpostListDto> mainPostList = pDao.getMainPostList(); 
	
	CommuCategoryDao cDao = new CommuCategoryDao();
	ArrayList<CommuCategoryDto> categoryList = cDao.getCategorySelect();
	 
	CommuMainDao mDao = new CommuMainDao();
	ArrayList<CommuMainRandomGosuDto> mList = mDao.getRandomGosu();
	
// 	int userIdx = Integer.parseInt(request.getParameter("userIDx"));
	CommuNoticeDao nDao = new CommuNoticeDao();
	ArrayList<CommuNoticeDto> nList = nDao.getNoticeList(userIdx);  // 알림 리스트를 가져올 메서드
	
	CommuServiceDao sDao = new CommuServiceDao(); 
// 	검색창
	String searchString = request.getParameter("searchText");
	ArrayList<CommuServiceList> sList = sDao.getServiceList(searchString);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>숨고 메인 </title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/soomgo_main.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
	
		$(function(){
			$(".curation-list").click(function(){
				
				let idx = $(this).attr("idx");
// 				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
				  location.href="soomgoQnA_Post.jsp?post_idx=" + idx;
// 				} else {
// 				  location.href="soomgoGosu_knowhow_post.jsp?post_idx=" + idx;
// 				}
			});
			$(".gkh_post").click(function(){
				
				let idx = $(this).attr("idx");
				location.href = "soomgoGosu_knowhow_post.jsp?post_idx=" + idx;
			});
			$(".notice-btn").click(function(){
				
				$(".notification-overlay").toggle();
				$(".usermenu-dropdown").hide();			
				
			});
			$(".usermenu-button").click(function(){
				
				$(".usermenu-dropdown").toggle();
				$(".notification-overlay").hide();
			});
			
			$(".all-read").click(function(){
				
				$(".confirm").css('display','block');
			});
			$(".cancel-btn").click(function(){
				
				$(".confirm").hide();
			});
			
// 			$(".confirm-btn").click(function(){
// 				$(".user_notice_item").hide();
// 				$(".confirm").hide();
// 				$(".div_more_btn").hide();
// 				$(".user_notice").html("알림이 없습니다");
// 			});
			 $('.confirm-btn').on('click', function() {
			    if ($('.notice-list li').length > 0) {
			      $('.notice-list').text("알림이 없습니다");
			      $('.div_more_btn').css('display','none');
			      
			    } else {
			      alert("삭제할 알림이 없습니다");
			    }
			    $('.confirm').hide();
			  });

			  // "아니오" 버튼 클릭 시 확인 대화 상자 숨김
			  $('.cancel-btn').on('click', function() {
				  
			    $('.confirm').hide();
			  });
			  
			  $(".user-notice-item").click(function(){
/* 				 let postIdx = $(this).find(".title").attr("idx");
				 let chatIdx = $(this).find(".title").attr("idx");
				 let estimateIdx = $(this).find(".title").attr("idx");
 */
				let comments_idx = $(this).parent().attr("comments_idx");
 				let chat_idx = $(this).parent().attr("chat_idx");
 				let estimate_idx = $(this).parent().attr("estimate_idx");
				if(comments_idx != undefined) {
					location.href = "soomgoQnA_Post.jsp?comments_idx=" + comments_idx;
				} else if(chat_idx != undefined) {
					alert("채팅방 목록 주소 chat_idx:" + chat_iDx);
				} else if(estimate_idx != undefined) {
					alert("견적창 주소 estimate_idx:" + estimate_idx);
				}
			  });
			  
			  $("#search-bar-input-group").click(function(){
				  
				 $(this).css('background','white'); 
				 $("input").css('background','white');
				 
				 $(".input-search-box").show();
			  });
			  
			  // 검색창 포커스 잃으면 밑에 조회하는 창이 닫힘
			  $("#search-bar-input-group").focusout(function(){
				  
					 $(".input-search-box").hide();
			  });
			  
			  $("input").on('focusout',function(){
				  
				 $(this).css('background',' rgb(242, 242, 242)') 
				 $("#search-bar-input-group").css('background',' rgb(242, 242, 242)') ;
			  });
			  
			  $(".close").click(function(){
// 				  close클릭 시 input값 삭제
				 $(".input-search-box").hide(); 
				 
			  });
			  
			  $("#search").on('input', function(){  /*  메인 검색 , 같은 문자 출력 */
				  var searchVal = $('input[name="searchText"]').val().trim();
			  	  
				if(searchVal.length > 0 ) {
					$(".popular-section").show();
				  $(".search-term").text('"' + searchVal + '"'); // 검색어 업데이트 
			  	} else {
			  	  $(".popular-section").hide();
			  	}
				/*
				$.ajax({
				    type : "get",            // HTTP method type(GET, POST) 형식이다.
				    url : "mainSearchServlet",      // 컨트롤러에서 대기중인 URL 주소이다.
				    success : function(response) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'response'는 응답받은 데이터.
				        //alert("성공!");
				    },
				    error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옴
				        alert("통신 실패.")
				    }
				});
				*/
			  });
			  
			  $("#search").keyup(function() {
				 let search_text = $(this).val(); 
				 $(".search-title > strong").text('"' + search_text + '"');
				 let params = { search_text: search_text };
				 $.ajax({
					type: "get",
					url: "mainSearchServlet",
					data: params,
					success: function(res) {
// 						console.log(res);    // check : res = JSON-ARRAY.
						$("ul.list").html("");
						for(let i=0; i<=res.length-1; i++) {
							let service_title = res[i].service_title;
							service_title = service_title.replace(search_text, '<strong class="soomgo_color">'+search_text+'</strong>');
							let str = '<li class="item">'
									+ '<div class="service" service_idx=' + res[i].service_idx + '>'
									+ '<img class="search-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMikiIHN0cm9rZT0iI0M1QzVDNSIgc3Ryb2tlLXdpZHRoPSIxLjUiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI0LjUiIGN5PSI0LjUiIHI9IjQuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im04IDggNCA0Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/>'
									+ '<div class="service-name">'
									+ service_title
									+ '</div>'
									+ '</div>'
									+ '</li>';
							$("ul.list").append(str);
						}
					},
					error: function(r, s, e) {
						alert('에러');
					}
				 });
			  });
		});	// function 마지막 중괄호

		$(document).on("click", ".list .item .service", function() {
			let service_idx = $(this).attr("service_idx");
			alert("견적 요청으로 이동해야 - service_idx=" + service_idx);
		});
		

	</script>
</head>

<body>
	<div id="app" class="center">
<!-- 			로그아웃시에 헤더 -->
<!-- 		<div class="header"> -->
<!-- 			<div class="app-header" class="center"> -->
<!-- 				<div class="global-navigation-bar" class="center"> -->
<!-- 					<div class="desktop-header" class="center"> -->
<!-- 						<div class="left-section"> -->
<!-- 							<div class="logo"> -->
<!-- 								<a> <img -->
<!-- 									src="https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg"> -->
<!-- 								</a> -->
<!-- 							</div> -->
<!-- 							<nav> -->
<!-- 								<ul class="nav-left-list"> -->
<!-- 									<li class="nav-left-section-item"><span>견적요청</span></li> -->
<!-- 									<li class="nav-left-section-item left-item-margin"><span>고수찾기</span></li> -->
<!-- 									<li class="nav-left-section-item left-item-margin"><span>마켓</span></li> -->
<!-- 									<li class="nav-left-section-item left-item-margin"><span>커뮤니티</span></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<!-- 						</div> -->
<!-- 						<div class="right-section"> -->
<!-- 							<nav> -->
<!-- 								<ul class="nav-right-list"> -->
<!-- 									<li class="nav-right-section-item"><span>로그인</span></li> -->
<!-- 									<li class="nav-right-section-item right-item-margin"><span>회원가입</span></li> -->
<!-- 								</ul> -->
<!-- 							</nav> -->
<!-- 							<button> -->
<!-- 								<a>고수가입</a> -->
<!-- 							</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<!-- 	고수 일때 헤더 -->
		<div class="header">
			<div class="app-header" class="center">
				<div class="global-navigation-bar" class="center">
					<div class="desktop-header" class="center">
						<div class="left-section">
							<div class="logo">
								<a> <img
									src="https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
								</a>
							</div>
							<nav>
								<ul class="nav-left-list">
									<li class="nav-left-section-item"><span>견적요청</span></li>
									<li class="nav-left-section-item left-item-margin"><span>고수찾기</span></li>
									<li class="nav-left-section-item left-item-margin"><span>마켓</span></li>
									<li class="nav-left-section-item left-item-margin"><span>커뮤니티</span></li>
								</ul>
							</nav>
						</div>
<!-- 						<div class="center-section">  일반USER일때  헤더 검색창 -->
<!-- 							<div class="search-box"> -->
<!-- 								<form> -->
<!-- 									<div class="input-group"> -->
<!-- 										<div class="input-group-prepend"> -->
<!-- 											<img class="search-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMSkiIHN0cm9rZT0iI0M1QzVDNSIgc3Ryb2tlLXdpZHRoPSIxLjUiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBjeD0iNi42MTEiIGN5PSI2LjYxMSIgcj0iNS44NjEiLz4KICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNS4yNSAxNS4yNS00LjI0My00LjI0MyIvPgogICAgPC9nPgo8L3N2Zz4K"/> -->
<!-- 										</div> -->
<!-- 										<input type="text" placeholder="키워드와 #태그 검색" autocomplete="off" class="search-input" maxlength="15" id="search"/> -->
<!-- 										<div class="input-group-append"> -->
<!-- 											<img class="reset" alt="검색어 삭제 아이콘" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiPgogICAgICAgICAgICA8Y2lyY2xlIGZpbGw9IiNDNUM1QzUiIGN4PSI5IiBjeT0iOSIgcj0iOSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS13aWR0aD0iMS41IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im02IDYgNi4wMDUgNi4wMDZNMTIuMDA1IDYgNiAxMi4wMDYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="/> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</div> -->
						
						<div class="right-infor">
							<nav>
								<ul class="nav_list">
									<li class="nav-item">
										<span>받은요청</span>
									</li>
									<li class="nav-item-chat">
										<span>바로견적</span>
									</li>
									<li class="nav-item-chat">
										<span>채팅</span>
<!-- 										<span class="badge-count">97</span>  고수 부분 -->
									</li>
									<li class="nav-item-chat">
										<span>프로필</span>
									</li>
								</ul>
							</nav>
							<div class="notification">
								<button class="notice-btn">
<!-- 									<img src="img/숨고알림.png" class="svg-icon"/> -->
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
										</svg>
								</button>
								<div class="notification-overlay"> <!-- 알림창 코드 숨겨놓음 -->
									<div class="div_notice_box">
										<div class="overlay_header">
											<h2 class="h2">알림</h2>	
											<button class="all-read">전체읽음</button>
										</div>
										<div class="overlay-body">
											<div class="user-notice">
												<ul class="notice-list">
													<%
														for (CommuNoticeDto dto : nList) {
													%>
														<li 
															<%if(dto.getCommentsIdx() != 0) {%>comments_idx="<%=dto.getCommentsIdx()%>" <%}%>
															<%if(dto.getEstimateIdx() != 0) {%>estimate_idx="<%=dto.getEstimateIdx()%>"<%}%>
															<%if(dto.getChatIdx() != 0) {%>chat_idx="<%=dto.getChatIdx()%>"<%}%>
														>
															<div class="user-notice-item">
																<div class="div_row_info">
																	<div class="div_notice_text_box">
																		<div class="type">
																			<span class="notice_text"> 알림 </span>
																		</div>
																	</div>
																	<div class="div_notice_date">
																		<%=dto.getNoticeDate().substring(2,10)%>
																	</div>
																</div>
																<%
																/* String msg = dto.getMessage();
																msg = msg.replace("@svc_name@", dto.getServiceName());	 */		
																	String msg = dto.getMessage();
																    String serviceName = dto.getServiceName();
																    if (serviceName == null) {
																        serviceName = ""; // 또는 적절한 기본값
																    }
																    msg = msg.replace("@svc_name@", serviceName);
																%>
																
																<div class="div_row_content">
																	<div class="div_text">
																		<h4 class="title" idx="<%=dto.getEstimateIdx()+dto.getChatIdx()+dto.getCommentsIdx()%>"><%=msg%> </h4>
																	</div>
																	<button class="btn_wrapper">
																	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxOFYxOEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTYgNEwxMiA5LjUgNiAxNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgPC9nPgo8L3N2Zz4K"/>
																	</button>
																</div>
																<p class="content">견적 내용을 자세히 확인해보세요</p>
															</div>
														</li>
													<%
														}
													%>
												</ul>
												<div class="div_more_btn">더 보기</div>
											</div>
											<div class="confirm">
												<p>모든 알림을 삭제하시겠습니까?</p>
												<button class="confirm-btn">예</button>
												<button class="cancel-btn">아니오</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="usermenu">
								<div class="usermenu-button">
									<div class="user-prifile-picture">
										<img  class="profile-img" src="img/두찜.png"/>
									</div>	
									<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K"/>						
									<img  class="arrowUp" data-v-35a09b99="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K">
								</div>
								<div class="usermenu-dropdown" style="display:none;">
									<div data-name="user-infor">
										<h4 class="user-name">마포구 이사전문 장용준 고객님</h4>
										<a class="score-review">
											<div class="review-avg">
												<span class="score-span">
													<img class="star-icon" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo="/>
														평점 0
												</span>
												<span class="score-review-line"></span>
												<span class="score-span">
													리뷰 0
												</span>
											</div>
										</a>
									</div>
									<ul class="user-menu-control">
										<li class="row"> 
											<div class="col">프로필 관리</div>  
										</li> 
										<li class="row">
											<div class="col">마이페이지</div>
										</li>
									</ul>
									<div data-name="user-type-control">
										<button class="btn-secondary">
											<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4="/>
											고객전환
										</button>
									</div>
									<div class="logout">
										<button class="logout-btn">
											로그아웃
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
<!-- ========= 		바디                 ========== -->
		<div id="app-body" class="center">
			<div id="home">
				<h2 id="hero-text">1,000가지 생활 서비스를 단 한 곳에서</h2>
				<div>
					<div id="service-search-container" class="center">
						<div id="service-search-bar" class="center">
							<form action="ServiceListAction.jsp" method="get">         <!-- ========================주소임시 -->
								<div id="search-bar-input-group" class="center">
									<div id="input-group-prepend" class="center">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
									</div>
									<input id="search" name="searchText" type="text" placeholder="어떤 서비스가 필요하세요?">
									<div id="clear">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDMgMykiPgogICAgICAgICAgICA8Y2lyY2xlIGZpbGw9IiNDNUM1QzUiIGN4PSI5IiBjeT0iOSIgcj0iOSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS13aWR0aD0iMS41IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im02IDYgNi4wMDUgNi4wMDZNMTIuMDA1IDYgNiAxMi4wMDYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
									</div>
								</div>
							</form>
							<div class="input-search-box"> <!-- 인풋창 클릭시 나타나는 search-box -->
								<div class="box-body">
									<section class="popular-section">
										<div class="search-title">
											<strong class="input_text soomgo_color">"청"</strong>
											검색결과
										</div>
										<ul class="list">
										<%--
											<li class="item">
												<div class="service" service_idx=0>
													<img class="search-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMikiIHN0cm9rZT0iI0M1QzVDNSIgc3Ryb2tlLXdpZHRoPSIxLjUiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI0LjUiIGN5PSI0LjUiIHI9IjQuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im04IDggNCA0Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/>
													<div class="service-name">
														아동/<strong class="soomgo_color">청</strong>소년 상담
													</div>
												</div>
											</li>
											<li class="item">
												<div class="service" service_idx=0>
													<img class="search-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDIgMikiIHN0cm9rZT0iI0M1QzVDNSIgc3Ryb2tlLXdpZHRoPSIxLjUiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI0LjUiIGN5PSI0LjUiIHI9IjQuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im04IDggNCA0Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/>
													<div class="service-name">
														후드 <strong class="soomgo_color">청</strong>소
													</div>
												</div>
											</li>
										 --%>
										</ul>
									</section>
								</div>
								<div class="search-box-footer">
									<div></div>
									<div class="close" style="cursor:pointer;">닫기</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="category-container" class="center">
					<ul>
						<li>
							<div class="category-icon">
								<div class="category-img-wrapper">
									<img
										src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzMiIHZpZXdCb3g9IjAgMCAzMiAzMyIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTQuODAwMDUgNy42OTk5OUM0LjgwMDA1IDYuMzc0NSA1Ljg3NDU3IDUuMjk5OTkgNy4yMDAwNSA1LjI5OTk5SDEyLjRDMTMuNzI1NSA1LjI5OTk5IDE0LjggNi4zNzQ1IDE0LjggNy42OTk5OVYxMi45QzE0LjggMTQuMjI1NSAxMy43MjU1IDE1LjMgMTIuNCAxNS4zSDcuMjAwMDVDNS44NzQ1NyAxNS4zIDQuODAwMDUgMTQuMjI1NSA0LjgwMDA1IDEyLjlWNy42OTk5OVoiIGZpbGw9IiNDN0NFRDYiLz4KPHBhdGggZD0iTTE3LjIgNy42OTk5OUMxNy4yIDYuMzc0NSAxOC4yNzQ1IDUuMjk5OTkgMTkuNiA1LjI5OTk5SDI0LjhDMjYuMTI1NCA1LjI5OTk5IDI3LjIgNi4zNzQ1IDI3LjIgNy42OTk5OVYxMi45QzI3LjIgMTQuMjI1NSAyNi4xMjU0IDE1LjMgMjQuOCAxNS4zSDE5LjZDMTguMjc0NSAxNS4zIDE3LjIgMTQuMjI1NSAxNy4yIDEyLjlWNy42OTk5OVoiIGZpbGw9IiM4RjlBQUIiLz4KPHBhdGggZD0iTTQuODAwMDUgMjAuMUM0LjgwMDA1IDE4Ljc3NDUgNS44NzQ1NyAxNy43IDcuMjAwMDUgMTcuN0gxMi40QzEzLjcyNTUgMTcuNyAxNC44IDE4Ljc3NDUgMTQuOCAyMC4xVjI1LjNDMTQuOCAyNi42MjU1IDEzLjcyNTUgMjcuNyAxMi40IDI3LjdINy4yMDAwNUM1Ljg3NDU3IDI3LjcgNC44MDAwNSAyNi42MjU1IDQuODAwMDUgMjUuM1YyMC4xWiIgZmlsbD0iIzhGOUFBQiIvPgo8cGF0aCBkPSJNMTcuMiAyMC4xQzE3LjIgMTguNzc0NSAxOC4yNzQ1IDE3LjcgMTkuNiAxNy43SDI0LjhDMjYuMTI1NCAxNy43IDI3LjIgMTguNzc0NSAyNy4yIDIwLjFWMjUuM0MyNy4yIDI2LjYyNTUgMjYuMTI1NCAyNy43IDI0LjggMjcuN0gxOS42QzE4LjI3NDUgMjcuNyAxNy4yIDI2LjYyNTUgMTcuMiAyNS4zVjIwLjFaIiBmaWxsPSIjNUQ2OTdBIi8+Cjwvc3ZnPgo="
										style="width: 30px; height: 30.94px;">
								</div>
								<p class="category-title">전체보기</p>
							</div>
						</li>
						<%
							for(CommuCategoryDto dto: categoryList) {
						%>
						<li>
							<div class="category-icon" idx="<%=dto.getCategoryIdx()%>">
								<div class="category-img-wrapper">
									<img
										src="<%=dto.getThumbnail()%>"
										style="width: 30px; height: 30.94px;">
								</div>
								<p class="category-title"><%=dto.getCategoryTitle()%></p>
							</div>
						</li>
						<%
							}
						%>
					</ul>
				</div>
				<div id="container-no-mobile-margin" class="center">
					<div id="main-banner" class="center">
						<div id="slider-banner" class="center">
							<div>
								<img
									src="https://static.cdn.soomgo.com/upload/banner/a598d5c9-6e6a-4a2e-b4dc-d781eef10160.png?w=970&webp=1 1x, https://static.cdn.soomgo.com/upload/banner/a598d5c9-6e6a-4a2e-b4dc-d781eef10160.png?w=1940&webp=1 2x">
							</div>
						</div>
						<div id="slide-prev-button">
							<img
								src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHZpZXdCb3g9IjAgMCA0OCA0OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8ZGVmcz4KICAgICAgICA8ZmlsdGVyIHg9Ii0xMi41JSIgeT0iLTEwJSIgd2lkdGg9IjEyNSUiIGhlaWdodD0iMTI1JSIgZmlsdGVyVW5pdHM9Im9iamVjdEJvdW5kaW5nQm94IiBpZD0iYSI+CiAgICAgICAgICAgIDxmZU9mZnNldCBkeT0iMSIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSIvPgogICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSIxLjUiIGluPSJzaGFkb3dPZmZzZXRPdXRlcjEiIHJlc3VsdD0ic2hhZG93Qmx1ck91dGVyMSIvPgogICAgICAgICAgICA8ZmVDb2xvck1hdHJpeCB2YWx1ZXM9IjAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAuMiAwIiBpbj0ic2hhZG93Qmx1ck91dGVyMSIvPgogICAgICAgIDwvZmlsdGVyPgogICAgICAgIDxjaXJjbGUgaWQ9ImIiIGN4PSIyNCIgY3k9IjI0IiByPSIyMCIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHVzZSBmaWxsPSIjMDAwIiBmaWx0ZXI9InVybCgjYSkiIHhsaW5rOmhyZWY9IiNiIi8+CiAgICAgICAgICAgIDx1c2UgZmlsbD0iI0ZGRiIgeGxpbms6aHJlZj0iI2IiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZD0iTTEyIDEyaDI0djI0SDEyeiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjciIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTI2IDMxLTctNyA3LTciLz4KICAgIDwvZz4KPC9zdmc+Cg==">
						</div>
						<div id="slide-next-button">
							<img
								src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDgiIGhlaWdodD0iNDgiIHZpZXdCb3g9IjAgMCA0OCA0OCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8ZGVmcz4KICAgICAgICA8ZmlsdGVyIHg9Ii0xMi41JSIgeT0iLTEwJSIgd2lkdGg9IjEyNSUiIGhlaWdodD0iMTI1JSIgZmlsdGVyVW5pdHM9Im9iamVjdEJvdW5kaW5nQm94IiBpZD0iYSI+CiAgICAgICAgICAgIDxmZU9mZnNldCBkeT0iMSIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSIvPgogICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSIxLjUiIGluPSJzaGFkb3dPZmZzZXRPdXRlcjEiIHJlc3VsdD0ic2hhZG93Qmx1ck91dGVyMSIvPgogICAgICAgICAgICA8ZmVDb2xvck1hdHJpeCB2YWx1ZXM9IjAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAuMiAwIiBpbj0ic2hhZG93Qmx1ck91dGVyMSIvPgogICAgICAgIDwvZmlsdGVyPgogICAgICAgIDxjaXJjbGUgaWQ9ImIiIGN4PSIyNCIgY3k9IjI0IiByPSIyMCIvPgogICAgPC9kZWZzPgogICAgPGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHVzZSBmaWxsPSIjMDAwIiBmaWx0ZXI9InVybCgjYSkiIHhsaW5rOmhyZWY9IiNiIi8+CiAgICAgICAgICAgIDx1c2UgZmlsbD0iI0ZGRiIgeGxpbms6aHJlZj0iI2IiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZD0iTTEyIDEyaDI0djI0SDEyeiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjciIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTIyIDMxIDctNy03LTciLz4KICAgIDwvZz4KPC9zdmc+Cg==">
						</div>
					</div>
				</div>
				<div id="main-service-container-no-mobile-padding" class="center">
					<h2>숨고 인기 서비스</h2>
					<div id="main-desktop-slide" class="center">
						<button type="button" id="prev-arrow-button"></button>
						<button type="button" id="next-arrow-button"></button>
						<div id="main-desktop-item-list">
							<div class="main-desktop-product">
								<div class="main-service-card">
									<img
										src="https://dmmj3ljielax6.cloudfront.net/upload/service/e83966e9-77de-452c-a188-1e14d07eaee2.png?h=302&w=458&webp=1"
										class="main-service-card-img">
									<p class="main-service-name">피아노/키보드 레슨</p>
									<div class="request-count">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMykiPgogICAgICAgICAgICA8cmVjdCBmaWxsPSIjQzVDNUM1IiB3aWR0aD0iMTQiIGhlaWdodD0iMTAiIHJ4PSIxIi8+CiAgICAgICAgICAgIDxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTEyIDIuNS01IDMtNS0zIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
											class="request-count-img"> <span>240,840</span>명 요청
									</div>
								</div>
							</div>
							<div class="main-desktop-product">
								<div class="main-service-card">
									<img
										src="https://dmmj3ljielax6.cloudfront.net/upload/service/edfc1261-a293-4875-8024-99032b98daa5.png?h=302&w=458&webp=1"
										class="main-service-card-img">
									<p class="main-service-name">골프 레슨</p>
									<div class="request-count">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMykiPgogICAgICAgICAgICA8cmVjdCBmaWxsPSIjQzVDNUM1IiB3aWR0aD0iMTQiIGhlaWdodD0iMTAiIHJ4PSIxIi8+CiAgICAgICAgICAgIDxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTEyIDIuNS01IDMtNS0zIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
											class="request-count-img"> <span>368,893</span>명 요청
									</div>
								</div>
							</div>
							<div class="main-desktop-product">
								<div class="main-service-card">
									<img
										src="https://dmmj3ljielax6.cloudfront.net/upload/service/6a497fde-2ba4-4a59-977c-41ce3be83e08.png?h=302&w=458&webp=1"
										class="main-service-card-img">
									<p class="main-service-name">퍼스널트레이닝(PT)</p>
									<div class="request-count">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMykiPgogICAgICAgICAgICA8cmVjdCBmaWxsPSIjQzVDNUM1IiB3aWR0aD0iMTQiIGhlaWdodD0iMTAiIHJ4PSIxIi8+CiAgICAgICAgICAgIDxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTEyIDIuNS01IDMtNS0zIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
											class="request-count-img"> <span>669,676</span>명 요청
									</div>
								</div>
							</div>
							<div class="main-desktop-product">
								<div class="main-service-card">
									<img
										src="https://dmmj3ljielax6.cloudfront.net/upload/service/85e81b4b-4b9e-4b45-b9ac-950a342788bc.png?h=302&w=458&webp=1"
										class="main-service-card-img">
									<p class="main-service-name">보컬 레슨</p>
									<div class="request-count">
										<img
											src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDEgMykiPgogICAgICAgICAgICA8cmVjdCBmaWxsPSIjQzVDNUM1IiB3aWR0aD0iMTQiIGhlaWdodD0iMTAiIHJ4PSIxIi8+CiAgICAgICAgICAgIDxwYXRoIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTEyIDIuNS01IDMtNS0zIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
											class="request-count-img"> <span>454,561</span>명 요청
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-pro-advertisement-container" class="center">
					<div id="title" class="center">
						<h2>숨은 고수를 발견했어요</h2>
						<div id="tooltip-container" class="center">
							<button type="button" id="btn-tooltip">
								<div>AD</div>
							</button>
						</div>
					</div>
					<div id="profile-section-container" class="center">
					<%
						for(CommuMainRandomGosuDto list : mList) {
					%>
						<div class="pro-card center">
							<div class="pro-card-header center">
								<div class="pro-info center">
									<img src="<%=list.getGosuImg()%> %>" class="pro-info-img">
									<div class="pro-service-title center">
										<div class="name"><%=list.getGosuName()%></div>
										<div class="service"><%=list.getServiceTitle()%></div>
									</div>
								</div>
								<div class="pro-card-arrow">
									<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
										xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M17.8491 11.9203C17.8482 11.7052 17.7549 11.5008 17.593 11.3591L7.39508 2.43559C7.08336 2.16282 6.60954 2.1944 6.33677 2.50612C6.064 2.81785 6.09558 3.29167 6.40731 3.56443L15.9657 11.9283L6.40257 20.4398C6.09315 20.7152 6.06557 21.1892 6.34096 21.4986C6.61634 21.8081 7.09042 21.8356 7.39983 21.5602L17.5978 12.4837C17.7585 12.3407 17.85 12.1355 17.8491 11.9203Z"
											fill="black"></path>
									</svg>
								</div>
							</div>
							<div class="pro-card-best-review center">
								<div class="pro-card-score">
									<ul class="star-rate-ul">
										<li class="star-rate-li"><img
											src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"
											class="star-img"></li>
										<li class="star-rate-li"><img
											src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"
											class="star-img"></li>
										<li class="star-rate-li"><img
											src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"
											class="star-img"></li>
										<li class="star-rate-li"><img
											src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"
											class="star-img"></li>
										<li class="star-rate-li"><img
											src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"
											class="star-img"></li>
									</ul>
									<%=list.getAvgScore()%>
								</div>
								<div class="pro-card-content">
									<div>
										<p><%=list.getReviewContents()%></p>
										<div><%=convStr(list.getUserName())%> 고객님의 후기</div>
									</div>
								</div>
							</div>
						</div>
					<%
						}
					%>
					</div>
				</div>
				<div id="main-community-list-container" class="center">
					<div id="main-community-header" class="center">
						<h2>숨고 커뮤니티에 물어보세요</h2>
						<a> <span>전체보기</span> <img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNTMuMDAwMDAwLCAtMjAyLjAwMDAwMCkgdHJhbnNsYXRlKDQ4NS4wMDAwMDAsIDE4OC4wMDAwMDApIHRyYW5zbGF0ZSg1NjguMDAwMDAwLCAxNC4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTEgMTNMNiA4IDExIDMiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMDUzLjAwMDAwMCwgLTIwMi4wMDAwMDApIHRyYW5zbGF0ZSg0ODUuMDAwMDAwLCAxODguMDAwMDAwKSB0cmFuc2xhdGUoNTY4LjAwMDAwMCwgMTQuMDAwMDAwKSB0cmFuc2xhdGUoOC41MDAwMDAsIDguMDAwMDAwKSBzY2FsZSgtMSwgMSkgdHJhbnNsYXRlKC04LjUwMDAwMCwgLTguMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
						</a>
					</div>
					<div id="main-community-contents" class="center">
						<div id="curation-container-left">
							<ul>
								<li>
								<%
									for(CommuMainpostListDto dto : mainPostList) {
								%>
									<a class="curation-list" idx="<%=dto.getPostIdx()%>">
										<div class="curation-contents-thumbnail">
											<p class="topic-name"><%=dto.getCommuTitle()%></p>
											<p class="curation-title"><%=dto.getPostTitle()%></p>
											<p class="curation-content"><%=dto.getPostContents()%></p>
											<%
												ArrayList<CommuMainPostActionDto> actionList = pDao.getMainAction(dto.getPostIdx());
											%>
											<%
												for(CommuMainPostActionDto actionDto : actionList) {
											%>
											<div class="curation-reactions">
												<span class="view-count-img"></span> 
												<span class="view-count"><%=actionDto.getViewCount()%></span> 
												<span class="comment-count-img"></span>
												<span class="comment-count"><%=actionDto.getCommentCount()%></span>
											</div>
											<%
												}
											%>
										</div>
										<div class="curation-topic-thumbnail">
										<%
											if (dto.getPostImg() != null) {
										%>
											<img src="<%=dto.getPostImg()%>" class="curation-topic-thumbnail-img"/>
										<%
											}
										%>
										</div>
									</a> 
								<%
 									}
 								%>
								</li>
							</ul>
						</div>
						<div id="knowhow-container-right">
						<%
							for (CommuGosuKnowhowPostListDto dto : mainList) {
						%>
							<a class="gkh_post" idx="<%=dto.getPostIdx() %>"> 
								<img
								src="<%=dto.getPostImg()%>">
								<div id="knowhow-card-desc">
									<p><%=dto.getServiceTitle() %></p>
									<div id="knowhow-line-clamp">
										<p><%=dto.getPostTitle() %></p>
									</div>
									<p><%=dto.getUserName() %></p>
								</div>
							</a> 
						<%} %>
						</div>
					</div>
				</div>
				<div id="main-portfolio-container" class="center">
					<div id="main-portfolio-header" class="center">
						<h2>숨은고수 포트폴리오</h2>
						<a> <span>전체보기</span> <img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNTMuMDAwMDAwLCAtMjAyLjAwMDAwMCkgdHJhbnNsYXRlKDQ4NS4wMDAwMDAsIDE4OC4wMDAwMDApIHRyYW5zbGF0ZSg1NjguMDAwMDAwLCAxNC4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTEgMTNMNiA4IDExIDMiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMDUzLjAwMDAwMCwgLTIwMi4wMDAwMDApIHRyYW5zbGF0ZSg0ODUuMDAwMDAwLCAxODguMDAwMDAwKSB0cmFuc2xhdGUoNTY4LjAwMDAwMCwgMTQuMDAwMDAwKSB0cmFuc2xhdGUoOC41MDAwMDAsIDguMDAwMDAwKSBzY2FsZSgtMSwgMSkgdHJhbnNsYXRlKC04LjUwMDAwMCwgLTguMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
						</a>
					</div>
					<div>
						<div id="main-portfolio-list">
							<div id="slick-slider">
								<button type="button" id="slick-slider-left"></button>
								<button type="button" id="slick-slider-right"></button>
								<div id="slick-track">
									<div class="slick-current">
										<div class="item-wrap">
											<a class="slick-track-img box"> <img
												src="https://static.cdn.soomgo.com/upload/portfolio/0c2db666-3ccd-4c23-853c-ff212cb9dd0e.jpg?w=250&h=250&webp=1">
												<div class="item-text-wrap">
													<h3 class="item-text-wrap-h3">내가 작업한 모델 포토샵 메이크업 헤어 사진</h3>
													<p
														style="font-size: 12px; font-weight: 400; line-height: 17px; overflow: hidden; color: rgb(255, 255, 255);">부분·피팅모델
														알바</p>
												</div>
											</a> <a class="slick-track-info">
												<div class="slick-track-info-img"></div> <span
												style="font-size: 12px; font-weight: 400; line-height: 20px;">남서연</span>
											</a>
										</div>
									</div>
									<div class="slick-current">
										<div class="item-wrap">
											<a class="slick-track-img box"> <img
												src="https://static.cdn.soomgo.com/upload/portfolio/0c2db666-3ccd-4c23-853c-ff212cb9dd0e.jpg?w=250&h=250&webp=1">
												<div class="item-text-wrap">
													<h3 class="item-text-wrap-h3">내가 작업한 모델 포토샵 메이크업 헤어 사진</h3>
													<p
														style="font-size: 12px; font-weight: 400; line-height: 17px; overflow: hidden; color: rgb(255, 255, 255);">부분·피팅모델
														알바</p>
												</div>
											</a> <a class="slick-track-info">
												<div class="slick-track-info-img"></div> <span
												style="font-size: 12px; font-weight: 400; line-height: 20px;">남서연</span>
											</a>
										</div>
									</div>
									<div class="slick-current">
										<div class="item-wrap">
											<a class="slick-track-img box"> <img
												src="https://static.cdn.soomgo.com/upload/portfolio/0c2db666-3ccd-4c23-853c-ff212cb9dd0e.jpg?w=250&h=250&webp=1">
												<div class="item-text-wrap">
													<h3 class="item-text-wrap-h3">내가 작업한 모델 포토샵 메이크업 헤어 사진</h3>
													<p
														style="font-size: 12px; font-weight: 400; line-height: 17px; overflow: hidden; color: rgb(255, 255, 255);">부분·피팅모델
														알바</p>
												</div>
											</a> <a class="slick-track-info">
												<div class="slick-track-info-img"></div> <span
												style="font-size: 12px; font-weight: 400; line-height: 20px;">남서연</span>
											</a>
										</div>
									</div>
									<div class="slick-current">
										<div class="item-wrap">
											<a class="slick-track-img box"> <img
												src="https://static.cdn.soomgo.com/upload/portfolio/0c2db666-3ccd-4c23-853c-ff212cb9dd0e.jpg?w=250&h=250&webp=1">
												<div class="item-text-wrap">
													<h3 class="item-text-wrap-h3">내가 작업한 모델 포토샵 메이크업 헤어 사진</h3>
													<p
														style="font-size: 12px; font-weight: 400; line-height: 17px; overflow: hidden; color: rgb(255, 255, 255);">부분·피팅모델
														알바</p>
												</div>
											</a> <a class="slick-track-info">
												<div class="slick-track-info-img"></div> <span
												style="font-size: 12px; font-weight: 400; line-height: 20px;">남서연</span>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-popular-pro" class="center">
					<div style="height: 303px;">
						<div id="main-popular-pro-header" class="center">
							<h2>지금 인기 있는 고수</h2>
							<a> <span>전체보기</span> <img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNTMuMDAwMDAwLCAtMjAyLjAwMDAwMCkgdHJhbnNsYXRlKDQ4NS4wMDAwMDAsIDE4OC4wMDAwMDApIHRyYW5zbGF0ZSg1NjguMDAwMDAwLCAxNC4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTEgMTNMNiA4IDExIDMiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMDUzLjAwMDAwMCwgLTIwMi4wMDAwMDApIHRyYW5zbGF0ZSg0ODUuMDAwMDAwLCAxODguMDAwMDAwKSB0cmFuc2xhdGUoNTY4LjAwMDAwMCwgMTQuMDAwMDAwKSB0cmFuc2xhdGUoOC41MDAwMDAsIDguMDAwMDAwKSBzY2FsZSgtMSwgMSkgdHJhbnNsYXRlKC04LjUwMDAwMCwgLTguMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
							</a>
						</div>
						<div id="main-popular-pro-header-chips" class="box">
							<button type="button" class="chips-btn"><span class="chips-btn-text">용달/화물 운송</span></button>
							<button type="button" class="chips-btn"><span class="chips-btn-text">수영 레슨</span></button>
							<button type="button" class="chips-btn"><span class="chips-btn-text">원룸/소형 이사</span></button>
							<button type="button" class="chips-btn"><span class="chips-btn-text">도배 시공</span></button>
						</div>
						<div id="main-desktop-slide">
							<div id="main-desktop-slick-list">
								<div id="main-desktop-slick-track">
									<div id="slick-list-item">
										<div>
											<a>
												<div id="main-meet-provider">
													<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTYiIGhlaWdodD0iNTYiIHZpZXdCb3g9IjAgMCA1NiA1NiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZD0iTS0xMTItMjE4NWgxMTcwdjUzNzFILTExMnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTIgLTEyKSI+CiAgICAgICAgICAgIDxyZWN0IGZpbGw9IiNGMkYyRjIiIHdpZHRoPSIxODIiIGhlaWdodD0iMTgyIiByeD0iOCIvPgogICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxMiAxMikiPgogICAgICAgICAgICAgICAgPGNpcmNsZSBmaWxsPSIjRDRFMEZFIiBmaWxsLXJ1bGU9Im5vbnplcm8iIGN4PSIyOCIgY3k9IjI4IiByPSIyOCIvPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTM0LjI3IDE2LjA3OGEzLjI3OCAzLjI3OCAwIDAgMC0zLjI4IDMuMTYybC0uMzY1IDEwLjc5NWg3LjI5MWwtLjM2NS0xMC43OTVhMy4yNzggMy4yNzggMCAwIDAtMy4yOC0zLjE2MnpNMjEuMjkyIDE2LjA3OGEzLjI3NyAzLjI3NyAwIDAgMC0zLjI4IDMuMTYybC0uMzY2IDEwLjc5NWg3LjI5MWwtLjM2NS0xMC43OTVhMy4yNzggMy4yNzggMCAwIDAtMy4yOC0zLjE2MnoiIGZpbGw9IiM1MDgwRkEiLz4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Im0zNi44NzcgMTcuOTg1LTcuOTQ4LjUwNmMtLjYxOS4wMzktMS4yNC4wMzktMS44NTggMGwtNy45NDgtLjUwNmE1LjI0NiA1LjI0NiAwIDAgMC01LjUzIDQuNDY4bC0xLjM0MyA5LjE4MmgzMS41bC0xLjM0My05LjE4MmE1LjI0NiA1LjI0NiAwIDAgMC01LjUzLTQuNDY4eiIgZmlsbD0iIzgwQTNGQyIvPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTM4LjEzNSAyNi4yNTVoLTIwLjI3Yy0zLjEwMSAwLTUuNjE1IDIuNTA2LTUuNjE1IDUuNTk4IDAgMy4wOTEgMi41MTQgNS41OTcgNS42MTUgNS41OTdoMjAuMjdjMy4xMDEgMCA1LjYxNS0yLjUwNiA1LjYxNS01LjU5NyAwLTMuMDkyLTIuNTE0LTUuNTk4LTUuNjE1LTUuNTk4eiIgZmlsbD0iIzQyNzBGOCIvPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTM1IDM5LjkyMmMtMy41NDQgMC02LjQxNy0yLjg2NC02LjQxNy02LjM5NyAwLTMuNTMzIDIuODczLTYuMzk3IDYuNDE3LTYuMzk3IDMuNTQzIDAgNi40MTYgMi44NjQgNi40MTYgNi4zOTcgMCAzLjUzMy0yLjg3MyA2LjM5Ny02LjQxNiA2LjM5N3oiIGZpbGw9IiMyQzNFRDAiIGZpbGwtcnVsZT0ibm9uemVybyIvPgogICAgICAgICAgICAgICAgPHBhdGggZD0iTTM0Ljk5OSAzNy4xNmEzLjY0IDMuNjQgMCAwIDEtMy42NDYtMy42MzVBMy42NCAzLjY0IDAgMCAxIDM1IDI5Ljg5YTMuNjQgMy42NCAwIDAgMSAzLjY0NiAzLjYzNSAzLjY0IDMuNjQgMCAwIDEtMy42NDYgMy42MzV6IiBmaWxsPSIjRUZGNEZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iLz4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0yMC43MDggMzkuOTIyYy0zLjU0MyAwLTYuNDE2LTIuODY0LTYuNDE2LTYuMzk3IDAtMy41MzMgMi44NzMtNi4zOTcgNi40MTYtNi4zOTcgMy41NDQgMCA2LjQxNyAyLjg2NCA2LjQxNyA2LjM5NyAwIDMuNTMzLTIuODczIDYuMzk3LTYuNDE3IDYuMzk3eiIgZmlsbD0iIzJDM0VEMCIgZmlsbC1ydWxlPSJub256ZXJvIi8+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMjAuNzA4IDM3LjE2YTMuNjQgMy42NCAwIDAgMS0zLjY0Ni0zLjYzNSAzLjY0IDMuNjQgMCAwIDEgMy42NDYtMy42MzUgMy42NCAzLjY0IDAgMCAxIDMuNjQ2IDMuNjM1IDMuNjQgMy42NCAwIDAgMS0zLjY0NiAzLjYzNXoiIGZpbGw9IiNFRkY0RkYiIGZpbGwtcnVsZT0ibm9uemVybyIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
													<span>3,167명</span><span>의</span>
													<br/>
													<div id="meet-provider-link">
														<span>고수 만나보기</span>
														<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzJEMkQyRCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0ibTQgMTAgNC00LTQtNCIvPgogICAgPC9nPgo8L3N2Zz4K">
													</div>
												</div>
											</a>
										</div>
									</div>
									<div id="slick-list-item">
										<div>
											<a>
												<div id="main-meet-procard">
													<div id="main-meet-procard-header">
														<div id="main-meet-procard-img">
															<img src="https://dmmj3ljielax6.cloudfront.net/upload/profile/d2251c28-fdf7-4413-87ca-091bee09fa1f.jpg?h=96&w=96&webp=1">
														</div>
														<div id="main-meet-procard-review">
															<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=" style="height: 14px; width: 14px; vertical-align: middle;">
															<span style="font-size: 14px; font-weight: 700; margin: 0px 2px;">5.0</span>
														</div>
													</div>
													<p class="main-meet-procard-name">⭐장용준⭐</p>
													<div style="margin-bottom: 16px; width: 158px; height: 22px;"></div>
													<div id="procard-sub-info">
														<span>경력 8년</span><span>평균 2시간 내 응답</span>
													</div>
												</div>
											</a>
										</div>
									</div>
									<div id="slick-list-item">
										<div>
											<a>
												<div id="main-meet-procard">
													<div id="main-meet-procard-header">
														<div id="main-meet-procard-img">
															<img src="https://dmmj3ljielax6.cloudfront.net/upload/profile/787f25e1-5a12-4598-91ba-d72891d85c86.jpg?h=96&w=96&webp=1">
														</div>
														<div id="main-meet-procard-review">
															<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=" style="height: 14px; width: 14px; vertical-align: middle;">
															<span style="font-size: 14px; font-weight: 700; margin: 0px 2px;">5.0</span>
														</div>
													</div>
													<p class="main-meet-procard-name">착한몬스터 우태균</p>
													<div style="margin-bottom: 16px; width: 158px; height: 22px;"></div>
													<div id="procard-sub-info">
														<span>경력 10년</span><span>평균 15분 내 응답</span>
													</div>
												</div>
											</a>
										</div>
									</div>
									<div id="slick-list-item">
										<div>
											<a>
												<div id="main-meet-procard">
													<div id="main-meet-procard-header">
														<div id="main-meet-procard-img">
															<img src="https://dmmj3ljielax6.cloudfront.net/upload/profile/cea82797-4a3b-4801-9b0c-e883c00c2db3.jpg?h=96&w=96&webp=1">
														</div>
														<div id="main-meet-procard-review">
															<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=" style="height: 14px; width: 14px; vertical-align: middle;">
															<span style="font-size: 14px; font-weight: 700; margin: 0px 2px;">5.0</span>
														</div>
													</div>
													<p class="main-meet-procard-name">⭐ 왕창이사(대표 장용준)⭐</p>
													<div style="margin-bottom: 16px; width: 158px; height: 22px;"></div>
													<div id="procard-sub-info">
														<span>경력 25년</span><span>평균 1시간 내 응답</span>
													</div>
												</div>
											</a>
										</div>
									</div>
									<div id="slick-list-item">
										<div>
											<a>
												<div id="main-meet-procard">
													<div id="main-meet-procard-header">
														<div id="main-meet-procard-img">
															<img src="https://dmmj3ljielax6.cloudfront.net/upload/profile/195b61ae-9bb9-4912-b0f6-315657478e4a.jpg?h=96&w=96&webp=1">
														</div>
														<div id="main-meet-procard-review">
															<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=" style="height: 14px; width: 14px; vertical-align: middle;">
															<span style="font-size: 14px; font-weight: 700; margin: 0px 2px;">4.8</span>
														</div>
													</div>
													<p class="main-meet-procard-name">정처산기A YG</p>
													<div style="margin-bottom: 16px; width: 158px; height: 22px;"></div>
													<div id="procard-sub-info">
														<span>경력 25년</span><span>평균 2시간 내 응답</span>
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-app-banner" class="center">
					<div id="app-download-banner" class="center">
						
					</div>
				</div>
				<div id="main-exhibition-container" class="center">
					<div id="exhibition-item" class="center">
						<h2>쓱싹쓱싹 청소하는 날</h2>
						<div id="exhibition-item-slide">
						<button type="button" id="slide-btn-left"></button>
						<button type="button" id="slide-btn-right"></button>
							<div id="exhibition-item-list">
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/22b8a2b3-3644-4c9e-814c-ba7284d71ef6.png?h=302&w=452&webp=1">
											<p>정리수납 컨설팅</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_65311471-18f1-4f66-86b9-a6e7298cfcce.jpg?h=302&w=452&webp=1">
											<p>에어컨 청소</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/71c1ef33-506c-44de-9663-04cbf241fddd.png?h=302&w=452&webp=1">
											<p>이사/입주 청소업체</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/7ab9aadc-14e7-4632-a47d-a2dcae5b2b0e.png?h=302&w=452&webp=1">
											<p>세탁기 청소</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-exhibition-container" class="center">
					<div id="exhibition-item" class="center">
						<h2>자동차를 부탁해</h2>
						<div id="exhibition-item-slide">
						<button type="button" id="slide-btn-left"></button>
						<button type="button" id="slide-btn-right"></button>
							<div id="exhibition-item-list">
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_c147809c-62c1-4fb9-8183-636db842f95a.jpg?h=302&w=452&webp=1">
											<p>자동차 정비</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_d3089e27-bb6e-4f92-9a61-126c6d0b9968.png?h=302&w=452&webp=1">
											<p>자동차 썬팅</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/bc35a7f5-9041-4013-bb04-5d898cc93ef7.png?h=302&w=452&webp=1">
											<p>출장 세차</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/21523e0e-e1fa-40a9-b5fb-8c893561487f.png?h=302&w=452&webp=1">
											<p>블랙박스/내비게이션 설치 및 수리</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-exhibition-container" class="center">
					<div id="exhibition-item" class="center">
						<h2>무엇이든 고치는 고수들</h2>
						<div id="exhibition-item-slide">
						<button type="button" id="slide-btn-left"></button>
						<button type="button" id="slide-btn-right"></button>
							<div id="exhibition-item-list">
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/80f1a805-f1e7-4acc-ab23-394b35300cbd.png?h=302&w=452&webp=1">
											<p>도배 시공</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_63368f08-bab4-45c3-bf57-9eb1779342b5.png?h=302&w=452&webp=1">
											<p>줄눈 시공</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_50de53e6-8c82-4d7b-a9db-aff280606228.jpg?h=302&w=452&webp=1">
											<p>수도 관련 설치 및 수리</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/featured_service_59ac9a8b-868c-4358-b8a4-d2319b91f7d6.jpg?h=302&w=452&webp=1">
											<p>전기배선 설치 및 수리</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-exhibition-container" class="center">
					<div id="exhibition-item" class="center">
						<h2>배우고 성장하는 재미</h2>
						<div id="exhibition-item-slide">
						<button type="button" id="slide-btn-left"></button>
						<button type="button" id="slide-btn-right"></button>
							<div id="exhibition-item-list">
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/service_popular_95.jpg?h=302&w=452&webp=1">
											<p>수영 레슨</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/71cbc82e-3a12-4330-871d-39cc0279b1c0.png?h=302&w=452&webp=1">
											<p>영어 과외</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/6a497fde-2ba4-4a59-977c-41ce3be83e08.png?h=302&w=452&webp=1">
											<p>퍼스널트레이닝(PT)</p>
										</a>
									</div>
								</div>
								<div id="exhibition-item-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/service/ccbc3bb8-8530-40fd-bf3b-5535752da7a0.png?h=302&w=452&webp=1">
											<p>기타 레슨</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-pro-locations" class="center">
					<div id="pro-locations-header">
						<h2>전국 숨은고수</h2>
						<div>
							믿을 수 있는 전문가를<br/>
							숨고 단 한 곳에서 찾으세요
						</div>
					</div>
					<ul id="location-list">
						<li style="padding: 0px 16px 24px 0px"><a>서울</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>세종</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>강원</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>인천</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>경기</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>충북</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>충남</a></li>
						<li style="padding: 0px 16px 24px 0px"><a>경북</a></li>
						<li style="padding-bottom: 24px; width: 58px"><a>대전</a></li>
						<li style="padding-right: 16px"><a>대구</a></li>
						<li style="padding-right: 16px"><a>전북</a></li>
						<li style="padding-right: 16px"><a>경남</a></li>
						<li style="padding-right: 16px"><a>울산</a></li>
						<li style="padding-right: 16px"><a>광주</a></li>
						<li style="padding-right: 16px"><a>부산</a></li>
						<li style="padding-right: 16px"><a>전남</a></li>
						<li style="padding-right: 16px"><a>제주</a></li>
					</ul>
				</div>
				<div id="main-soomgo-story" class="center">
					<div id="main-soomgo-story-header">
						<h2>숨고 이야기</h2>
						<a> <span>전체보기</span> <img
							src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEgxNlYxNkgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNTMuMDAwMDAwLCAtMjAyLjAwMDAwMCkgdHJhbnNsYXRlKDQ4NS4wMDAwMDAsIDE4OC4wMDAwMDApIHRyYW5zbGF0ZSg1NjguMDAwMDAwLCAxNC4wMDAwMDApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTEgMTNMNiA4IDExIDMiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0xMDUzLjAwMDAwMCwgLTIwMi4wMDAwMDApIHRyYW5zbGF0ZSg0ODUuMDAwMDAwLCAxODguMDAwMDAwKSB0cmFuc2xhdGUoNTY4LjAwMDAwMCwgMTQuMDAwMDAwKSB0cmFuc2xhdGUoOC41MDAwMDAsIDguMDAwMDAwKSBzY2FsZSgtMSwgMSkgdHJhbnNsYXRlKC04LjUwMDAwMCwgLTguMDAwMDAwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
						</a>
					</div>
					<div id="soomgo-story-slide" class="center">
						<div id="soomgo-story-list" class="center">
							<button type="button" id="slide-btn-left"></button>
							<button type="button" id="slide-btn-right"></button>
							<div id="slick-track">
								<div id="soomgo-story-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/c116964a-313e-4dc1-9630-fc421d191f55.png?h=552&w=738&webp=1">
											<p>🔭 18살에 유럽 프로 리그 데뷔전 2위! 축구 레슨 허민영 고수</p>
										</a>
									</div>
								</div>
								<div id="soomgo-story-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/79aee9a6-0375-4ed5-9942-133d5f900371.png?h=552&w=738&webp=1">
											<p>고객 만족도 200% 보장하는 에어컨 청소</p>
										</a>
									</div>
								</div>
								<div id="soomgo-story-current">
									<div>
										<a>
											<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/b0c0bc18-cac3-499e-bdaa-b32a6df07918.png?h=552&w=738&webp=1">
											<p>🔭 동양인 최초 국제콩쿠르 우승! 기타 레슨 김승원 고수</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="main-pro-info-container" class="center">
					<div id="main-pro-info-header">
						<p>
							전문가로 활동하시나요?<br/>
							숨고에서 새로운 고객을<br/>
							만나보세요<br/>
						</p>
						<div id="pro-signup-btn">
							<a>고수가입</a>
						</div>
					</div>
					<div id="main-pro-info-slider">
					<button type="button" id="pro-info-left-btn"></button>
					<button type="button" id="pro-info-right-btn"></button>
						<div id="main-pro-info-list">
							<div id="main-pro-info-track">
								<div>
									<div style="width: 100%; display: inline-block;">
										<div id="pro-info-slide">
											<img src="https://assets.cdn.soomgo.com/images/home/img-main-signup-pro-step-1@2x.png?webp=1">
											<p>고객의 요청서를 무료로 받으세요</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!-- home --> 
		</div><!-- body --> 
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
	</div><!-- app --> 
</body>
</html>