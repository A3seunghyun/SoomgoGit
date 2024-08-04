<%@page import="dto.Gosu_joinDto"%>
<%@page import="dao.Gosu_joinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
	Gosu_joinDao gjDao = new Gosu_joinDao();
	ArrayList<Gosu_joinDto> GosuJoin = gjDao.getGosuJoin();
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숨고 : 숨은고수 - 가장 빨리 새로운 고객 만나는 방법 - 숨고,숨은고수</title>
  <link rel="icon" href="./img/favicon_logo.ico">
  <link rel="stylesheet" href="./css/Gosu_join.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script>
    $(function(){
        
        $(".category-icon-li").click(function(){
        	let idx = $(this).attr("idx");
        	location.href = "Gosu_join_select.jsp?category_idx=" + idx;
        });
        
    });
  </script>
</head>
<body>
    <!--상단-->
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
                                        <span class = "header-nav-li-span" style = "color : black;">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span" style = "color : black;">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
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

    
    <!--중단 전체 보더 박스-->
    <div id = "desktop-1" class ="center">
        <div id = "middle-top-outter" class = "center">
            <div id = "middle-top-text-outter" class = "center" >
                <h1 class = "middle-top-text">
                    숨은고수가 되어
                </h1>
                <h1 class = "middle-top-text">
                    수익을 만들어보세요!
                </h1>
            </div>
        </div>

        <div id = "iddle-category-outter" class = "center">
            <div id = "middle-category-outter1" class = "center">
                <div id = "middle-category-outter2" class = "center">
                    <div id = "category-main-title" class = "center">
                        <h3 class = "category-title">활동 분야를 선택하세요</h3>
                    </div>

                    <ul class = "category-icon-ul">
                    	<% for(Gosu_joinDto jdto : GosuJoin) { %>
                        <li class = "category-icon-li" idx = "<%=jdto.getCategory_idx() %>">
                             <div class = "category-icon-div1">
                                  <div class = "category-icon-div2">
                                      <img class = "category-icon-img" src = "<%=jdto.getThumbnail() %>">
                                  </div>
                                  <p class = "category-icon-font"><%=jdto.getTitle() %></p>
                             </div>
                        </li>
						<% } %>
                    </ul>
                </div>
            </div>
        </div>

        <div id = "middle-text-box1-outter" class = "center">
            <div id = "middle-text-title-outter" class = "center">
                <div id = "middle-text-title-outter1" class = "center">
                    <h2 class = "middle-title">수많은 고객들이 고수님을 기다립니다</h2>
                    <br/>
                    <p class = "middle-text">가장 많은 고객이 숨고에 있습니다.
                        <!---->
                        숨고에서 빠르고 편리하게 고객을 만나세요.
                    </p>
                </div>

                <div id = "middle-row-outter" class ="center">
                    <div id = "middle-row-inner1" class = "center">
                        <div id = "middle-inner1-1" class = "center">
                            <div id = "middle-number1-1" class = "center">
                                <h3 class = "middle-number">3</h3>
                            </div>
                            
                            <div id = "middle-number1-2" class = "center">
                                <h3 class = "middle-number">1</h3>
                            </div>

                            <div id = "middle-number1-3" class = "center">
                                <h3 class = "middle-number">,</h3>
                            </div>

                            <div id = "middle-number1-4" class = "center">
                                <h3 class = "middle-number">0</h3>
                            </div>

                            <div id = "middle-number1-5" class = "center">
                                <h3 class = "middle-number">2</h3>
                            </div>

                            <div id = "middle-number1-6" class = "center">
                                <h3 class = "middle-number">4</h3>
                            </div>

                            <div id = "middle-number1-7" class = "center">
                                <h3 class = "middle-number">,</h3>
                            </div>

                            <div id = "middle-number1-8" class = "center">
                                <h3 class = "middle-number">7</h3>
                            </div>

                            <div id = "middle-number1-9" class = "center">
                                <h3 class = "middle-number">5</h3>
                            </div>

                            <div id = "middle-number1-10" class = "center">
                                <h3 class = "middle-number">6</h3>
                            </div>
                        </div>

                        <div id = "middle-1-text" class = "center">
                            <p class = "middle-wait-text">누적 요청서</p>
                        </div>
                    </div>

                    <div id = "middle-row-inner2" class = "center">
                        <div id = "middle-inner2-1" class = "center">
                            <div id = "middle-number2-1" class = "center">
                                <h3 class = "middle-number">1</h3>
                            </div>

                            <div id = "middle-number2-2" class = "center">
                                <h3 class = "middle-number">,</h3>
                            </div>

                            <div id = "middle-number2-3" class = "center">
                                <h3 class = "middle-number">7</h3>
                            </div>

                            <div id = "middle-number2-4" class = "center">
                                <h3 class = "middle-number">5</h3>
                            </div>

                            <div id = "middle-number2-5" class = "center">
                                <h3 class = "middle-number">7</h3>
                            </div>

                            <div id = "middle-number2-6" class = "center">
                                <h3 class = "middle-number">,</h3>
                            </div>

                            <div id = "middle-number2-7" class = "center">
                                <h3 class = "middle-number">1</h3>
                            </div>

                            <div id = "middle-number2-8" class = "center">
                                <h3 class = "middle-number">9</h3>
                            </div>

                            <div id = "middle-number2-9" class = "center">
                                <h3 class = "middle-number">2</h3>
                            </div>
                        </div>
                            <div id = "middle-1-text" class = "center">
                                <p class = "middle-wait-text">등록된 고수</p>
                            </div>
                    </div>

                    <div id = "middle-row-inner3" class = "center">
                        <div id = "middle-inner3-1" class = "center">
                            <h3 class = "middle-number">4.9 / 5점</h3>
                        </div>

                        <div id = "middle-3-text" class = "center">
                            <p class = "middle-wait-text">평균 리뷰별점</p>
                        </div>
                    </div>

                    </div>
                </div>

             </div>
             <div id = "middle-2-outter" class = "center">
                <div id = "middle-2-outter-top" class = "center">
                    <h2 class = "middle-2-top-title-text">숨고는 어떻게 운영되나요?</h2>
                </div>

                <div id = "middle-2-middle-outter" class = "border center">
                    <div id = "middle-2-middle-1" class = "center">
                        <div id = "middle-2-middle-1-img" class = "center">
                            <img src = "https://static.cdn.soomgo.com/static/img/home/safety_num_1.png?webp=1" width = "65px" height = "65px">
                        </div>

                        <div id = "middle-2-middle-1-title" class = "center">
                            <h3 class = "middle-2-title">고객의 요청을 받아보세요</h3>
                        </div>

                        <div id = "middle-2-middle-1-text" class = "center">
                            <figcaption class = "middle-2-text"> 고객이 필요한 서비스의 요청서를 작성하면 숨고가 검토 후 고수님께 무료로 보내드려요.</figcaption>
                        </div>
                    </div>

                    <div id = "middle-2-middle-2" class = "center">
                        <div id = "middle-2-middle-2-img" class = "center">
                            <img src = "https://static.cdn.soomgo.com/static/img/home/safety_num_2.png?webp=1" width = "65px" height = "65px">
                        </div>

                        <div id = "middle-2-middle-2-title" class = "center">
                            <h3 class = "middle-2-title">맞춤 견적을 보내세요</h3>
                        </div>

                        <div id = "middle-2-middle-2-text" class = "center">
                            <figcaption class = "middle-2-text"> 요청서 확인 후 간단히 견적금액만 입력하면 
                                <br/>
                                프로필과 함께 고객에게 메세지로 전송돼요.</figcaption>
                        </div>
                    </div>
                    
                    <div id = "middle-2-middle-3" class = "center">
                        <div id = "middle-2-middle-3-img" class = "center">
                            <img src = "https://static.cdn.soomgo.com/static/img/home/safety_num_3.png?webp=1" width = "65px" height = "65px">
                        </div>

                        <div id = "middle-2-middle-3-title" class = "center">
                            <h3 class = "middle-2-title">상담 후 거래하세요</h3>
                        </div>

                        <div id = "middle-2-middle-3-text" class = "center">
                            <figcaption class = "middle-2-text"> 원하는 고객과 채팅 및 전화(안심번호)로 자세한  
                            <br/>
                            사항을 협의하고 거래하세요.</figcaption>
                        </div>
                    </div>

                    <div id = "middle-2-more-outter" class = "center">
                        <div id = "middle-2-more-inner" class = "border center">
                            <a href = "https://soomgo.com/how-soomgo-works">
                                <button id = "more-button" class = "more-text">더 알아보기</button>
                            </a>
                        </div>
                    </div>
                </div>
                </div>

                <div id = "review-outter" class ="center">
                    <div id = "review-outter1" class = "center">
                        <div id = "review-title-outter" class = "center">
                            <h2 class = "review-title">숨은 고수들의 생생한 후기</h2>
                        </div>

                        <div id = "review-gosu-detail" class = "center">
                            <a href = "https://soomgo.com/profile/users/43053">
                                <div id = "review-detail-1" class = "center">
                                    <div id = "review-detail-1-img" class = "center">
                                        <img src = "/img/고수1.PNG" width = "148px" height = "182px">
                                    </div>
                                    <div id = "review-text-outter" class = "center">
                                    <div id = "review-text" class = "center">
                                        <p class = "review-text">예전에 학원에서는 수수료 50%를 떼이는 게 너무 억울했었는데 숨고는 합리적이라 생각해요! 현재 37명 레슨 중인데, 그 중 대부분이 숨고로 알게 된 분들이에요. 주위 여러 친구들한테 숨고를 추천했어요.</p>
                                    </div>
                                    <div id = "more-outter" class = "center" style="font-size:16px;">
                                        더보기
                                    </div>
                                    </div>
                                </div>
                            </a> 
                        </div>
                    </div>
                </div>
                
                <div id = "middle-under-outter" class = "center">
                    <div id = "middle-under-inner" class = "center">
                        <div id = "middle-under-title-outter" class = "center">
                            <div id = "middle-title-outter" class = "center">
                                <h2 class = "gosu-success-title">고수 성공 스토리</h2>
                            </div>
    
                            <div id = "middle-text-outter" class = "center">
                                <p class = "middle-text">숨고를 통해 성공한 고수의 스토리를 들어보세요.</p>
                            </div>
                        </div>
                        
                        <div id = "middle-youtube-outter" class = "center">
                            <a href = "https://www.youtube.com/watch?time_continue=1&v=p291Tk-29Co&embeds_referring_euri=https%3A%2F%2Fsoomgo.com%2F&source_ve_path=Mjg2NjY&feature=emb_logo">
                                <div id = "middle-youtube-inner1" class = "center">
                                    <img src = "https://assets.cdn.soomgo.com/assets/images/btn_clip_play.png?webp=1" style = "margin-left : 190px; margin-top :270px">
                                    <div id = "gosu-intro-text1" class = "center">
                                        <div id = "gosu-intro-title" class = "center">
                                            <h3 style="font-size: 1.25rem; color: #fff; font-weight: 100; position: absolute;letter-spacing: -.03125rem; ">포토그래퍼</h3>
                                        <div id = "gosu-intro-coment">
                                            <small style = "color:#fff; font-size: .875rem;">강휘원 고수</small>
                                        </div>

                                        </div>
                                    </div>
                                </div>
                            </a>
                            
                            <a href = "https://www.youtube.com/watch?v=-JL5G7JqDps&embeds_referring_euri=https%3A%2F%2Fsoomgo.com%2F&source_ve_path=Mjg2NjY&feature=emb_logo">
                                <div id = "middle-youtube-inner2" class = "center">
                                    <img src = "https://assets.cdn.soomgo.com/assets/images/btn_clip_play.png?webp=1" style = "margin-left : 20px; margin-top :120px">
                                    <div id = "gosu-intro-text" class = "center">
                                        <div id = "gosu-intro-title" class = "center">
                                            <h3 style="font-size: 1.25rem; color: #fff; font-weight: 100; position: absolute;letter-spacing: -.03125rem; margin-left:10px;">　이사</h3>
                                        <div id = "gosu-intro-coment">
                                            <small style = "color:#fff; font-size: .875rem;">박환준 고수</small>
                                        </div>

                                        </div>
                                    </div>
                                </div>
                            </a>
                            
                            <a href = "https://www.youtube.com/watch?v=9_YQ9JAevo8">
                                <div id = "middle-youtube-inner3" class = "center">
                                    <img src = "https://assets.cdn.soomgo.com/assets/images/btn_clip_play.png?webp=1" style = "margin-left : 20px; margin-top :120px">
                                    <div id = "gosu-intro-text" class = "center">
                                        <div id = "gosu-intro-title" class = "center">
                                            <h3 style="font-size: 1.25rem; color: #fff; font-weight: 100; position: absolute;letter-spacing: -.03125rem;">웨딩플래너</h3>
                                        <div id = "gosu-intro-coment">
                                            <small style = "color:#fff; font-size: .875rem;">이성희 고수</small>
                                        </div>

                                        </div>
                                    </div>
                                </div>
                            </a>

                            <a href = "https://www.youtube.com/watch?v=q3G7882275g">
                                <div id = "middle-youtube-inner4" class = "center">
                                    <img src = "https://assets.cdn.soomgo.com/assets/images/btn_clip_play.png?webp=1" style = "margin-left : 190px; margin-top :120px">
                                    <div id = "gosu-intro-text" class = "center">
                                        <div id = "gosu-intro-title" class = "center">
                                            <h3 style="font-size: 1.25rem; color: #fff; font-weight: 100; position: absolute;letter-spacing: -.03125rem;">피아니스트</h3>
                                        <div id = "gosu-intro-coment">
                                            <small style = "color:#fff; font-size: .875rem;">윤다정 고수</small>
                                        </div>

                                        </div>
                                    </div>
                                </div>
                            </a>
                            
                            <a href = "https://www.youtube.com/watch?v=LwUFczpI_Lg&embeds_referring_euri=https%3A%2F%2Fsoomgo.com%2F&source_ve_path=Mjg2NjY&feature=emb_logo">
                                <div id = "middle-youtube-inner5" class = "center">
                                    <img src = "https://assets.cdn.soomgo.com/assets/images/btn_clip_play.png?webp=1" style = "margin-left : 20px; margin-top :120px">
                                    
                                    <div id = "gosu-intro-text" class = "center">
                                        <div id = "gosu-intro-title" class = "center">
                                            <h3 style="font-size: 1.25rem; color: #fff; font-weight: 100; position: absolute;letter-spacing: -.03125rem;">청소도우미</h3>
                                        <div id = "gosu-intro-coment">
                                            <small style = "color:#fff; font-size: .875rem;">이은혜 고수</small>
                                        </div>

                                        </div>
                                    </div>
                                </div >
                            </a>
                        </div>
                    </div>
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