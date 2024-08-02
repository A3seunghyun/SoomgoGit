<%@page import="dto.CommuLatestPhotoReviewsList"%>
<%@page import="dto.CommuHotTopicList"%>
<%@page import="dto.CommuPostLikeViewCommentDto"%>
<%@page import="dto.CommuCommentsChildDto"%>
<%@page import="dto.CommuServiceCountDto"%>
<%@page import="dao.CommuServiceDao"%>
<%@page import="dto.CommuTownDto"%>
<%@page import="dto.CommuProvinceDto"%>
<%@page import="dao.ProvinceTownDao"%>
<%@page import="dto.CommuCategoryDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuPostListDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// soomgoCommu.jsp?commuIdx=1 
	// --> request.getParameter("commuIdx") : "1"
	// --> Integer.parseInt("1") : 1
	Integer commuIdx = 0;	// 받아온 값이 없으면 0 (전체)가 기본값
	Integer townIdx = null;
	Integer serviceIdx = null;
	if(request.getParameter("commuIdx") != null)
		commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
	if(request.getParameter("townIdx") != null)
		townIdx = Integer.parseInt(request.getParameter("townIdx"));
	if(request.getParameter("serviceIdx") != null)
		serviceIdx = Integer.parseInt(request.getParameter("serviceIdx"));
	
	
	/* 커뮤니티 전체 게시글을 뿌려주는 메서드 */
	CommunityDao pDao = new CommunityDao();
	ArrayList<CommuPostListDto> listPost = pDao.getListPostSelect(commuIdx, townIdx, serviceIdx);
	
	int pageNum = 1;  // 현재페이지 : 초기값(1)
   	
   	try {
       	pageNum = Integer.parseInt(request.getParameter("page"));  // 게시글 갯수를 세는 메서드 (무한스크롤 적용)
   	} catch(Exception e) {}
	
	
	
	CommunityDao cDao = new CommunityDao();
	ArrayList<CommunityDto> category = cDao.commuTitleSelect();
	
	
	CommuServiceDao serviceDao = new CommuServiceDao();
	ArrayList<CommuServiceCountDto> listServiceCount = serviceDao.serviceSelect();
	
	ProvinceTownDao ptDao = new ProvinceTownDao();
	ArrayList<CommuProvinceDto> ptDto = ptDao.getProvinceSelect();
	
	
	CommunityDao dao = new CommunityDao();
	ArrayList<CommuHotTopicList>hList = dao.hotTopic();
	ArrayList<CommuLatestPhotoReviewsList> list = dao.latestPhotoReviews();
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>숨고 커뮤니티 메인</title>
	<link rel="stylesheet" href="css/soomgoCommu.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		let page_num = <%=pageNum%>;
		function draw_board_list(page) {
			$.ajax({
	 			type: 'get',
	 			data: {page_num : page_num},
	 			dataType: "json",
	 			url : "soomgoCommuAjaxServlet",
	 			success: function(res){   /* res가 곧 JSONArray */
	 				for(let i=0; i<=res.length-1; i++) {
	 					let str = 
	 						"<li class=\"feed_item\" idx=\"" + res[i].postIdx + "\" data-service-name=\"" + res[i].serviceTitle + "\">"
	 					    + "<a class=\"life_feed_item\">"
	 					    + "<p class=\"category\">" + res[i].commuTitle + " · " + res[i].serviceTitle + "</p>"
	 					    + "<div class=\"feed_content_box\">"
	 					    + "<div class=\"feed_content\">"
	 					    + "<div class=\"item_wrapper\">"
	 					    + "<h3 class=\"title\">" + res[i].postTitle + "</h3>"
	 					    + "<p class=\"content_body\">" + res[i].postContents + "</p>"
	 					    + "<p class=\"content_town\" data-town-name=\"" + res[i].townName + "\">" + res[i].provinceName + "/" +  res[i].townName + "</p>"
	 					    + "</div>"
	 					    + "</div>";

	 					if (res[i].getPostImg != null) {
	 					    str += "<img src=\"" + res[i].postImg + "\"/>";
	 					}
	 					str += "</div>"
	 					    + "<div class=\"feed_footer\">"
	 					    + "<div class=\"user_like_comment\">"
	 					    + "<span class=\"like\">" + res[i].postLikeCount + "</span>"
	 					    + "<span class=\"comment\">" + res[i].postCommentsCount + "</span>"
	 					    + "</div>"
	 					    + "<span class=\"write_date\">" + res[i].writeDate.substring(2,10) + "</span>"
	 					    + "</div>"
	 					    + "</a>"
	 					    + "</li>";
							$(".feed_list").append(str);
	 				}
	 			},
	 			error: function(r, s, e) {
					alert("[에러] code"+r.status+", message:"+r.resoponseText+", error:"+e);
//					에러함수는 변경하지말고 필요할때 이대로 써
	 			}
 			});
		}
		 // 무한스크롤을 위한 윈도우 함수 스크롤 바닥찍으면 이벤트 발생
		$(window).scroll(function() {
		   if($(window).scrollTop() + $(window).height() == $(document).height()) {
			   draw_board_list(++page_num);
		   }
		});
		
			draw_board_list(page_num);
		
		$(function(){
			$("#div_commu_layout > div > div:nth-child(<%=commuIdx%>)").addClass("selected");
			
			// 글쓰기 버튼 클릭시
			$(".write_btn").click(function(){
				$(".dropdown-write-menu").toggle();
			});
			
// 			게시글 클릭시
			$(document).on('click', '.feed_item', function(){
				alert("AAA");
				let feed_item = $(this).find(".category").text();
				//console.log(feed_item);
				
				let idx = $(this).attr("idx");
				 location.href="PostViewInsertServlet?post_idx=" + idx;  //조회수 중복 오름
/*
				if(feed_item.substring(0,5)!= "고수노하우") {
// 					console.log("고수노하우가 아닐떄");
					location.href="soomgoQnA_Post.jsp?post_idx=" + idx;
				} else {
					location.href="soomgoGosu_knowhow_post.jsp?post_idx=" + idx;
				}
*/
			});
			
			$("#div_commu_header2 > div:nth-child(2).div_commu_header2_text").click(function(){
				window.location.href = "http://localhost:9090/Hello/soomgoGosucenter.html";
			});
			$("#div_commu_layout > div:first-child > div").click(function(){
 				/* 사이드탭 선택시 원래 적용되었던 백그라운드 색상은 없어지고 클릭 한 탭에 백그라운드 컬러 적용*/
 				// 선택된 요소의 배경색을 제거
 				/* alert("!!!"); */
 				$("#div_commu_layout > div:first-child > div").removeClass("selected");
 				// 클릭한 요소에 배경색 추가
 				$(this).addClass("selected");
 			});
				$("#div_commu_notice").click(function(){
					window.location.href="http://localhost:9090/Hello/soomgoGuideLine.html";
				});		
			$(".feed_item").on('click',function(){
				if($(this).attr('idx') != undefined) {
// 					location.href="soomgoQnA_Post.jsp?post_idx= " + idx;
					location.href="PostViewInsertServlet?post_idx=" + idx;
				}
			});
			
			$(".topic_item").click(function (){
				let idx = $(this).attr("idx");
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					// 고수에게 묻다, 함께해요, 고수소식, 고수광장
					location.href="soomgoQnA2.jsp?commuIdx=" + idx; 
				} else if(idx==2) {
					// 고수노하우
					location.href="soomgoG_knowHow.jsp?commuIdx=" + idx
				} else if(idx==5){
					//숨고 이야기
					location.href="soomgoStory.jsp?commuIdx=" + idx
				}
			});
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
		});  /* $(function) 마지막 중괄호 */
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


