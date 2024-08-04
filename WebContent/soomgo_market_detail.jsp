<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.MarketProductDetailScheduleDTO"%>
<%@page import="dto.MarketProductDetailAskRefundDTO"%>
<%@page import="dto.MarketProductQnaAnswerDTO"%>
<%@page import="dto.MarketProductQnaDTO"%>
<%@page import="dto.MarketProductAskDTO"%>
<%@page import="dto.MarketGosuReviewDTO"%>
<%@page import="dto.MarketGosuInfoDTO"%>
<%@page import="dao.MarketGosuInfoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.MarketOptionDTO"%>
<%@page import="dao.MarketOptionDAO"%>
<%@page import="dto.MarketProductDetatilimgDTO"%>
<%@page import="dto.MarketProductDetailDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MarketProductDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%! 
	    public String contact(String input) {
			if(input.equals("1")){
				return "대면";
			}else{
				return "비대면";		
			}
	    }
	    
	    public String m3(int price) {
			DecimalFormat decFormat = new DecimalFormat("###,###");
			return decFormat.format(price);
		}
	    
	    public String identity(String input){
	    	if(input.equals("1")){
				return "본인 인증 완료";
			}else{
				return "";		
			}
	    }
	    
	    public String qnaType(String input) {
	    		if(input.equals("1")){
	    			return "상품";
	    		} else if(input.equals("2")) {
	    			return "취소/환불";
	    		} else {
	    			return "기타";
	    		}
	    }
	    
	    public String answer(String input) {
	    	if(input.equals("0")){
	    		return "답변대기";
	    	} else {
	    		return "답변완료";
	    	}
	    }
	    
    %>
    <%
		//영현이 헤더 jquery
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
    	int marketIdx = Integer.parseInt(request.getParameter("market_idx"));
    	String marketTitle = request.getParameter("market_title");
    	
    	MarketProductDetailDAO mpddao = new MarketProductDetailDAO();
    	
    	//온라인진행, 대면/비대면, 서비스지역, 상세 설명
    	ArrayList<MarketProductDetailDTO> mpd = mpddao.mpdlist(marketIdx);
    	
    	//상세이미지
    	ArrayList<MarketProductDetatilimgDTO> mpdimg = mpddao.mpdimglist(marketIdx);
    	
    	ArrayList<MarketOptionDTO> mop = mpddao.molist(marketIdx);
    	
    	ArrayList<MarketProductAskDTO> marketask = mpddao.getMarketAsk(marketIdx);
    	
    	ArrayList<MarketProductQnaDTO> mpq = mpddao.getMarketQna(marketIdx);
    	
    	ArrayList<MarketProductQnaAnswerDTO> mpqa = new ArrayList<MarketProductQnaAnswerDTO>();
    	
    	ArrayList<MarketProductDetailAskRefundDTO> mpdar = new ArrayList<MarketProductDetailAskRefundDTO>();
    	
    	
    	ArrayList<MarketProductDetailScheduleDTO> mpds = new ArrayList<MarketProductDetailScheduleDTO>();
    	
    	Calendar cal = Calendar.getInstance();
    	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    	String todayDayOfWeek = "";
    	switch(dayOfWeek) {
    		case 1:
    			todayDayOfWeek = "일";
    			break;
    		case 2:
    			todayDayOfWeek = "월";
    			break;
    		case 3:
    			todayDayOfWeek = "화";
    			break;
    		case 4:
    			todayDayOfWeek = "수";
    			break;
    		case 5:
    			todayDayOfWeek = "목";
    			break;
    		case 6:
    			todayDayOfWeek = "금";
    			break;
    		case 7:
    			todayDayOfWeek = "토";
    			break;
    	}
    	
    	
    	MarketGosuInfoDAO mgidao = new MarketGosuInfoDAO();
    	ArrayList<MarketGosuInfoDTO> gosuinfo = mgidao.gosuinfo(marketIdx);
    	
    	ArrayList<MarketGosuReviewDTO> gosureview = new ArrayList<MarketGosuReviewDTO>();
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 마켓 상품 상세페이지 -승현</title>
<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/soomgo_market_list.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
// 	border-top-left-radius: 8px;
// 	border-top-right-radius: 8px;
	
		$(function () {
			$(".options-wrapper").hide();
			$(".icon-checked").hide();
			
			$("#product-reserve-option > button").click(function () {
				$(".options-wrapper").toggle();	
				 if($(this).hasClass("open") == true){
					$(this).removeClass("open");
				 } else {
					$(this).addClass("open");
				 }
			});
			
			$(".item").click(function () {
				$(".icon-checked").hide();
				$(this).find(".icon-checked").show();
				
				let item = $(this).find(".label").text();
				$("#product-reserve-option").find("button").text(item);
				$(".options-wrapper").hide();
				if($("#product-reserve-option > button").hasClass("open") == true){
					$("#product-reserve-option > button").removeClass("open");
				 } else {
					$("#product-reserve-option > button").addClass("open");
				 }
			})
			
			$(".reserveDate").click(function () {
				if($(".reserveDate").hasClass("active") == true){
					$(".reserveDate").removeClass("active");
				}
				
				$(this).addClass("active");
			})
			
			$(document).on("click",".reserve-time", function () {
				if($(".reserve-time").hasClass("active") == true){
					$(".reserve-time").removeClass("active");
					$(".reserve-time").css("color","rgb(115, 115, 115)");
				}
				
				$(this).addClass("active");
				$(this).css("color","rgb(255, 255, 255)");
				
				let dayweek = $(this).parent().find(".date-text").text();
			})
			
			let idetity = $(".identity").text();
			if(idetity.length >= 1){
				$(".gosuidentity").show();
			} else if(idetity.length < 1){
				$(".gosuidentity").hide();
			}
			
			$("#product-reserve-option > button > p").text($(".options> li:nth-child(1) > label").text());
			
			$("#detail-menu > ul > li").click(function () {
				if($("#detail-menu > ul > li").hasClass("active") == true){
					$("#detail-menu > ul > li").removeClass("active");
				}
				
				$(this).addClass("active");
			})
			
			$(".qna-content").hide();
			$(".summary").click(function () {
				$(this).next(".qna-content").slideToggle();
				$(this).find(".arrow").toggleClass("reverse");
				if($(".arrow").hasClass("reverse")){
					$(".arrow").attr("src","data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMjBoMjBWMEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNi4wMzggNy41MDItNiA2LTYtNiIvPgogICAgPC9nPgo8L3N2Zz4K");
				} else {
					$(".arrow").attr("src","data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMjBoMjBWMEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNi4wMzggNy41MDItNiA2LTYtNiIvPgogICAgPC9nPgo8L3N2Zz4K");
				}
			})
			
			let now = new Date();
			
			
			let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
			// 윤년 계산
			if (now.getFullYear() % 400 == 0) {
				monthDays[1] = 29;
			} else if (now.getFullYear() % 100 == 0) {
				monthDays[1] = 28;
			} else if (now.getFullYear() % 4 == 0) {
				monthDays[1] = 29;
			}
			
			let nextMonthDay = 1;
			$(".reserveDate").each(function (index, item) {
				let date = now.getDate()+index;
				if(date > monthDays[now.getMonth()]){
					$(this).text(nextMonthDay);
					nextMonthDay++;
				} else {
					let date = now.getDate()+index;
					$(this).text(date);
				}
				// now.getMonth() + 1; 현재 월
				console.log(monthDays[now.getMonth()]);
			})
			
				let day = now.getDay();
			$(".date-text").each(function (index, item) {
				if(day > 6){
					day = 0;
				}
				switch(day){
					case 0 :
						$(this).text("일");
						day++;
					break;
					
					case 1 :
						$(this).text("월");
						day++;
					break;

					case 2 :
						$(this).text("화");
						day++;
					break;

					case 3 :
						$(this).text("수");
						day++;
					break;

					case 4 :
						$(this).text("목");
						day++;
					break;

					case 5 :
						$(this).text("금");
						day++;
					break;

					case 6 :
						$(this).text("토");
						day++;
					break;
				}
				
			})
			
			$(".reserveDate").click(function () {
				let dayWeek = $(this).closest("li").find(".date-text").text();
				let marketIdx = <%=marketIdx%>;
				$.ajax({
					type: "post",
					data: {dayWeek: dayWeek, marketIdx: marketIdx},
					url: "AjaxSoomgoMarketDetailScheduleServlet",
					success: function (res) {
						$("#product-reserve-time-item").html("");
						for(let i = 0; i <= res.length-1; i++){
							
							let str = "<li>" +
										"<label><span class=\"reserve-time\">" + res[i].stTime + "</span></label>" +
									"</li>";
									console.log(str);
							$("#product-reserve-time-item").append(str);
						}
					},
					error: function (r, s, e) {
						alert("[에러] code:" + r.status + ", message:" + r.responseText + ", error:"+e)
					}
				});
			})
			
			$(".control-btn").hide();
			$("#product-reserve-date > div").hover(function () {
				$(".control-btn").show();
			}, function () {
				$(".control-btn").hide();
			})
			
			$(".modal_btn, #soomgo-guarantee-banner, #inquiry-btn").click(function () {
				swal("준비중입니다.");
			})
			
			let year = now.getFullYear();
			let month = now.getMonth()+1;
			let nextMonth = now.getMonth();
			
			$("#reserve-btn").click(function () {
				// 상품명, 상품옵션, 옵션가격, 예약날짜, 예약시간
				let title = $("#product-controller > #product-title > h3").text();	// 상품명
				let option = $("#product-reserve-option > button").text();	// 옵션명, 옵션 가격
				let index = $("#product-reserve-option > button").text().indexOf("("); // "(" index
				let optionTitle = option.substr(0,index);	// 옵션 명
				let optionPrice = option.substr(index).replaceAll("(","").replaceAll(")","");	// 옵션 가격
				let day = $(".reserveDate.active").text();	// 예약 일
				let dayWeek = $(".reserveDate.active").parent().parent().find(".date-text").text();	// 요일
				let time = $(".reserve-time.active").text();	// 시간
				console.log("상품명 : " + title);
				console.log("옵션명 : " + optionTitle);
				console.log("옵션가격 " + optionPrice);
				console.log("예약시간 " + time);
				console.log("예약날짜 " + year +"년 " + (now.getMonth()+1) + "월 " + day + " " + dayWeek);
				location.href = "SoomgoMarketReserveServlet?title=" + title + "&optionTitle=" + optionTitle + "&optionPrice=" + optionPrice 
						+"&year=" + year + "&month=" + month +"&day=" + day + "&dayWeek=" + dayWeek + "&time=" + time;
			})
		})
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
		<div id="app-body2" class="center">
			<div id="main-page" class="center">
				<div id="product-detail">
				<%
					for(MarketProductDetailDTO dto : mpd) {
				%>
					<div id="product-img">
						<img src="<%=dto.getImg_url() %>" width="600px" height="400px">
					</div>
				<%
					}
				%>
					<div id="detail-menu">
						<ul>
							<li class="active">상세 설명</li>
							<li>가격</li>
							<li>고수 정보</li>
							<li>질문답변</li>
							<li>문의</li>
							<li>취소/환불</li>
						</ul>
					</div>
					<div id="product-detail-info">
						<h4>상세 설명</h4>
						<div id="detail-explanation">
							<div>
								<%
									for(MarketProductDetailDTO dto : mpd) {
								%>
								<div>
									<span>작업방식</span><span><%=contact(dto.getContact())%></span>
								</div>
								<div>
									<span>서비스 지역</span><span><%=dto.getTownName() %></span>
								</div>
								<div>
									<span>찾아오는 길</span><span>서울시 <%=dto.getTownName() %> 찾아오는길 DB에 없나..?</span>
								</div>
								<div id="detail-map">
									<h1>지도 API 넣어줘 영현아..</h1>
								</div>
								<div id="product-description">
									<p class="description"><%=dto.getContents() %></p>
								</div>
								<%
									}
								%>
								<div id="detail-img">
									<%
										for(MarketProductDetatilimgDTO imgdto : mpdimg) {
									%>
									<img src="<%=imgdto.getImgUrl() %>">
									<%
										}
									%>
								</div>
								<div id="product-pricd">
									<h4>가격</h4>
									<ul>
									<%
										for(MarketOptionDTO option : mop){
									%>
										<li>
											<div>
												<button type="button">
													<span><%=option.getOptionName() %></span>
													<b><%=m3(option.getOptionPrice()) %>원</b>
												</button>
											 </div>
										</li>
									<%
										}
									%>	
									</ul>
								</div>
								<%
									for(MarketGosuInfoDTO info : gosuinfo){
								%>
								<div id="product-profile">
									<h4>고수 정보</h4>
									<div id="product-provider">
										<div id="provider-overview">
											<div id="provider-info">
												<img src=<%=info.getGosuFimg() %>>
												<div>
													<div id="provider-name">
													<%=info.getGosuName() %>
													<span>
														<img src="img/provider-name-arrow.png">
													</span>
													</div>
													<div id="provider-review">
														<span>
															<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
	   															 <path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
															</svg>
														</span>
														<span>5</span>
														<span>(3)</span>
													</div>
												</div>
											</div>
											<div id="share-button">
												<img src="img/provider-share.png" width="16px" height="19px">
											</div>
										</div>
										<div id="row-additional">
											<div class="gosuidentity">
												<span>
													<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path d="M16.013 10.3597C16.3151 10.0764 16.3305 9.60173 16.0472 9.29955C15.7639 8.99736 15.2892 8.98205 14.987 9.26535L10.8333 13.1595L9.01296 11.4528C8.71077 11.1696 8.23615 11.1849 7.95285 11.487C7.66955 11.7892 7.68486 12.2639 7.98705 12.5472L10.3204 14.7347C10.6089 15.0051 11.0578 15.0051 11.3463 14.7347L16.013 10.3597Z" fill="black"></path>
														<path fill-rule="evenodd" clip-rule="evenodd" d="M3.5 7.08847C3.5 6.06936 4.26629 5.21322 5.27916 5.10069L6.01834 5.01857C7.11472 4.89676 8.15631 4.47506 9.02861 3.7998L10.7597 2.45975C11.4879 1.89601 12.507 1.90244 13.2281 2.47532L14.8349 3.75191C15.7233 4.4577 16.7935 4.89713 17.9215 5.01924L18.7152 5.10516C19.7306 5.21506 20.5 6.07228 20.5 7.09354V12.6872C20.5 15.4171 19.108 17.9585 16.8076 19.4284L13.0769 21.8123C12.4203 22.2319 11.5797 22.2319 10.9231 21.8123L7.19241 19.4284C4.89204 17.9585 3.5 15.4171 3.5 12.6872V7.08847ZM19 7.09354V12.6872C19 14.9052 17.869 16.9701 15.9999 18.1644L12.2692 20.5483C12.1051 20.6532 11.8949 20.6532 11.7308 20.5483L8.00008 18.1644C6.13103 16.9701 5 14.9052 5 12.6872V7.08847C5 6.83369 5.19157 6.61965 5.44479 6.59152L6.18397 6.5094C7.55445 6.35714 8.85642 5.83001 9.94681 4.98593L11.6779 3.64588C11.86 3.50495 12.1147 3.50655 12.295 3.64977L13.9018 4.92637C15.0123 5.8086 16.3501 6.35789 17.7601 6.51053L18.5538 6.59644C18.8076 6.62392 19 6.83823 19 7.09354Z" fill="black"></path>
													</svg>
												</span>
												<span class="identity"><%=identity(info.getGosuReal()) %></span>
											</div>
											<div>
												<span>
													<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path fill-rule="evenodd" clip-rule="evenodd" d="M8.25002 5.99993C8.25469 4.55669 9.26882 3.31283 10.6826 3.01829L10.8306 2.98746C11.6019 2.82677 12.3981 2.82677 13.1694 2.98746L13.3174 3.01829C14.7312 3.31283 15.7453 4.55669 15.75 5.99993H20C21.1046 5.99993 22 6.89536 22 7.99993V17.9999C22 19.1045 21.1046 19.9999 20 19.9999H4C2.89543 19.9999 2 19.1045 2 17.9999V7.99993C2 6.89536 2.89543 5.99993 4 5.99993H8.25002ZM9.75003 5.99993C9.75469 5.26721 10.2703 4.63639 10.9886 4.48676L11.1365 4.45593C11.7061 4.33728 12.2939 4.33728 12.8635 4.45593L13.0114 4.48676C13.7297 4.63639 14.2453 5.26721 14.25 5.99993H9.75003ZM20 7.49993H4C3.72386 7.49993 3.5 7.72379 3.5 7.99993V11.9999H7.7002V11.7499C7.7002 11.3357 8.03598 10.9999 8.4502 10.9999C8.86441 10.9999 9.2002 11.3357 9.2002 11.7499V11.9999H14.7002V11.7499C14.7002 11.3357 15.036 10.9999 15.4502 10.9999C15.8644 10.9999 16.2002 11.3357 16.2002 11.7499V11.9999H20.5V7.99993C20.5 7.72379 20.2761 7.49993 20 7.49993ZM14.7002 13.4999V14.2499C14.7002 14.6641 15.036 14.9999 15.4502 14.9999C15.8644 14.9999 16.2002 14.6641 16.2002 14.2499V13.4999H20.5V17.9999C20.5 18.2761 20.2761 18.4999 20 18.4999H4C3.72386 18.4999 3.5 18.2761 3.5 17.9999V13.4999H7.7002V14.2499C7.7002 14.6641 8.03598 14.9999 8.4502 14.9999C8.86441 14.9999 9.2002 14.6641 9.2002 14.2499V13.4999H14.7002Z" fill="black"></path>
													</svg>
												</span>
												<span>총 경력 <%=info.getGosuCareer() %>년</span>
											</div>
										</div>
										<div id="profile-review">
										<% gosureview = mgidao.gosuReview(info.getGosu_idx()); %>
										<%
											for(MarketGosuReviewDTO mgrdto : gosureview){
										%>
											<div id="review1" class="fl">
												<div id="review1-score">
													<ul>
													<%for(int i=0; i<mgrdto.getScore(); i++){ %>
														<li>
															<img src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg" class="review1-star-icon">
														</li>
													<%} %>
													</ul>
													<%=mgrdto.getScore() %>.0
												</div>
												<div id="review1-content">
													<div>
														<p>
															<%=mgrdto.getContent() %>
														</p>
														<div>
															<%=mgrdto.getWriter() %> 고객님의 후기
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
										</div>
									</div>
								</div>
								<%
									}
								%>
								<div id="product-questions">
									<h4>질문 답변</h4>
									<div id="questions1">
										<ul>
										<%
											for(MarketProductAskDTO mpa : marketask){
										%>
											<li>
												<p>Q. <%=mpa.getQuestion() %></p>
												<p><%=mpa.getAnswer() %></p>
											</li>
										<%
											}
										%>
										</ul>
									</div>
								</div>
								<div id="product-qna">
									<h4>문의</h4>
<!-- 									<p>상품에 대해 궁금한 점을 문의해 보세요.</p> -->
									<div class="product-qna-list">
										<div class="product-qna-list-header"></div>
										<div class="product-qna-list-content">
											<section class="qna-list-provider">
												<div class="qna-list-wrap">
												<%
													for( MarketProductQnaDTO dto : mpq ){
														
												%>
													<article class="market-qna-item">
														<section class="summary">
															<div class="qna-head">
																<span class="qna-head-badge <%=(answer(dto.getAnswer_cnt()).equals("답변완료") ? "success" : "")%>"><%=answer(dto.getAnswer_cnt())%></span>
																<img class="arrow" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMjBoMjBWMEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNi4wMzggNy41MDItNiA2LTYtNiIvPgogICAgPC9nPgo8L3N2Zz4K">
															</div>
															<div style="height: 32px;">
																<p class="qna-title">[ <%=qnaType(dto.getType()) %> ] <%=dto.getQuestion() %></p>
															</div>
															<div class="author">
																<p class="author-name"><%=dto.getName() %></p>
																<p class="author-divider"></p>
																<p class="created-at"><%=dto.getQna_date() %></p>
															</div>
														</section>
														<section class="qna-content">
															<section class="qna-text-content">
																<p class="qna-text"><%=dto.getQuestion() %></p>
															</section>
															<% mpqa = mpddao.getMarketQnaAnswer(dto.getQnaIdx()); %>
															<% for(MarketProductQnaAnswerDTO answer : mpqa) {%>
															<section class="qna-text-content-answer">
																<div class="author">
																	<p class="author-name"><%=answer.getGosuname()%></p>
																	<p class="author-divider"></p>
																	<p class="created-at"><%=answer.getAnswer_date()%></p>
																</div>
																<p class="qna-text-answer"><%=answer.getAnswer_content()%></p>
															</section>
															<%} %>
														</section>
													</article>
												<%
													}
												%>
												</div>
											</section>
										</div>
									</div>
								</div>
								<div id="product-refund">
									<h4>취소 및 환불 규정</h4>
									<%mpdar = mpddao.getMarketAskRefund(marketIdx); %>
									<%
										for(MarketProductDetailAskRefundDTO dto : mpdar) {
									%>
									<div>
										<%=dto.getAskRefund() %>
									</div>
									
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="product-detail-right">  
					<div id="product-controller" class="sticky">
						<div id="product-category">
							<ol>
								<li>
									<a href="https://soomgo.com/market/%EC%B7%A8%EB%AF%B8-%EC%9E%90%EA%B8%B0%EA%B3%84%EB%B0%9CA">취미/자기계발</a>
								</li>
								<li>
									<a></a>
									<a href="https://soomgo.com/market/%EC%B7%A8%EB%AF%B8-%EC%9E%90%EA%B8%B0%EA%B3%84%EB%B0%9CA/%ED%94%BC%ED%8A%B8%EB%8B%88%EC%8A%A4A">피트니스</a>
								</li>
							</ol>
						</div>
						<div id="product-title">
							<h3><%=marketTitle %></h3>
						</div>
						<div id="product-reserve">
							<div id="product-reserve-option">
								<button type="button"><p></p>
									<i>
										<svg data-v-398e8b16="" data-v-3548bde4="" width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="prisma-icon black"><path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="black"></path></svg>
									</i>
								</button>
								<div class="options-wrapper">
									<ul class="options">
										<%
										for(MarketOptionDTO option : mop){
										%>
										<li class="item">
											<input class="radio" type="radio">
											<label class="label"><%=option.getOptionName() %> (<%=m3(option.getOptionPrice()) %>원)</label>
											<i class="icon-checked"><svg data-v-eec0a5dc="" data-v-3548bde4="" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="color-teal prisma-icon primary" category="toggle"><path fill-rule="evenodd" clip-rule="evenodd" d="M20.0811 6.45171C20.3839 6.73434 20.4003 7.20893 20.1176 7.51174L10.7843 17.5117C10.6425 17.6637 10.4439 17.75 10.236 17.75C10.0281 17.75 9.82956 17.6637 9.68771 17.5117L5.02105 12.5117C4.73842 12.2089 4.75479 11.7343 5.0576 11.4517C5.36041 11.1691 5.835 11.1855 6.11763 11.4883L10.236 15.9008L19.021 6.48826C19.3037 6.18545 19.7783 6.16909 20.0811 6.45171Z" fill="rgb(0, 199, 174)"></path></svg></i>
										</li>
										<%
										}
										%>
									</ul>
								</div>
							</div>
							<div id="product-reserve-date">
								<div>
									<ul>
										<li>
											<p class="date-text" style="color: rgb(0, 199, 174);"></p>
											<label>
												<span class="reserveDate active"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
										<li>
											<p class="date-text"></p>
											<label>
												<span class="reserveDate"></span>
											</label>
										</li>
									</ul>
									<button type="button" class="control-btn prev">
										<i class="icon">
											<svg data-v-eec0a5dc="" data-v-23528234="" width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="sg-gray-500 prisma-icon primary" category="navigation"><path fill-rule="evenodd" clip-rule="evenodd" d="M5.45997 11.9203C5.46087 11.7052 5.55415 11.5008 5.71607 11.3591L15.914 2.43559C16.2257 2.16282 16.6996 2.1944 16.9723 2.50612C17.2451 2.81785 17.2135 3.29167 16.9018 3.56443L7.34342 11.9283L16.9065 20.4398C17.2159 20.7152 17.2435 21.1892 16.9681 21.4986C16.6927 21.8081 16.2187 21.8356 15.9093 21.5602L5.71133 12.4837C5.55061 12.3407 5.45906 12.1355 5.45997 11.9203Z" fill="black"></path></svg>
										</i>
									</button>
									<button type="button" class="control-btn next">
										<i class="icon">
											<svg data-v-eec0a5dc="" data-v-23528234="" width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="sg-gray-500 prisma-icon primary" category="navigation"><path fill-rule="evenodd" clip-rule="evenodd" d="M17.8491 11.9203C17.8482 11.7052 17.7549 11.5008 17.593 11.3591L7.39508 2.43559C7.08336 2.16282 6.60954 2.1944 6.33677 2.50612C6.064 2.81785 6.09558 3.29167 6.40731 3.56443L15.9657 11.9283L6.40257 20.4398C6.09315 20.7152 6.06557 21.1892 6.34096 21.4986C6.61634 21.8081 7.09042 21.8356 7.39983 21.5602L17.5978 12.4837C17.7585 12.3407 17.85 12.1355 17.8491 11.9203Z" fill="black"></path></svg>
										</i>
									</button>
								</div>
							</div>
							<div id="product-reserve-time">
								<div>
									<ul id="product-reserve-time-item">
										<% mpds = mpddao.getMarketSchedule(marketIdx, todayDayOfWeek);%>
										<% for(MarketProductDetailScheduleDTO mpdsList : mpds){ %>
										<li>
											<label><span class="reserve-time"><%=mpdsList.getStTime() %></span></label>
										</li>
										<%} %>
									</ul>
								</div>
								<button type="button" class="modal_btn">예약가능 날짜 더보기</button>
							</div>
						</div>
						<div id="buy-button-group">
							<button type="button" id="inquiry-btn">
								<span>문의</span>
							</button>
							<button type="button" id="reserve-btn">
								<span>예약하기</span>
							</button>
						</div>
						<div id="soomgo-guarantee-banner">
							<img src="img/guarantee-banner.svg">
							<div>
								<strong>
									안심하세요 숨고가 보상해드려요!
								</strong>
								<p>
									최대 1,000만 원 까지 보상
								</p>
							</div>
						</div>
					</div>
				</div>
				<div id="recent-view-item">
					<h4>
						최근 본 상품 👀
					</h4>
					<div>
						<div>
							<div id="recently-viewed-products">
								<div id="viewed-product">
									<div id="product-img" class="box">
										<img src="https://static.cdn.soomgo.com/upload/market/d3cdb60c-4b76-4125-95ce-6ece7f2263e5.jpg?w=480&webp=1">
									</div>
									<div id="product-title">
										<h3>왕초보 악필도 OK! 취미/자격증/전시 선택 1대1 개인지도 캘리그라피/피오피 통합과정</h3>
									</div>
									<div id="product-price">
										<strong>35,000원 ~ </strong>
									</div>
									<div id="product-review">
										<span>
											<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
											</svg>
										</span>
										<span>1.1</span>
										<span>(11)</span>
									</div>
								</div>
							</div>
							<div id="recently-viewed-products">
								<div id="viewed-product">
									<div id="product-img" class="box">
										<img src="https://static.cdn.soomgo.com/upload/unknown/ea698dd0-6867-48ee-becc-c6c36ea0da2d.jpg?w=480&webp=1">
									</div>
									<div id="product-title">
										<h3>직접 만들어보는 카페 디저트! 자격증 보유, 운영 중인 카페에서 수업</h3>
									</div>
									<div id="product-price">
										<strong>10,000원 ~ </strong>
									</div>
									<div id="product-review">
										<span>
											<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
											</svg>
										</span>
										<span>2.2</span>
										<span>(22)</span>
									</div>
								</div>
							</div>
							<div id="recently-viewed-products">
								<div id="viewed-product">
									<div id="product-img" class="box">
										<img src="https://static.cdn.soomgo.com/upload/unknown/efd2dade-8b0b-4f4d-b0a8-3e7a34aa506b.jpg?w=480&webp=1">
									</div>
									<div id="product-title">
										<h3>양손을 사용하는 신개념 배드민턴으로 두뇌집중력과 활성화 신체균형운동으로 어디에서나 운동가능</h3>
									</div>
									<div id="product-price">
										<strong>50,000원 ~ </strong>
									</div>
									<div id="product-review">
										<span>
											<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
											</svg>
										</span>
										<span>3.3</span>
										<span>(33)</span>
									</div>
								</div>
							</div>
							<div id="recently-viewed-products">
								<div id="viewed-product">
									<div id="product-img" class="box">
										<img src="https://static.cdn.soomgo.com/upload/market/9f5011dc-676a-4595-9e9b-5f1024055cfe.jpeg?w=480&webp=1">
									</div>
									<div id="product-title">
										<h3>꾸머드론 | 드론 촬영의 처음과 끝</h3>
									</div>
									<div id="product-price">
										<strong>200,000원 ~ </strong>
									</div>
									<div id="product-review">
										<span>
											<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
											</svg>
										</span>
										<span>4.4</span>
										<span>(44)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
				<span class ="under-2-2-text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 <br/>의무와 책임은 거래당사자에게 있습니다.</span>
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
	<div style ="clear:both;"></div>
</body>
</html>