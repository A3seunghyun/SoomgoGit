<%@page import="dao.MainPageDao"%>
<%@page import="dto.CommuGosuKnowhowPostListDto"%>
<%@page import="dto.CommuPostListDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CommuGosuKnowhowPostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    	CommunityDao cDao = new CommunityDao();
		ArrayList<CommunityDto> commuDto = cDao.commuTitleSelect();
		        	
		MainPageDao gDao = new MainPageDao();
// 		고수노하우 포스트 리스트 조회
		ArrayList<CommuGosuKnowhowPostListDto> gDto = gDao.getGkhPostList();
		      	
		      	
		Integer townIdx = null;
		Integer serviceIdx = null;
		Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
		  /* 메인에서 클리한 커뮤idx에 따라 게시글 리스트가 달라짐 */
		    	
		  // 커뮤니티 게시글 리스트 조회 지역, 서비스 선택 없을시
		if(request.getParameter("townIdx") != null)
		   townIdx = Integer.parseInt(request.getParameter("townIdx").trim());
		if(request.getParameter("serviceIdx") != null)
		   serviceIdx = Integer.parseInt(request.getParameter("serviceIdx").trim());
		ArrayList<CommuPostListDto> pList = cDao.getListPostSelect(commuIdx, serviceIdx, townIdx);
		    	
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-고수노하우</title>
	<link rel="stylesheet" href="css/soomgoG_knowHow.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$(".topic_link_item").click(function (){
 				/* 커뮤 카테고리 클릭시 해당 카테고리로 이동 */
				let idx = $(this).attr("idx").trim();
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					location.href = "soomgoQnA2.jsp?commuIdx=" + idx; 
				} else if(idx==2) {
					location.href = "soomgoG_knowHow.jsp?commuIdx=" + idx
				} else if(idx==5){
					location.href = "soomgoStory.jsp?commuIdx=" + idx
				} else {
					location.href="soomgoCommu.jsp";
				}   
			});
			$(".item_wrapper").click(function(){
					let idx = $(this).attr("idx");
					alert("idx=" + idx);
					location.href = "GosuKnowhowPost?post_idx=" + idx;
			});
			
			$("#div_category > div:nth-child(2)").click(function(){
				window.location.href = "http://localhost:9090/Hello/soomgoGosucenter.html";
				/* 고수센터(전체)로 이동 */
			});
			$("#div_category > div:nth-child(1)").click(function(){
				window.location.href = "http://localhost:9090/Hello/soomgoCommu.html";
				/* 숨고생활 (전체)로 이동 */
			});
			$("#div_community_layout > div:first-child > div").click(function(){
 				/* 사이드탭 선택시 원래 적용되었던 백그라운드 색상은 없어지고 클릭 한 탭에 백그라운드 컬러 적용*/
 				// 선택된 요소의 배경색을 제거
 				/* alert("!!!"); */
 				$("#div_community_layout > div:first-child > div").removeClass("selected");
 				// 클릭한 요소에 배경색 추가
 				$(this).addClass("selected");
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
	<div class="div_layout">
		<div class="div_community">
			<div class="div_header">
				<div class="div_header_inner">
					<div class="div_header_text">커뮤니티</div>
					<div class="div_header_img">
						<div class="text">글쓰기</div>
						<div><img class="inner_img" src="img/숨고글쓰기이미지.png"/>
						</div>
					</div>
				</div>
				<div class="div_category">
					<div class="div_soomgo_text1"> 숨고생활 </div>
					<div class="div_soomgo_text2" > 고수센터 </div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="community_layout ">
				<div class="soomgo_life_topic_layout ">
					<ul>
						<li>
							<a class="topic_link_item" href="soomgoCommu.jsp"">전체</a>
						</li>
						<%
							for (CommunityDto dto : commuDto) {
						%>
						
						<li>
							<a class="topic_link_item" idx=" <%=dto.getIdx()%>"><%=dto.getTitle()%></a>
							
						</li>
						<%
							}
						%>
						
					</ul>
				</div>
				<div class="community_content_layout">
					<div class="topic_guide">
						<p class="guide_line">고수님이 알려주는 유용한 서비스 전문 지식을 만나보세요</p>
						<img class="guide_icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNzIiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA3MiA0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTQyLjY5IDBoMTUuMjI4YzEuNzU3IDAgMy40My4zNDggNC45NTEuOTc3QzY4LjIxMyAzLjAyIDcyIDguMDc0IDcyIDEzLjk5OWMwIDcuMDkyLTUuNDE4IDEzLjA2NS0xMi40NDUgMTMuOTg2LTEuMDIxLjEzNC0xLjkzNy0uNjMxLTEuOTM3LTEuNjM1di0xLjY0NUg0Mi42OWMtNy4wMDggMC0xMi42OS01LjUzLTEyLjY5LTEyLjM1M0MzMCA1LjUzMSAzNS42ODIgMCA0Mi42OSAwIiBmaWxsPSIjRkJBREIxIi8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNDEgMTEpIiBmaWxsPSIjRkZGIj4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMiIgY3k9IjIiIHI9IjIiLz4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMTAiIGN5PSIyIiByPSIyIi8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjE4IiBjeT0iMiIgcj0iMiIvPgogICAgICAgIDwvZz4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHBhdGggZD0iTTI5LjMxIDEySDE0LjA4MmMtMS43NTcgMC0zLjQzLjM0OC00Ljk1MS45NzdDMy43ODcgMTUuMDIgMCAyMC4wNzQgMCAyNS45OTljMCA3LjA5MiA1LjQxOCAxMy4wNjUgMTIuNDQ1IDEzLjk4NiAxLjAyMS4xMzQgMS45MzctLjYzMSAxLjkzNy0xLjYzNXYtMS42NDVIMjkuMzFjNy4wMDggMCAxMi42OS01LjUzIDEyLjY5LTEyLjM1M0M0MiAxNy41MzEgMzYuMzE4IDEyIDI5LjMxIDEyIiBmaWxsPSIjRkY4NjhEIi8+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNS42NjcgMjIuMjVoLS44OWMtLjk4MSAwLTEuNzc3Ljc4My0xLjc3NyAxLjc1djUuMjVjMCAuOTY3Ljc5NiAxLjc1IDEuNzc4IDEuNzVoLjg4OWMuNDkgMCAuODg5LS4zOTIuODg5LS44NzV2LTdhLjg4Mi44ODIgMCAwIDAtLjg5LS44NzVtMTEuNTU2IDBoLTQuNDQ0bC43MzQtMi43MDZhMS43MzcgMS43MzcgMCAwIDAtLjczOC0xLjg4bC0uNzg3LS41MTdhLjg5Ny44OTcgMCAwIDAtMS4yODguMzM3bC0yLjAwNCA0LjAzOWEzLjQ1NiAzLjQ1NiAwIDAgMC0uMzYxIDEuNTM2djYuMTkxYzAgLjk2Ny43OTUgMS43NSAxLjc3NyAxLjc1aDYuMDQ0Yy44NDcgMCAxLjU3Ny0uNTg5IDEuNzQzLTEuNDA3bDEuMDY3LTUuMjVjLjIyLTEuMDgyLS42MjItMi4wOTMtMS43NDMtMi4wOTMiIGZpbGw9IiNFNTQ2NEYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="/>
					</div>
					<div style="clear: both;"></div>
					<div class="knowhow_list">
						<ul>
						<%
							for(CommuGosuKnowhowPostListDto dto : gDto) {
						%>
							<li >
								<div class="item_wrapper" idx="<%=dto.getPostIdx() %>">
									<a >
										<div class="image_wrapper">
											<img class="content_image" src="<%=dto.getPostImg()%>"/>
										</div>
										<h3 class="content_title"><%=dto.getPostTitle() %></h3>
										<p class="content_writer"><%=dto.getUserName() %></p>
									</a>	
								</div>
							</li>
						<% 
							} 
						%>
						</ul>
					</div>
					
				</div>
				
			</div>
		</div>
	</div>
			
			
			
			
			
			
			
			
			
			
			
			
			<%-- <div id="div_community_layout " class="border">
				<div class="soomgo_life_topic">
					<div class=" topic_item ">전체</div>
					<%
						for (CommunityDto_101 dto : commuDto) {
					%>
					<div class="topic_item" idx = "<%=dto.getIdx()%>"> <%=dto.getTitle()%> </div>
					<%
						}
					%>
				</div>
				<div>
					<div id="div_topic" >
						<p>고수님이 알려주는 유용한 서비스 전문 지식을 만나보세요</p>
						<img src="img/고수노하우img.png"/>
					</div>
					
<!-- -------------------------------------게시글 목록---------------------------- -->
					<div class="div_post_item_list">
					<%
						for (GosuKnowhowPostListDto dto : gDto) { 
					
					%>
						<div class="div_post_item" idx="<%=dto.getPostIdx()%>">
							<div class="div_img_box">
								<div><img class="p_img" src="<%=dto.getPostImg()%>"/>
								</div>
							</div>
							<div class="div_title_box" >
								<%=dto.getPostTitle() %>
							</div>
							<div id="div_post_writer" >
								<%=dto.getUserName() %>
							</div>
						</div>
					<%
						} 
					%>
							
<!-- -------------------------------------여기까지 게시글 목록---------------------------- -->
				</div>
			</div>
		</div> --%>


