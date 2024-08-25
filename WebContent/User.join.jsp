<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>무료 가입하기</title>
  <link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
  <link rel="stylesheet" href="./css/User.join2.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>  
  <script> 
  $(function(){
	  $(".name-note-outter").hide();
	  $(".email-note-outter").hide();
	  $(".pw-note-outter").hide();
	  $(".chk2").hide();
	  $(".chk4").hide();
	  $(".chk6").hide();
	  $(".chk8").hide();
	  $(".chk10").hide();
	  $(".chk12").hide();
	  $(".chk14").hide();
	  
	  
	  $(".name-input").click(function(){
		$(this).css("border", "solid 1px #09A08E");
		$(".email-input").css("border", "solid 1px #E1E1E1");
		$(".pw-input").css("border", "solid 1px #E1E1E1");
	 });
	 
	 $(".email-input").click(function(){
		$(".name-input").css("border", "solid 1px #E1E1E1");
		$(this).css("border", "solid 1px #09A08E");
		$(".pw-input").css("border", "solid 1px #E1E1E1");
	 });
	 
	 $(".pw-input").click(function(){
		$(".name-input").css("border", "solid 1px #E1E1E1");
		$(".email-input").css("border", "solid 1px #E1E1E1");
		$(this).css("border", "solid 1px #09A08E");
	 });
	 
	 $(".name-input").blur(function() {
		 if ($(this).val().length <= 2) {
			 $(".name-note-outter").show();
			 $(".name-input").css("border", "solid 1px red");
	        }else{
	        	$(".name-note-outter").hide();
	        }
	    });
	
	 $(".email-input").blur(function() {
	        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	        if (emailPattern.test($(this).val())) {
	        	$(".email-note-outter").hide();
	        }else{
	        	$(".email-note-outter").show();
	        	$(".email-input").css("border", "solid 1px red");
	        }
	    });
	 
	 $(".pw-input").blur(function(){
		 if ($(this).val().length >= 8) {
			 $(".pw-note-outter").hide();
		 }else{
			 $(".pw-note-outter").show();
			 $(".pw-input").css("border", "solid 1px red");
		 }
	 });
	 
	 $(".custom-check-outter").click(function(){
		$(".chk1").toggle();
		$(".chk2").toggle();
		$(".chk3").toggle();
		$(".chk4").toggle();
		$(".chk5").toggle();
		$(".chk6").toggle();
		$(".chk7").toggle();
		$(".chk8").toggle();
		$(".chk9").toggle();
		$(".chk10").toggle();
		$(".chk11").toggle();
		$(".chk12").toggle();
		$(".chk13").toggle();
		$(".chk14").toggle();
	 });
	 
	 $(".check-li-div2").click(function(){
		$(".chk3").toggle();
		$(".chk4").toggle();
	 });
	 
	 $(".check-li-div3").click(function(){
			$(".chk5").toggle();
			$(".chk6").toggle();
		 });
	 
	 $(".check-li-div4").click(function(){
			$(".chk7").toggle();
			$(".chk8").toggle();
		 });
	 
	 $(".check-li-div5").click(function(){
			$(".chk9").toggle();
			$(".chk10").toggle();
		 });
	 
	 $(".check-li-div6").click(function(){
			$(".chk11").toggle();
			$(".chk12").toggle();
		 });
	 
	 $(".check-li-div7").click(function(){
			$(".chk13").toggle();
			$(".chk14").toggle();
		 });
	 
  });
  </script>
</head>
<body>
    <!--상단 고정 내용들-->
    <header class = "header-total">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "Controller?command=main_page">
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
                                    <a href = "Controller?command=market_list">
                                        <span class = "header-nav-li-span" style = "color : black;">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=post_main_list">
                                        <span class = "header-nav-li-span" style = "color : black;">커뮤니티</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- <div class = "center-section">
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
                    </div> -->

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
    <!--중단 고정 내용들-->
