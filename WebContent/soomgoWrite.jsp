<%@page import="dao.ProvinceTownDao"%>
<%@page import="dto.CommuTownDto"%>
<%@page import="dto.CommuProvinceDto"%>
<%@page import="dto.CommuServiceCountDto"%>
<%@page import="dao.CommuServiceDao"%>
<%@page import="dto.CommuPostWritePowerDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommunityDao dao = new CommunityDao();
	ArrayList<CommuPostWritePowerDto> list = dao.postWritePowerSelect();
	
	CommuServiceDao serviceDao = new CommuServiceDao();
	ArrayList<CommuServiceCountDto> listServiceCount = serviceDao.serviceSelect();
	
	ProvinceTownDao ptDao = new ProvinceTownDao();
	ArrayList<CommuProvinceDto> ptDto = ptDao.getProvinceSelect();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활_게시글쓰기</title>
	<link rel="stylesheet" href="css/soomgoWrite.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<script>
	$(function(){
		$(".img_icon").click(function(){
			$(".custom-file-label").click();
		});
		
			let text = $(".editor_contents_text_area").text();
	    $('.content_text_area').on('input', function() {
            // 입력 필드의 값이 변경될 때마다 span의 텍스트를 지웁니다.
            if($(this).val().trim().length > 0) {
            	
    		     $('.editor_contents_text_area').text('');
    		     
            } else if($(this).val().trim().length < 1) {
            	
    		     $('.editor_contents_text_area').text(text);
            	
            }
        });
	    
// 	    $(".service_town_button").click(function(){
// 	    	$("#div_service_town_layout").show();
// 	    });
	    
	    
	    
	    
	    
		  /*===========  여기부터 서비스, 지역필터 jquery   =============== */
		   $(".service_btn").click(function(){
				/* 서비스 버튼 클릭시 서비스필터, 뒷배경필터 , 서비스텍스트 색상변경 */
				$("#greyscreen_filter").css('display','block');
				$("#div_service_town_layout").css('display','block');
				$("#div_town_layout").css('display','none');
				$("#div_service").addClass('active');  // [서비스] [지역] 중 서비스에 밑줄.
					event.preventDefault();
				
				$(window).scroll(function(){
					/* 서비스, 지역버튼 클릭시 뒷배경 스크롤 위치 따라오기 */
					let scrollTop = $(window).scrollTop();
					$("#greyscreen_filter").css('top',scrollTop);
				});
				
			});
			$(".town_btn").click(function() {
				$("#greyscreen_filter").css('display','block');
				$("#div_service_town_layout").css('display','none');
				$("#div_town_layout").css('display','block');
				$("#div_town2").addClass('active');   // [서비스] [지역] 중 지역에 밑줄.
			});
			
			$(".x").click(function() {
				/* x 클릭시 필터 가려짐 */
				$("#div_service_town_layout").css('display','none');  // == hide()
				$("#greyscreen_filter").css('display','none');
				$("#div_town_layout").css('display','none');
				$("#div_service").removeClass('active');
				$("#div_town").removeClass('active');
				$(".feed_item").css('display','block');
				$(".div_category").each(function(){
						//x를 눌렀을때 arrow-up을 찾아 제거하고 arrow-down을 생성 (화살표 업다운)
					if($(this).find("div").hasClass("arrow-up")) {
						$(this).find("div").removeClass("arrow-up").addClass("arrow-down");
	 				}
						// name 변수를 사용하여, for 속성이 name 변수의 값과 일치하는 
						// .div_category 요소를 찾아서 display 속성을 "none"으로 설정후 백그라운드 색상 제거
						let name = $(this).text().trim();
						$(".div_category[for='" + name + "']").css("display","none");
						$(this).css("background","");
						
						$('input[type="text"]').val('');
							/* 검색창에 입력했던 text를 x버튼 누르면 초기화 */
							
							/* 다시 서비스필터를 켯을떄 .div_category 리스트 복원 */
	 					$(".div_category").css('display', '');
	 					$(".div_category").each(function(idx, item) {
	 						if($(item).find("div").hasClass("arrow-up")) {
	 							let item_name = $(item).text().trim();
	 							$("[for='" + item_name + "']").css('display', 'block');
	 						}
	 					});
					});
				});
			$(".btn_init").click(function() {
				$(this).css('display', 'none');
				$(".selected_names").remove();
				$(".div_category").css('background','');
				$(".div_category.level1").css('display','none');
				$(".div_category.level2").css('display','none');
				$(".div_town").css('background','');
				$(".div_town.level1").css('display','none');
				$(".service_btn").css("display", "block"); 						
				$(".town_btn").css("display", "block"); 	
				$(".serviceName").remove();
				$(".feed_item").show();
			});
			$(".div_category").click(function(){   // [서비스] 팝업에서 항목 선택시.
				/* 서비스 카테고리별 클릭시 중주제 -> 소주제 펼쳐지고 접혀짐 */
				if($(this).attr('idx') != undefined) {
					// 최종선택(NOT '펼치는') 판단
					let name = $(this).text().trim();
					let len = $(".div_category[for='" + name + "']").length;
					if(len==0) {  // '최종선택'임. 펼칠게 없는경우.
						$("#div_service_town_layout").css("display","none");
						$("#greyscreen_filter").css("display","none");
						let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
						$("#div_service_town > div:last-child").before(str);
						$(".service_btn").css("display", "none"); 						
						$(".btn_init").css("display", "inline-block");
					}
					
					var serviceIdx = $(this).text().trim();
					$(".feed_item").hide();
					
					$(".feed_item").each(function(){
					/* 선택한 서비스 이름에 맞는 게시글만 조회 */
						var postServiceName = $(this).data("service-name");
						if(postServiceName == serviceIdx) {
							$(this).show();
						}
					});
				}
	 			if($(this).find("div").hasClass("arrow-down")) {
	 				$(this).find("div").removeClass("arrow-down");
	 				$(this).find("div").addClass("arrow-up");
	 			
					let name = $(this).text().trim();
					//$(".div_category[for='" + name + "']").css('display', 'block');
					$(".div_category[for='" + name + "']").slideDown();
					$(this).css("background","rgb(242,242,242)");
					
				} else if($(this).find("div").hasClass("arrow-up")) {
					$(this).find("div").removeClass("arrow-up");
					$(this).find("div").addClass("arrow-down");
					
					let name = $(this).text().trim();
					//$(".div_category[for='" + name + "']").css('display', 'none');
					$(".div_category[for='" + name + "']").slideUp();
					$(this).css("background","");
	 			} 
			}); 
			
			$(".div_category.level2").click(function(){
				/* alert("!!!"); */
				$(".div_town").css("display","block");
			});
			
			$(".div_town").click(function() {	// [지역] 팝업에서 항목 선택시.
				if($(this).attr('idx') != undefined) {
					// 최종선택(NOT '펼치는') 판단
					let name = $(this).text().trim();
					let len = $(".div_town[for='" + name + "']").length;
					if(len==0) {  // '최종선택'임.
						$("#div_town_layout").css("display","none");
						$("#greyscreen_filter").css("display","none");
						let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
						$("#div_service_town > div:last-child").before(str);
						$(".town_btn").css("display", "none"); 						
						$(".btn_init").css("display", "inline-block");
					}
				}
				if($(this).find("div").hasClass("arrow-down")) {
	 				$(this).find("div").removeClass("arrow-down");
	 				$(this).find("div").addClass("arrow-up");
	 			
					let name = $(this).text().trim();
					//$(".div_category[for='" + name + "']").css('display', 'block');
					$(".div_town[for='" + name + "']").slideDown();
					$(this).css("background","rgb(242,242,242)");
					
				} else if($(this).find("div").hasClass("arrow-up")) {
					$(this).find("div").removeClass("arrow-up");
					$(this).find("div").addClass("arrow-down");
					
					let name = $(this).text().trim();
					//$(".div_category[for='" + name + "']").css('display', 'none');
					$(".div_town[for='" + name + "']").slideUp();
					$(this).css("background","");
	 			} 
		/* 		let name = $(this).text().trim();
				//alert("selected name : " + name);
				$(".div_town[for='" + name + "']").css("display", "block");
				$(this).css("background","rgb(242,242,242)");
				});
			 */
			});		
		 	$("#div_town").click(function() {
				/* 서비스 필터에서 지역버튼 누르면 텍스트 색상및 밑줄 생김 */
				$("#div_service_town_layout").css('display','none');
				$("#div_town_layout").css('display','block');
		 	});
			$("#div_service2").click(function() {
				/* 지역버튼에서 서비스 버튼 누르면 지역버튼 색상,밑줄off 서비스버튼on */
				$("#div_service_town_layout").css('display','block');
				$("#div_service").addClass("active");
				$("#div_town_layout").css('display','none');
			}); 
		// input 태그에 change 이벤트가 발생했을 때 (텍스트 변경) -> change : 포커스를 잃어야 발생.
			// input 태그에 keyup 이벤트가 발생했을 때 (이것도 텍스트 변경).
			// input 태그에 입력되고 있는 문자열은 이 태그의 value 라는 속성에 저장.
			// 제이쿼리는 input(type='text') 태그에  입력한 값을 가져올 때 : ".val()"
			// 제이쿼리로 input(type='text') 태그에 새로운 값을 대입시킬 때 : ".val(새로운 값)"
			// 자바스크립트, 문자열의 길이 : "문자열.length"   <------> Java, 문자열.length()
			$("#div_input > input[type='text']").keyup(function() {
				let input_str = $(this).val();
				if(input_str.length==0) {   // 복원(필터링OFF)
					$(".div_category").css('display', '');
					$(".div_category").each(function(idx, item) {
						if($(item).find("div").hasClass("arrow-up")) {
							let item_name = $(item).text().trim();
							$("[for='" + item_name + "']").css('display', 'block');
						}
					});
				} else {   // 필터링ON
					// 제이쿼리의 'for-each' 반복문 문법을 사용해서 모든 .div_category 해당 태그들을 탐색.
					// 여러 가지 변형이 가능한 문법 -----> 절대로 신경쓰지 말고, 이 틀대로만 사용할 것!
					// idx : 인덱스 번호 정보가 들어가 있음.
					// item : 해당 태그에 대한 정보가 들어가 있고. --> 사용은 "$(item)" 으로.
					$(".div_category").each(function(idx, item) {
						let txt = $(item).text();   // 해당 요소의 제목(ex. '국내 이사')
						if(txt.indexOf(input_str)>=0) {   // 있으면 살려둔다.
							$(item).css('display', 'block');
						} 
						// 펼치는 애들은 먼저 사라지게.(대분류는 안보이게.)
						// .find() : 자자손손들 중에서 찾음.
						// $(item) : 해당 요소.
						// $(item).find("div") : 해당 요소 '안에 있는' div 태그.
						// $(item).find("div").length : ~~~~~~~~~~~ 태그의 개수.
						if( $(item).find("div").length == 1 ) {  // 대분류이면.
							$(item).css('display', 'none');
						}
						
						// txt.indexOf('찾는문자열') : txt 안에 '찾는문자열'이 있으면 "0 이상의 값"이 됨.
						if(txt.indexOf(input_str)==-1) {   // 없으면(-1 이라는 소리) 사라지게.
							$(item).css('display', 'none');
						}
					});
				}
			});
			//close_x는 동적으로 생성되기 떄문에 on 을 써줘야함 (초기에는 없다가 jquery or js로 인해 생성되는 요소)
			//그래서 위에 코드는 실행 되지 않음 아래 on 코드를 사용해야함 *
			$("#div_service_area").on('click', '.selected_names > .close_x', function() {
			    alert("!!!");
			    $(this).parent().remove(); // 여기서 $(this)는 클릭된 .close_x 요소를 참조합니다.
			});
	    
	    
	    
	    
	    
	    
	    
	    
	    
	});
