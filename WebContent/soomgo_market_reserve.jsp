<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
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
	
    <%
    	String title = (String)request.getAttribute("title");
    	String optionTitle = (String)request.getAttribute("optionTitle");
    	String optionPrice = (String)request.getAttribute("optionPrice");
    	String year = (String)request.getAttribute("year");
    	String month = (String)request.getAttribute("month");
    	String day = (String)request.getAttribute("day");
    	String dayWeek = (String)request.getAttribute("dayWeek");
    	String time = (String)request.getAttribute("time");
    %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>숨고 마켓 상품 예약하기 -승현</title>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/soomgo_market_reserve.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
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
	
	<script type="module">
		import { v4 as uuidv4 } from 'https://cdn.skypack.dev/uuid';
		window.uuidv4 = uuidv4;
	</script>
	
	<script type="text/javascript">
		function payment(data) {
		    const uid = window.uuidv4();

	    	// 매개변수 data에서 값을 가져옵니다.
		    let marketTitle = data.marketTitle;
		    let marketPrice = data.marketPrice;
		    let marketOption = data.marketOption;
		    let reserveDate = data.reserveDate;
		    let reserveTime = data.reserveTime;
	
		    IMP.init('imp54682524'); // 아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	
		    IMP.request_pay({ // param
		        pg: "kakaopay.TC0ONETIME", // pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
		        pay_method: "card", // 지불 방법
		        merchant_uid: uid, // 가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
		        name: marketTitle + " " + marketOption,
		        amount: marketPrice, // 금액
		        buyer_email: "tkswk8093@naver.com",
		        buyer_name: "장용준",
		        buyer_tel: "01040968093"
		    }, function (rsp) { // callback
		        if (rsp.success) {
		            alert("완료 -> imp_uid : " + rsp.imp_uid + " / merchant_uid(orderKey) : " + rsp.merchant_uid);
		        } else {
		            alert("실패 : 코드(" + rsp.error_code + ") 메시지(" + rsp.error_msg + ")");
		        }
		    });
		}

		$(function () {
		    $(document).on("click", "#chkBox1, #chkBox2", function () {
		        let chkBox1 = $('#chkBox1').is(':checked');
		        let chkBox2 = $('#chkBox2').is(':checked');
		        if (chkBox1 && chkBox2) {
		            $(".pay-button").addClass("complete");
		        } else {
		            $(".pay-button").removeClass("complete");
		        }
		    });
	
		    $(document).on("click", ".pay-button.complete", function () {
		        let marketTitle = $("#marketTitle").text();
		        let marketOption = $("#marketOption").text();
		        let marketPrice = $("#marketPrice").text();
		        let reserveDate = $("#reserveDate").text();
		        let reserveTime = $("#reserveTime").text();
		        swal({
		            title: "결제 정보 확인\n\n",
		            text: "상품명 : " + marketTitle + "\n\n상품 옵션 : " + marketOption + "\n\n상품 가격 : " + marketPrice + "\n\n예약 날짜 : " + reserveDate + "\n\n예약 시간 : " + reserveTime + "\n\n결제 수단 : Kakao Pay 카카오페이",
		            icon: "info",
		            buttons: true,
		            dangerMode: true,
		        }).then((willPay) => {
		            if (willPay) {
		                const paymentData = {
		                    marketTitle: marketTitle,
		                    marketOption: marketOption,
		                    marketPrice: marketPrice,
		                    reserveDate: reserveDate,
		                    reserveTime: reserveTime
		                };
	
		                payment(paymentData);
		            }
		        });
		    });
	
		    $(".informationPrivacy").click(function () {
		        swal("숨고 회원 계정으로 마켓 상품을 구매하는 경우, 주식회사 브레이브모바일(이하 “회사”)은 사이트 이용을 위해 필요한 최소한의 범위로 개인정보를 수집합니다. 회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 다음과 같은 목적을 위하여 개인정보를 수집하고 이용합니다.\n\n" +
		            "1. 개인정보의 수집 및 이용 목적 : 상품 구매 중개, 구매 및 요금 결제, 상담 및 불만 처리, 상품 구매에 따른 혜택 제공\n\n" +
		            "2. 수집하는 개인정보 항목 : 상품 구매정보, 결제수단\n\n" +
		            "3. 개인정보의 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보관하며, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 파기합니다.\n\n" +
		            "전자상거래 등에서 소비자 보호에 관한 법률\n\n" +
		            "1) 계약 또는 청약철회 등에 관한 기록 \n: 5년 보관\n\n" +
		            "2) 대금결제 및 재화 등의 공급에 관한 기록 \n: 5년 보관\n\n" +
		            "3) 소비자의 불만 또는 분쟁처리에 관한 기록 \n: 3년 보관\n\n" +
		            "사용자는 개인정보 수집 및 이용에 대한 동의를 거부할 수 있으며, 동의 거부 시 마켓 상품 구매가 제한됩니다. 그밖의 내용은 회사의 이용약관 및 개인정보처리방침에 따릅니다.");
		    });
	
		    $(".informationThird").click(function () {
		        swal("숨고 회원 계정으로 마켓 상품을 구매하는 경우, 주식회사 브레이브모바일(이하 “회사”)은 거래 당사자 간 원활한 의사소통, 상담, 서비스 제공 등 거래 이행을 위하여 필요한 최소한의 개인정보를 아래와 같이 제공합니다.\n\n" +
		            "1. 개인정보를 제공받는 자 : 마켓 상품 판매자\n\n" +
		            "2. 제공하는 개인정보 항목 : 이름, 상품 구매정보, 결제수단\n\n" +
		            "3. 개인정보를 제공받는 자의 이용 목적 : 판매자와 구매자 간의 원활한 거래 진행, 본인의사의 확인, 상담 및 불만 처리, 서비스 제공, 상품 구매에 따른 혜택 제공\n\n" +
		            "4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보관하며, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 파기합니다.\n\n" +
		            "사용자는 개인정보 제공에 대한 동의를 거부할 수 있으며, 동의 거부 시 마켓 상품 구매가 제한됩니다. 그밖의 내용은 회사의 이용약관 및 개인정보처리방침에 따릅니다.");
		    });
		});
	</script>
