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
    	int categoryIdx = 1;
    	try{
	    	categoryIdx = Integer.parseInt(request.getParameter("category_idx"));
    	} catch (Exception e) { }
    	
    	MarketProductListDAO mplDao = new MarketProductListDAO();
    	ArrayList<MarketProductListDTO> mpl = mplDao.marketList(categoryIdx);
    	
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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/soomgo_market.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/clear.css">
<!-- 	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
			
			
		})
	</script>
</head>
<body>
	<div id = "total-header" class="sticky">
    <!--상단바메인 보더 박스-->
    <div id="soomgo-header" class = "center">
        <!--상단바 로고  보더 박스 -->
        <div id = "soomgo-header1" class = "center">
            <!--숨고 메인 페이지 이동 URL-->
            <a href = "soomgo_main.html">
                <!--숨고 메인 로고-->
                <img src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg" width = "79.5px" height = "27px">
            </a>
        </div>

        <!--숨고 견적,고수,마켓,커뮤 보더 박스-->
        <div id = "soomgo-menu1" class = "center">
            <!--견적요청 보더 박스-->
            <div id = "soomgo-request" class = "center">
                <!--견적요청 페이지 이동URL-->
                <a href = "https://soomgo.com/category-home/?from=web_gnb">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">견적요청</span>
                </a>
            </div>
            <!--고수찾기 보더 박스-->
            <div id = "soomgo-serch" class ="center">
                <!--고수찾기 페이지 이동URL-->
                <a href = "https://soomgo.com/search/pro?from=web_gnb">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">고수찾기</span>
                </a>
            </div>
            
            <!--마켓 보더 박스-->
            <div id = "soomgo-market" class ="center" style="cursor: pointer;">
                <!--마켓 페이지 이동 URL-->
                <a href = "SoomgoMarketServlet?category_idx=1">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">마켓</span>
            </div>
            
            <!--커뮤니티 보더 박스-->
            <div id = "soomgo-community" class ="center">
                <!--커뮤니티 페이지 이동 URL-->
                <a href = "https://soomgo.com/community/soomgo-life/all?from=web_gnb">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">커뮤니티</span>
                </a>
            </div>
        </div>

        <!--상단바 검색 보더 박스-->
        <div id = "soomgo-header-serch" class ="center">
            <!--상단바 검색 돋보기 이미지-->
            <div id = "reading-glasses-img" class ="center">
                <img src ="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" width ="24px" height = "24px">
            </div>
            <!--상단바 검색 버튼-->
            <div id="serch-input-outter" class ="center">
                <input type="text" class = "serch-input" style = "font-size: .875ream; font-weight:400;"
                placeholder= "어떤 서비스가 필요하세요?">
            </div>
        </div>
        
        <!--상단바 우측 로그인,회원가입,고수가입 보더 박스-->
        <div id = "soomgo-menu2" class ="center">
            <!--로그인 보더 박스-->
            <div id = "soomgo-login" class ="center">
                <!--로그인 페이지 이동URL-->
                <a href = "https://soomgo.com/login">
                    <span style = "font-size : 14px; font-weight: 400;">로그인</span>
                </a>
            </div>
            <!--회원가입 보더 박스-->
            <div id = "soomgo-join" class ="center">
                <!--회원가입 페이지 이동URL-->
                <a href = "https://soomgo.com/sign-up?from=gnb&entry_point=signup_cta">
                    <span style = "font-size : 14px; font-weight: 400; color:rgb(12, 12, 12);" >회원가입</span>
                </a>
            </div>
            <!--고수가입 보더 박스-->
            <div id = "soomgo-gosu-join" class ="center">
                <!--고수가입 페이지 이동URL-->
                <a href = "https://soomgo.com/sign-up?from=gnb&entry_point=signup_cta">
                    <span style = "font-size : 14px; color:#fff; font-weight: 500">고수가입</span>
                </a>
            </div>
        </div>
    </div>
</div>
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
						<a class="product-list-item-a" href="SoomgoMarketDetailServlet?market_idx=<%=dto.getMarket_idx() %>" >
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
<!-- 	마켓 채팅 문의하기 시작-->

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
<!-- 	마켓 채팅 문의하기 끝-->
</body>
</html>