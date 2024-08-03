<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Search_profile_2Dto"%>
<%@page import="dao.Search_profile_2Dao"%>
<%@page import="dto.Search_profile_1Dto"%>
<%@page import="dao.Search_profile_1Dao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNum = 1;
	try{
		pageNum = Integer.parseInt(request.getParameter("page"));
	}catch(Exception e){
	
	}
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

	// Dao 객체 생성 및 메소드 호출
	Search_profile_1Dao sp1Dao = new Search_profile_1Dao();
	ArrayList<Search_profile_1Dto> SearchProfile1 = sp1Dao.getSeachprofile();

	Search_profile_2Dao sp2Dao = new Search_profile_2Dao();
	ArrayList<Search_profile_2Dto> SearchProfile2 = sp2Dao.getSeachprofile();

	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화

	HttpSession hs = request.getSession();
	
	 // 세션에서 users_idx를 가져옴, 존재하지 않으면 기본값 0 설정
    //users_idx = 9999;
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
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내 주변 고수찾기, 현재 10,000명 활동중 - 숨고, 숨은고수</title>
  <link rel="icon" href="./img/favicon_logo.ico">
  <link rel="stylesheet" href="./css/Search.profile.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>  
  
  <script>
  $(function() {
	    let page_num = 1; // 초기 페이지 번호
	    let isLoading = false; // 데이터 로딩 중 여부
	    let isLastPage = false; // 마지막 페이지 여부
	    let scrollTimeout;
	    $(".gosu-profile-outter3").empty();

	    const container = $(".gosu-profile-outter3"); // 데이터를 추가할 컨테이너

	    // 데이터 로드 함수
	    function draw_Search_profile_list(page_num) {
	        if (isLoading || isLastPage) return; // 이미 로딩 중이거나 마지막 페이지인 경우 return

	        isLoading = true; // 로딩 시작

	        $.ajax({
	            type: 'get',
	            data: { page_num: page_num },
	            dataType: "json",
	            url: "SearchProfileServlet",
	            success: function(res) {
	                console.log(res);

	                // 응답 데이터가 비어 있는지 확인
	                if (res.length === 0) {
	                    isLastPage = true; // 데이터가 없으므로 마지막 페이지로 설정
	                    return;
	                }

	                // 응답 받은 데이터를 HTML로 변환하여 추가
	                for (let i = 0; i < res.length; i++) {
	                    let profile = res[i];
	                    let str = '<div class="gosu-profile-outter1" idx = '+ profile.users_idx +'>';
	                    str += '<div id="gosu-profile-name-outter1" class="center">';
	                    str += '<h5 class="profile-title1">' + profile.name + '</h5>';
	                    str += '</div>';
	                    str += '<div id="gosu-profile-second-outter1" class="center">';
	                    str += '<div id="gosu-profile-secont-2" class="center">';
	                    str += '<span>';
	                    str += '<svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">';
	                    str += '<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>';
	                    str += '</svg></span>';
	                    str += '<span class="profile-review1">' + profile.score + '.0</span>';
	                    str += '<span class="profile-text1">(' + profile.c_review + ') ·</span>';
	                    str += '</div>';
	                    str += '<span class="profile-text2">' + profile.c_transaction + '회 고용 ·</span>';
	                    str += '<span class="profile-text2">경력 ' + profile.career + '년</span>';
	                    str += '</div>';
	                    str += '<div id="profile-img3" class="center" style="background-image: url(' + profile.f_img + ');">';
	                    str += '</div>';
	                    str += '<div id="profile-intro-outter1" class="center">';
	                    str += '<p class="profile-intro1">' + profile.intro + '</p>';
	                    str += '</div>';
	                    str += '</div>';

	                    container.append(str); // 기존 컨테이너에 추가
	                }

	                isLoading = false; // 로딩 완료
	            },
	            error: function(r, s, e) {
	                alert("[에러] code:" + r.status + " , message:" + r.responseText + " , error :" + e);
	                isLoading = false; // 에러 발생 시 로딩 상태 해제
	            }
	        });
	    }

	    // 페이지 로드 시 초기 데이터 로드
	    draw_Search_profile_list(page_num);

	    // 스크롤 이벤트 핸들러
	    $(window).scroll(function() {
	        clearTimeout(scrollTimeout);
	        scrollTimeout = setTimeout(function() {
	            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 10) {
	                if (!isLoading && !isLastPage) {
	                    page_num++; // 페이지 번호 증가
	                    draw_Search_profile_list(page_num); // 다음 페이지 데이터 로드
	                }
	            }
	        }, 200); // 200ms 딜레이를 주어 빠른 스크롤 방지
	    });
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
  
  
	$(document).ready(function(){
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
    
    $(".right-select-button").click(function () {
        $(".option-outter").show();
    });
    
    $(".c-filter").click(function(){
        if($(".c-filter").hasClass("active") ){
        $(".c-filter").removeClass("active");
        }
        $(this).addClass("active");
        let gosuselect = $(".c-filter.active").text();
        $("#c-select").text(gosuselect);

        $(".option-outter").hide();
    });
    $("#c-select").text($(".c-filter.active").text());

    
    $("#right-button1").click(function() {
                if ($(this).hasClass("chk")) {
                    $(this).removeClass("chk");
                    $(this).css({
                        "background-color": "white",
                        "color": "black"
                    });
                    $(this).find("path").css("fill","black");
                } else {
                    $(this).addClass("chk");
                    $(this).css({
                        "background-color": "black",
                        "color": "white"
                    });
                    $(this).find("path").css("fill","white");
                }
            });
            $("#right-button2").click(function() {
                if ($(this).hasClass("chk1")) {
                    $(this).removeClass("chk1");
                    $(this).css({
                        "background-color": "white",
                        "color": "black"
                    });
                    $(this).find("path").css("fill","black");
                } else {
                    $(this).addClass("chk1");
                    $(this).css({
                        "background-color": "black",
                        "color": "white"
                    });
                    $(this).find("path").css("fill","white");
                }
            });
            $(document).on("click", ".gosu-profile-outter1", function(){			
            //$(".gosu-profile-outter1").click(function(){
            	 //let idx = $(this).find(".gosu-profile-outter1").attr("idx");
            	 let idx = $(this).attr("idx");
            	location.href = "Gosu.profile.p.jsp?users_idx=" + idx;
            	//alert(idx);
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
            	 }
             });
            
            
            $(document).ready(function(){
                if(users_idx != 0){
                    $(".gosu-zim-buttom").click(function(){
                        // .header-total1 요소가 표시되어 있는지 확인하고 상태를 세션 스토리지에 저장합니다.
                        if ($(".header-total1").is(":visible")) {
                            sessionStorage.setItem("header-total1-visible", "true");
                        } else {
                            sessionStorage.setItem("header-total1-visible", "false");
                        }
                        location.href = "Gosu.zim.jsp?users_idx=" + users_idx;
                    });
                } else if(users_idx == 0){
                    $(".gosu-zim-buttom").click(function(){
                        location.href = "Login.jsp";
                    });
                }
            });
             
            /* $("#serarch_profile").click(function(){
            	location.href = "Seach.profile.jsp";
            }); */
		});
  </script>