<!-- ------------------------------------헤더----------------------------------------- -->



<div id="div_commu_container">
	<div id="div_commu_header">
		<div class="div_commu_header_inner">
			<h1>커뮤니티</h1>
			<div class="write_btn" > 글쓰기
				<img class="write_img" src="img/숨고글쓰기이미지.png"/>
				<ul role="menu" class="dropdown-write-menu">
					<li>
						<div class="dropdown-menu-item">
							<div class="dropdown-menu-item-text">
								<span class="headline">고수노하우</span>
								<span class="underline">나만의 전문 경험과 지식을 공유해 보세요</span>
							</div>
							<i class="dropdown-menu-itme-icon"></i>
						</div>
					</li>
					<li>
						<div class="dropdown-menu-item">
							<div class="dropdown-menu-item-text">
								<span class="headline">고수소식</span>
								<span class="underline">나만의 전문 경험과 지식을 공유해 보세요</span>
							</div>
							<i class="dropdown-menu-itme-icon"></i>
						</div>
					</li>
					<li>
						<div class="dropdown-menu-item">
							<div class="dropdown-menu-item-text">
								<span class="headline">고수광장</span>
								<span class="underline">나만의 전문 경험과 지식을 공유해 보세요</span>
							</div>
							<i class="dropdown-menu-itme-icon"></i>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div id="div_commu_header2">
			<div class="div_commu_header2_text"> 숨고생활</div>
			<div class="div_commu_header2_text"> 고수센터</div>
		</div>
		<div id="div_commu_layout">
			<div >
				<div class="topic_item" idx="0">전체</div>
				<%
					for(CommunityDto dto : category) {
				%>
				<div class="topic_item" idx="<%=dto.getIdx()%>"> <%=dto.getTitle()%> </div>
				<%
					}
				%>
			</div>
			<div>
				<div id="div_commu_notice">
					<div>
						<a >
							<span class="notice-title">공지</span><span class="notice-text">숨고생활 가이드라인 🤝</span>
							<img  class="notice_img" src="img/숨고공지 화살표.png"/>
						</a>
					</div>
				</div>
				<!-- 여기부터 숨고픽 슬라이더 -->
				<div class="div_curation">
					<div class="div_curation_header">
						<h2> 지금 가장 뜨거운 숨고픽 🔥 </h2>
						<span>1/3</span>
					</div>
					<div class="slick_slider">
						<button class="slick_arrow"></button>
						<div class="slick_list">
							<div class="slider_track">
							<%
								for(CommuHotTopicList dto : hList) {
							%>
								<div class="div_slide" idx="<%=dto.getPostIdx()%>"> 
									<div>
										<a href="https://soomgo.com/community/soomgo-life/posts/66791aec51df8ea415addd85-%EC%84%9C%EC%9A%B8%EB%8C%80-%EC%84%9D%EC%82%AC-%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%84%88%EA%B0%80-%EC%95%8C%EB%A0%A4%EC%A3%BC%EB%8A%94-%EB%B0%94%EB%A5%B8-%EC%9E%90%EC%84%B8%EC%97%90-%EB%AC%B4%EC%A1%B0%EA%B1%B4-%EB%8F%84%EC%9B%80-%EB%90%98%EB%8A%94-%EC%9A%B4%EB%8F%99-5?from=curation">
											<div class="curation_item">
												<h3 class="h3"><%=dto.getPostTitle()%></h3>
												<div class="react_item">
													<p class="view">
														<%=dto.getViewCount()%>
													</p>
													<p class="comment">
														<%=dto.getCommentsCount()%>
													</p>
												</div>
											</div>
										</a>
									</div>
								</div>
								<%
									}
								%>
							</div>
						</div>
						<button class="slick_arrow_right"></button>
					</div>
				</div>
				<!-- 여기까지 숨고픽 슬라이더 -->
				
				<!-- 여기부터 사진리뷰 슬라이더 -->
				<div id="div_commu_review">
					<div class="commu_review_header">
						<p style=margin:0;>만족도 높은</p>
						<h2>고객님들의 최신 사진 리뷰</h2>
					</div>
					<div class="slick_slider_review">
						<button class="slick_arrow"></button>
						<div class="slick_list_review">
							<div class="slick_track_review">
							<%
								for(CommuLatestPhotoReviewsList dto : list) {
							%>
								<div class="slider_item" idx =<%=dto.getUsersIdx()%>>
									<div>
										<div class="commu_review_card">
											<a class="service_item">
												<img class="thumbnail" src="<%=dto.getReviewImg1()%>"/>
												<div class="contents_container">
													<h3>
														<%=dto.getServiceTitle()%>
													</h3>
													<p> <%=dto.getContents()%> </p>
													<div class="contents_footer">
														<span class="review_star">
														<%
															for (int i=0; i<dto.getScore(); i++) {
														%>
															<span class="star_icon">
																<img class="star_icon" src="https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg"/>
															</span>
															<%
																}
															%>
															<%=dto.getScore()%>.0
														</span>			
														<span class="write_date"><%=dto.getReviewDate().substring(2,10)%></span>								
													</div>
												</div>
											</a>
										</div>
									</div>
								</div>
							<%
								}
							%>
							</div>
						</div>
						<button class="slick_arrow_right"></button>
					</div>
					<!-- 여기까지 최신 사진 리뷰 슬라이드 -->
					
				</div>
				<div id="div_service_area" >
					<button class="btn_init">
						<span>초기화</span>
					</button>
					<div class="service_btn">서비스<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTMuNjY2IDhhLjcwOC43MDggMCAwMS45MjktMS4wNjRsLjA3My4wNjMgNS4zMzEgNS4zMzMgNS4zMzMtNS4zMzNhLjcwOC43MDggMCAwMS45My0uMDYzbC4wNzIuMDYzYS43MDguNzA4IDAgMDEuMDY0LjkzTDE2LjMzNCA4bC01LjgzMyA1LjgzM2EuNzA4LjcwOCAwIDAxLS45My4wNjRsLS4wNzItLjA2NEwzLjY2NiA4eiIgZmlsbD0iIzg4OCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+"/></div>
					<div class="town_btn">지역 <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTMuNjY2IDhhLjcwOC43MDggMCAwMS45MjktMS4wNjRsLjA3My4wNjMgNS4zMzEgNS4zMzMgNS4zMzMtNS4zMzNhLjcwOC43MDggMCAwMS45My0uMDYzbC4wNzIuMDYzYS43MDguNzA4IDAgMDEuMDY0LjkzTDE2LjMzNCA4bC01LjgzMyA1LjgzM2EuNzA4LjcwOCAwIDAxLS45My4wNjRsLS4wNzItLjA2NEwzLjY2NiA4eiIgZmlsbD0iIzg4OCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+"/></div>
				</div>
				<div id="div_contents_layout">
					<ul class="feed_list">
