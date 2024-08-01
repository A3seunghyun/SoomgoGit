<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숨고 숨은고수</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script>
    $(function(){
        $("#email-box-inner-text").hide();  
        $("#pw-box-inner-text").hide();
        
        $(".email-input").on('input', function() {
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (emailPattern.test($(this).val())) {
            $(this).css({
                "border-color": "#e1e1e1"
                // "box-shadow": "0 0 10px #00c7ae"
            });
        } else {
            $("#email-box-inner-text").show();
            $(this).css({
                "border-color": "red",
                "box-shadow": "none"
            });
        }
    });
    $(".email-input").focus(function() {
        $(this).css({
            "border": "1px solid #00c7ae",
            "box-shadow": "0 0 10px #00c7ae"
        });
    });

    $(".email-input").blur(function() {
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (emailPattern.test($(this).val())) {
            $("#email-box-inner-text").hide();
            $(this).css({
                // "border": "1px solid #00c7ae",
                // "box-shadow": "none"
            });
        } else {
            $("#email-box-inner-text").show();
            $(this).css({
                "border-color": "red",
                "box-shadow": "none"
            });
        }
    });
    $(".pw-input").on('input', function() {
        if ($(this).val().length >= 8) {

            $(this).css({
                "border-color": "#e1e1e1"
                // "box-shadow": "0 0 10px #00c7ae"
            });
        } else {
            $(this).css({
                "border-color": "red",
                "box-shadow": "none"
            });
        }
    });

    $(".pw-input").focus(function() {
        $(this).css({
            "border": "1px solid #00c7ae",
            "box-shadow": "0 0 10px #00c7ae"
            
        });
    });

    $(".pw-input").blur(function() {
        if ($(this).val().length >= 5) {
            $("#pw-box-inner-text").hide();
            $(this).css({
                "border-color": "#e1e1e1",
            });
        } else {
            $("#pw-box-inner-text").show();
            $(this).css({
                "border-color": "red",
                "box-shadow": "none"
            });
        }
    });
        
    });

  </script>
  <link rel="icon" href="./img/favicon_logo.ico">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Login2.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/>
