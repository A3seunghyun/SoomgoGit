<%@page import="dto.Search_emailDto"%>
<%@page import="dao.Search_emailDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    
    <%
    String phone = (request.getParameter("phone"));
	Search_emailDao gpDao = new Search_emailDao();
	ArrayList<Search_emailDto> SearchEmail = gpDao.getSearchEmail(phone);
    
	//String name = (String)request.getAttribute("name");
	//String email = (String)request.getAttribute("email");
    %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숨고:숨은고수 - 1000만명이 선택한 전국민 생활 솔루션</title>
  <link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
  <link rel="stylesheet" href="./css/email_search.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script>
    $(function(){
        $(".phone-message-font1").hide();
        $(".phone-message-font2").hide();
        $(".certification-number-outter").hide();
        $(".send-button").attr("disabled",true);
        $(".certification-number-text1").hide();
        $(".certification-number-text2").hide();
        $(".select-name-input-radio2").hide();
        $(".select-name-body").hide();
        $(".ok-button2").hide();
        $(".ok-button3").hide();
        $(".ok-button4").hide();
        $(".service-select").hide();
        $(".select-service-input-radio2").hide();
        $(".email-serch-last-outter").hide();
		
        $(".send-button").click(function() {
            let phone = $(".input-number").val();
                
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "SearchEmailServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    let response = JSON.parse(xhr.responseText);
                    
                    if (response.status === "success") {
                        $(".certification-number-outter").show();
                        $(".select-name-span2").text(response.name); // 이름을 HTML 요소에 삽입
                        $(".email-serch-last-email1").text(response.email); 
                    } else {
                        alert(response.message);
                        $(".certification-number-outter").hide();
                        $(".phone-message-font1").show();
                        $(".phone-message-font2").hide();
                        if ($(".phone-message-font1").is(':visible')) {
                            location.reload();
                        }
                    }
                }
            }
            let params = "phone=" + encodeURIComponent(phone);
            xhr.send(params); // 요청과 함께 보낼 데이터 입력
        });


        $(".input-number").on('input', function() {
        var phonePattern = /^(\d{3})(\d{3,4})(\d{4})$/;
        var inputVal = $(this).val().replace(/-/g, '');

        if (phonePattern.test(inputVal)) {
            var formattedPhone = inputVal.replace(phonePattern, '$1-$2-$3');
            $(this).val(formattedPhone);
            if (inputVal.startsWith("010")) {
                $(this).css({
                    "border-color": "#00c7ae",
                });
                $(".phone-message-font1").hide();
                $(".send-button").css("background-color", "#00c7ae");
                $(".send-button").attr("disabled",false);
            } else {
                $(".phone-message-font1").show();
                $(this).css({
                    "border-color": "red"
                });
            }
        } else {
            $(".phone-message-font1").show();
            $(this).css({
                "border-color": "red"
            });
        }
    });

    $(".input-number").focus(function() {
        $(this).css("border-color", "#00c7ae");
    });

    $(".input-number").blur(function() {
        var phonePattern = /^010-(\d{3,4})-(\d{4})$/;
        if (!phonePattern.test($(this).val())) {
            $(this).css("border-color", "red");
        } else {
            $(this).css("border-color", "#00c7ae");
        }
    });

    $(".send-button").click(function(){
        //$(".certification-number-outter").show();
        $(".body-inner").css("margin-bottom","30px");
        $(".phone-message-font2").show();
        $(".input-number").css("background-color","#E1F6FA")
        });
    
    $(".certification-number-input").click(function(){
        $(this).css("border-color","#00c7ae");

        $(".certification-number-input").on('input', function() {
            if ($(this).val().length >= 6 && $.isNumeric($(this).val())) {
                $(".certification-number-button").css({
                    "background-color": "#00c7ae"
                });
                
            } else {
                $(".certification-number-button").css({
                    "background-color": ""
                });
            }
        });
    });

    $(".certification-number-button").click(function(){
        $(".certification-number-text2").show();
        $(".send-button").css("background-color","#E1E1E1");
        $(this).css("background-color","#E1E1E1");
        $(".ok-button1").css("background-color","#00c7ae");
        $(".ok-button1").css("border-color","#00c7ae");
        $(".ok-button1").css("cursor","pointer");
    });
    
    $(".ok-button1").click(function(){
        $(".body-inner").hide();
        $(".certification-number-outter").hide();
        $(this).css("background-color","#B5B5B5");
        $(this).css("border-color","#B5B5B5");
        $(".select-name-body").show();
        $(".ok-button1").hide();
        $(".ok-button2").show();
    });

    $(".select-name-li").click(function() {
        // 모든 .select-name-li 요소에서 active 클래스를 제거
        $(".select-name-li").removeClass("active");
        // 모든 .select-input-radio2 요소를 숨김
        $(".select-name-input-radio2").hide();
        $(".select-name-input-radio1").show();

        // 클릭된 요소에 active 클래스를 추가
        $(this).addClass("active");

        // 클릭된 요소에 해당하는 .select-input-radio2를 표시
        $(this).find(".select-name-input-radio2").show();
        $(this).find(".select-name-input-radio1").hide();

        $(".ok-button2").css("background-color","#00c7ae");
        $(".ok-button2").css("border-color","#00c7ae");
        $(".ok-button2").css("cursor","pointer");
    });
        $(".ok-button2").click(function(){
            $(".select-name-body").hide();
            $(".email-serch-last-outter").show();
            $(".ok-button2").hide();
            $(".ok-button4").show();
        });

        $(".select-service-li").click(function() {
        // 모든 .select-name-li 요소에서 active 클래스를 제거
        $(".select-service-li").removeClass("active");
        // 모든 .select-input-radio2 요소를 숨김
        $(".select-service-input-radio2").hide();
        $(".select-service-input-radio1").show();

        // 클릭된 요소에 active 클래스를 추가
        $(this).addClass("active");

        // 클릭된 요소에 해당하는 .select-input-radio2를 표시
        $(this).find(".select-service-input-radio2").show();
        $(this).find(".select-service-input-radio1").hide();

        $(".ok-button3").css("background-color","#00c7ae");
        $(".ok-button3").css("border-color","#00c7ae");
        $(".ok-button3").css("cursor","pointer");
    });
        /* $(".ok-button3").click(function(){
            $(".ok-button3").hide();
            $(".service-select").hide();
            $(".ok-button4").show();
            $(".email-serch-last-outter").show();
        }); */
        
        /* if(".input-number" == ) */	
        
        

    });
  </script>
