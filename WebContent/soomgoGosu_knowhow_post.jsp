<%@page import="dto.CommuGkhpostFooterDto"%>
<%@page import="dto.CommuPostLikeViewCommentDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuGosuKnowhowPostDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int postIdx = Integer.parseInt(request.getParameter("post_idx"));
	CommunityDao gDao = new CommunityDao();
	
	
	ArrayList<CommuGosuKnowhowPostDto> gDto = gDao.getGkhPost(postIdx);  //게시글 정보를 불러올 Dto
	
	// GosuKnowhowPostDto에서 반복할것들과 반복하지 않을 것들을 구분하기 위함    
    CommuGosuKnowhowPostDto mainDto = gDto.isEmpty() ? null : gDto.get(0);
	// isEmpty() 메서드는 리스트가 비어 있으면 true, 그렇지 않으면 false를 반환
	// gDto가 비어 있지 않으면, gDto.get(0)을 반환합니다. gDto의 첫 번째 요소를 반환
	
	CommuPostLikeViewCommentDto likeViewDto = gDao.getLikeCommentView(postIdx);	// 게시글의 댓글수,좋아요,조회수를 불러오는 메서드
	
	ArrayList<CommuGkhpostFooterDto> gList = gDao.getGkhPostFooter();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-고수노하우_게시글</title>
	<link rel="stylesheet" href="css/soomgoGosu_knowhow_post.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$(".div_item").click(function(){
				let idx = $(this).attr("idx");
				location.href="soomgoGosu_knowhow_post.jsp?post_idx=" + idx;
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
<!-- -------------------------------------게시글 목록---------------------------- -->
<%
	if(mainDto != null ) {
%>
<div class="div_post_layout"  > 
	<div class="div_post_header">
		<img class="header_img" src="<%=mainDto.getImg()%>"/>
		<div class="div_post_category_subject" >
			<span>커뮤니티</span>	
			<img src="img/왼화살표이미지.png"/>
			<span><%=mainDto.getCommuTitle()%></span>
		</div>
		<div class="div_post_header_title">
			<div >
				<span><%=mainDto.getServiceTitle()%></span>
			</div>
			<div >
				<h1><%=mainDto.getTitle()%> </h1>
			</div>
		</div>
		<div class="div_user_profile">
			<div>
				<img class="profile_img" src="<%=mainDto.getImg()%>"/> 
				<div class="user_name"><%=mainDto.getName()%></div>
				<div class="post_date"><%=mainDto.getWriteDate().substring(2,10)%> · 조회 <%=likeViewDto.getViewCount()%></div>
			</div>
			<div >
				<div class="back_img1"></div>
				<div class="back_img2">
				<img  src="img/세로점3.png"/>
				<div style="clear:both"></div>
				</div>
			</div>
		</div>
<%
	for (CommuGosuKnowhowPostDto dto : gDto) {
%>
		<div class="div_body_contents">
			<span>
				<%=dto.getStartPost()%> 
			</span>
<!-- 			=========여기부터 본문========= -->
				<p><%=dto.getHeaderPost()%></p>
				<div class=" content_img_box">
				<%
					if(dto.getMainImg1() != null){
				%>
					<img class="content_img" src="<%=dto.getMainImg1()%>"/>  <%-- 이미지 여러개인것들 어떻게 출력할지? dto에 이미지 1,2,3 있음 --%>
				<%
					}
				%>
				</div>
				<div class="span_content">
					<span>
						<%=dto.getContents()%>
					</span>
				</div>
<!-- 			=========여기까지 본문========= -->
		</div>
<%
	}
%>		
		<div class="div_react">
		<img src="img/좋아요이미지1.png"/> 좋아요 <%=likeViewDto.getLikeCount()%>
		</div>
		<div class="div_profile_container">
			<img  class="bottom_profile_img" src="<%=mainDto.getImg()%>"/>
			<div class="bottom_user_name"><%=mainDto.getName()%></div>
			<div class="bottom_user_service"><%=mainDto.getServiceTitle()%></div>
			<button class="bottom_button">견적요청</button>
			<p>
				<%=mainDto.getExplain()%>
			</p>
		</div>
		<div class="div_pro_popular_layout">
			<div class="div_pro_popular">
				<h2>많이 보는 노하우</h2>
				<div class="div_item_box">
				<%
					for(CommuGkhpostFooterDto footerList : gList) {
				%>
					<div class="div_item" idx = "<%=footerList.getPostIdx()%>">
						<div >
							<img class="item_img" src="<%=footerList.getPostImg() %>"/>
						</div>
						<div class="content_title"><%=footerList.getPostTitle()%></div>
						<div class="content_writer"><%=footerList.getUserName() %></div>
					</div>
					<%} %>
				</div>
			</div>	
		</div>
	</div>	
</div>
<%} %>
<!-- -------------------------------------게시글 목록---------------------------- -->








