</head>
<body>
<div id = "total-header">
    <!--상단바메인 보더 박스-->
    <div id="soomgo-header" class = "center">
        <!--상단바 로고  보더 박스 -->
        <div id = "soomgo-header1" class = "center">
            <!--숨고 메인 페이지 이동 URL-->
            <a href = "https://soomgo.com/">
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
                <a href = "Seach.profile.jsp">
                    <span style = "font-size : 16px; font-weight:500; color:rgb(12, 12, 12);">고수찾기</span>
                </a>
            </div>
            
            <!--마켓 보더 박스-->
            <div id = "soomgo-market" class ="center">
                <!--마켓 페이지 이동 URL-->
                <a href = "https://soomgo.com/market/%EC%B7%A8%EB%AF%B8-%EC%9E%90%EA%B8%B0%EA%B3%84%EB%B0%9CA">
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
                <input type="text" class = "serch-input" style = "font-size: .875ream; font-weight:500;"
                placeholder= "어떤 서비스가 필요하세요?">
            </div>
        </div>
        
        <!--상단바 우측 로그인,회원가입,고수가입 보더 박스-->
        <div id = "soomgo-menu2" class ="center">
            <!--로그인 보더 박스-->
            <div id = "soomgo-login" class ="center">
                <!--로그인 페이지 이동URL-->
                <a href = "Login.jsp">
                    <span style = "font-size : 14px; font-weight: 400;">로그인</span>
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
    <div id = "desktop-1" class ="center">
        <!--중단 로그인 보더 라인 박스-->
        <div id = "top-login-text" class ="center">
            <!--로그인 보더 박스-->
            <div id = "login-text" class = "center"> 
                <h2 style = "font-size : 2.125rem; font-weight: 500;">로그인</h2>
            </div>
        </div>
        <!--이메일,비밀번호 보더 박스 아웃라인-->
        <div id = "email-pw-login-box-outline" class ="center">
            <!--이메일,비밀번호 보더 박스 인라인-->
            <div id ="email-pw-login-box-inline" class ="center">
                <!--이메일 텍스트 박스-->
                <div id ="email-text" class ="center">
                    <span style = "font-weight: 500;">이메일</span>
                </div>
                <!--이메일 입력 보더 박스 아웃라인-->
                <form action = "LoginUserServlet" method="post">
                <div id = "email-input-box-outter" class = "center">
                    <!--이메일 입력 input 박스-->
                    <div id = "email-input-box-inner" class ="center">
                        <input type ="email" class = "email-input" placeholder="example@soomgo.com" style = "font-size: 1rem;" name = "email" required>
                    </div>
                    <div id ="email-box-inner-text" class ="center" style ="font-size : 12.8px; font-weight: 400; color:rgb(250, 89, 99);">
                        이메일 주소를 입력해주세요.
                    </div>
                </div>
                <!--비밀번호 텍스트 박스-->
                <div id = "pw-text" class ="center" style="font-weight: 500;">
                    비밀번호
                </div>
                <!--비밀번호 입력 input 박스-->
                <div id = "pw-input-box-outter" class = "center">
                    <input type ="password" class = "pw-input" placeholder="비밀번호를 입력해주세요." style ="font-size :15px" name = "pw">
                </div>
                <div id ="pw-box-inner-text" class ="center" style ="font-size : 12.8px; font-weight: 400; color:rgb(250, 89, 99);">
                    비밀번호를 입력해주세요.
                </div>
                <!--이메일 로그인 버튼 박스-->
                <div id="login-button-box-outter" class ="center">
                    <input type = "submit" id ="login-button" value = "이메일 로그인" class = "login-button-font" name = "login-button">
                </div>
                </form>
                <!--로그인 하단 이메일 찾기,비밀번호 찾기,회원가입 보더 박스-->
                <div id ="email-pw-join-outter" class = "center">
                    <div id ="email-pw-join-inline" class = "center">
                        <div id ="email-serch" class ="center">
                            <a href = "email_search.jsp" style = "color:rgb(115, 115, 115); font-size :14px; font-weight: 400;">
                                이메일 찾기
                            </a>
                        </div>
                        
                        <div id ="line" class = "center">
                        </div>
                        
                        <div id = "pw-serch" class = "center">
                            <a href = "pw_search.jsp"  style = "color:rgb(115, 115, 115); font-size :14px; font-weight: 400;">비밀번호 찾기</a>
                        </div>

                        <div id ="line" class = "center">
                        </div>

                        <div id ="join" class ="center">
                            <a href ="User.join.jsp"  style = "color:rgb(115, 115, 115); font-size :14px; font-weight: 400;">회원가입</a>
                        </div>

                        
                    </div>
                    <div id ="last-login-text" class ="center" style = "color:rgb(115, 115, 115); font-size :12px; font-weight: 400;">
                        이전에
                        <span style = "color:rgb(0, 199, 174); font-size :12px; font-weight: 400;">네이버</span>
                        로 로그인했어요
                    </div>
                    
                        <div id ="kakao-login" class = "center">
                                                    <a href = "https://accounts.kakao.com/login/?continue=https%3A%2F%2Fkauth.kakao.com%2Foauth%2Fauthorize%3Fresponse_type%3Dcode%26redirect_uri%3Dhttps%253A%252F%252Fsoomgo.com%252Fsocial-login%252Fkakao%252F%26through_account%3Dtrue%26client_id%3Dba8769c8485f570fc250a457ae336eb9#login">
                                                        <button id ="kakao-button">
                                                            <img src ="https://assets.cdn.soomgo.com/icons/icon-login-kakaotalk-btn.svg" width = "20px" height ="20px">
                                                            <span style ="font-size: 15px; font-weight: 500; font-stretch :100%; ">&nbsp;&nbsp;카카오로 시작</span>
                                                        </button>
                                                    </a>
                                                </div>

                                                <div id ="naver-login" class ="center">
                                                    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ltCYu2JjB5FE0nDlkh_F&redirect_uri=https://soomgo.com/login?is_naver_login=true&state=b9d1eaa2-fd9c-4366-ae14-50793c7eb5b4">
                                                        <button id ="naver-button">
                                                            <img src ="https://assets.cdn.soomgo.com/icons/icon-login-naver-btn.svg" width = "20px" height ="20px">
                                                            <span style ="font-size: 15px; color :#fff; font-weight: 500; font-stretch :100%;">&nbsp;&nbsp;네이버로 시작</span>
                                                        </button>
                                                    </a>
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