</head>
<body>
<div id = "total-header">
    <!--상단바메인 보더 박스-->
    <div id="soomgo-header" class = "center">
        <!--상단바 로고  보더 박스 -->
        <div id = "soomgo-header1" class = "center">
            <!--숨고 메인 페이지 이동 URL-->
            <a href = "Controller?command=main_page">
                <!--숨고 메인 로고-->
                <img src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg" width = "79.5px" height = "27px">
            </a>
        </div>

        <!--숨고 견적,고수,마켓,커뮤 보더 박스-->
        <div id = "soomgo-menu1" class = "center">
            <!--견적요청 보더 박스-->
            <div id = "soomgo-request" class = "center">
                <!--견적요청 페이지 이동URL-->
                <a href = "sgRequestMain.jsp">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">견적요청</span>
                </a>
            </div>
            <!--고수찾기 보더 박스-->
            <div id = "soomgo-serch" class ="center">
                <!--고수찾기 페이지 이동URL-->
                <a href = "Seach.profile.jsp">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">고수찾기</span>
                </a>
            </div>
            
            <!--마켓 보더 박스-->
            <div id = "soomgo-market" class ="center">
                <!--마켓 페이지 이동 URL-->
                <a href = "Controller?command=market_list">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">마켓</span>
            </div>
            
            <!--커뮤니티 보더 박스-->
            <div id = "soomgo-community" class ="center">
                <!--커뮤니티 페이지 이동 URL-->
                <a href = "Controller?command=post_main_list">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">커뮤니티</span>
                </a>
            </div>
        </div>

        <!--상단바 검색 보더 박스-->
       <!--  <div id = "soomgo-header-serch" class ="center">
            상단바 검색 돋보기 이미지
            <div id = "reading-glasses-img" class ="center">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#B5B5B5" class="css-14be4in ewnhp7m1"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.509 17.018a8.512 8.512 0 1 1 1.057-1.064l4.455 4.455a.75.75 0 1 1-1.06 1.06l-4.452-4.45Zm1.523-6.506a7.012 7.012 0 1 1-14.023 0 7.012 7.012 0 0 1 14.023 0Z" fill="currentColor"></path></svg>
            </div>
            상단바 검색 버튼
            <div id="serch-input-outter" class ="center">
                <input type="text" class = "serch-input" style = "font-size: .875ream; font-weight:400;"
                placeholder= "어떤 서비스가 필요하세요?">
            </div>
        </div> -->
        
        <!--상단바 우측 로그인,회원가입,고수가입 보더 박스-->
        <div id = "soomgo-menu2" class ="center">
            <!--로그인 보더 박스-->
            <div id = "soomgo-login" class ="center">
                <!--로그인 페이지 이동URL-->
                <a href = "Login.jsp">
                    <span style = "font-size : 14px; font-weight: 400; color:black;">로그인</span>
                </a>
            </div>
            <!--회원가입 보더 박스-->
            <div id = "soomgo-join" class ="center">
                <!--회원가입 페이지 이동URL-->
                <a href = "User.join.jsp">
                    <span style = "font-size : 14px; font-weight: 400; color:rgb(12, 12, 12);" >회원가입</span>
                </a>
            </div>
            <!--고수가입 보더 박스-->
            <div id = "soomgo-gosu-join" class ="center">
                <!--고수가입 페이지 이동URL-->
                <a href = "Gosu_join.jsp">
                    <span style = "font-size : 14px; color:#fff; font-weight: 500">고수가입</span>
                </a>
            </div>
        </div>
    </div>