</script>
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
<div id="div_body">
	<form action="soomgoWriteAction.jsp" method="post">
		<div id="div_select_header">
				<%
					for(CommuPostWritePowerDto dto : list) {
				%>
					<% if(1!=1) { %>		
	<!-- 					고수이면 -->
						<select class="option" name="commuIdx">
							<option disabled>주제선택</option>
							<option value="<%=dto.getCommuIdx()%>"> <%=dto.getCommuTitle() %></option> 
						</select>	
					<% } else {  %>
	<!-- 					일반유저이면 -->
						<select class="option" name="commuIdx">
							<option disabled>주제선택</option>
							<option value="1">고수에게묻다</option>
							<option value="3">함께해요</option>
						</select>							
					<% } %>
				<%} %>	
			<input type="submit" class="add_btn" value="등록" />
		</div>
		<div id="div_attach_file">
			<div id="div_attach_area">
				<div class="img_icon"></div>
				<div class="custom_file">
					<label data-browse="Browse"	class="custom-file-label" for="img_upload">
				 	<input type=file class="custom_file_input" name="uploadFile" id="img_upload" accept="image/jpg,image/jpeg,image/png,image/gif,image/bmp,image/heic" multiple="multiple"/>
						<span class="file_text" style="pointer-events: none"></span>
					</label>
				</div>
				<span class="img_count_text">0/15</span>
			</div>
		</div>
		<div id="div_body_container" >
			<div id="div_label">
					<input id="input_text" type="text" name="title" placeholder="제목을 입력해주세요."  maxlength="30"/>
			</div>
			<div id="div_service_region">
				<button type="button" class="service_btn">
					<span class="service_town_span">(선택) 서비스</span>
				</button>
				<button type="button" class="town_btn">
					<span class="service_town_span">(선택) 지역</span>
				</button>
			</div>
			<div class="contents">
				<span class="legacy">
					<div class="editor-img-list-box">
						<div class="editor-img-list">
							<div class="image-preview">
								<img class="delete-badge" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik01LjM2NCA0LjIzNGEuNzk4Ljc5OCAwIDEgMC0xLjEzIDEuMTNMNi44NyA4LjAwMWwtMi42MzcgMi42MzZhLjguOCAwIDAgMCAxLjEzIDEuMTI5TDggOS4xM2wyLjYzNiAyLjYzNWEuNzk4Ljc5OCAwIDEgMCAxLjEzLTEuMTNMOS4xMyA4LjAwMmwyLjYzNy0yLjYzN2EuOC44IDAgMCAwLTEuMTMtMS4xMjlMOCA2Ljg3IDUuMzY0IDQuMjM0eiIgZmlsbD0iI0ZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo="/>
								<img class="view" src="https://static.cdn.soomgo.com/upload/soomgo-life/b1e70765-e6cd-4f11-b54a-649e3b24a47c.jpg?h=80&w=80&webp=1"/>
								<img class="delete-badge" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik01LjM2NCA0LjIzNGEuNzk4Ljc5OCAwIDEgMC0xLjEzIDEuMTNMNi44NyA4LjAwMWwtMi42MzcgMi42MzZhLjguOCAwIDAgMCAxLjEzIDEuMTI5TDggOS4xM2wyLjYzNiAyLjYzNWEuNzk4Ljc5OCAwIDEgMCAxLjEzLTEuMTNMOS4xMyA4LjAwMmwyLjYzNy0yLjYzN2EuOC44IDAgMCAwLTEuMTMtMS4xMjlMOCA2Ljg3IDUuMzY0IDQuMjM0eiIgZmlsbD0iI0ZGRiIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo="/>
								<img class="view" src="https://static.cdn.soomgo.com/upload/soomgo-life/b1e70765-e6cd-4f11-b54a-649e3b24a47c.jpg?h=80&w=80&webp=1"/>
							</div>
						</div>
					</div>
				 </span>
				 <textarea name="content" class="content_text_area"></textarea>
				 <span class="editor_contents_text_area">
				 	생활 속에서 궁금했던 모든 것을 물어보세요.

					예) 도어락 버튼이 작동을 안 하는데 왜 그런건가요?
					예) 바닥 장판이 들떴는데 원인이 궁금해요.
					
					※ 주제에 맞지 않는 글이나 커뮤니티 이용정책에 위배되는 글은 신고의 대상이 됩니다.
					※ 일정 수 이상의 신고를 받으면 작성한 글이 숨김 및 삭제될 수 있습니다.
				</span>
			</div>	 
		</div>
	</form>
