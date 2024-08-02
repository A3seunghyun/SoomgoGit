<%@page import="dao.EstimateOptionContentDao"%>
<%@page import="dto.EstimateOptionContentDto"%>
<%@page import="dao.EstimateQuestionDao"%>
<%@page import="dao.EstimateOptionDao"%>
<%@page import="dto.EstimateOptionDto"%>
<%@page import="dto.EstimateQuestionDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.EstimateServiceDto"%>
<%@page import="dao.EstimateServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	int serviceIdx = 19;
	try{
		serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
		
	
	} catch(Exception e){
		
	}
	//serviceDto, QuestionDao, OptionDao
	EstimateServiceDto sDto = (EstimateServiceDto) session.getAttribute("sDto");	
	EstimateQuestionDao qDao = new EstimateQuestionDao();	 
	EstimateOptionDao oDao = new EstimateOptionDao();
	EstimateOptionContentDao ocDao = new EstimateOptionContentDao();
	// serviceIdx에 해당하는 질문 list
	ArrayList<EstimateQuestionDto> listQuestion = (ArrayList<EstimateQuestionDto>)session.getAttribute("listQuestion");
	// serviceIdx에 해당하는 선택지 list
	ArrayList<EstimateOptionDto> listOption = (ArrayList<EstimateOptionDto>)session.getAttribute("listOption");	
	// getOptionContentByMultiIdx(serviceIdx, requestIdx);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sgRequest</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/HeaderUnder.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/esclear.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sgRequestSelect.css"/>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/js/sgRequestSelect.js"></script>

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
	<!-- 상단바 end -->
	<!-- 중심구조 start -->
	<div id="main_body" class="">
		<!-- 서비스 헤더 start-->
		<section id="header_container" class="">
			<!-- 서비스 -->
			<div id="title_wrapper" class="">
				<span class="form_title"><h1><%=sDto.getTitle()%></h1></span>
				<button class="info_button btn">
					<img src="img/soomgo/img_icon_bang.PNG"/>
				</button>
			</div>
			<!-- 진행도 -->
			<div id="progress_wrapper" class="">
				<progress id="progress" value="0" min="0" max="100"></progress>
				<p id="progress_percent">0%</p>
			</div>
		</section>
		<!-- 서비스 헤더 end -->
		<!-- 견적요청 start -->
		<div id="form_wrapper" class="">
			<ul class="form_massage">
				<li id="service_infor_message">
					<!-- 정보 message -->
					<div class="message_info message">
						<p class="content">
							몇 가지 정보만 알려주시면<br/>
							<span class="bold">평균 4개 이상</span>의 견적을 받을 수 있어요.
						</p>
					</div>
				<li>
				<!-- 1번 질문 -->
				<%
					int listSize = listQuestion.size();
									for(EstimateQuestionDto qDto : listQuestion) {
				%>
				<li id="question_<%=qDto.getRequestIdx()-1%>" class="questions message_wrapper">
					<div class=" message">
						<p class="content title"><span><%=qDto.getContents()%></span></p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
							    <!-- 선택지0 -->
							    <%
							        int currentRequestIdx = qDto.getRequestIdx();
							        ArrayList<EstimateOptionContentDto> ocList = ocDao.getOptionContentByMultiIdx(serviceIdx, currentRequestIdx);
							        int firstOptionType = ocList.get(0).getOptionType();    
							        if (firstOptionType <= 4) { // answer_wrapper 밑의 ul 추가 위해 첫 optionType 구분
							    %>
							        <ul>
							            <%
							                for (EstimateOptionContentDto ocDto : ocList) {
							                    int oType = ocDto.getOptionType();
							                    int numberIdx = ocDto.getOptionNumber() - 1;
							                    String[] ocContent = ocDto.getContents().split("\\(");
							                    switch (oType) {
							                        case 1: // checkbox_
							            %>
							                        <li id="checkbox_wrapper_<%= numberIdx %>" class="answer type<%= oType %>">
							                            <div>
							                                <input id="checkbox_<%= numberIdx %>" type="checkbox" class="input_checkbox" value="포장이사"/>
							                                <label for="checkbox_<%= numberIdx %>" class="checkbox_label">
							                                    <div class="checkbox_icon">
							                                        <img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
							                                    </div>
							                                    <div class="text_area">
							                                        <div class="text">
							                                            <%= ocContent[0] %>
							                                            <span style="display: none;">(고수 미제공)</span>
							                                        </div>
							                                        <div class="text_comment"><%= ocContent[1].replaceAll("\\)", "") %></div>
							                                    </div>
							                                </label>
							                            </div>
							                        </li>
							                        <%
							                            break;
							                        case 2: // checkboxWithText
							                            // Implement case 2 logic here
							                            break;
							                        case 3: // radio
							                        %>
							                        <!-- 선택지 0 -->
							                        <li id="radio_wrapper_<%= numberIdx %>" class="answer radio_answer type<%= oType %>">
							                            <div class="radio_wrapper">
							                                <input id="radio_<%= numberIdx %>" type="radio" class="input_radio" value="네"/>
							                                <label for="radio_<%= numberIdx %>" class="circle_label">
							                                    <div class="icon_circle radio_icon">
							                                        <img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
							                                    </div> 
							                                    <div class="text_area">
							                                        <div class="text checked">
							                                            <%= ocContent[0] %>
							                                            <span style="display:none;">(고수 미제공)</span>
							                                        </div>
							                                    </div>
							                                </label>
							                            </div>
							                        </li>            
							                        <%
							                            break;
							                        case 4: // radioWithText
							                            // Implement case 4 logic here
							                            break;
							                        default:
							                            oType = ocDto.getOptionType();
							                        %>
							                            <div>오류 ! --<%= oType %>-- 현재 oType</div>
							                        <%
							                            break;
							                    }
							                }
							            %>
							        </ul>
							        <%
							        } else { // ul이 없는 경우
							            for (EstimateOptionContentDto ocDto : ocList) {
							                int oType = ocDto.getOptionType();
							                int numberIdx = ocDto.getOptionNumber() - 1;
							                switch (oType) {
							                    case 5: // textarea
							                    %>
							                    <div class="text_wrapper text_field_wrapper">
							                        <textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_field"></textarea>
							                        <p class="validation">
							                            <span class="input_length">0</span>/255자
							                        </p>
							                    </div>
							                    <%
							                        break;
							                    case 6: // dateButton
							                        // Implement case 6 logic here
							                        break;
							                    case 7: // townButton
							                        // Implement case 7 logic here
							                        break;
							                    case 8: // image
							                    %>
							                    <div class="form_wrapper">
							                        <div id="img_card_0" class="upload_img_card">
							                            <div class="image_wrapper">
							                                <div class="image_thumbnail_wrapper">
							                                    <img src="img/soomgo/img_gosuprof_1.webp" class="img_thumbnail"/>
							                                </div>
							                                <div class="text_form">
							                                    <textarea placeholder="사진을 설명해주세요.(선택)" class="input_text form_control text_length" rows="2" wrap="soft" maxlength="100"></textarea>
							                                </div>
							                            </div>
							                            <div class="text_footer">
							                                <span class="input_length_text">
							                                    <span class="input_length">0</span><span>/100자</span>
							                                </span>
							                                <button class="delete_btn">삭제</button>
							                            </div>    
							                        </div>
							                        <input id="file_input_11" class="file_input" type="file" accept="image/*">
							                        <input name="request_picture" class="file_input">
							                        <label for="file_input_11" class="upload_label">
							                            <button class="upload_btn">
							                                <div class="img_plus">
							                                    <img src="img/soomgo/img_icon_plus_black.PNG">
							                                </div>
							                                사진추가
							                            </button>
							                        </label>
							                    </div>
							                    <%
							                        break;
							                    case 9: // loginOrEndding
							                    %>
							                    <div class="button_wrapper login_btn">
							                        <button class="btn btn_kakao btn_social">
							                            <img src="img/soomgo/img_icon_kakao.svg">
							                            <span>카카오로 시작하기</span>
							                        </button>
							                        <button class="btn btn_naver btn_social">
							                            <img src="img/soomgo/img_icon_naver_white.svg">
							                            <span>네이버로 시작하기</span>
							                        </button>
							                        <button class="btn btn_sg">이메일로 시작하기</button>
							                    </div>
							                    <%
							                        break;
							                    case 10: // countButton
							                        // Implement case 10 logic here
							                        break;
							                    default:
							                    %>
							                    <div>
							                        옵션 타입 오류 : 옵션--<%= oType %>--으로 잡힘 
							                    </div>
							                    <%
							                        break;
							                }
							            } // for(OptionContentDto ocDto : ocList)
							        }
							        %>
							    <!-- 선택지0 end -->
							</div>

							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<%
					}	// for(QuestionDto qDto : listQuestion)
				%>
				<li id="question_0" class="questions message_wrapper">
					<div class=" message">
						<p class="content title"><span>어떤 서비스를 원하시나요?</span></p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"	/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														포장이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고수가 전부 포장 및 정리/귀중품 제외</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														반포장이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고수와 함께 포장/고수는 큰 짐 배치만</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon"> 
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														일반이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">고객이 전부 포장 및 정리/고수는 짐 운반만</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														보관이사
														<span style="display: none;">(고수 미제공)</span>
													</div>
													<div class="text_comment">이삿짐 보관 후 입주일에 맞춰 운반</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 1번질문 end-->
				<!-- 1번답변 -->
				<li id="answer_0" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_0">수정</button>
					</div>
				</li>
				<!-- 1번답변 end-->
				<!-- 2번질문 -->
				<li id="question_1" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">이사 날짜를 선택해주세요.</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<div class="button_wrapper">
									<button class="btn button btn_primary">날짜 선택하기</button>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!-- 2번질문 end -->
				<!-- 2번답변 -->
				<li id="answer_1" class="message_wrapper my_answer answers">
					<div class="answer_message message"> 
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_1">수정</button>
					</div>
				</li>
				<!-- 2번답변 end -->
				<!-- 3번질문 -->
				<li id="question_2" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발 지역을 선택해주세요.</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<div class="button_wrapper">
									<button class="btn button btn_primary">지역 선택</button>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!-- 3번질문 end -->
				<!-- 3번답변 -->
				<li id="answer_2" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_2">수정</button>
					</div>
				</li>
				<!-- 3번답변 end -->
				<!-- 4번질문 -->
				<li id="question_3" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지 층수를 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_field"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 4번질문 end -->
				<!-- 4번답변 -->
				<li id="answer_3" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_3">수정</button>
					</div>
				</li>
				<!-- 4번답변 end -->
				<!-- 5번질문 -->
				<li id="question_4" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지에 엘레베이터가 있나요?</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<!--선택지 영역-->
								<ul class="pick_answer">
									<!-- 선택지 1 -->
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														네.
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<!-- 선택지 2 -->					
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													아니오.
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 5번질문 end -->
				<!-- 5번답변 -->
				<li id="answer_4" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_4">수정</button>
					</div>
				</li>
				<!-- 5번답변 end -->
				<!-- 6번 질문 -->
				<li id="question_5" class="questions message_wrapper">
					<div class=" message">
						<p class="content title">
							<span>옮길 가전 제품을 선택해주세요.</span>
							<span class="subtitle"><br>내용과 다르면 비용이 추가될 수 있어요.</span>
						</p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														없음
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														냉장고
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														김치냉장고
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div> 
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														세탁기/건조기
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
									<!-- 선택지4 -->
									<li id="checkbox_wrapper_4" class="answer">
										<div>
											<input id="checkbox_4" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_4" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														에어컨
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지4 end-->
									<!-- 선택지5 -->
									<li id="checkbox_wrapper_5" class="answer">
										<div>
											<input id="checkbox_5" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_5" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														TV/모니터
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지5 end-->
									<!-- 선택지6 -->
									<li id="checkbox_wrapper_6" class="answer">
										<div>
											<input id="checkbox_6" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_6" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														PC/노트북
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지6 end-->
									<!-- 선택지7 -->
									<li id="checkbox_wrapper_7" class="answer">
										<div>
											<input id="checkbox_7" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_7" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														전자레인지
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지7 end-->
									<!-- 선택지8 -->
									<li id="checkbox_wrapper_8" class="answer">
										<div>
											<input id="checkbox_8" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_8" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														정수기
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지8 end-->
									<!-- 선택지9 -->
									<li id="checkbox_wrapper_9" class="answer">
										<div>
											<input id="checkbox_9" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_9" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														비데
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지9 end-->
									<!-- 선택지10 -->
									<li id="checkbox_wrapper_10" class="answer">
										<div>
											<input id="checkbox_10" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_10" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														기타
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지10 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 6번 질문 end-->
				<!-- 6번답변 -->
				<li id="answer_5" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"></span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_5">수정</button>
					</div>
				</li>
				<!-- 6번답변 end -->
				<!-- 7번 질문 -->
				<li id="question_6" class="questions message_wrapper">
					<div class=" message">
						<p class="content title">
							<span>옮길 가구를 선택해주세요.</span>
							<span class="subtitle"><br>내용과 다르면 비용이 추가될 수 있어요.</span>
						</p>
						<div class="answer_sheet checkbox">
							<!-- 선택지 영역 -->
							<div class="answer_wrapper">
								<ul>
									<!-- 선택지0 -->
									<li id="checkbox_wrapper_0" class="answer">
										<div>
											<input id="checkbox_0" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_0" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														없음
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지0 end-->
									<!-- 선택지1 -->
									<li id="checkbox_wrapper_1" class="answer">
										<div>
											<input id="checkbox_1" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_1" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														침대
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지1 end-->
									<!-- 선택지2 -->
									<li id="checkbox_wrapper_2" class="answer">
										<div>
											<input id="checkbox_2" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_2" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														소파
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지2 end-->
									<!-- 선택지3 -->
									<li id="checkbox_wrapper_3" class="answer">
										<div>
											<input id="checkbox_3" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_3" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														책상/테이블
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지3 end-->
									<!-- 선택지4 -->
									<li id="checkbox_wrapper_4" class="answer">
										<div>
											<input id="checkbox_4" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_4" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														의자
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지4 end-->
									<!-- 선택지5 -->
									<li id="checkbox_wrapper_5" class="answer">
										<div>
											<input id="checkbox_5" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_5" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														수납장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지5 end-->
									<!-- 선택지6 -->
									<li id="checkbox_wrapper_6" class="answer">
										<div>
											<input id="checkbox_6" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_6" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														책장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지6 end-->
									<!-- 선택지7 -->
									<li id="checkbox_wrapper_7" class="answer">
										<div>
											<input id="checkbox_7" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_7" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														진열장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지7 end-->
									<!-- 선택지8 -->
									<li id="checkbox_wrapper_8" class="answer">
										<div>
											<input id="checkbox_8" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_8" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														옷장
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지8 end-->
									<!-- 선택지9 -->
									<li id="checkbox_wrapper_9" class="answer">
										<div>
											<input id="checkbox_9" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_9" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														화장대
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지9 end-->
									<!-- 선택지10 -->
									<li id="checkbox_wrapper_10" class="answer">
										<div>
											<input id="checkbox_10" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_10" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														피아노
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지10 end-->
									<!-- 선택지11 -->
									<li id="checkbox_wrapper_11" class="answer">
										<div>
											<input id="checkbox_11" type="checkbox" class="input_checkbox" value="포장이사"/>
											<label for="checkbox_11" class="checkbox_label">
												<div class="checkbox_icon">
													<img src="img/soomgo/img_icon_checkbox_none.PNG" class="box_icon"/>
												</div>
												<div class="text_area">
													<div class="text">
														기타
														<span style="display: none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>
									<!-- 선택지11 end-->
								</ul>
							</div>
							<!-- 선택지 영역 end-->
							<!-- 답변 저장 버튼 -->
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit disable btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 7번 질문 end-->
				<!-- 7번답변 -->
				<li id="answer_6" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_6">수정</button>
					</div>
				</li>
				<!-- 7번답변 end -->
				<!-- 8번질문 -->
				<li id="question_7" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">이삿짐 사진이 있으면 첨부해주세요.</span>
							<span class="subtitle"><br>더 정확한 견적을 받을 수 있어요.	</span>
						</p>
						<div class="answer_sheet">
							<div class="answer_wrapper">
								<div class="form_wrapper">
									<div imd="img_card_0" class="upload_img_card">
										<div class="image_wrapper">
											<div class="image_thumbnail_wrapper">
												<img src="img/soomgo/img_gosuprof_1.webp" class="img_thumbnail"/>
											</div>
											<div class="text_form">
												<textarea placeholder="사진을 설명해주세요.(선택)" class="input_text form_control text_length" rows="2" wrap="soft" maxlength="100"></textarea>
											</div>
										</div>
										<div class="text_footer">
											<span class="input_length_text">
												<span class="input_length">0</span><span>/100자</span>
											</span>
											<button class="delete_btn"">삭제</button>
										</div>	
									</div>
									<input id="file_input_11" class="file_input" type="file" accept="image/*">
									<input nane="request_picture" class="file_input">
									<label for="file_input_11" class="uplopad_label">
										<button class="upload_btn">
											<div class="img_plus"">
												<img src="img/soomgo/img_icon_plus_black.PNG">
											</div>
											사진추가
										</button>
									</label>
								</div>
							</div>
							<div class="btn_wrapper">
								<button class="btn skip btn_none">건너뛰기</button>
								<button class="btn btn_submit btn_primary ">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 8번질문 end -->
				<!-- 8번답변 -->
				<li id="answer_7" class="message_wrapper my_answer answers">
					<div class="answer_image">
						<img src="img/soomgo/img_gosuprof_1.webp" alt="첨부이미지-0" class="my_image">
					</div>
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_7">수정</button>
					</div>
				</li>
				<!-- 8번답변 end -->
				<!-- 9번질문 -->
				<li id="question_8" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">도착 지역을 선택해주세요.</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<div class="button_wrapper">
									<button class="btn button btn_primary">지역 선택</button>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!-- 9번질문 end -->
				<!-- 9번답변 -->
				<li id="answer_8" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_8">수정</button>
					</div>
				</li>
				<!-- 9번답변 end -->
				<!-- 10번질문 -->
				<li id="question_9" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">도착지 층수를 입력해주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.10층" maxlength="255" class="textarea_field text_length" name="floor_depart"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 10번질문 end -->
				<!-- 10번답변 -->
				<li id="answer_9" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_9">수정</button>
					</div>
				</li>
				<!-- 10번답변 end -->
				<!-- 11번질문 -->
				<li id="question_10" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">출발지에 엘레베이터가 있나요?</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<!--선택지 영역-->
								<ul class="pick_answer">
									<!-- 선택지 1 -->
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														네.
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<!-- 선택지 2 -->					
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													아니오.
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 11번질문 end -->
				<!-- 11번답변 -->
				<li id="answer_10" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_10">수정</button>
					</div>
				</li>
				<!-- 11번답변 end -->
				<!-- 12번질문 -->
				<li id="question_11" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">도착지 실평수와 거주 인원수를 알려주세요.</span>
						</p>
						<div class="answer_sheet text_field">
							<div class="answer_wrapper">
								<div class="text_wrapper text_field_wrapper">
									<textarea placeholder="ex.15평 / 2명" maxlength="255" class="textarea_field text_length" name="room_area"></textarea>
									<p class="validation">
										<span class="input_length">0</span>/255자
									</p>
								</div>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary disable">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 12번질문 end -->
				<!-- 12번답변 -->
				<li id="answer_11" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_11">수정</button>
					</div>
				</li>
				<!-- 12번답변 end -->
				<!-- 13번질문 -->
				<li id="question_12" class="questions message_wrapper">
					<div class="message">
						<p class="content">
							<span class="title">이사 관련 요청사항을 알려주세요!</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<!--선택지 영역-->
								<ul class="pick_answer">
									<!-- 선택지 1 -->
									<li id="radio_wrapper_0" class="answer radio_answer">
										<div class="radio_wrapper">
											<input id="radio_0" type="radio" class="input_radio" value="네"/>
											<label for="radio_0" class="circle_label">
												<div class="icon_circle radio_icon">
													<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
												</div> 
												<div class="text_area">
													<div class="text checked">
														고수와 상담 시 논의할게요
														<span style="display:none;">(고수 미제공)</span>
													</div>
												</div>
											</label>
										</div>
									</li>				
									<!-- 선택지 2 -->					
									<li id="radio_wrapper_1" class="answer radio_answer">
										<input id="radio_1" type="radio" class="input_radio" value="아니오"/>
										<label for="radio_1" class="circle_label">
											<div class="icon_circle radio_icon">
												<img src="img/soomgo/img_icon_radio_none.PNG" class="circle_icon"/>
											</div> 
											<div class="text_area">
												<div class="text checked">
													지금 작성할게요
													<span style="display:none;">(고수 미제공)</span>
												</div>
											</div>
										</label>
										<div class="extra_wrapper text">
											<textarea placeholder="세부 짐 항목, 특별 요청 등 자유롭게 남겨주세요." rows="2" wrap="soft" class="form_control text_length" maxlength="255"></textarea>
											<span class="text_counter">
												<span class="input_length">0</span>/255자
											</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="button_wrapper">
								<button class="btn button btn_submit btn_primary">다음</button>
							</div>
						</div>
					</div>
				</li>
				<!-- 13번질문 end -->
				<!-- 13번답변 -->
				<li id="answer_12" class="message_wrapper my_answer answers">
					<div class="answer_message message">
						<p class="content">
							<span class="title answer_text"> <!-- 답변입력--> </span>
						</p>
					</div>
					<div class="edit_wrapper">
						<button class="btn edit btn_none answer_12">수정</button>
					</div>
				</li>
				<!-- 13번답변 end -->
				<!-- (마지막 질문)로그인박스-->
				<li id="last_login">
					<div class="message">
						<p class="content">
							<span class="title">로그인하고 무료견적을 받아보세요!</span>
						</p>
						<div class="answer_sheet">
							<div class=answer_wrapper>
								<div class="button_wrapper login_btn">
									<button class="btn btn_kakao btn_social">
										<img src="img/soomgo/img_icon_kakao.svg">
										<span>카카오로 시작하기</span>
									</button>
									<button class="btn btn_naver btn_social">
										<img src="img/soomgo/img_icon_naver_white.svg">
										<span>네이버로 시작하기</span>
									</button>
									<button class="btn btn_sg">이메일로 시작하기</button>
								</div>
							</div>
						</div>
					</div>
				</li>
				<!--로그인박스 end-->
			</ul>
		</div>
		<!-- 견적요청 end -->
		<!-- modal 서비스안내 -->
		<div class="modal_wrapper modal_hidden">
			<div class="service_info">
				<div class="modal_header">
					<h2 class="title">서비스안내</h2>
					<button class="btn modal_close_btn">
						<img src="img/soomgo/img_icon_exit.PNG" class="close_img"/>
					</button>
				</div>
				<div class="modal_content">
					<div class="request_service_info">
						<div class="service_section">
							<h2 class="service_name">가정이사(투룸 이상)</h2>
							<div class="review_rate">
								<ul class="star_rate">
									<li><img src="img/soomgo/img_icon_star_full.svg"></li>
									<li><img src="img/soomgo/img_icon_star_full.svg"></li>
									<li><img src="img/soomgo/img_icon_star_full.svg"></li>
									<li><img src="img/soomgo/img_icon_star_full.svg"></li>
									<li><img src="img/soomgo/img_icon_star_half.svg"></li>
								</ul>
								<span class="rate">4.8</span>
							</div>
							<div class="service_data">
								<div class="data provider">
									<div class="data_wrapper_left">
										<p class="count">6,083</p>
										<h3 class="title">활동 고수</h3>
									</div>
								</div>
								<span class="divider""></span>
								<div class="data request">
									<p class="count">314,197</p>
									<h3 class="title">누적 요청서</h3>
								</div>
								<span class="divider""></span>
								<div class="data review">
									<div class="data_wrapper_right">
										<p class="count">9,934</p>
										<h3 class="title">리뷰 수</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="discription_section">
							<h2 class="title">가정이사(투룸 이상) 고수를 만나보세요!</h2>
							<p class="discription">이삿짐센터는 많은데, 어떤 업체를 선택해야 할지 고민되시죠? 다양한 숨고 이사 후기를 비교해보세요.
								새벽이사부터 이삿짐 단기보관까지 원하는 이사 서비스를 받아보실 수 있어요. 요청서를 작성하시고, 합리적인 가격으로 쉽고 빠르게 가정 이사를 진행해보세요!
							</p>
						</div>
					</div>
					<div class="request_provider_list">
						<h2 class="title">가정이사(투룸 이상) 인기 고수</h2>
						<p class="discription">6,083명의 가정이사(투룸 이상) 고수가 기다리고 있어요!</p>
						<ul class="pro_list">
							<li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="img/soomgo/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="img/soomgo/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="img/soomgo/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="img/soomgo/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="img/soomgo/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="img/soomgo/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li><li class="pro_item">
								<div class="profile_section">
									<div class="pro_profile">
										<div class="user_profile_image profile_image">
											<img src="img/soomgo/img_gosuprof_1.webp"/>
										</div>
										<div class="pro_name">⭐고객평가1위스마트친절이사</div>
									</div>
									<div class="pro_introduction">
										⭐고객평가1위스마트친절이사 윤재근 고수의 가정이사 (투룸 이상), 원룸/소형 이사서비스.
									</div>
								</div>
								<div class="review_section">
									<div class="pro_rate">
										<div class="rate_icon"><img src="img/soomgo/img_icon_star_full.svg"></div>
										<span class="review_rate">5</span>
										<span class="review_count">(388)</span>
									</div>
									<p class="review">
										<span class="comment">“작업속도가 빨라서 좋았습니다! 덕분에 빠르게 이사 마칠 수 있었습니다. 감사합니다!”</span>
									</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="request_service_review">
						<h2 class="title">숨고 고객의<br>가정이사(투룸 이상) 후기</h2>
						<div class="update_date">업데이트 2024.06.24</div>
						<ul class="review_list">
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										서러운 전세살이  세번 이용했던 이사업체 중에 가장 신속하고 꼼꼼하고 친절하셨습니다.
										하필 가장 추운날에 이사여서 와주셨던 이모님, 삼촌분들 정말 고생 많으셨습니다. 만족스러운 이사였습니다.
									</div>
								</div>
							</li>
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										서러운 전세살이  세번 이용했던 이사업체 중에 가장 신속하고 꼼꼼하고 친절하셨습니다.
										하필 가장 추운날에 이사여서 와주셨던 이모님, 삼촌분들 정말 고생 많으셨습니다. 만족스러운 이사였습니다.
									</div>
								</div>
							</li>
							<li class="review_item">
								<div class="review_card">
									<div class="reviewer_wrapper"">
										<p class="reviewer_name">김**</p>
										<ul class="star_rate">
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
											<li><img src="img/soomgo/img_icon_star_full.svg"></li>
										</ul>
									</div>
									<div class="review_content"">
										서러운 전세살이  세번 이용했던 이사업체 중에 가장 신속하고 꼼꼼하고 친절하셨습니다.
										하필 가장 추운날에 이사여서 와주셨던 이모님, 삼촌분들 정말 고생 많으셨습니다. 만족스러운 이사였습니다.
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- modal 서비스안내 end-->
	</div>
	<!-- 중심구조 end -->
</div>
</body>
</html>