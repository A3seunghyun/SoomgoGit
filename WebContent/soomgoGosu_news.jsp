<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-고수소식</title>
	<link rel="stylesheet" href="css/soomgoGosu_news.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 	
 	<script>
 		 $(function(){
 			$('.service_btn').click(function(){
 				$('#div_service_town_layout').css('display','block');
 				$('#greyscreen_filter').css('display','block');
 				$('#div_service').addClass('active');
 			});
 			$(".town_btn").click(function(){
 				$('#greyscreen_filter').css('display','block');
 				$('#div_town_layout').css('display','block');
 				$('div_town').addClass('active');
 			});
 			$('.x').click(function(){
 					/* x 누르면 검색창에 입력한 text가 초기화됨 */
 				 $('input[type="text"]').val('');
 				 
 				$('#div_service_town_layout').css('display','');
 				$('#greyscreen_filter').css('display','none');
 				$('#div_town_layout').css('display','');
 				$('#greyscreen_filter').css('display','none');
 				$('#div_town').removeClass('active');
 					
				$('.div_category').each(function() {
					 /* 필터 열어서 입력했던 값들 초기화  */
				      if ($(this).find('div').hasClass('arrow-up')) {
				          $(this).find('div').removeClass('arrow-up').addClass('arrow-down');
				      }
				      let name = $(this).text().trim();
				      $(".div_category[for='" + name + "']").css('display','none');
				      $(this).css('background','');
				    });
 			});
 			$('#div_town').click(function(){
 				$('#div_service_town_layout').css('display','none');
 				$('#div_town_layout').css('display','block');
 				$('#div_town2').addClass('active');
 				$('#div_service').removeClass('active');
 			});
 			
 			$("#div_service2").click(function(){
 				/* alert("!!!"); */
 				$('#div_service_town_layout').css('display','block');
 				$('#div_service').addClass('active');
 				$('#div_town2').removeClass('active');
 				$("#div_town_layout").css('display','none');
 			});
 			
 			$('.div_category').click(function(){
 				/* alert("!!"); */
 				if($(this).attr('idx') != undefined) {
 					let name = $(this).text().trim();
 					let len = $(".div_category[for='" + name + "']").length;
 					if(len==0) {
 						$('#greyscreen_filter').css('display','none');
 		 				$('#div_service_town_layout').css('display','none');
 		 				$('.service_btn').css('display','none');
 		 				$('.btn_init').css('display','block');
 		 				let str = '<div class="selected_names fl">' + name + '<img class="service" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIj48cGF0aCBkPSJNMCAxOGgxOFYwSDB6Ii8+PHBhdGggc3Ryb2tlPSIjRkZGIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS41IiBkPSJNMTQuNDM0IDYuNzUxbC01LjQgNS40LTUuNC01LjQiLz48L2c+PC9zdmc+"/></div>';
 		 				$("#div_service_town > div:last-child").before(str);
 					}
 				}
 				if($(this).find('div').hasClass('arrow-down')) {
 					$(this).find('div').removeClass('arrow-down');
 					$(this).find('div').addClass('arrow-up');
 					
 					let name = $(this).text().trim();
 					$(".div_category[for='" + name + "']").css('display','block');
 					$(this).css('background','rgb(242,242,242)');
 				} else if($(this).find('div').hasClass('arrow-up')) {
 					$(this).find('div').removeClass('arrow-up');
 					$(this).find('div').addClass('arrow-down');
 					
 					let name = $(this).text().trim();
 					$(".div_category[for='" + name + "']").css('display','none');
 					$(this).css('background','');
 				}
 				
 				
 			/* 	$('.div_category.level2').click(function(){
 					// 소주제까지 선택시 그레필터, 서비스선택창, 서비스버튼 이 없어지고
	 				$('#greyscreen_filter').css('display','none');
	 				$('#div_service_town_layout').css('display','none');
	 				$('.service_btn').css('display','none');
	 				// 초기화 버튼이 생성
	 				$('.btn_init').css('display','block');
 				}); */
 				
 				
 				$('.div_town').click(function(){
 				// 지역 -> 도시까지 선택시 그레이필터 지역선택창, 지역버튼이 없어짐.
	 				$('#greyscreen_filter').css('display','none');
	 				$('#div_service_town_layout').css('display','none');
	 				$('.service_btn').css('display','none');
 				});
 				
 			});
 			
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
<!-- -------------------------------------헤더--------------------------------------------------- -->


		<div id="div_layout">
		<div id="div_community">
			<div id="div_header">
				<div id="div_header_inner">
					<div id="div_header_text">커뮤니티</div>
					<div id="div_header_img">
						<div class="text">글쓰기</div>
						<div><img class="inner_img" src="img/숨고글쓰기이미지.png"/>
						</div>
					</div>
				</div>
				<div id="div_category">
					<div class="div_soomgo_text1" > 숨고생활 </div>
					<div class="div_soomgo_text2" > 고수센터 </div>
				</div>
			</div>
			<div id="div_community_layout">
				<div>
					<div class="selected">전체</div>
					<div>질문답변</div>
					<div>고수노하우</div>
					<div>함께해요</div>
					<div>고수소식</div>
					<div>숨고이야기</div>
					<div>고수광장</div>
				</div>
				<div>
					<div id="div_topic" >
						<p>생활 속 궁금했던 모든 것을 물어보고 답해보세요</p>
						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNzIiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA3MiA0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTQyLjY5IDBoMTUuMjI4YzEuNzU3IDAgMy40My4zNDggNC45NTEuOTc3QzY4LjIxMyAzLjAyIDcyIDguMDc0IDcyIDEzLjk5OWMwIDcuMDkyLTUuNDE4IDEzLjA2NS0xMi40NDUgMTMuOTg2LTEuMDIxLjEzNC0xLjkzNy0uNjMxLTEuOTM3LTEuNjM1di0xLjY0NUg0Mi42OWMtNy4wMDggMC0xMi42OS01LjUzLTEyLjY5LTEyLjM1M0MzMCA1LjUzMSAzNS42ODIgMCA0Mi42OSAwIiBmaWxsPSIjODBEQkI0Ii8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNDEgMTEpIiBmaWxsPSIjRkZGIj4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMiIgY3k9IjIiIHI9IjIiLz4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMTAiIGN5PSIyIiByPSIyIi8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjE4IiBjeT0iMiIgcj0iMiIvPgogICAgICAgIDwvZz4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHBhdGggZD0iTTI5LjMxIDEySDE0LjA4MmMtMS43NTcgMC0zLjQzLjM0OC00Ljk1MS45NzdDMy43ODcgMTUuMDIgMCAyMC4wNzQgMCAyNS45OTljMCA3LjA5MiA1LjQxOCAxMy4wNjUgMTIuNDQ1IDEzLjk4NiAxLjAyMS4xMzQgMS45MzctLjYzMSAxLjkzNy0xLjYzNXYtMS42NDVIMjkuMzFjNy4wMDggMCAxMi42OS01LjUzIDEyLjY5LTEyLjM1M0M0MiAxNy41MzEgMzYuMzE4IDEyIDI5LjMxIDEyIiBmaWxsPSIjNDVDNTlCIi8+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNS42NjcgMjIuMjVoLS44OWMtLjk4MSAwLTEuNzc3Ljc4My0xLjc3NyAxLjc1djUuMjVjMCAuOTY3Ljc5NiAxLjc1IDEuNzc4IDEuNzVoLjg4OWMuNDkgMCAuODg5LS4zOTIuODg5LS44NzV2LTdhLjg4Mi44ODIgMCAwIDAtLjg5LS44NzVtMTEuNTU2IDBoLTQuNDQ0bC43MzQtMi43MDZhMS43MzcgMS43MzcgMCAwIDAtLjczOC0xLjg4bC0uNzg3LS41MTdhLjg5Ny44OTcgMCAwIDAtMS4yODguMzM3bC0yLjAwNCA0LjAzOWEzLjQ1NiAzLjQ1NiAwIDAgMC0uMzYxIDEuNTM2djYuMTkxYzAgLjk2Ny43OTUgMS43NSAxLjc3NyAxLjc1aDYuMDQ0Yy44NDcgMCAxLjU3Ny0uNTg5IDEuNzQzLTEuNDA3bDEuMDY3LTUuMjVjLjIyLTEuMDgyLS42MjItMi4wOTMtMS43NDMtMi4wOTMiIGZpbGw9IiMxNTlBNkQiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="/>
					</div>

	<div id="div_service_town">
		<button class="btn_init fl">
			<span>초기화</span>
		</button>
		<button type="button" class="service_btn fl">
			<span>서비스</span>
			<img src="img/숨고서비스화살표.png"/>
		</button>
		<button class="town_btn fl">
			<span >지역</span>
			<img src="img/숨고서비스화살표.png"/>
		</button>
		
<!-- 		<div class="selected_names fl">용준이가 ...<span class="close_x">X</span></div>
		<div class="selected_names fl">전국<span class="close_x">X</span></div> -->
		
		<div style="clear:both;"></div>
	</div>

	<div id="greyscreen_filter"></div>
					
	<div id="div_town_layout" class="scroll ">
		<div id="div_town_header">
			<div id="div_service2" >서비스</div>
			<div id="div_town2" class="active">지역</div> 
			<img class="x" src="img/x.png"/>
		</div>
		<div id="div_town_box">
			<div class="div_town town_text_color" idx="11" >
				전국<div class="arrow-down" ></div>
			</div>
			<div class="div_town" idx="DB에서심어야돼">
				서울<div class="arrow-down"></div>
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				서울 전체
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				강남구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				강동구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				강북구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				강서구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				관악구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				광진구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				구로구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				금천구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				노원구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				도봉구
			</div>
			<div class="div_town level1" for="서울" idx="DB에서심어야돼">
				그 다음은 용이 하자
			</div>
			<div class="div_town" >
				세종<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				강원<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				인천<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				경기<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				충북<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				충남<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				경북<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				대전<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				대구<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				전북<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				경남<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				울산<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				광주<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				부산<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				전남<div class="arrow-down"></div>
			</div>
			<div class="div_town" >
				제주<div class="arrow-down"></div>
			</div>
		</div> 
	</div>	
					
	<div id="div_service_town_layout" class="border">
		<div id="div_service_town_header">
			<div id="div_service" >서비스</div>
			<div id="div_town" >지역</div>
			<img class="x" src="img/x.png"/>
		</div>
		<div id="div_search_service" >
			<div id="div_bottom_line">
				<img  class="img" src="img/서비스검색돋보기.png"/>
				<div id="div_input" class="border">
				<input type="text" placeholder="어떤 분야의 고수를 찾으세요?"/>
				</div>
			</div>	
			<!-- 	*************이사 청소****************	 -->
			<div class="div_category" idx="9999">
				이사/청소<div class="arrow-down"> </div>
			</div>
			<div class="div_category level1" for="이사/청소" idx="9998">
				이사<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				가정이사(투룸이상)
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				국내 이사
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				무진동차량/냉동차량/냉장차량
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				사무실/상업공간 이사
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				원룸/소형 이사
			</div>
			<div class="div_category level2" for="이사" idx="DB에서뽑아서적기">
				용달/화물 운송
			</div>
			
			<div class="div_category level1" for="이사/청소">
				입주/집 청소<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="입주/집 청소">
				거주 청소업체
			</div>
			<div class="div_category level2" for="입주/집 청소">
				곰팡이 제거
			</div>
			<div class="div_category level2" for="입주/집 청소">
				나노코팅 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				단열/결로 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				라돈저감 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				보일러/수도배관 청소
			</div>
			<div class="div_category level2" for="입주/집 청소">
				새집/헌집증후군 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				이사/입주 청소업체
			</div>
			<div class="div_category level2" for="입주/집 청소">
				입주사전점검 대행
			</div>
			<div class="div_category level2" for="입주/집 청소">
				정리수납 컨설팅
			</div>
			<div class="div_category level2" for="입주/집 청소">
				줄눈 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				집청소 도우미
			</div>
			<div class="div_category level2" for="입주/집 청소">
				코킹 시공
			</div>
			<div class="div_category level2" for="입주/집 청소">
				하수구 청소
			</div>
			
			
			<div class="div_category level1" for="이사/청소">
				가전/가구 청소<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				가구 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				가전제품 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				냉장고 청소
			</div>			
			<div class="div_category level2" for="가전/가구 청소">
				세탁기 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				소파 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				시스템에어컨 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				실외기 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				에어컨 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				온풍기/낸난방기 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				침대/매트리스 청소
			</div>
			<div class="div_category level2" for="가전/가구 청소">
				후드 청소
			</div>
			
			
			
			<div class="div_category level1" for="이사/청소">
				사업장 청소<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="사업장 청소">
				건물내부 청소(바닥/계단/화장실)
			</div>
			<div class="div_category level2" for="사업장 청소">
				건물외부 청소(외벽/유리창)
			</div>
			<div class="div_category level2" for="사업장 청소">
				계단/화장실 청소
			</div>
			<div class="div_category level2" for="사업장 청소">
				닥트/환풍구 청소
			</div>
			<div class="div_category level2" for="사업장 청소">
				바닥 청소(왁스 코팅)
			</div>
			<div class="div_category level2" for="사업장 청소">
				사무실/상업공간 청소업체
			</div>
			<div class="div_category level2" for="사업장 청소">
				시설/건물 관리
			</div>
			<div class="div_category level2" for="사업장 청소">
				업소용 주방기구 판매
			</div>
			<div class="div_category level2" for="사업장 청소">
				중공 청소
			</div>
			<div class="div_category level2" for="사업장 청소">
				카페트 청소
			</div>
			
			
			<div class="div_category level1" for="이사/청소">
				특수 청소<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="특수 청소">
				단체 세탁
			</div>
			<div class="div_category level2" for="특수 청소">
				대기 측정 및 관리
			</div>
			<div class="div_category level2" for="특수 청소">
				물탱크/저수조 청소
			</div>
			<div class="div_category level2" for="특수 청소">
				바퀴벌레 퇴치
			</div>
			<div class="div_category level2" for="특수 청소">
				방역소독
			</div>
			<div class="div_category level2" for="특수 청소">
				벌초/예초
			</div>
			<div class="div_category level2" for="특수 청소">
				비둘기 퇴치
			</div>
			<div class="div_category level2" for="특수 청소">
				수질관리 및 녹조제거
			</div>
			<div class="div_category level2" for="특수 청소">
				악취 제거
			</div>
			<div class="div_category level2" for="특수 청소">
				유품정리/특수청소
			</div>
			<div class="div_category level2" for="특수 청소">
				침수 복구 및 청소
			</div>
			<div class="div_category level2" for="특수 청소">
				해충방역
			</div>
			<div class="div_category level2" for="특수 청소">
				화재 복구/청소
			</div>
			
			
			<div class="div_category level1" for="이사/청소">
				철거/페기<div class="arrow-down"></div>
			</div>
			<div class="div_category level2" for="철거/페기">
				철거
			</div>
			<div class="div_category level2" for="철거/페기">
				폐기물 처리
			</div>
			
			
			
		<!-- 	*************설치 수리****************	 -->		
			<div class="div_category" idx="111">
				설치/수리
				<div class="arrow-down"></div>
			</div>
			<div class="div_category level1" for="설치/수리">
				가전제품<div class="arrow-down"></div>
			</div>
			<div class="div_category level1" for="설치/수리">
				문/창문<div class="arrow-down"></div>
			</div>
			<div class="div_category level1" for="설치/수리">
				수도/보일러/전기<div class="arrow-down"></div>
			</div>
			<div class="div_category level1" for="설치/수리">
				가구<div class="arrow-down"></div>
			</div>
			<div class="div_category level1" for="설치/수리">
				기타 설치/수리<div class="arrow-down"></div>
			</div>
			
			
			
			
			
			
			
			
			
			<div class="div_category" >
				인테리어
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				외주
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				이벤트/뷰티
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				취업/직무
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				과외
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				취미/자기계발
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				자동차
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				법률/금융
				<div class="arrow-down">
				</div>
			</div>
			<div class="div_category" >
				기타
				<div class="arrow-down">
				</div>
			</div>
		</div>
	</div>


<!-- -------------------------------------게시글 목록---------------------------- -->

	<div id="div_feed_item" >
		<div >질문답변 · 인터렛/랜 공사</div>
		<div id="div_feed_item_inner" >
			<div >인터넷 증설 공사</div>
			<div id="div_no_image">이번에 월세로 새로 이사를 가게 되었는데 그 건물에 lg를 쓰는 사람이 한명도 없어서 증설공사를 해야한다고 하더라고요. 
									그러면 단자만 건들면 되는건가요? 아니면 벽을 뜯어서 공사를 해야하나요?벽을 뚫을거면 집주인분이 불가능하다고 말씀을 하셨어요.
			</div>
			<div class="div_town_info">대전/서구</div>
			<div id="div_feed_footer" >
			<div id="div_feed_footer_inner">
				<div id="div_like">
					<img class="like_img" src="img/숨고좋아요이미지.png"/>
					<div class="like_text">1</div>
				</div>
				<div id="div_comment">
					<img class="like_comment_img" src="img/댓글수이미지.png"/>
					<div >3</div>
				</div>
			</div>
			<div id="div_date">
					5시간 전
			</div>
		</div>
		</div>
	</div>
					
					
					
	<div id="div_feed_item" >
		<div >질문답변 · 페인트시공</div>
		<div id="div_feed_item_inner" >
		<div >베란다 보면 한숨이 절로 나오네요.</div>
		<div id="div_no_image">구축 아파트에 이사 왔는데 창문을 온종일 열어놔도 곰팡이가 피네요. 그나마 곰팡이는 락스로 청소하면 사라지는데 
			벽에 발라진 페인트가 떨어지면서 가루가 날리는 바람에 마음 놓고 환기를 못 시키고 있습니다. 
			혹시 베란다 벽 페인트를 전부 벗겨내고 시멘트 벽 상태로만 놔두면 문제가 생길까요? 단열 공사까지 하기에는 비용이 너무 많이 들 것 같아서요.
		</div>
		<div class="div_town_info">서울/전체</div>
		<div id="div_feed_footer" >
			<div id="div_feed_footer_inner">
				<div id="div_like">
					<img class="like_img" src="img/숨고좋아요이미지.png"/>
					<div class="like_text">1</div>
				</div>
				<div id="div_comment">
					<img class="like_comment_img" src="img/댓글수이미지.png"/>
					<div >1</div>
				</div>
			</div>
			<div id="div_date">
						25분 전
			</div>
		</div>
		</div>
	</div>
	<div id="div_feed_item" >
		<div >질문답변 · 철거</div>
		<div>
			<img  class="post_img" src="https://static.cdn.soomgo.com/upload/soomgo-life/b458f73c-5cbc-43fd-a668-4a5d02845cad.png?webp=1"/>
		</div>
		<div id="div_feed_item_inner" >
		<div >코너형 옷장 철거 폐기</div>
		<div>대충 이렇게 생긴 제품이고 코너 형 하나 일반 옷장 2개 있습니다. X표는 없다는 뜻.. 
			철거와 폐기 견적 받고 싶어요. 독산역 근처입니다. 카테고리를 잘 모르겠어서 철거로 했습니다.
		</div>
		<div class="div_town_info">서울/금천구</div>
		<div id="div_feed_footer" >
			<div id="div_feed_footer_inner">
				<div id="div_like">
					<img class="like_img" src="img/숨고좋아요이미지.png"/>
					<div class="like_text">1</div>
				</div>
				<div id="div_comment">
					<img class="like_comment_img" src="img/댓글수이미지.png"/>
					<div >1</div>
				</div>
			</div>
			<div id="div_date">
						25분 전
			</div>
		</div>
		</div>
	</div>
					
<!-- -------------------------------------게시글 목록---------------------------- -->
					
				</div>
			</div>
		</div>
	</div>