</div>
    <!--중단 전체 보더 박스-->
    <div id = "app" class ="center">
        <div id = "app-outter">
            <div id = "app-inner">
                <h1 class = "app-header-font">이메일 찾기</h1>
                <div id = "body">
                    <div>
                    	
                        <form class = "body-inner" action = "/SearchEmailServlet" method = "post">
                            <label id = "p-number-text">휴대전화 번호</label>
                            <div class = "p-number-inner1">
                                <div class = "p-number-inner2">
                                    <div class = "p-number-inner3">
                                        <input type="phone" placeholder="예) 010-1234-1234" maxlength="13" class = "input-number" name = "phone">
                                    </div>
                                        <p class = "phone-message-font1">휴대폰 번호를 입력해주세요.</p>
                                        <p class = "phone-message-font2">인증번호를 전송하였습니다.</p>
                                </div>
                                    <!-- <fieldset disabled style = "border: none;" class = "send-button-disabled"> -->
                                        <button type = "button" class = "send-button">전송</button>
                                    <!--  </fieldset> -->
                            </div>
                        </form>
						 
                        <form class = "certification-number-outter">
                            <label class = "certification-number-label">인증번호</label>
                                <div class = "certification-number-inner1">
                                    <div class = "certification-number-inner2">
                                        <div class = "certification-number-inner3">
                                    <input class = "certification-number-input" type = "verify" placeholder="SMS 인증번호를 입력해주세요." maxlength="6" name = "verification">
                                       </div>
                                    </div>
                                    <button type = "button" class = "certification-number-button">인증하기</button>
                                        <div class = "certification-number-text-outter">
                                            <p class = "certification-number-text1">인증번호가 일치하지 않습니다.</p>
                                            <p class = "certification-number-text2">인증 되었습니다.</p>
                                        </div>    
                                </div>
                        </form>

                        <form class = "select-name-body">
                            <h2 class = "email-h2-font">숨고 활동명을 선택해주세요</h2>
                                <ul class = "select-name-ul">
                                    <li class = "select-name-li">
                                        <div class = "select-name-div">
                                            <label class = "select-name-label">
                                                <input class = "select-name-input" type = "radio" name = "name" value ="최승현">
                                                    <div class = "select-name-radio-div">
                                                        <svg class = "select-name-input-radio1" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#E1E1E1">
                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 20.5a8.5 8.5 0 1 0 0-17 8.5 8.5 0 0 0 0 17Zm0 1.5c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10Z" fill="currentColor"></path></svg>

                                                        <svg class = "select-name-input-radio2" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#00C7AE">
                                                            <path d="M12 17a5 5 0 1 0 0-10 5 5 0 0 0 0 10Z" fill="currentColor"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10Zm-1.5 0a8.5 8.5 0 1 1-17 0 8.5 8.5 0 0 1 17 0Z" fill="currentColor"></path></svg>
                                                    </div>
                                                    <span class = "select-name-span1">
                                                        <span class = "select-name-span2"></span>
                                                    </span>
                                            </label>
                                        </div>
                                    </li>

                                </ul>
                        </form>

                        <form class = "service-select">
                            <h2 class = "service-select-h2-font">
                                고수로 활동할 때<br/>
                                어떤 서비스를 제공했나요?
                            </h2>

                            <ul class = "select-service-ul">
                                <li class = "select-service-li">
                                    <div class = "select-service-div">
                                        <label class = "select-service-label">
                                            <input class = "select-service-input" type = "radio" name = "name" value ="최승현">
                                                <div class = "select-service-radio-div">
                                                    <svg class = "select-service-input-radio1" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#E1E1E1">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 20.5a8.5 8.5 0 1 0 0-17 8.5 8.5 0 0 0 0 17Zm0 1.5c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10Z" fill="currentColor"></path></svg>

                                                    <svg class = "select-service-input-radio2" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#00C7AE">
                                                        <path d="M12 17a5 5 0 1 0 0-10 5 5 0 0 0 0 10Z" fill="currentColor"></path>
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10Zm-1.5 0a8.5 8.5 0 1 1-17 0 8.5 8.5 0 0 1 17 0Z" fill="currentColor"></path></svg>
                                                </div>
                                                <span class = "select-service-span1">
                                                    <span class = "select-service-span2">오늘은 삼두,이두</span>
                                                </span>
                                        </label>
                                    </div>
                                </li>

                                
                            </ul>
                        </form>

                        <section class = "email-serch-last-outter">
                            <h2 class = "email-serch-last-h2-font">고객님의 계정 정보를 알려드려요</h2>
                                <p class = "email-serch-last-text-meassge">
                                개인정보 도용 피해방지를 위해<br/>
                                정보를 보호해주세요.
                                </p>
                                    <div class = "email-serch-last-inner1-email">
                                        <div class = "email-serch-last-inner2-email">가입한 아이디
                                            <p class = "email-serch-last-email1"></p>
                                            <p class = "email-serch-last-email2">
                                            <!-- 가입일 -->
                                               <!--  <time datetime="1900-01-01">2024.05.10</time> -->
                                            </p>
                                        </div>
                                    </div>
                                    <a class = "email-serch-last-pw-page-work" href = "pw_search.jsp">
                                        비밀번호 찾기
                                    </a>
                        </section>

                        <button type = "button" class = "ok-button1">확인</button>
                        <button type = "button" class = "ok-button2">확인</button>
                        <button type = "button" class = "ok-button3">확인</button>
                        <a class = "ok-button4" href = "Login.jsp">로그인 하기</a>
                    </div>
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