<%-- 					<script>alert(<%=listPost.size()%>);</script>  게시글 갯수 확인--%>
<%-- 					<% --%>
<!--  						for(PostListDto dto : listPost) { -->
<%-- 					%> --%>
<%-- 						<li class="feed_item" idx="<%=dto.getPostIdx()%>" data-service-name="<%=dto.getServiceName()%>"> --%>
<!-- 							<a class="life_feed_item"> -->
<%-- 								<p class="category" ><%=dto.getCommuName()%> · <%=dto.getServiceName()%></p> --%>
<!-- 								<div class="feed_content_box"> -->
<!-- 									<div class="feed_content"> -->
<!-- 										<div class="item_wrapper"> -->
<%-- 											<h3 class="title"><%=dto.getTitle()%></h3> --%>
<%-- 											<p class="content_body"> <%=dto.getContents()%> <p> --%>
<%-- 											<p class="content_town" data-town-name="<%=dto.getTown_name()%>"><%=dto.getProvince_name()%>/<%=dto.getTown_name()%></p> --%>
<!-- 										</div> -->
									
<!-- 									</div> -->
<%-- 								<%if(dto.getImgUrl() != null){ %> --%>
<%-- 									<img src="<%=dto.getImgUrl()%>"/> --%>
<%-- 								<%} %> --%>
<!-- 								</div> -->
<%-- 								<script>alert("called.");</script> --%>
<%-- 								<% --%>
<!-- 									PostLikeViewCommentDto plcDto = dao.getLikeCommentView(dto.getPostIdx()); -->
<%-- 								%> --%>
<!-- 								<div class="feed_footer"> -->
<!-- 									<div class="user_like_comment"> -->
<%-- 										<span class="like"><%=plcDto.getLikeCount() %></span> --%>
<%-- 										<span class="comment"><%=plcDto.getCommentCount() %></span> --%>
<!-- 									 </div> -->
<%-- 									 <span class="write_date"><%=dto.getP_date().substring(2,10) %></span> --%>
<!-- 								</div> -->
<!-- 							</a> -->
<!-- 						</li> -->
<%-- 					<% --%>
<!-- 						} -->
<%-- 					%> --%>
					</ul>
				</div>
				<
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