</head>
<body>
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
	<div id="app-body" class="center">
		<div id="app-container" class="center">
			<div id="app-container-inner" class="center">
   				<div id="app-header" class="center">
    				<h1>예약하기</h1>
   				</div>
   				<div id="reserve-notice" class="center border_radius">
   					<div>
   						<span style="width:20px; height:20px;">
   							<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" ;>
	   							<path d="M21.25 12C21.25 17.1086 17.1086 21.25 12 21.25C6.89137 21.25 2.75 17.1086 2.75 12C2.75 6.89137 6.89137 2.75 12 2.75C17.1086 2.75 21.25 6.89137 21.25 12ZM12.8628 10.2729C13.3926 9.97204 13.75 9.40276 13.75 8.75C13.75 7.7835 12.9665 7 12 7C11.0335 7 10.25 7.7835 10.25 8.75C10.25 9.40276 10.6074 9.97204 11.1372 10.2729C10.7518 10.5443 10.5 10.9928 10.5 11.5V16C10.5 16.8284 11.1716 17.5 12 17.5C12.8284 17.5 13.5 16.8284 13.5 16V11.5C13.5 10.9928 13.2482 10.5443 12.8628 10.2729Z" fill="rgb(80, 128, 250)" stroke="grey" stroke-width="1.5"></path>
   							</svg>
						</span>
						<span id="notice-content">
							결제금액은 서비스 완료 후 고수에게 전달됩니다
						</span>
					</div>
   				</div>
	   			<div id="product-summary" class="center">
   					<div id="product-summary-container" class="center">
   						<div id="summary-title-box">
   							<h3>예약 상품</h3>
   						</div>
   						<ul>
	   						<li>
	   							<span>상품명</span>
	   							<p id="marketTitle"><%=title %></p>
	   						</li>
	   						<li>
	   							<span>상품 옵션</span>
	   							<p id="marketOption"><%=optionTitle %></p>
	   						</li>
	   						<li>
	   							<span>상품 가격</span>
	   							<p id="marketPrice"><%=optionPrice %></p>
	   						</li>
   						</ul>
   					</div>
   				</div>
	   			<div id="product-reservation" class="center">
   					<div class="center">
   						<div id="reservation-title-box" class="center">
   							<h3>일정 정보</h3>
   							<p>예약 일시는 서비스 진행 당일입니다</p>
   						</div>
   						<table id="reservation-table">
   							<tr id="tr-row1">
   								<th>예약 날짜</th>
   								<td id="reserveDate"><%=year %>년 <%=month %>월 <%=day %>일 (<%=dayWeek %>)</td>
   							</tr>
	   						<tr id="tr-row2">
   								<th>예약 시간</th>
   								<td id="reserveTime"><%=time %></td>
   							</tr>   						
   						</table>
	   				</div>
   				</div>
	   			<div id="payment-methods" class="center">
   					<h3>결제 수단</h3>
   					<div id="payment-methods-list" class="center">
   						<div id="payment-control">
   							<input type="radio" checked>
   							<span>Kakao Pay 카카오페이</span>
   						</div>
   					</div>
   				</div>
	   			<div id="amount" class="center">
   					<h3>결제 금액</h3>
   					<table id="amount-table">
   						<tr id="amount-tr-row1">
   							<th>서비스 금액</th>
   							<td>
   								<p><%=optionPrice %></p>
   							</td>
   						</tr>
   						<tr id="amount-tr-row2">
   							<th>최종 결제금액</th>
   							<td>
   								<p><%=optionPrice %></p>
   							</td>
   						</tr>
   					</table>
   					<div id="refund-policy" class="center">
   						<strong>💰 취소/환불은 어떻게 진행되나요?</strong>
   						<p class="policy-highlight">결제 직후 3시간 이내로 취소 시 전액 환불처리됩니다.</p>
   						<p class="policy-normal">결제 직후 3시간 이후엔 주문취소가 불가하며 고수님과 환불을 위한 별도의 협의가 필요합니다.</p>
   						<p class="policy-normal">주문취소는 구매내역에서 가능하며, 고수가 서비스를 취소한 경우 고객님의 결제금액이 전액 환불됩니다.</p>
   					</div>
   				</div>
	   			<div id="terms" class="center">
   					<h3>이용동의</h3>
   					<div id="payment-terms" class="center">
   						<ul>
   							<li>
   								<div>
   									<label>
   										<input type="checkbox" id="chkBox1"/>
   										<p>개인정보 수집 및 이용 동의(필수)</p>
   									</label>
   								</div>
   								<button type="button" class="informationPrivacy">보기</button>
   							</li>
   							<li>
   								<div>
   									<label>
   										<input type="checkbox" id="chkBox2"/>
   										<p>제 3자 정보 공유 동의(필수)</p>
   									</label>
   								</div>
   								<button type="button" class="informationThird ">보기</button>
   							</li>
   						</ul>
   					</div>
   					<div id="phone-number-notice" class="center">
   						<p>결제 후 실제 고객님의 휴대전화번호 대신 안심번호가 고수님에게 제공됩니다.</p>
   					</div>
   				</div>
	   			<div id="pay-button" class="center">
   					<button class="pay-button">결제하기</button>
   				</div>
	   		</div>
   		</div>
	</div>
    <!--하단 고정 내용들-->
	<div id = "under-box" class = "center">
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
				<span class ="under-2-2-text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span>
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
	</div>
</body>
</html>