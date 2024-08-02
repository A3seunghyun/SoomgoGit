<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/clear.css">
<link rel="stylesheet" href="css/HeaderUnder.css">
<link rel="stylesheet" href="css/sgEstimatedCost.css">

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
		                    <span style = "font-size : 14px; font-weight: 400; color:rgb(12, 12, 12);">로그인</span>
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
		
		<!-- 중심부  -->
		<div id="body_box" class"">
			<div id="main_body" class"">
				<h1>이사/입주 청소업체 <br/> 예상 견적을 알려드려요</h1>
				<!-- 중심 몸통 + 바깥 몸통 -->
				<div id="content_box" class"">
					<!-- 중심 몸통  -->
					<div id="content_body" class"">
						<!-- 예상 견적  -->
						<article id="article1">
							<div id="main_infor" class"">
								<!-- 평균 서비스 가격 부분 -->
								<section>
									<h2>종합 가격 정보</h2>
									<div id="price_infor" class"">
										<div class"">
											<!-- 가격 상단 - 평균  -->
											<div id="price_top">
												<span>평균</span>
												<!-- 평균금액수치 표시부분 -->
												<strong id="avg_price">
													<span id="price_tf">
														<!-- 표시 금액  -->
														<span id="price_true">28만</span>
														<!-- 가려지는 금액 -->
														<span id="price_false"></span>
													</span>원
												</strong>
											</div>
											<!-- 가격 하단 - 최고최저 -->
											<div id="price_bot">
												최저
												<span>21<!-- -->만원</span>
												<span>~</span>
												최고
												<span>34<!-- -->만원</span>
											</div>
										</div>
										<img src="img/soomgo/img_icon_calculator.webp"/>
									</div>
								</section>
								<!-- 누적 서비스 정보 부분 -->
								<section id="request_infor">
									<!-- 누적 견적요청 -->
									<div id="request_sec" class="r_sec">
										<h4 class="text_sec">누적 견적요청</h4>1,813,909<!-- -->건	
									</div>
									<!-- 중앙|분리대 -->
									<div id="m_sec"></div>
									<!-- 활동고수 -->
									<div id="gosu_sec" class="r_sec">
										<h4 class="text_sec">활동고수</h4>18,621<!-- -->명	
									</div>
								</section>
							</div>
							<section id="textbox1">
								<h2>이사/입주 청소업체<!--  -->
								비용은 어떻게 되나요?</h2>
								<p>
								이사/입주 청소 업체는 평수 당 견적이 달라집니다.
								숨고 내에서 거래되는 이사/입주 청소 업체의 평균 비용은 280,000원,
								최저 비용은 210,000원이고 최고 비용은 340,000원입니다.
								</p>
								<p>
								예상 견적은 숨고에서 고수가 책정하는 견적 데이터를 기반으로 산출되었습니다.
								고객님의 서비스 조건과 상황에 따라 상담 시 금액이 달라질 수 있어요.
								</p>
							</section>
						<!-- article1 종료 -->
						</article>
						<article id="article2">
							<h2 class="h2_arti">이사/입주 청소업체<!-- -->
							비용이 다양한 이유</h2>
							<div>
								<h3>전용면적에 따라</h3>
								<p>
								이사, 입주 청소 비용은 면적에 따라 결정됩니다. 평수가 클수록 견적이 높아지는 것이 당연하겠죠? 일반적으로 말하는 평수는 계단, 복도, 엘리베이터 등 공용공간 면적이 포함된 것이므로, 이사, 입주청소 비용을 산정할 때에는 전용면적을 기준으로 상담을 진행하세요.
								</p>
							</div>
							<div>
								<h3>공간 구성에 따라</h3>
								<p>
								같은 평수라도 공간의 구성에 따라 견적이 달라집니다. 방이나 화장실, 베란다의 갯수가 많거나, 보조주방이 있다면 비용이 더 높아져요. 화장실이나 주방, 베란다 등은 오염 물질이 많아 청소 시간이 더 오래 걸리기 때문입니다. 이사, 입주 청소 전문 고수와 상담할 때 구체적으로 공간 구성을 설명해주세요. 구체적인 견적서를 받을 수 있을 거예요.
								</p>
							</div>
							<div>
								<h3>추가 서비스에 따라</h3>
								<p>
								이사 청소, 입주청소 외에 추가로 원하는 서비스가 있나요? 업체에 따라 에어컨이나 벽걸이 TV 서비스를 제공하는 경우도 있습니다. 비용이 추가되므로 전문가와 미리 상의해보세요. 신축 건물로 입주한다면 새집증후군 제거 서비스를 추가하는 것을 추천합니다. 이외에도 많은 분들이 정리수납 컨설팅, 세탁기 청소, 냉장고 청소, 매트리스 청소를 숨고에서 함께 신청 진행하고 있습니다.
								</p>
							</div>
						<!-- article2 종료 -->
						</article>
						<article id="article3">
							<h2 class="h2_arti">숨고 고객의 이사/입주 청소업체 후기</h2>
							<div>
								<img id="art3_img1" src="img/soomgo/img_icon_quote.webp"/>
								<p>
								14년 된 아파트 입주청소 진행했습니다. 14년 묵은 찌든 때랑 먼지가 뒤섞여 있어 엉망진창이었어요. 숨고 이사 입주 청소 고수님 세 분이 오셔서 꼼꼼히 현장 확인하고, 깨끗이 청소해주셨습니다. 창틀에 먼지가 너무 많아서 움직이지 않을 정도였는데 이젠 잘 여닫기네요ㅎㅎ 정말 힘든 이사 청소였을텐데 친절하게 청소 진행해주셔서 감사합니다. 
								</p>
								<img id="art3_img2" src="img/soomgo/img_people_face_profiles.webp"/>
							</div>
						<!-- article3 종료 -->
						</article>
						<article id="article4">
							<h2 class="h2_arti">여러 전문가에게 견적을 받으면 좋은 점
							</h2>
							<p>고객님의 상황, 전문가의 경력 등에 따라 견적은 달라질 수 있어요. 고객님의 조건에 딱 맞는 견적이 궁금하신가요? 그럼 여러 고수에게 견적을 많이 받아보시는 걸 추천드려요.</p>
							<div><img src="img/soomgo/img_click_to_provider_quotation.webp"/></div>
							<p>돈 내고 이사 입주 청소 서비스를 받았는데 만족스럽지 못한 경험이 있나요? 숨고에서 1분 요청서 보내고, 다양한 이사 입주 청소 고수들과 상담해보세요. 이사 청소, 입주 청소, 원룸 청소 등 내게 딱 맞는 이사 입주 청소 업체를 만날 수 있을 거예요. 숨은 고수와 함께라면 만족스러운 이사 입주 청소는 문제 없습니다!</p>
						<!-- article4 종료 -->
						</article>
						<article id="article5">
							<h2 class="h2_arti">숨고에서 이사/입주 청소업체 견적 받는 방법</h2>
							<ol id="list_art5">
								<li>
									<div>
										<div class="circle_num">1</div>
										<div class="stick"></div>
									</div>
									<div>
										<h3>견적 요청하기</h3>
										<p>원하는 조건을 상세히 적어주세요.자세할수록 정확한 견적을 받을 수 있어요.</p>
									</div>
								</li>
								<li>
									<div>
										<div class="circle_num">2</div>
										<div class="stick"></div>
									</div>
									<div>
										<h3>견적 받기</h3>
										<p>조건에 딱 맞는 고수들이 고객님께 직접 견적을 보내드려요.</p>
									</div>
								</li>
								<li>
									<div>
										<div class="circle_num">3</div>
										<div class="stick"></div>
									</div>
									<div>
										<h3>상담하기</h3>
										<p>원하는 고수와 채팅/전화를 통해 서비스 일정, 상세한 가격을 조율해요.</p>
									</div>
								</li>
								<li>
									<div>
										<div class="circle_num">4</div>
									</div>
									<div>
										<h3>고용하기</h3>
										<p>숨고페이 안전결제로 거래하고, 협의된 날짜에 서비스를 받아요.</p>
									</div>
								</li>
							</ol>
						<!-- article5 종료 -->
						</article>
						<article id="article6">
							<h2 class="h2_arti">이사/입주 <!-- -->청소업체 연관 서비스</h2>
							<div id="similar_ser" class"">
								<a href="">
									<img src="img/soomgo/service/movcln/img_movcln_1room.webp"/>
									<p>원룸/소형 이사</p>
								</a>
								<a href="">
									<img src="img/soomgo/service/movcln/img_movcln_inkorea.webp"/>
									<p>국내 이사</p>
								</a>
								<a href="">
									<img src="img/soomgo/service/movcln/img_movcln_2room.webp"/>
									<p>가정이사(투룸 이상)</p>
								</a>
								<a href="">
									<img src="img/soomgo/service/movcln/img_movcln_wallpapering.webp"/>
									<p>도배 시공</p>
								</a>
							</div>
						<!-- article6 종료 -->
						</article>
						<article id="article7">
							<h2 class="h2_arti">다른<!-- --> 청소 업체 <!-- -->예상 견적 알아보기</h2>
							<ul id="another_ser">
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_disinfection.webp"/>
										<p>방역소독</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_outcompressor.webp"/>
										<p>실외기 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_premove.webp"/>
										<p>입주사전점검 대행</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_washingmac.webp"/>
										<p>세탁기 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_housesyndrome.webp"/>
										<p>새집/헌집증후군 시공</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_refrigator.webp"/>
										<p>냉장고 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_radon.webp"/>
										<p>라돈저감 시공</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_homeappliance.webp"/>
										<p>가전제품 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_leavingcln.webp"/>
										<p>거주 청소업체</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_furniturecln.webp"/>
										<p>가구 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_officecln.webp"/>
										<p>사무실/상업공간 청소업체</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_sofacln.webp"/>
										<p>소파 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_airconcln.webp"/>
										<p>에어컨 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_bedcln.webp"/>
										<p>침대/매트리스 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_systemairconcln.webp"/>
										<p>시스템에어컨 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_carpetcln.webp"/>
										<p>카페트 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_heatercln.webp"/>
										<p>온풍기/냉난방기 청소</p>
									</a>
								</li>
								<li>
									<a href="">
										<img src="img/soomgo/service/movcln/img_movcln_blinds.webp"/>
										<p>줄눈 시공</p>
									</a>
								</li>
							</ul>
						<!-- article7 종료 -->
						</article>
					</div>
					<!-- 바깥 몸통(사이드 버튼) -->
					<div id="side_box" class="">
						<h2>전문가가 보내는 <br/> 맞춤 견적을 받아보세요! </h2>
						<a><button id="side_bnt">
							무료 견적 받기
						</button></a>
					</div>
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

  	 	 </div>
	</div>	
		
</body>
</html>