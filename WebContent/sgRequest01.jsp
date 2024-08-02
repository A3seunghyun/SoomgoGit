<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>견적요청</title>
	<link rel="stylesheet" href="css/SgRequest01.css"/>
	
</head>
<body>
	<div class="border top_header"></div>
	<div class=" main" id="mainA">
		<div class="" id="categories">
			<div class=" header">
				<div class=" title_categories">
					<h1 class=" title_ask">견적요청</h1>
				</div>
				<div class=" category_container">
					<ul class=" category_list">
						<li class=" category_item fl" id="mov-cle">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_mov.svg"/>
										</div>
										<span class=" category_name">이사/청소</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="ins-fix">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_ins-fix.svg"/>
										</div>
										<span class=" category_name">설치/수리</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="int">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_int.svg"/>
										</div>
										<span class=" category_name">인테리어</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="out">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_out.svg"/>
										</div>
										<span class=" category_name">외주</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="eve">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_eve.svg"/>
										</div>
										<span class=" category_name">이벤트/뷰티</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="emp-job">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_emp_job.svg"/>
										</div>
										<span class=" category_name">취업/직무</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="tut">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_tut.svg"/>
										</div>
										<span class=" category_name">과외</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="hob-dev">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_hob-dev.svg"/>
										</div>
										<span class=" category_name">취미/자기계발</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="car">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_car.svg"/>
										</div>
										<span class=" category_name">자동차</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="law-fin">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_law-fin.svg"/>
										</div>
										<span class=" category_name">법률/금융</span>
									</div>
								</div>
							</a>
						</li>
						<li class=" category_item fl" id="etc">
							<a class=" router_link">
								<div class=" category_icon">
									<div class=" category_box">
										<div class=" category_img_wrapper">
											<img src="img/soomgo/img_icon_ect.svg"/>
										</div>
										<span class=" category_name">기타</span>
									</div>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class=" content">
				<div class=" navigator fl">
					<ul class=" nav_category_list fl">
						<li class=" nav_list fl" id="mov">
							<button class="nav_button">
								<span>이사</span>
							</button>
						</li>
						<li class=" nav_list fl" id="mov-cle">
							<button class="nav_button">
								<span>입주/집 청소</span>
							</button>
						</li>
						<li class=" nav_list fl" id="fur-cle">
							<button class="nav_button">
								<span>가전/가구 청소</span>
							</button>
						</li>
						<li class=" nav_list fl" id="bus-cle">
							<button class="nav_button">
								<span>사업장 청소</span>
							</button>
						</li>
						<li class=" nav_list fl" id="spe-cle">
							<button class="nav_button">
								<span>특수 청소</span>
							</button>	
						</li>
						<li class=" nav_list fl" id="dem-dis">
							<button class="nav_button">
								<span>철거/폐기</span>
							</button>
						</li>
					</ul>
				</div>
				<div class=" service_list_wrapper fl">
					<ul class=" service_list_container fl">
						<li class=" service_wrapper fl" id="mov">
							<div class=" con_category_title fl">
								<h3>이사</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												가정이사(투룸 이상)
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												국내 이사
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												무진동차량/냉동차량/냉장차량
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												사무실/상업공간 이사
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												원룸/소형 이사
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												용달/화물 운송
											</h4>
										</div>
									</button>
								</li>
							</ul>
						</li>
						<li class=" service_wrapper fl" id="mov-cle">
							<div class=" con_category_title fl">
								<h3>입주/집 청소</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												거주 청소업체
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												곰팡이 제거
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												나노코팅 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												단열/결로 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												라돈저감 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												보일러/수도배관 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												새집/헌집증후군 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												이사/입주 청소업체
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												입주사전점검 대행
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												정리수납 컨설팅
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												줄눈 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												집청소 도우미
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												코킹 시공
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												하수구 청소
											</h4>
										</div>
									</button>
								</li>
							</ul>
						</li>
						<li class=" service_wrapper fl" id="fur-cle">
							<div class=" con_category_title fl">
								<h3>가전/가구 청소</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												가구 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												가전제품 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												냉장고 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												세탁기 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												소파 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												시스템에어컨 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												실외기 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												에어컨 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												온풍기/냉난방기 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												침대/매트리스 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												후드 청소
											</h4>
										</div>
									</button>
								</li>
							</ul>
							
							
						</li>
						<li class=" service_wrapper fl" id="bus-cle">
							<div class=" con_category_title fl">
								<h3>사업장 청소</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												건물내부 청소(바닥/계단/화장실)
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												건물외벽 청소(외벽/유리창)
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												계단/화장실 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												닥트/환풍구 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												바닥 청소(왁스 코팅)
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												사무실/상업공간 청소업체
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												시설/건물 관리
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												업소용 주방기구 판매
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												준공 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												카페트 청소
											</h4>
										</div>
									</button>
								</li>
							</ul>
						</li>
						<li class=" service_wrapper fl" id="spe-cle">
							<div class=" con_category_title fl">
								<h3>특수 청소</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												단체 세탁
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												대기 측정 및 관리
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												물탱크/저수조 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												바퀴벌레 퇴치
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												방역소독
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												벌초/예초
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												비둘기 퇴치
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												수질관리 및 녹조제거
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												악취 제거
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												유품정리/특수청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												침수 복구 및 청소
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												해충방역
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												화재 복구/청소
											</h4>
										</div>
									</button>
								</li>
							</ul>
						</li>
						<li class=" service_wrapper fl" id="dem-dis">
							<div class=" con_category_title fl">
								<h3>철거/폐기</h3>
							</div>
							<ul class=" service_list fl">
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												철거
											</h4>
										</div>
									</button>
								</li>
								<li class=" list_li fl">
									<button>
										<div class=" service_name">
											<h4>
												폐기물 처리
											</h4>
										</div>
									</button>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>