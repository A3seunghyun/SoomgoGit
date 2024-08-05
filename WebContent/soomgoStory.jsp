<%@page import="dto.CommunityDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CommunityDao cDao = new CommunityDao();
	ArrayList<CommunityDto> category = cDao.commuTitleSelect();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-숨고이야기</title>
	<link rel="stylesheet" href="css/soomgoStory.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
		$(function(){
			$(".topic_item").click(function (){
 				/* 커뮤 카테고리 클릭시 해당 카테고리로 이동 */
				let idx = $(this).attr("idx").trim();
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					location.href = "soomgoQnA2.jsp?commuIdx=" + idx; 
				} else if(idx==2) {
					location.href = "soomgoG_knowHow.jsp?commuIdx=" + idx
				} else if (idx = 5) {
					location.href = "soomgoQnA2.jsp?commuIdx=" + idx
				} else {
					location.href="soomgoCommu.jsp";
				}   
			});
			$(".")
			
			
			
			
			
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
					<div class="div_soomgo_text" > 숨고생활 </div>
					<div class="div_soomgo_text_center" > 고수센터 </div>
				</div>
			</div>
			<div id="div_community_layout">
				<div>
					<div class="topic_item">전체</div>
					<%
						for (CommunityDto dto : category) {
					%>
					<div class="topic_item"  idx =<%=dto.getIdx()%> ><%=dto.getTitle() %></div>
					<%} %>
				</div>
				<div>
					<div id="div_topic" >
						<p>숨고가 전하는 고수와 고객의 특별한 이야기를 만나보세요</p>
						<img src="img/숨고이야기img1.png"/>
					</div>
					<div id="div_service_town" >
						<div id="div_service" class="border">
							<span>서비스
							</span>
								<img src="img/숨고서비스화살표.png"/>
						</div>
					</div>
					
<!-- -------------------------------------게시글 목록---------------------------- -->
					<div class="div_post_item_list">
						<ul class="feed_list">
							<li class="div_item_box">
								<div class="img_wrapper">
									<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/ab5c1ad4-c5cd-489a-af34-4d2e1f72da48.png?h=126&w=189&webp=1"/>
								</div>	
								<h3 class="title">
									💌숨고레터 118호💌 맛있는 건 참을 수 없어
								</h3>
								<div class="feed_footer">
									<div class="user_interaction">
										<span class="like">4</span>
										<span class="comment">14</span>
									</div>	
								</div>
							</li>
							<li class="div_item_box">
								<div class="img_wrapper">
									<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/d1e64281-4a03-40a2-a8dc-b361320b2ec3.png?h=126&w=189&webp=1"/>
								</div>	
								<h3 class="title">
									서울대 석사 트레이너가 알려주는 바른 자세에 무조건 도움 되는 운동 5
								</h3>
								<div class="feed_footer">
									<div class="user_interaction">
										<span class="like">1</span>
										<span class="comment">4</span>
									</div>	
								</div>
							</li>
							<li class="div_item_box">
								<div class="img_wrapper">
									<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/c116964a-313e-4dc1-9630-fc421d191f55.png?h=126&w=189&webp=1"/>
								</div>	
								<h3 class="title">
									🔭 18살에 유럽 프로 리그 데뷔전 2위! 축구 레슨 허민영 고수
								</h3>
								<div class="feed_footer">
									<div class="user_interaction">
										<span class="like">3</span>
										<span class="comment">7</span>
									</div>	
								</div>
							</li>
							<li class="div_item_box">
								<div class="img_wrapper">
									<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/79aee9a6-0375-4ed5-9942-133d5f900371.png?h=126&w=189&webp=1"/>
								</div>	
								<h3 class="title">
									?고객 만족도 200% 보장하는 에어컨 청소
								</h3>
								<div class="feed_footer">
									<div class="user_interaction">
										<span class="like">5</span>
										<span class="comment">24</span>
									</div>	
								</div>
							</li>
							<li class="div_item_box">
								<div class="img_wrapper">
									<img src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/445fb5b6-6cd2-4e44-a089-0944adce59e3.png?h=126&w=189&webp=1"/>
								</div>	
								<h3 class="title">
									🔭 국가대표 상비군 출신 댄스스포츠 조소휘 고수
								</h3>
								<div class="feed_footer">
									<div class="user_interaction">
										<span class="like">6</span>
										<span class="comment">54</span>
									</div>	
								</div>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


					


<!-- -------------------------------------여기까지 게시글 목록---------------------------- -->
					
		














