</div>
</body>




<!--=========== 서비스 , 지역 필터 =================== -->

 <div id="greyscreen_filter"></div>
<div id="div_town_layout" class="scroll ">
	<div id="div_town_header">
		<div id="div_service2">서비스</div>
		<div id="div_town2" class="active">지역</div>
		<img class="x" src="img/x.png" />
	</div>
	<div id="div_town_box">
		<div class="div_town" style="color: rgb(0,199,174);">
			전국
			<div class="arrow-down" ></div>
		</div>
		
	<%
				for (CommuProvinceDto pDto : ptDto) {
			%>
		<div class="div_town" idx="<%=pDto.getProvenceIdx()%>">
			<%=pDto.getProvinceName()%> <div class="arrow-down"></div>
		</div>
	<%
		ArrayList<CommuTownDto> tDto = ptDao.getTownSelect(pDto.getProvenceIdx());
	%>
 	<%
 		for (CommuTownDto dto : tDto) {
 	%>
		<div class="div_town level1" for="<%=pDto.getProvinceName()%>" idx="<%=dto.getTownIdx()%>"> <%=dto.getTownName()%></div>
	<%
		}
	%> 
<%
 	}
 %>
	</div>
</div>


<div id="div_service_town_layout" class="border">
	<div id="div_service_town_header">
		<div id="div_service">서비스</div>
		<div id="div_town">지역</div>
		<img class="x" src="img/x.png" />
	</div>
	<div id="div_search_service">
		<div id="div_bottom_line">
			<img class="img" src="img/서비스검색돋보기.png" />
			<div id="div_input" class="border">
				<input type="text" placeholder="어떤 분야의 고수를 찾으세요?" />
			</div>
		</div>
			<!-- *************이사 청소****************	 -->
		<%
			for(CommuServiceCountDto sDto : listServiceCount) {
		%>
			<% if(sDto.getServiceIdx()==null) { // 대분류 %>
				<div class="div_category" idx="<%=sDto.getCategoryIdx()%>"><%=sDto.getCategoryTitle()%><div class="arrow-down"></div>
				</div>
			<% } else {   // 소분류 %>
				<div class="div_category level2" for="<%=sDto.getCategoryTitle()%>" idx="<%=sDto.getServiceIdx()%>"><%=sDto.getServiceTitle()%></div>
			<% } %>
		<% } %>
	</div>
</div> 












