<%@page import="dto.CommuPostWritePowerDto"%>
<%@page import="dto.GosuKnowHowListDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.MainPageDao"%>
<%@page import="dto.CommuGosuKnowhowPostLisMaintDto"%>
<%@page import="dto.CommuPostListDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CommuGosuKnowhowPostDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더시작 -->
<%
//여기부터 헤더 =================================
	/* ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
//	HttpSession hs = request.getSession();
	HttpSession hs = (HttpSession)request.getAttribute("hs");
	
	int users_idx = (int)(hs.getAttribute("L_users_idx"));
	int isgosu = (int)(hs.getAttribute("isgosu"));
	
	try{
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
	}catch(Exception e){} */
	
	
	// 로그인 수정 0810
	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
	int users_idx = (int)(session.getAttribute("L_users_idx"));
	int isgosu = (int)(session.getAttribute("isgosu"));
	
	try{
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
	}catch(Exception e){}

//	여기까지 헤더=================================
%> 
<!-- 헤더끝--> 
    
<%

// 		GosuKnhListAction 으로 이동!!

     	CommunityDao cDao = new CommunityDao();
//    		ArrayList<CommunityDto> commuDto = cDao.commuTitleSelect();
   // 		고수노하우 포스트 리스트 조회
// 			ArrayList<GosuKnowHowListDto> list = cDao.getGosuKnowHowList();
//    		ArrayList<CommuPostListDto> pList = cDao.getListPostSelect(commuIdx, serviceIdx, townIdx);
   		      	
   		      	
   		Integer townIdx = null;
   		Integer serviceIdx = null;
   		Integer commuIdx = Integer.parseInt(request.getParameter("commuIdx"));
   		  /* 메인에서 클리한 커뮤idx에 따라 게시글 리스트가 달라짐 */
   		    	
   		  // 커뮤니티 게시글 리스트 조회 지역, 서비스 선택 없을시
   		if(request.getParameter("townIdx") != null)
   		   townIdx = Integer.parseInt(request.getParameter("townIdx").trim());
   		if(request.getParameter("serviceIdx") != null)
   		   serviceIdx = Integer.parseInt(request.getParameter("serviceIdx").trim());
   		
   		ArrayList<CommuPostListDto> pList = (ArrayList<CommuPostListDto>)request.getAttribute("pList");
   		ArrayList<CommunityDto> commuDto = (ArrayList<CommunityDto>)request.getAttribute("commuDto");
   		ArrayList<GosuKnowHowListDto> list = (ArrayList<GosuKnowHowListDto>)request.getAttribute("list");
   		ArrayList<CommuPostWritePowerDto> listPostWritePower = (ArrayList<CommuPostWritePowerDto>)request.getAttribute("listPostWritePower");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-고수노하우</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="css/soomgoG_knowHow.css"/>
	<link rel="stylesheet" href="css/header.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
	<script>
	    $(function(){
	        $(".usermenu-dropdown").hide();
	        $(".usermenu3-dropdown").hide();
	        $(".header-total1").hide();
	        $(".header-total2").hide();
	        
	        $(".right-section-div2").click(function(){
	            var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
	            var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
	    
	            $(".usermenu-dropdown").toggle();
	            if ($(".right-section-div2-2-img").attr("src") === img1) {
	            $(".right-section-div2-2-img").attr("src", img2);
	             } else {
	             $(".right-section-div2-2-img").attr("src", img1);
	            }
	        });
	
	        $(".right3-section-div2").click(function(){
	            var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
	            var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
	    
	            $(".usermenu3-dropdown").toggle();
	            if ($(".right3-section-div2-2-img").attr("src") === img1) {
	            $(".right3-section-div2-2-img").attr("src", img2);
	             } else {
	             $(".right3-section-div2-2-img").attr("src", img1);
	            }
	        });
	        $(".usermenu-dropdown-div2-button").click(function(){
	        	if(g_user != 0){
	            	$(".header-total1").hide();
	            	$(".header-total2").show();
	        	}else{
	        		$(".header-total1").show();
	        		$(".header-total2").hide();
	        		location.href = "Gosu_join.jsp";
	        	}
	        });
	        $(".usermenu3-dropdown-div2-button").click(function(){
	            $(".header-total1").show();
	            $(".header-total2").hide(); 
	        });
	        
	        let users_idx = <%=users_idx%>; 
	        //alert(users_idx);
	       
	       let g_user = <%=isgosu%>
	       $(document).ready(function(){
	           if(g_user == 0){
	               $(".header-total").hide();
	               $(".header-total1").show();
	               $(".header-total2").hide();
	           } else if(g_user == 1) {
	               $(".header-total").hide();
	               $(".header-total1").hide();
	               $(".header-total2").show();
	           }
	       });
	       $(".usermenu-dropdown-div3-button").click(function(){
	       	$(".header-total").show();
	           $(".header-total1").hide();
	           $(".header-total2").hide();
	       });
	       
	       $(".usermenu-dropdown-div2-button").click(function(){
	      	 if(g_user != 1){
	      		location.href = "/Web/Gosu_join.jsp";
	      		$(".header-total2").hide();
	      		$(".header-total1").show();
	      	 }else{
	      		$(".header-total2").show();
	      		$(".header-total1").hide();
	      	 }
	       });
	       
	       $(function(){
	    	   $(".usermenu-dropdown-div3-button").click(function(){
	    	  	 $.ajax({
	    	  	        type: "POST",
	    	  	        url: "LogoutServlet", // 로그아웃을 처리하는 서블릿 URL
	    	  	        success: function(data) {
	    	  	            // 로그아웃 성공 시 처리할 코드
	    	  	            // 예를 들어 세션 무효화 후 화면 처리 등을 할 수 있음
	    	  	            console.log("로그아웃 성공");
	    	  	            $(".header-total").show();
	    	  	            $(".header-total1").hide();
	    	  	            $(".header-total2").hide();
	    	  	        },
	    	  	        error: function() {
	    	  	            // 에러 발생 시 처리할 코드
	    	  	            console.error("로그아웃 에러");
	    	  	        }
	    	  	    });
	    	   	});
	    	 
	       });
	    });
	</script>
	
	<script>
		$(function(){
			$(".topic_link_item").click(function (){
 				/* 커뮤 카테고리 클릭시 해당 카테고리로 이동 */
				let idx = $(this).attr("idx").trim();
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					location.href = "Controller?command=post_list&commuIdx=" + idx; 
				} else if(idx==2) {
					location.href = "Controller?command=gosu_knowhow_list&commuIdx=" + idx
				} else if(idx==5){
					location.href = "soomgoStory.jsp?commuIdx=" + idx
				} else if(idx==0){
					location.href="Controller?command=post_main_list";
				}   
			});
			$(".item_wrapper").click(function(){
					let idx = $(this).attr("idx");
					alert("idx=" + idx);
					location.href = "Controller?command=gosu_knowhow_detail&post_idx=" + idx;
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
 			
 			// 글쓰기 버튼 클릭시
			$(".div_header_img").click(function(){
				if(<%=users_idx%> != 0) {
					$(".dropdown-write-menu").toggle();
				} else {
					alert("로그인이 필요합니다.");
					location.href = "Login.jsp";
				}
			});
			
			$(document).on('click', '.dropdown-write-menu > li', function() {
				let selected = $(this).find(".headline").text();
				if(selected=="함께해요" || selected=="고수에게묻다" || selected=="고수광장" || selected=="고수소식") {
					let commu_idx = $(this).attr("commu-idx");
					location.href = "Controller?command=post_write&commu_idx=" + commu_idx + "&selected=" + encodeURI(selected);   /* 일부 특수문자를 제외한 URL을 인코딩함. (한글 인코ㄷ딩)*/
				} else if(selected=="고수노하우") {
					location.href = "soomgoGkh_Write.jsp";
				} 
			});
		});
	</script>
</head>

	<header class = "header-total">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "Controller?command=main_page">
                                <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
                            </a>
                        </div>
                        <nav class = "header-nav">
                            <ul class = "header-nav-ul">
                                <li class = "header-nav-li">
                                    <a href = "sgRequestMain.jsp">
                                        <span class = "header-nav-li-span">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span" id = "serarch_profile">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=market_list">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=post_main_list">
                                        <span class = "header-nav-li-span">커뮤니티</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>

                    <div class = "right-section">
                        <nav class = "right-section-nav">
                            <ul class = "right-section-nav-ul">
                                <li class = "right-section-nav-li">
                                    <a href = "Login.jsp">
                                        <span class = "right-section-nav-li-span">로그인</span>
                                    </a>
                                </li>

                                <li class = "right-section-nav-li1">
                                    <a href = "User.join.jsp">
                                        <span class = "right-section-nav-li-span">회원가입</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <button type = "button" class = "btn-signup">
                            <a href = "Gosu_join.jsp" class = "btn-a">고수가입</a>
                        </button>
                    </div>
                </div>
            </section>
        </div>
    </header>

	 <header class = "header-total1">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "Controller?command=main_page">
                                <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
                            </a>
                        </div>
                        <nav class = "header-nav">
                            <ul class = "header-nav-ul">
                                <li class = "header-nav-li">
                                    <a href = "sgRequestMain.jsp">
                                        <span class = "header-nav-li-span">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=market_list">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=post_main_list">
                                        <span class = "header-nav-li-span">커뮤니티</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- <div class = "center-section">
                        <div class = "center-section-desktop">
                            <form class = "center-section-form">
                                <div class = "center-section-form-div1">
                                    <div class = "center-section-form-div2">
                                        <img class = "center-section-form-div2-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
                                    </div>
                                    <input type = "text" class = "center-section-form-div2-input" placeholder="어떤 서비스가 필요하세요?" autocomplete="off">
                                </div>
                            </form>
                        </div>
                    </div> -->

                    <div class = "right-section">
                        <nav class = "right-section-nav">
                            <ul class = "right-section-nav-ul">
                                <li class = "right-section-nav-li3">
                                    <a href = "">
                                        <span class = "right-section-nav-li-span">받은견적</span>
                                    </a>
                                </li>

                                <li class = "right-section-nav-li1">
                                    <a href = "">
                                        <span class = "right-section-nav-li-span">채팅</span>
                                    </a>
                                    <span class = "right-section-nav-li-span1">148</span>
                                </li>
                            </ul>
                        </nav>
                        <div class = "right-section-div1">
                            <button type = "button" class = "right-section-div1-button">
                                <span class = "right-section-div1-span">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
                                    </svg>
                                </span>
                            </button>
                        </div>
                        <%
                        	if (SoomgoHeader != null && !SoomgoHeader.isEmpty()) {
                                                for(Soomgo_headerDto shdto : SoomgoHeader){
                        %>
                        <div class = "right-section-div2-outter">
                            <div class = "right-section-div2">
                                <div class = "right-section-div2-1">
                                    <div class = "right-section-div2-2">
	                                    <img src = "<%=shdto.getF_img()%>">
                                    </div>
                                </div>
                                <img class = "right-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
                                
                            </div>
                            <div class = "usermenu-dropdown">
                                <div class = "usermenu-dropdown-div1">
                                    <h4 class = "usermenu-dropdown-div1-font"><%=shdto.getName()%> 고객님</h4>
                                </div>
                                <ul class = "usermenu-dropdown-ul">
                                    <li class = "usermenu-dropdown-li">
                                        <a href = "">
                                            <div class = "usermenu-dropdown-li-font">받은 견적</div>
                                        </a>
                                    </li>

                                    <li class = "usermenu-dropdown-li">
                                        <a href = "">
                                            <div class = "usermenu-dropdown-li-font">마이페이지</div>
                                        </a>
                                    </li>
                                </ul>
                                <div class = "usermenu-dropdown-div2">
                                    <button type = "button" class = "usermenu-dropdown-div2-button">
                                        <img class = "usermenu-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
                                        고수전환
                                    </button>
                                </div>
                                <div class = "usermenu-dropdown-div3">
                                	<a href = "soomgo_main.jsp">
                                    <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
                                	</a>
                                </div>
                            </div>
                        </div>
                       <%
                       	} 
                                              	}
                       %>
                    </div>
                </div>
            </section>
        </div>
    </header>
	
    <header class = "header-total2">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "Controller?command=main_page">
                                <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
                            </a>
                        </div>
                        <nav class = "header-nav">
                            <ul class = "header-nav-ul">
                                <li class = "header-nav-li">
                                    <a href = "sgRequestMain.jsp">
                                        <span class = "header-nav-li-span">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=market_list">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Controller?command=post_main_list">
                                        <span class = "header-nav-li-span">커뮤니티</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    

                    <div class = "right3-section">
                        <nav class = "right3-section-nav">
                            <ul class = "right3-section-nav-ul">
                                <li class = "right3-section-nav-li3">
                                    <a href = "">
                                        <span class = "right3-section-nav-li-span">받은견적</span>
                                    </a>
                                </li>

                                <li class = "right3-section-nav-li1">
                                    <a href = "">
                                        <span class = "right3-section-nav-li-span">바로견적</span>
                                    </a>
                                </li>

                                <li class = "right3-section-nav-li1">
                                    <a href = "">
                                        <span class = "right3-section-nav-li-span">채팅</span>
                                    </a>
                                </li>

                                <li class = "right3-section-nav-li1">
                                    <a href = "">
                                        <span class = "right3-section-nav-li-span">프로필</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <a href= "" class = "right3-section-cash-outter">
                            <span class = "right3-section-cash-span1">
                                <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <g fill="none" fill-rule="evenodd">
                                        <path fill="none" d="M0 0h20v20H0z"></path>
                                        <path d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z" fill="#FFBF0D"></path>
                                        <path d="M7.916 7.341a3.312 3.312 0 0 1 2.316-.912 3.32 3.32 0 0 1 2.293.974.714.714 0 1 0 1.005-1.015A4.75 4.75 0 0 0 10.25 5a4.74 4.74 0 0 0-3.313 1.301 5.066 5.066 0 0 0-1.562 3.264 5.124 5.124 0 0 0 .989 3.49 4.806 4.806 0 0 0 3.038 1.878 4.703 4.703 0 0 0 3.467-.773c.325-.224.62-.486.879-.778a.714.714 0 1 0-1.069-.948 3.453 3.453 0 0 1-.621.55 3.274 3.274 0 0 1-2.416.541 3.377 3.377 0 0 1-2.133-1.323 3.695 3.695 0 0 1-.71-2.517A3.637 3.637 0 0 1 7.915 7.34z" stroke="#FFF" stroke-width=".833" fill="#FFF"></path>
                                    </g>
                                </svg>
                            </span>
                        </a>
                        <div class = "right3-section-div1">
                            <button type = "button" class = "right3-section-div1-button">
                                <span class = "right3-section-div1-span">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
                                    </svg>
                                </span>
                            </button>
                        </div>
                         <%
                         	if (SoomgoHeader2 != null && !SoomgoHeader2.isEmpty()) {
                                                 		for(Soomgo_header2Dto sh2dto : SoomgoHeader2){
                         %>
                        <div class = "right3-section-div2-outter">
                            <div class = "right3-section-div2">
                                <div class = "right3-section-div2-1">
                                    <div class = "right3-section-div2-2">
                                    	<img src = "<%=sh2dto.getF_img()%>" width = "30px;" height = "30px;">
                                    </div>
                                </div>
                                <img class = "right3-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K">
                                
                            </div>
                            <div class = "usermenu3-dropdown">
                                <div class = "usermenu3-dropdown-div1">
                                    <h4 class = "usermenu3-dropdown-div1-font"><%=sh2dto.getName()%> 고객님</h4>
                                    <a class = "usermenu3-dropdown-div1-a">
                                        <div class = "usermenu3-dropdown-div1-a-1">
                                            <span class = "usermenu3-dropdown-div1-a-1-span1">
                                                <img class = "usermenu3-dropdown-div1-a-1-span1-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo=">
                                                평점 <%=sh2dto.getAvg_score()%>.0
                                            </span>
                                            <span class = "usermenu3-dropdown-div1-a-1-span2"></span>
                                            <span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review()%>개</span>
                                        </div>
                                    </a>
                                </div>
                                <ul class = "usermenu3-dropdown-ul">
                                    <li class = "usermenu3-dropdown-li">
                                        <a href = "">
                                            <div class = "usermenu3-dropdown-li-font">받은 견적</div>
                                        </a>
                                    </li>

                                    <li class = "usermenu3-dropdown-li">
                                        <a href = "">
                                            <div class = "usermenu3-dropdown-li-font">마이페이지</div>
                                        </a>
                                    </li>
                                </ul>
                                <div class = "usermenu3-dropdown-div2">
                                    <button type = "button" class = "usermenu3-dropdown-div2-button">
                                        <img class = "usermenu3-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4=">
                                        고객전환
                                    </button>
                                </div>
                                <div class = "usermenu3-dropdown-div3">
                                	<a href = "soomgo_main.jsp">
                                    <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                            	<%
                            		}
                            			                        }
                            	%>
                    </div>
                </div>
            </section>
        </div>
    </header>


<!-- -------------------------------------헤더--------------------------------------------------- -->
<body>
	<div class="div_layout">
		<div class="div_community">
			<div class="div_header">
				<div class="div_header_inner">
					<div class="div_header_text">커뮤니티</div>
					<div class="div_header_img">
						<div class="text" >글쓰기</div>
						<img class="inner_img" src="img/숨고글쓰기이미지.png"/>
						<ul role="menu" class="dropdown-write-menu">
					<% for(CommuPostWritePowerDto dtoPower : listPostWritePower) { %>
						<li commu-idx="<%=dtoPower.getCommuIdx()%>">
							<div class="dropdown-menu-item">
								<div class="dropdown-menu-item-text">
									<span class="headline"><%=dtoPower.getCommuTitle()%></span>
									<span class="underline">나만의 전문 경험과 지식을 공유해 보세요</span>
								</div>
								<i class="dropdown-menu-itme-icon"></i>
							</div>
						</li>
					<% } %>
				</ul>
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
							<a class="topic_link_item" idx=0>전체</a>
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
							for(GosuKnowHowListDto dto : list) {
						%>
							<li >
								<div class="item_wrapper" idx="<%=dto.getPostIdx() %>">
									<a >
										<div class="image_wrapper">
											<img class="content_image" src="<%=dto.getImg()%>"/>
										</div>
										<h3 class="content_title"><%=dto.getTitle() %></h3>
										<p class="content_writer"><%=dto.getGosuName() %></p>
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
<!-- 		<div id="app-footer" class="center"> -->
<!-- 			<div id="footer-container" class="center"> -->
<!-- 				<div id="col-content"> -->
<!-- 					<p id="col-content-text">1599-5319</p> -->
<!-- 					<p id="col-content-text-middle"> -->
<!-- 						평일 10:00 - 18:00<br/> -->
<!-- 						(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외) -->
<!-- 					</p> -->
<!-- 					<a class="footer-download" style="margin-right: 8px;"> -->
<!-- 						<img src="https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" class="footer-download-img"> -->
<!-- 						APP STORE  -->
<!-- 					</a> -->
<!-- 					<a class="footer-download"> -->
<!-- 						<img src="https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" class="footer-download-img"> -->
<!-- 						PLAY STORE  -->
<!-- 					</a> -->
<!-- 				</div> -->
<!-- 				<div id="col-content-right"> -->
<!-- 					<ul id="content-list"> -->
<!-- 						<li class="content-list"> -->
<!-- 							<span class="content-list-category">숨고소개</span> -->
<!-- 							<div> -->
<!-- 								<a class="content-list-text">회사소개</a> -->
<!-- 								<a class="content-list-text">채용안내</a> -->
<!-- 								<a class="content-list-text">팀블로그</a> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 						<li class="content-list"> -->
<!-- 							<span class="content-list-category">고객안내</span> -->
<!-- 							<div> -->
<!-- 								<a class="content-list-text">이용안내</a> -->
<!-- 								<a class="content-list-text">안전정책</a> -->
<!-- 								<a class="content-list-text">예상금액</a> -->
<!-- 								<a class="content-list-text">고수찾기</a> -->
<!-- 								<a class="content-list-text">숨고보증</a> -->
<!-- 								<a class="content-list-text">고수에게묻다</a> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 						<li class="content-list"> -->
<!-- 							<span class="content-list-category">고수안내</span> -->
<!-- 							<div> -->
<!-- 								<a class="content-list-text">이용안내</a> -->
<!-- 								<a class="content-list-text">고수가이드</a> -->
<!-- 								<a class="content-list-text">고수가입</a> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 						<li class="content-list"> -->
<!-- 							<span class="content-list-category">고객센터</span> -->
<!-- 							<div> -->
<!-- 								<a class="content-list-text">공지사항</a> -->
<!-- 								<a class="content-list-text">자주묻는질문</a> -->
<!-- 							</div> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div id="footer-container-row" class="center"> -->
<!-- 				<div id="footer-container-row-term"> -->
<!-- 					<div class="row-term-content"> -->
<!-- 						<div class="row-term-list"> -->
<!-- 							<div class="row-term-list-terms-group" style="margin-right: 30px;"> -->
<!-- 								<a class="terms-text" style="margin-right: 30px;">이용약관</a> -->
<!-- 								<a class="terms-text">개인정보처리방침</a> -->
<!-- 							</div> -->
<!-- 							<div class="row-term-list-terms-group"> -->
<!-- 								<a class="terms-text" style="margin-right: 30px;">위치기반 서비스 이용약관</a> -->
<!-- 								<a class="terms-text">사업자 정보확인</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row-term-list"> -->
<!-- 							<span class="terms-text-span">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span> -->
<!-- 						</div> -->
<!-- 						<ul class="row-term-content-guide"> -->
<!-- 							<li class="content-guide-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li> -->
<!-- 							<li class="content-guide-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li> -->
<!-- 							<li class="content-guide-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li> -->
<!-- 							<li class="content-guide-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 					<div class="row-term-content-badge"> -->
<!-- 						<a class="footer-badge"> -->
<!-- 							<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg" class="footer-badge-img"> -->
<!-- 						</a> -->
<!-- 						<a class="footer-badge"> -->
<!-- 							<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg" class="footer-badge-img"> -->
<!-- 						</a> -->
<!-- 						<a class="footer-badge"> -->
<!-- 							<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg" class="footer-badge-img"> -->
<!-- 						</a> -->
<!-- 						<a class="footer-badge"> -->
<!-- 							<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg" class="footer-badge-img"> -->
<!-- 						</a> -->
<!-- 						<a class="footer-badge"> -->
<!-- 							<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg" class="footer-badge-img"> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
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


