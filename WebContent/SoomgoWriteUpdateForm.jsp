<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuTownDto"%>
<%@page import="dto.CommuProvinceDto"%>
<%@page import="dao.ProvinceTownDao"%>
<%@page import="dto.CommuServiceCountDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommuServiceDao"%>
<%@page import="dto.CommuPostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int postIdx = 0;
	try {
	    if (request.getParameter("post_idx") != null) {
	        postIdx = Integer.parseInt(request.getParameter("post_idx"));
	    }
	} catch (NumberFormatException e) {
	    e.printStackTrace(); // 또는 적절한 예외 처리
	}
	CommunityDao dao = new CommunityDao();
	CommuPostDto dto = dao.getPostViewSelect(postIdx);
	
	// 게시글 업데이트
//	dao.postUpdate(dto.getPostTitle(), dto.getPostContents(), 26, 11, 6, postIdx);
	
	/* 서비스 지역필터 */
	CommuServiceDao serviceDao = new CommuServiceDao();
   	ArrayList<CommuServiceCountDto> listServiceCount = serviceDao.serviceSelect();
   	
//    	지역 필터
   	ProvinceTownDao ptDao = new ProvinceTownDao();
   	ArrayList<CommuProvinceDto> ptDto = ptDao.getProvinceSelect();
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활_게시글 수정</title>
	<link rel="stylesheet" href="css/soomgoWrite.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<script>
	$(function(){
// 		$(".img_icon").click(function(){
// 			$(".custom-file-label").click();
// 		});
// 		$(".button").click(function(){
// 			preventDefault();
// 		});
		//$(document).ready(function() {		/* 문서가 준비되면 실행될 코드를 정의함. */
	    // textarea의 keyup 이벤트를 감지하여 내용 길이를 확인
	    $(".content_text_area").on('keyup', function() {
	        var inputValue = $(this).val().trim();   // textarea의 값을 가져와서 앞뒤 공백을 제거한 후 inputValue에 저장함.
	        var length = inputValue.length;			// 값을 가져온 inputValue에 길이를 구함.
	        
	        // 입력된 글자 수가 2글자 이상인 경우
	        if (length > 1) {
	            $(".next_button").css('color', 'rgb(0, 199, 174)');
	        } else {
	            $(".next_button").css('color', 'rgb(197, 197, 197)'); // 2글자 미만이면 원래 글씨 색상으로.
	        }
	    });
		//});
// 		서비스 버튼 클릭시
		$("#div_service_region > button:nth-child(1)").click(function(){
			$("#greyscreen_filter").show();
			$("#div_service_town_layout").show();
			$("#div_service").addClass('active');
			$("#div_town").removeClass('active');
		});
// 		지역버튼 클릭시
		$("#div_service_region > button:nth-child(2)").click(function() {
			$("#greyscreen_filter").show();
			$("#div_service_town_layout").hide();
			$("#div_town_layout").show();
			$("#div_town").addClass('active');
			$("#div_service").removeClass('active');
			
		});
		$("#div_service_town_layout > div > #div_town").click(function() {
			$("#div_service_town_layout").hide();
			$("#div_town_layout").show();
		});
		$("#div_service2").click(function(){
			$("#div_town_layout").hide();
			$("#div_service_town_layout").show();
			$("#div_service").addClass('active'); 
			$("#div_town").removeClass('active');
		});
		$(".x").click(function(){
			$("#div_service_town_layout").hide();
			$("#greyscreen_filter").hide();
			$("#div_town_layout").hide();
			$("#div_input > input").val('');
		});
		$(".div_category").click(function(){
			if($(this).find("div").hasClass("arrow-down")){
				$(this).find("div").removeClass("arrow-down").addClass("arrow-up");
				$(this).find("div_category .level2").css('display','block');				
				
				
			} else {
				$(this).find("div").removeClass("arrow-up").addClass("arrow-down");
			}
			
			let name = $(this).text().trim();
			console.log(name);
			let length = $(".div_category[for='" + name + "']").length;
			
		});
		$(".next_button").click(function() {
			$("#input_town_name").val($("#townName").text());
			$("#input_service_title").val($("#serviceTitle").text());
		});
		
		
	});  //마지막 중괄호 $(function)의 끝.
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
	<form action="PostUpdateServlet" method="post" >
		<input type="hidden" name="post_idx" value="<%=postIdx%>"/>
		<div id="div_select_header">
			<div>
				<%
					if(1==1) {
				%>		
<!-- 					고수이면 -->
					<select class="option" name="commu_idx">
						<option disabled>주제선택</option>
						<option value="4">고수소식</option>
						<option value="6">고수광장</option>
					</select>		
				<%
							} else {
						%>
<!-- 					일반유저이면 -->
					<select class="option" name="commu_idx">
						<option disabled>주제선택</option>
						<option value="1">고수에게묻다</option>
						<option value="3">함께해요</option>
					</select>
				<%
					}
				%>
			</div>
			<input type="submit" class="next_button" value="등록" style="color: rgb(0, 199, 174);"/>
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
				<input id="input_text" type="text" name="post_title" value="<%=dto.getPostTitle()%>"  maxlength="30"/>
			</div>
			<div id="div_service_region">
				<button type="button" class="service_town_button">
<!-- 				 <input type="hidden" id="serviceTitle" name="spanValue" value=""/>  인풋타입  히든으로 스팬태그에 있는 값들을 보내야 하는건지? -->
					<span class="service_town_span" id="serviceTitle"><%=dto.getServiceTitle()%></span>
					<input type="hidden" id="input_service_title" name="service_title"/>
					<input type="hidden" name="service_idx" value="<%=dto.getServiceIdx()%>"/>
				</button>
				<button type="button" class="service_town_button">
					<span class="service_town_span" id="townName"><%=dto.getTownName()%></span>
					<input type="hidden" id="input_town_name" name="town_name"/>
					<input type="hidden" name="town_idx" value="<%=dto.getTownIdx()%>"/>
				</button>
			</div>
			<div style="clear:both;"></div>
			<div class="contents">
				<span class="legacy">
					 <textarea name="content" class="content_text_area" ><%=dto.getPostContents()%></textarea>
				 </span>
<!-- 				 <span class="editor_contents_text_area"> -->
<!-- 				 </span> -->
			</div>	 
		</div>
	</form>
</div>
</body>

<!-- 서비스 지역필터 -->
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
 		for (CommuTownDto townDto : tDto) {
 	%>
		<div class="div_town level1" for="<%=pDto.getProvinceName()%>" idx="<%=townDto.getTownIdx()%>"> <%=townDto.getTownName()%></div>
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
			for(CommuServiceCountDto serviceDto : listServiceCount) {
		%>
			<% if(serviceDto.getServiceIdx()==null) { // 대분류 %>
				<div class="div_category" idx="<%=serviceDto.getCategoryIdx()%>"><%=serviceDto.getCategoryTitle()%><div class="arrow-down"></div>
				</div>
			<% } else {   // 소분류 %>
				<div class="div_category level2" for="<%=serviceDto.getCategoryTitle()%>" idx="<%=serviceDto.getServiceIdx()%>"><%=dto.getServiceTitle()%></div>
			<% } %>
		<% } %>
	</div>
</div>
								

















