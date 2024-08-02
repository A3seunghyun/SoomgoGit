<%@page import="dto.CommuPostLikeViewCommentDto"%>
<%@page import="dto.CommuProvinceDto"%>
<%@page import="dto.CommuTownDto"%>
<%@page import="dao.ProvinceTownDao"%>
<%@page import="dto.CommuPostListDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuCommentsCountDto"%>
<%@page import="dto.CommuServiceCountDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommuServiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	CommunityDao cDao = new CommunityDao();
	CommuServiceDao serviceDao = new CommuServiceDao();
	ProvinceTownDao ptDao = new ProvinceTownDao();
	

	ArrayList<CommuServiceCountDto> listServiceCount = serviceDao.serviceSelect();
	ArrayList<CommunityDto> commuDto = cDao.commuTitleSelect();
 	
 		
 	Integer townIdx = null;
 	Integer serviceIdx = null;
 	Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
 	/* 메인에서 클리한 커뮤idx에 따라 게시글 리스트가 달라짐 */
  	
 	if(request.getParameter("townIdx") != null)
 		townIdx = Integer.parseInt(request.getParameter("townIdx"));
 	if(request.getParameter("serviceIdx") != null)
	serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
  	
 	ArrayList<CommuPostListDto> pList = cDao.getListPostSelect(commuIdx, serviceIdx, townIdx);
 	ArrayList<CommuProvinceDto> ptDto = ptDao.getProvinceSelect();
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-묻다,해요,소식</title>
	<link rel="stylesheet" href="css/soomgoQnA.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
 	
 	<script>
 		 $(function(){
 			 
 			$("#div_commu_layout > div > div:nth-child(<%=commuIdx+1%>)").addClass("selected");
 			 
 			 $(".feed_item").on('click',function(){
 			 	/* 게시글 클릭시 해당 게시글로 이동 */
 				 let idx = $(this).attr("idx");
  				 location.href="soomgoQnA_Post.jsp?post_idx=" + idx;
  				 location.href="PostViewInsertServlet?post_idx=" + idx;
 			 });
 			 $("#div_header_img").on('click',function(){
 				location.href="soomgoWrite.jsp" ;
 			 });
 			$(".topic_item").click(function (){
 				/* 커뮤 카테고리 클릭시 해당 카테고리로 이동 */
				let idx = $(this).attr("idx");
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					location.href="soomgoQnA2.jsp?commuIdx=" + idx; 
				} else if(idx==2) {
					location.href="soomgoG_knowHow.jsp?commuIdx=" + idx
				} else if(idx==5){
					location.href="soomgoStory.jsp?commuIdx=" + idx
				} else {
					location.href="soomgoCommu.jsp";
				}    
			});
 			$("#div_community_layout > div:first-child > div").click(function(){
 				/* 사이드탭 선택시 원래 적용되었던 백그라운드 색상은 없어지고 클릭 한 탭에 백그라운드 컬러 적용*/
 				// 선택된 요소의 배경색을 제거
 				/* alert("!!!"); */
 				$("#div_community_layout > div:first-child > div").removeClass("selected");
 				// 클릭한 요소에 배경색 추가
 				$(this).addClass("selected");
 			});
 			
 			
 			 
 			$(".service_btn").click(function(){
 				/* 서비스 버튼 클릭시 서비스필터, 뒷배경필터 , 서비스텍스트 색상변경 */
 				$("#greyscreen_filter").css('display','block');
 				$("#div_service_town_layout").css('display','block');
 				$("#div_town_layout").css('display','none');
 				$("#div_service").addClass('active');  // [서비스] [지역] 중 서비스에 밑줄.
 				
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
				location.href = "soomgoQnA2.jsp?commuIdx=<%=commuIdx%>";
				
/*  			$(this).css('display', 'none');
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
 */
 			});
 			$(".div_category").click(function(){   // [서비스] 팝업에서 항목 선택시.
 				/* 서비스 카테고리별 클릭시 중주제 -> 소주제 펼쳐지고 접혀짐 */
 				if($(this).attr('idx') != undefined) {
 					// 최종선택(NOT '펼치는') 판단
 					let name = $(this).text().trim();
 					let len = $(".div_category[for='" + name + "']").length;
 					if(len==0) {  // '최종선택'임. 펼칠게 없는경우.
 						//$("#div_service_town_layout").css("display","none");
 						//$("#greyscreen_filter").css("display","none");
 						//let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
 						//$("#div_service_town > div:last-child").before(str);
						//$(".service_btn").css("display", "none"); 	// 서비스 버튼 숨기고.	 				
 						//$(".btn_init").css("display", "inline-block");  // 초기화 버튼 보이고.

 						let new_location = "soomgoQnA2.jsp?";
 						if(<%=commuIdx%>!=null) {
 							new_location += "commuIdx=<%=commuIdx%>&";
 						}
 						if(<%=townIdx%>!=null) {
 							new_location += "townIdx=<%=townIdx%>&";
 						}
 						new_location += "serviceIdx=" + $(this).attr('idx');
 						//alert("다음으로 이 : " + new_location);
 						location.href = new_location;
 					}
 					
 					
// 					let serviceIdx = $(this).text().trim();
//  					$(".feed_item").hide();
//  					$(".feed_item").each(function(){
// 	 					// 선택한 서비스 이름에 맞는 게시글만 조회
//  						var postServiceName = $(this).data("service-name");
//  						if(postServiceName == serviceIdx) {
//  							$(this).show();
//  						}
//  					});
 					
 					
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
 						//$("#div_town_layout").css("display","none");
 						//$("#greyscreen_filter").css("display","none");
 						//let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
 						//$("#div_service_town > div:last-child").before(str);
						//$(".town_btn").css("display", "none"); 						
 						//$(".btn_init").css("display", "inline-block");
 						
 						let new_location = "soomgoQnA2.jsp?";
 						if(<%=commuIdx%>!=null) {
 							new_location += "commuIdx=<%=commuIdx%>&";
 						}
 						if(<%=serviceIdx%>!=null) {
 							new_location += "serviceIdx=<%=serviceIdx%>&";
 						}
 						new_location += "townIdx=" + $(this).attr('idx');
 						//alert("다음으로 이 : " + new_location);
 						location.href = new_location;
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
			 /* let name = $(this).text().trim();
				//alert("selected name : " + name);
				$(".div_town[for='" + name + "']").css("display", "block");
				$(this).css("background","rgb(242,242,242)"); 
				});*/
			 
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

 			$(".div_soomgo_text2").click(function(){
 				 // 고수센터 텍스트 클릭시 고수센터 페이지로 이동.
 				window.location.href = "http://localhost:9090/Hello/soomgoGosucenter.html";
 			});
 			$("#div_community_layout > div:first-child > div").click(function(){
 				/* 사이드탭 선택시 원래 적용되었던 백그라운드 색상은 없어지고 클릭 한 탭에 백그라운드 컬러 적용*/
 				// 선택된 요소의 배경색을 제거
 				$("#div_community_layout > div:first-child > div").removeClass('selected');
 				// 클릭한 요소에 배경색 추가
 				$(this).addClass('selected');
 			});
 			
 			$("#div_service_town").on('click', '.selected_names > .close_x', function() {
 			    if($(this).hasClass("service")) {
	 				let new_location = "soomgoQnA2.jsp?";
					if(<%=commuIdx%>!=null) {
						new_location += "commuIdx=<%=commuIdx%>&";
					}
					if(<%=townIdx%>!=null) {
						new_location += "townIdx=<%=townIdx%>";
					}
					location.href = new_location;
 			    }
 			    if($(this).hasClass("town")) {
	 				let new_location = "soomgoQnA2.jsp?";
					if(<%=commuIdx%>!=null) {
						new_location += "commuIdx=<%=commuIdx%>&";
					}
					if(<%=serviceIdx%>!=null) {
						new_location += "serviceIdx=<%=serviceIdx%>&";
					}
					location.href = new_location;
 			    }
 			    
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
 		 });  // the end of $(function)
 		
 		
 		
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
						<div>
							<img class="inner_img" src="img/숨고글쓰기이미지.png" />
						</div>
					</div>
				</div>
				<div id="div_category">
					<div class="div_soomgo_text1">숨고생활</div>
					<div class="div_soomgo_text2">고수센터</div>
				</div>
		</div>
		<div id="div_community_layout">
			<div>
				<div class="topic_item">전체</div>
				<%
					for (CommunityDto cDto : commuDto)  {
				%>
				<div class="topic_item" idx="<%=cDto.getIdx()%> "><%=cDto.getTitle()%></div>
				<%
					}
				%>
			</div>
			<div id="div_contents_layout">
				<div>
					<div id="div_topic">
						<p>생활 속 궁금했던 모든 것을 물어보고 답해보세요</p>
						<img src="img/숨고질.답img.png" />
					</div>

					<div id="div_service_town">
						<%
							if(serviceIdx != null || townIdx != null) {
						%>
							<button class="btn_init">
								<span>초기화</span>
							</button>
						<%
							}
						%>
						<%
							if(serviceIdx == null) {
						%>
							<button type="button" class="service_btn fl">
								<span>서비스</span> <img src="img/숨고서비스화살표.png" />
							</button>
						<%
							}
						%>
						<%
							if(townIdx == null) {
						%>
							<button class="town_btn fl">
								<span>지역</span> <img src="img/숨고서비스화살표.png" />
							</button>
						<%
							}
						%>
						<!-- 		<div class="selected_names fl">용준이가 ...<span class="close_x">X</span></div>
	<div class="selected_names fl">전국<span class="close_x">X</span></div> -->
						<%
							if(serviceIdx != null) {
						%>
							<div class="selected_names fl"><%=serviceDao.getServiceTitleFromServiceIdx(serviceIdx)%><span class="close_x service">X</span></div>
						<%
							}
						%>
						<%
							if(townIdx != null) {
						%>
							<div class="selected_names fl"><%=ptDao.getTownNameFromTownIdx(townIdx)%><span class="close_x town">X</span></div>
						<%
							}
						%>
						<div style="clear: both;"></div>
					</div>
				</div> 
				<div id="div_contents_layout">
					<ul class="feed_list">
					<%
						for (CommuPostListDto pDto : pList) {
					%>
						<li class="feed_item" idx="<%=pDto.getPostIdx()%>" data-service-name="<%=pDto.getServiceName()%>">
							<a class="life_feed_item" >
								<p class="category"> <%=pDto.getCommuName()%>· <%=pDto.getServiceName()%></p>
								<div class="feed_content_box">
									<div class="feed_content">
										<div class="item_wrapper">
											<h3 class="title"><%=pDto.getTitle()%></h3>
											<p class="content_body"> <%=pDto.getContents()%> <p>
											<p class="content_town"><%=pDto.getProvince_name()%>/<%=pDto.getTown_name()%></p>
										</div>
									</div>
								<%
									if(pDto.getImgUrl() != null) {
								%>
									<img src=" <%=pDto.getImgUrl()%>"/>
								<%
									}
								%>
								</div>
								<div class="feed_footer">
									<div class="user_like_comment">
									<%
										CommuPostLikeViewCommentDto dto  = cDao.getLikeCommentView(pDto.getPostIdx());
									%>
										<span class="like"><%=dto.getLikeCount()%></span>
										<span class="comment"><%=dto.getCommentCount()%></span>
									 </div>
									 <span class="write_date"><%=pDto.getP_date().substring(2,10)%></span>
								</div>
							</a>
						</li>
					</ul>
				<%
					}
				%>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



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
			for(CommuServiceCountDto dto : listServiceCount) {
		%>
			<% if(dto.getServiceIdx()==null) { // 대분류 %>
				<div class="div_category" idx="<%=dto.getCategoryIdx()%>"><%=dto.getCategoryTitle()%><div class="arrow-down"></div>
				</div>
			<% } else {   // 소분류 %>
				<div class="div_category level2" for="<%=dto.getCategoryTitle()%>" idx="<%=dto.getServiceIdx()%>"><%=dto.getServiceTitle()%></div>
			<% } %>
		<% } %>
	</div>
</div>
								
								
								
								
								<%--
								<div class="div_category" idx="9999">
									이사/청소<div class="arrow-down"></div>
								</div>

								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									가정이사(투룸이상)</div>
								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									국내 이사</div>
								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									무진동차량/냉동차량/냉장차량</div>
								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									사무실/상업공간 이사</div>
								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									원룸/소형 이사</div>
								<div class="div_category level2" for="이사/청소" idx="DB에서뽑아서적기">
									용달/화물 운송</div>

								<div class="div_category level2" for="이사/청소">거주 청소업체</div>
								<div class="div_category level2" for="이사/청소">곰팡이 제거</div>
								<div class="div_category level2" for="이사/청소">나노코팅 시공</div>
								<div class="div_category level2" for="이사/청소">단열/결로 시공</div>
								<div class="div_category level2" for="이사/청소">라돈저감 시공</div>
								<div class="div_category level2" for="이사/청소">보일러/수도배관 청소
								</div>
								<div class="div_category level2" for="이사/청소">새집/헌집증후군 시공
								</div>
								<div class="div_category level2" for="이사/청소">이사/입주 청소업체
								</div>
								<div class="div_category level2" for="이사/청소">입주사전점검 대행</div>
								<div class="div_category level2" for="이사/청소">정리수납 컨설팅</div>
								<div class="div_category level2" for="이사/청소">줄눈 시공</div>
								<div class="div_category level2" for="이사/청소">집청소 도우미</div>
								<div class="div_category level2" for="이사/청소">코킹 시공</div>
								<div class="div_category level2" for="이사/청소">하수구 청소</div>

								<div class="div_category level2" for="이사/청소">가구 청소</div>
								<div class="div_category level2" for="이사/청소">가전제품 청소</div>
								<div class="div_category level2" for="이사/청소">냉장고 청소</div>
								<div class="div_category level2" for="이사/청소">세탁기 청소</div>
								<div class="div_category level2" for="이사/청소">소파 청소</div>
								<div class="div_category level2" for="이사/청소">시스템에어컨 청소
								</div>
								<div class="div_category level2" for="이사/청소">실외기 청소</div>
								<div class="div_category level2" for="이사/청소">에어컨 청소</div>
								<div class="div_category level2" for="이사/청소">온풍기/낸난방기
									청소</div>
								<div class="div_category level2" for="이사/청소">침대/매트리스 청소
								</div>
								<div class="div_category level2" for="이사/청소">후드 청소</div>

								<div class="div_category level2" for="이사/청소">건물내부
									청소(바닥/계단/화장실)</div>
								<div class="div_category level2" for="이사/청소">건물외부
									청소(외벽/유리창)</div>
								<div class="div_category level2" for="이사/청소">계단/화장실 청소</div>
								<div class="div_category level2" for="이사/청소">닥트/환풍구 청소</div>
								<div class="div_category level2" for="이사/청소">바닥 청소(왁스 코팅)
								</div>
								<div class="div_category level2" for="이사/청소">사무실/상업공간
									청소업체</div>
								<div class="div_category level2" for="이사/청소">시설/건물 관리</div>
								<div class="div_category level2" for="이사/청소">업소용 주방기구 판매
								</div>
								<div class="div_category level2" for="이사/청소">중공 청소</div>
								<div class="div_category level2" for="이사/청소">카페트 청소</div>

								<div class="div_category level2" for="이사/청소">단체 세탁</div>
								<div class="div_category level2" for="이사/청소">대기 측정 및 관리</div>
								<div class="div_category level2" for="이사/청소">물탱크/저수조 청소</div>
								<div class="div_category level2" for="이사/청소">바퀴벌레 퇴치</div>
								<div class="div_category level2" for="이사/청소">방역소독</div>
								<div class="div_category level2" for="이사/청소">벌초/예초</div>
								<div class="div_category level2" for="이사/청소">비둘기 퇴치</div>
								<div class="div_category level2" for="이사/청소">수질관리 및 녹조제거</div>
								<div class="div_category level2" for="이사/청소">악취 제거</div>
								<div class="div_category level2" for="이사/청소">유품정리/특수청소</div>
								<div class="div_category level2" for="이사/청소">침수 복구 및 청소</div>
								<div class="div_category level2" for="이사/청소">해충방역</div>
								<div class="div_category level2" for="이사/청소">화재 복구/청소</div>

								<div class="div_category level2" for="이사/청소">철거</div>
								<div class="div_category level2" for="이사/청소">폐기물 처리</div>

									<!-- *************설치 수리**************** -->	
								<div class="div_category" idx="111">
									설치/수리<div class="arrow-down"></div>
								</div>


								<div class="div_category">
									인테리어
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									외주
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									이벤트/뷰티
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									취업/직무
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									과외
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									취미/자기계발
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									자동차
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									법률/금융
									<div class="arrow-down"></div>
								</div>
								<div class="div_category">
									기타
									<div class="arrow-down"></div>
								</div>
								 --%>
						