<form action = "Controller" method = "GET">
<input type = "hidden" value = "users_join" name = "command">
    <main class = "main-app">
        <div class = "app">
            <div class = "app-inner">
                <h1 class = "app-header-font">숨고에 오신 것을 환영합니다</h1>
                <div class = "app-body" autocomplete="off">
                    <div class = "name-outter">
                        <div class = "name-outter1">
                            <label class = "name-label">이름</label>
                            <div class = "name-input-outter">
                                <input class = "name-input" name = "name" type = "text" placeholder="이름(실명)을 입력해주세요" autocomplete="off" spellcheck="false" autocorrect="off" autofocus>
                            </div>
                            <div class = "name-note-outter">
                                <p class = "note">이름을 입력해주세요.</p>
                            </div>
                        </div>
                        <div class = "text-note-outter">
                            <div class = "text-note-inner">
                                <div class = "text-note">타인 명의로 가입 시 계정이 정지되고 재가입이 불가능합니다.</div>
                            </div>
                        </div>
                        <div class = "email-input-ouuter">
                            <label class = "email-label">이메일</label>
                            <div class = "email-input-inner">
                                <input type = "email" class = "email-input" placeholder="example@soomgo.com" maxlength="30" name = "email" autocomplete="off" autocapitalize="off" autocorrect="off" spellcheck="false">
                            </div>
                            <div class = "email-note-outter">
                                <p class = "note">이메일 주소를 입력해주세요.</p>
                            </div>
                        </div>
                    </div>
                    <div class = "pw-input-outter">
                        <label class = "pw-label">비밀번호</label>
                        <div class = "pw-input-inner">
                            <input type = "password" class = "pw-input" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." maxlength="255" name = "pw" autocomplete="off" autocapitalize="off" autocorrect="off" spellcheck="false">
                        </div>
                        <div class = "pw-note-outter">
                            <p class = "note">비밀번호를 입력해주세요.</p>
                        </div>
                    </div>
                    <div>
                    <div class = "check-outter">
                        <div class = "check-inner">
                            <label class = 'check-label'>
                                <input type = "checkbox" class = "checkbox">
                                <span class = "check-span1">
                                    <span class = "check-span2">약관 전체 동의</span>
                                </span>
                                <div class = "custom-check-outter">
                                    <svg class = "chk1" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                    <svg class = "chk2" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                </div>
                            </label>
                        </div>
                    </div>
                        <ul class = "check-ul">
                            <li class = "check-li">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li-span3">만 14세 이상입니다</span>
                                                <span class = "check-li-span4">(필수)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div2">
                                            <svg class = "chk3" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk4" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class = "check-li1">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li1-span5">이용약관 동의</span>
                                                <span class = "check-li-span4">(필수)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div3">
                                            <svg class = "chk5" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk6" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class = "check-li1">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li1-span5">개인정보 수집 및 이용 동의</span>
                                                <span class = "check-li-span4">(필수)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div4">
                                            <svg class = "chk7" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk8" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class = "check-li1">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li1-span5">선택정보 수집 및 이용 동의</span>
                                                <span class = "check-li-span4">(선택)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div5">
                                            <svg class = "chk9" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk10" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class = "check-li1">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li1-span5">개인정보 마케팅 활용 동의</span>
                                                <span class = "check-li-span4">(선택)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div6">
                                            <svg class = "chk11" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk12" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class = "check-li1">
                                <div class = "check-li-div1">
                                    <div class = "check-li-label">
                                        <input class = "check-li-input" type = "checkbox">
                                        <span class = "check-li-span1">
                                            <span class = "check-li-span2">
                                                <span class = "check-li1-span5">마케팅 알림 수신 동의</span>
                                                <span class = "check-li-span4">(선택)</span>
                                            </span>
                                        </span>
                                        <div class = "check-li-div7">
                                            <svg class = "chk13" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M20 3.5H4a.5.5 0 0 0-.5.5v16a.5.5 0 0 0 .5.5h16a.5.5 0 0 0 .5-.5V4a.5.5 0 0 0-.5-.5ZM4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Z" fill="currentColor"></path></svg>
                                        	<svg class = "chk14" width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4 2a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H4Zm13.543 7.472a.75.75 0 1 0-1.086-1.034l-6.124 6.43-2.79-2.93a.75.75 0 1 0-1.086 1.034l3.333 3.5a.75.75 0 0 0 1.086 0l6.667-7Z" fill="#00C7AE"></path></svg> -->
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class = "join-button-outter">
                        <input type = "submit" value = "회원가입" class = "join-button">
                        <a class = "gosu-join-a-tag" href = "Gosu_join.jsp">고수로 가입하시나요?</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</form>
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