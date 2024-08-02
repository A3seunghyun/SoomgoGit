<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/HeaderUnder.css"/>
<link rel="stylesheet" href="css/clear.css"/>
<link rel="stylesheet" href="css/sgNation.css"/>
 
</head>
<body>
	<div id="app" class="">
		<!-- 상단바 -->
		<div id = "total-header" class="">
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
		                <a href = "https://soomgo.com/search/pro?from=web_gnb">
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
		
	    <!-- 메인 -->
	    <div id="app_body" class="">
	    	<div id="body_main" class="">
	    		<div id="body_header" class="">
	    			<h1>서울</h1>
	    			<button>서울
	    			 <img src="img/soomgo/img_icon_downarrow.svg">
	    			</button>
	    			<div class=""></div>
	    		</div>
	    		<div id="body_container" class="">
	    			<div id="main_head" class="">
	    				<h3>서울 지역 인기 서비스</h3>
	    				<ol class="fl">
	    					<li class="fl"><a href="https://soomgo.com/">숨고</a></li>
	    					<li class="fl">
	    						<img src="img/soomgo/img_icon_rightarrow.svg"/>
	    						<span>서울</span>
	    					</li>
	    				</ol>
	    			</div>
	    			<ul id="main_list" class="">
	    				<li id="list" class="">이사/입주 청소업체</li>
	    				<li id="list" class="">영어 과외</li>
	    				<li id="list" class="">에어컨 설치 및 수리</li>
	    				<li id="list" class="">원룸/소형 이사</li>
	    				<li id="list" class="">도배 시공</li>
	    				<li id="list" class="">에어컨 청소</li>
	    				<li id="list" class="">퍼스널트레이닝(PT)</li>
	    				<li id="list" class="">용달/화물 운송</li>
	    				<li id="list" class="">국내 이사</li>
	    				<li id="list" class="">욕실/화장실 리모델링</li>
	    				<li id="list" class="">정리수납 컨설팅</li>
	    				<li id="list" class="">도배장판 시공</li>
	    				<li id="list" class="">거주 청소업체</li>
	    				<li id="list" class="">폐기물 처리</li>
	    				<li id="list" class="">집 인테리어</li>
	    				<li id="list" class="">전기배선 설치 및 수리</li>
	    				<li id="list" class="">수학 과외</li>
	    				<li id="list" class="">싱크대 교체</li>
	    				<li id="list" class="">인테리어필름 시공</li>
	    				<li id="list" class="">가정이사(투룸 이상)</li>
	    				<li id="list" class="">세탁기 청소</li>
	    				<li id="list" class="">페인트 시공</li>
	    				<li id="list" class="">문 설치 및 수리</li>
	    				<li id="list" class="">조명 인테리어</li>
	    				<li id="list" class="">상업공간 인테리어</li>
	    				<li id="list" class="">블라인드/커튼 시공</li>
	    				<li id="list" class="">피아노/키보드 레슨</li>
	    				<li id="list" class="">벽걸이TV 설치 및 철거</li>
	    				<li id="list" class="">타일 시공</li>
	    				<li id="list" class="">방송댄스 레슨</li>
	    			</ul>
	    			<a id="main_more" class="">서비스 더보기</a>
	    		</div>
	    	</div>
	    </div>
	    
	    <!-- 하단바 -->
		<div id = "under-box" class="center">
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
		<!-- 하단바 종료 -->
  	 	</div>
	</div>
</body>
</html>