</head>
<body>
	<header class = "header-total">
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
	<div>
	</div>
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
    </header>
    <!--중단 전체 보더 박스-->
    <div id = "app-body" class ="center">
        <div id = "app-body-outter">
            <div id = "desktop-header-title" class = "center">
                <h1 class = "header-title-p">고수찾기</h1>
                <section id = "service-area-outter" class = "center">
                    <div id = "service-outter" class = "center">
                        <button class = "service-button cursor">
                            <div id = "service-button-inner-main" class = "center">
                                <div id = "service-button-inner1" class = "center">
                                    <span style = "font-size : 16px; text-align: left;" >서비스</span>
                                </div>

                                <div id = "service-button-inner2" class = "center">
                                    <span class = "ss" style = "margin-top:2px;"></span>
                                </div>

                            </div>
                        </button>
                     </div>

                     <div id = "area-outter" class = "center">
                        <button class = "area-button cursor">
                            <div id = "area-button-inner-main" class = "center">
                                <div id = "area-button-inner1" class = "center">
                                    <span style = "font-size : 16px; text-align: left;">지역</span>
                                </div>

                                <div id = "area-button-inner2" class = "center">
                                    <span class = "ss" style="margin-top:2px; margin-left:1px;"></span>
                                </div>
                            </div>
                        </button>
                     </div>     
                </section>
            </div>


            <div id = "content">
                <aside id = "content-left-outter">
                    <div id = "content-left-inner">
                        <div id = "content-left-section1-outter">
                            <span class = "content-left-section1-font1">필터</span>
                            <div id = "content-left-section1-inner">
                                <span class= "content-left-section1-font2">초기화</span>
                            </div>
                        </div>
                    </div>
                    <div id = "content-left-under-outter" class = "center">
                        <div id = "content-left-under-inner" class = "center">
                            <h3 class = "left-under-title">서비스 분야를 선택해 주세요.</h3>
                            <p class = "left-under-text">
                            서비스 분야를 선택하면 나에게 딱 맞는
                            <br/>
                            고수를 필터링해 찾아볼 수 있어요!
                            </p>
                        </div>
                    </div>
                </aside>

                <section id = "content-right-outter">
                        <div id = "content-right-top-outter" class = "center">
                            <div id = "content-right-top" class = "center">
                                <div id = "right-button-outter" class = "center">
                                    <div id = "right-button1-outter" class = "center">
                                        <button id = "right-button1">
                                            <div id = "right-button1-img-outter" class = "center">
                                                <svg data-v-eec0a5dc="" data-v-3817a41f="" width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="prisma-icon white" category="contents">
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M8.5 3.75C8.5 3.33579 8.16421 3 7.75 3C7.33579 3 7 3.33579 7 3.75V5H5C3.89543 5 3 5.89543 3 7V19C3 20.1046 3.89543 21 5 21H19C20.1046 21 21 20.1046 21 19V7C21 5.89543 20.1046 5 19 5H17.5V3.75C17.5 3.33579 17.1642 3 16.75 3C16.3358 3 16 3.33579 16 3.75V5H8.5V3.75ZM4.5 12H19.5V19C19.5 19.2761 19.2761 19.5 19 19.5H5C4.72386 19.5 4.5 19.2761 4.5 19V12Z" fill="black"></path>
                                                </svg>
                                            </div>
                                            
                                            <div id = "right-button-text-outter" class = "center">
                                                <p class = "reservation-font">예약</p>
                                            </div>
                                        </button>
                                    </div>
        
                                    <div id = "right-button2-outter" class = "center">
                                        <button id = "right-button2">
                                            <div id = "right-button2-img-outter" class = "center">
                                                <svg data-v-eec0a5dc="" data-v-3817a41f="" width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="prisma-icon primary" category="commerce" svg-color>
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M1.81294 5.5C1.81294 4.5335 2.59644 3.75 3.56294 3.75H20.436C21.4025 3.75 22.186 4.5335 22.186 5.5V7.75L22.1917 7.75V9.25C20.2996 9.25 18.9417 10.5722 18.9417 12C18.9417 13.4278 20.2996 14.75 22.1917 14.75V16.25L22.186 16.25V18.5C22.186 19.4665 21.4025 20.25 20.436 20.25H3.56294C2.59644 20.25 1.81294 19.4665 1.81294 18.5V16.2647L1.80823 16.2647V14.7647C3.70036 14.7647 5.05823 13.4425 5.05823 12.0147C5.05823 10.5868 3.70036 9.26469 1.80823 9.26469V7.76469L1.81294 7.76469V5.5ZM9.65662 10.6488C10.485 10.6488 11.1566 9.97723 11.1566 9.1488C11.1566 8.32038 10.485 7.6488 9.65662 7.6488C8.82819 7.6488 8.15662 8.32038 8.15662 9.1488C8.15662 9.97723 8.82819 10.6488 9.65662 10.6488ZM15.3884 16.3806C16.2168 16.3806 16.8884 15.709 16.8884 14.8806C16.8884 14.0521 16.2168 13.3806 15.3884 13.3806C14.56 13.3806 13.8884 14.0521 13.8884 14.8806C13.8884 15.709 14.56 16.3806 15.3884 16.3806ZM8.85715 15.3119C8.56426 15.0191 8.56426 14.5442 8.85715 14.2513L14.7592 8.34919C15.0521 8.05629 15.527 8.05629 15.8199 8.34919C16.1128 8.64208 16.1128 9.11696 15.8199 9.40985L9.91781 15.3119C9.62492 15.6048 9.15004 15.6048 8.85715 15.3119Z" fill="black"></path>
                                                </svg>
                                            </div>
                                            <div id = "right-button-text-outter" class = "center">
                                                <p class = "reservation-font">쿠폰</p>
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            
                            <div id = "content-right-select-outter" class = "center">
                                <button  type = "button" class = "center right-select-button">
                                    <span id = "c-select"class = "select-font"></span>
                                </button>
        
                            <ul  class = "center option-outter">
                                    <li id = "option-1" class = "c-filter center">숨고페이 이용순</li>
                                    <li id = "option-1" class = "c-filter center active">리뷰 많은 순</li>
                                    <li id = "option-1" class = "c-filter center">최근활동순</li>
                                    <li id = "option-1" class = "c-filter center">평점순</li>
                                    <li id = "option-1" class = "c-filter center">고용순</li>
                            </ul>
                        </div>
                    </div>

                    <div id = "content-right-middle-outter" class = "center">
                        <div id = "content-right-middle-inner" class = "center">
                            <input type = "text" class = "content-right-input" placeholder="어떤 서비스가 필요하세요?">
                        </div>
    
                        <div id = "content-right-middle-map-outter" class = "center">
                            <a href = "./Search_profile_map.jsp">
                                <button id = "content-right-map-button" class = "center">
                                    
                                    <div id = "map-button-img" class = "center">
                                        <svg data-v-eec0a5dc="" data-v-4272b524="" width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="prisma-icon primary" category="contents"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.25 5.57258V17.7169C21.25 18.4977 20.7327 19.1841 19.982 19.3992L15.6477 20.641C15.3287 20.7324 14.9903 20.7313 14.672 20.6376L9.01265 18.9734C8.9633 18.9589 8.91067 18.96 8.86195 18.9765L5.06119 20.2633C3.92652 20.6474 2.75 19.8036 2.75 18.6057V6.44955C2.75 5.68666 3.24421 5.01167 3.97148 4.78127L8.39965 3.37841C8.73568 3.27195 9.09602 3.26945 9.43349 3.37124L15.0845 5.07559C15.1324 5.09005 15.1836 5.08978 15.2313 5.07483L18.9773 3.90246C20.1043 3.54974 21.25 4.39165 21.25 5.57258ZM19.75 17.7169V5.57258C19.75 5.40388 19.5863 5.2836 19.4253 5.33399L15.8136 6.46434L15.8136 19.0332L19.5689 17.9572C19.6761 17.9265 19.75 17.8284 19.75 17.7169ZM14.3136 18.9687L9.62701 17.5906L9.62702 4.99634L14.3136 6.40983L14.3136 18.9687ZM8.12701 17.6417L8.12702 5.03825L4.4245 6.21123C4.3206 6.24414 4.25 6.34057 4.25 6.44955L4.25 18.6057C4.25 18.7768 4.41807 18.8974 4.58017 18.8425L8.12701 17.6417Z" fill="black"></path></svg>
                                    </div>
                                   
                                    <div id = "map-button-text" class = "center" style = "margin-left:3px;">
                                        지도
                                        <!--<span id = "content-right-map-button">지도</span>-->
                                    </div>
                                </button>
                            </a>
                        </div>
                    </div>

                    <article id = "content-right-under-outter">
                        <div id = "content-right-under-section1">
                            <div id = "item-top-title-outter" class = "center">
                                <span class = "item-title">숨고와 함께하는 소상공인 고수</span>
                            </div>
                                <div class = "gosu-profile-outter" >
                                    <div id = "gosu-profile-name-outter" class = "center">
                                        <h5 class = "profile-title">조덕호아카이브</h5>
                                    </div>
                                    <div id = "gosu-profile-second-outter" class = "center">
                                        <div id = "gosu-profile-secont-1" class = "center">
                                            <span><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
												</svg>
											</span>
                                            <span class = "profile-review">5.0</span>
                                            <span class = "profile-text1">(6) ·</span>
                                        </div>
                                        <span class = "profile-text2">2회 고용 ·</span>
                                        <span class = "profile-text2">경력 9년</span>
                                    </div>
            
                                    <div id = "profile-img1" class = "center">
                                    </div>
            
                                    <div id = "profile-intro-outter" class = "center">
                                        <p class = "profile-intro">당신이 브랜드가 될 수 있도록 '초정밀 성장 아카이브'을 제공합니다.</p>
                                    </div>
                                </div>
                                <div class = "gosu-profile-outter">
                                    <div id = "gosu-profile-name-outter" class = "center">
                                        <h5 class = "profile-title">한빛난방관리</h5>
                                    </div>
                                    <div id = "gosu-profile-second-outter" class = "center">
                                        <div id = "gosu-profile-secont-1" class = "center">
                                            <span><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
    											<path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
												</svg>
											</span>
                                            <span class = "profile-review">5.0</span>
                                            <span class = "profile-text1">(3) ·</span>
                                        </div>
                                        <span class = "profile-text2">경력 15년</span>
                                    </div>
            
                                    <div id = "profile-img2" class = "center">
                                    </div>
            
                                    <div id = "profile-intro-outter" class = "center">
                                        <p class = "profile-intro">고수의 수도 관련 설치 및 수리, 보일러 설치 및 수리(지역난방 포함), 온수기 설치 및 수리, 누수 탐지 서비스</p>
                                    </div>
                                </div>
                            
            
                            <div id = "item-top-title1-outter" class = "center">
                                <span class = "item-title">바로 답변 가능한 고수</span>
                            </div>
            
                            
                               <div class = "gosu-profile-outter3">
                                <div class = "gosu-profile-outter1">
                                    <div id = "gosu-prof ile-name-outter1" class = "center">
                                        <h5 class = "profile-title1"></h5>
                                    </div>
                                    <div id = "gosu-profile-second-outter1" class = "center">
                                        <div id = "gosu-profile-secont-2" class = "center">
                                            <span><svg width="14" height="14" viewBox="0 0 14 14" xmlns="http://www.w3.org/2000/svg">
												    <path d="m7.496 1.596 1.407 2.742 3.145.44c.91.127 1.275 1.204.615 1.822l-2.276 2.134.538 3.015c.155.872-.797 1.538-1.612 1.126L6.5 11.452l-2.813 1.423c-.815.412-1.767-.254-1.612-1.126l.538-3.015L.337 6.6c-.66-.618-.296-1.695.615-1.822l3.145-.44 1.407-2.742C5.912.8 7.088.8 7.496 1.596" fill="#FFCE21" fill-rule="evenodd"></path>
												</svg>
											</span>
                                            <span class = "profile-review1"></span>
                                            <span class = "profile-text1">() ·</span>
                                        </div>
                                        <span class = "profile-text2">회 고용 ·</span>
                                        <span class = "profile-text2">경력 년</span>
                                    </div>
            
                                    <div id = "profile-img3" class = "center" style = "background-image: url();">
                                    </div>
            
                                    <div id = "profile-intro-outter1" class = "center">
                                        <p class = "profile-intro1"></p>
                                    </div>
                                </div>
	                        </div>
                        </div>
                    </article>
                </section>
            </div>
            <div id = "gosu-zim-buttom-outter">
            
                <!-- <a href = "/Web/Login.jsp"> -->
                    <button id = "gosu-zim-buttom" class = "gosu-zim-buttom">
                        <img src = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iMjRweCIgaGVpZ2h0PSIyNHB4IiB2aWV3Qm94PSIwIDAgMjQgMjQiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8dGl0bGU+SWNvbl9oZWFydDwvdGl0bGU+CiAgICA8ZyBpZD0i8J+UljEwNTct66Gk67CxLe2bhC3rs4Dqsr3rkJwtVUktKOywnO2VnOqzoOyImCkiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSLslYTsnbTsvZhfQ1RBLeyVhOydtOy9mC3rs4Dqsr0iIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0yMy4wMDAwMDAsIC00MzEuMDAwMDAwKSIgZmlsbD0iI0ZGRkZGRiI+CiAgICAgICAgICAgIDxnIGlkPSJJY29uX2hlYXJ0IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgyMy4wMDAwMDAsIDQzMS4wMDAwMDApIj4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0xOS42MTIwMzE4LDUuNjg3OTY4MjIgQzE4LjcyMzc3MDIsNC43OTkyODk1NSAxNy41MTg3Nzg2LDQuMyAxNi4yNjIyOTIsNC4zIEMxNS4wMDU4MDU1LDQuMyAxMy44MDA4MTM4LDQuNzk5Mjg5NTUgMTIuOTEyNTUyMiw1LjY4Nzk2ODIyIEwxMS45OTk3Njk3LDYuNjAwNzUwNzggTDExLjA4Njk4NzEsNS42ODc5NjgyMiBDOS4yMzY5NzY5MywzLjgzNzk1ODA4IDYuMjM3NTE3ODEsMy44Mzc5NTgxIDQuMzg3NTA3NjQsNS42ODc5NjgyNyBDMi41Mzc0OTc0Nyw3LjUzNzk3ODQ0IDIuNTM3NDk3NDUsMTAuNTM3NDM3NiA0LjM4NzUwNzU5LDEyLjM4NzQ0NzggTDUuMzAwMjkwMTUsMTMuMzAwMjMwMyBMMTEuOTk5NzY5NywxOS45OTk3MDk4IEwxOC42OTkyNDkyLDEzLjMwMDIzMDMgTDE5LjYxMjAzMTgsMTIuMzg3NDQ3OCBDMjAuNTAwNzEwNCwxMS40OTkxODYyIDIxLDEwLjI5NDE5NDUgMjEsOS4wMzc3MDc5OSBDMjEsNy43ODEyMjE0NCAyMC41MDA3MTA0LDYuNTc2MjI5ODIgMTkuNjEyMDMxOCw1LjY4Nzk2ODIyIFoiIGlkPSJQYXRoIj48L3BhdGg+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPg==">
                        <span class = "gosu-zim-font">찜한 고수</span>
                    </button>
                <!-- </a> -->
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

    </div>

    
    
</body>
</html>