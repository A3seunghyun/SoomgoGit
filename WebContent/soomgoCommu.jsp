<%@page import="dto.CommuNoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.CommuPostWritePowerDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
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
<!-- 헤더끝 -->

<%
	// soomgoCommu.jsp?commuIdx=1 
	// --> request.getParameter("commuIdx") : "1"	
	// --> Integer.parseInt("1") : 1
	
// 	무한스크롤은 남겨 놓고
	int pageNum = 1;  // 현재페이지 : 초기값(1)
   	try {
       	pageNum = Integer.parseInt(request.getParameter("page"));  // 게시글 갯수를 세는 메서드 (무한스크롤 적용)
   	} catch(Exception e) {}
	
	
   	CommunityDao cDao = new CommunityDao();  /* 헤더 isgosu 영현이가 고치면 이동 */
	
// 	======================    아래의 코드 PostListAction으로 이동     ==========================================
	
	Integer commuIdx = 0;	// 받아온 값이 없으면 0 (전체)가 기본값
	Integer townIdx = null;
	Integer serviceIdx = null;
	if(request.getAttribute("commuIdx") != null)
		commuIdx = (Integer)request.getAttribute("commuIdx");
	if(request.getAttribute("townIdx") != null)
		townIdx = (Integer)request.getAttribute("townIdx");
	if(request.getAttribute("serviceIdx") != null)
		serviceIdx = (Integer)request.getAttribute("serviceIdx");
	
	
 	ProvinceTownDao ptDao = new ProvinceTownDao();
//  	1189행을 위해 dao 살려놔야 하나?
	
// 	CommunityDao cDao = new CommunityDao();
// 	/* 커뮤니티 전체 게시글을 뿌려주는 메서드 */
	ArrayList<CommuPostListDto> listPost = cDao.getListPostSelect(commuIdx, townIdx, serviceIdx);
	

// 	ArrayList<CommunityDto> category = cDao.commuTitleSelect();
// 	ArrayList<CommuPostWritePowerDto> listPostWritePower = cDao.postWritePowerSelect(isgosu);   /* (위에 코드 빼놓음) */
	
// 	CommuServiceDao serviceDao = new CommuServiceDao();
// 	ArrayList<CommuServiceCountDto> listServiceCount = serviceDao.serviceSelect();
	
// // 	ProvinceTownDao ptDao = new ProvinceTownDao();
// 	ArrayList<CommuProvinceDto> ptDto = ptDao.getProvinceSelect();
	
// 	ArrayList<CommuHotTopicList>hList = cDao.hotTopic();
// 	ArrayList<CommuLatestPhotoReviewsList> list = cDao.latestPhotoReviews();


// 	ArrayList<CommuPostListDto> listPost = (ArrayList<CommuPostListDto>)request.getAttribute("listPost");  게시글 뿌리는 메서드 위에 코드있음    (무한스크롤 이건 위에 냅둬야하나 action으로 해야하나?)
	ArrayList<CommunityDto> category = (ArrayList<CommunityDto>)request.getAttribute("category");
	ArrayList<CommuServiceCountDto> listServiceCount = (ArrayList<CommuServiceCountDto>)request.getAttribute("listServiceCount");
	ArrayList<CommuProvinceDto> ptDto = (ArrayList<CommuProvinceDto>)request.getAttribute("ptDto");
	ArrayList<CommuHotTopicList>hList = (ArrayList<CommuHotTopicList>)request.getAttribute("hList");
	ArrayList<CommuLatestPhotoReviewsList> list = (ArrayList<CommuLatestPhotoReviewsList>)request.getAttribute("list");
	ArrayList<CommuPostWritePowerDto> listPostWritePower = (ArrayList<CommuPostWritePowerDto>)request.getAttribute("listPostWritePower");
%>	
	
<%-- 알림 여기부터 --%>
<%
	ArrayList<CommuNoticeDto> nList = (ArrayList<CommuNoticeDto>)request.getAttribute("nList");
%>
<%-- //알림 여기까지 --%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고 커뮤니티 전체</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="css/soomgoCommu.css"/>
	<link rel="stylesheet" href="css/header.css"/>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
<script>
//영현이 헤더 jquery 
	let a = 0;
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
        $(".usermenu-dropdown-div2-button").click(function(){     // 고수전한 버튼 클릭시.
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
      		location.href = "Gosu_join.jsp";
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
    // 영현이 헤더 jquery
 </script>
 
 <%-- 웹소켓 시작 --%>
<script>
	// 알림
	function func_on_message(e) {
// 			댓글 등록 버튼을 누르면 알림을 받아와서 뿌려줌
// 			alert("notice!");
			let str = e.data;
			let arr = str.split("||");
			//alert(arr[1]);	//(게시글 작성자)idx
			//alert(<%=users_idx%>);	// 댓글을 단 유저 idx 
			//alert(arr[0]);  // Notice ?
			//alert(arr[1]);  // 21 ?
			//alert(arr[1]=="<%=users_idx%>");  // true?
			if(arr[0]=="Notice" && arr[1]=="<%=users_idx%>") {
 				alert("moonjang : " + arr[2]);   // before toast testing.
				let params = { user_idx : <%=users_idx%> };
				
				$.ajax({
					type: "get",
					url: "AjaxNoticeListServlet",
					data: params,
					success: function(res) {
						//alert("?");
 						console.log(res);     // CHECK, res = JSON ARRAY.
 						$(".notice-list").html("");
 						if(res.length==0) {
 							$(".notice-list").html("알림이 없습니다.");
 						}
 						for(let i=0; i<=res.length-1; i++) {
 							let idx_name = "";
 							if(res[i].chat_idx != 0) idx_name = "chat_idx";
 							if(res[i].estimate_idx != 0) idx_name = "estimate_idx";
 							if(res[i].comments_idx != 0) idx_name = "comments_idx";
 						
 							let idx_number = res[i].chat_idx + res[i].estimate_idx + res[i].comments_idx; 

 							let msg = res[i].message;
 							msg = msg.replace("@name@", res[i].name);
 							msg = msg.replace("@svc_name@", res[i].svc_name);
 							
 							let new_li = '<li ' + idx_name + '="' + idx_number + '">' 
 								+ '<div class="user-notice-item">' 
 								+ '<div class="div_row_info">' 
 								+ '<div class="div_notice_text_box">' 
 								+ '<div class="type">' 
 								+ '<span class="notice_text"> 알림 </span>' 
 								+ '</div>' 
 								+ '</div>' 
 								+ '<div class="div_notice_date">' 
 								+ res[i].notice_date 
 								+ '</div>' 
 								+ '</div>' 
 								+ '<div class="div_row_content">' 
 								+ '<div class="div_text">' 
 								+ '<h4 class="title" idx="' + idx_number + '">' + msg + '</h4>' 
 								+ '</div>' 
 								+ '<button class="btn_wrapper">' 
 								+ '<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxOFYxOEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTYgNEwxMiA5LjUgNiAxNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgPC9nPgo8L3N2Zz4K">' 
 								+ '</button>' 
 								+ '</div>' 
 								+ '<p class="content">견적 내용을 자세히 확인해보세요</p>' 
 								+ '</div>' 
 								+ '</li>';
 							$(".notice-list").append(new_li);
 						}
					},
					error: function(r, s, e) {
						alert('에러');
					}
				});
			}
			
			alert("새로운 메시지가 도착하였습니다!");
			//$("#div_message").append("<p class='chat'>" + e.data + "</p>");
		}
		function func_on_open(e) {
 			//alert("websocket connected.");
		}
		function func_on_error(e) {
			alert("Error!");
		}
		/* ws://localhost:9095/YjProject0805Git/broadcast_notice */
		let webSocket = new WebSocket("ws://localhost:9095/SHProject/broadcast_notice");
		webSocket.onmessage = func_on_message;
		webSocket.onopen = func_on_open;
		webSocket.onerror = func_on_error;
</script>
<%--//웹소켓 여기까지 --%>

<%-- 알림 여기부터 --%>
<script>	
		$(function(){
			
// 			알림시작============================================
// 			$("#notice_btn").click(function(){
				
// 				$(".notification-overlay").toggle();
// 				$(".usermenu-dropdown").hide();			
				
// 			});

	  		$(".right-section-div1-button, .right3-section-div1-button").click(function(){
//			   	헤더 알림이미지 클릭시
// 	  		   alert("!");
					$(".notification-overlay").toggle();
					$(".usermenu-dropdown").hide();	
	  	   });
	  		
			$(".usermenu-dropdown").on(function(){
// 				$(".usermenu-dropdown").toggle();
				$(".notification-overlay").hide();
			});
			
			$(".all-read").click(function(){    // button 'set to read'
				
				$(".confirm").css('display','block');
			});
			$(".cancel-btn").click(function(){    // when 'no' clicked.
				
				$(".confirm").hide();
			});
			
			 $('.confirm-btn').on('click', function() {   // when 'yes' clicked.
			    if ($('.notice-list li').length > 0) {
			    	let params = { user_idx : <%= users_idx%> };
			    	$.ajax({
						type: "get",
						url: "AjaxNoticeSetToReadServlet",
						data: params,
						success: function(res) {
							if(res.result=='success') {
								$('.notice-list').text("알림이 없습니다");
							}
						},
						error: function(r, s, e) {
							alert('에러');
						}
					});			 	  
			        //$('.div_more_btn').css('display','none');
			    } else {
			      alert("삭제할 알림이 없습니다");
			    }
			    $('.confirm').hide();
			  });

			  // "아니오" 버튼 클릭 시 확인 대화 상자 숨김
			  $('.cancel-btn').on('click', function() {
				  
			    $('.confirm').hide();
			  });
			  
			  $(".user-notice-item").click(function(){
/* 				 let postIdx = $(this).find(".title").attr("idx");
				 let chatIdx = $(this).find(".title").attr("idx");
				 let estimateIdx = $(this).find(".title").attr("idx");
 */
				let comments_idx = $(this).parent().attr("comments_idx");
 				let chat_idx = $(this).parent().attr("chat_idx");
 				let estimate_idx = $(this).parent().attr("estimate_idx");
				if(comments_idx != undefined) {
					location.href = "Controller?command=post_detail&comments_idx=" + comments_idx;
				} else if(chat_idx != undefined) {
					alert("채팅방 목록 주소 chat_idx:" + chat_iDx);
				} else if(estimate_idx != undefined) {
					alert("견적창 주소 estimate_idx:" + estimate_idx);
				}
			  });

		});
</script>
<%-- // 알림 여기까지 --%>

<script>
	let page_num = <%=pageNum%>;
		function draw_board_list(page) {
			$.ajax({
	 			type: 'get',
	 			data: {page_num : page_num},
	 			dataType: "json",
	 			url : "soomgoCommuAjaxServlet",
	 			success: function(res){   /* res가 곧 JSONArray */
	 				console.log("res : ", res);
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
	 					    str += "<img src='" + res[i].postImg + "'/>";
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
	 			}
 			});
		}
		
		$(function(){
			draw_board_list(page_num);
			
			 // 무한스크롤을 위한 윈도우 함수 스크롤 바닥찍으면 이벤트 발생
			$(window).scroll(function() {
			   if($(window).scrollTop() + $(window).height() == $(document).height()) {
				   draw_board_list(++page_num);
			   }
			});
			
			$("#div_commu_layout > div > div:nth-child(<%=commuIdx%>)").addClass("selected");
			
			// 글쓰기 버튼 클릭시
			$(".write_btn").click(function(){
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
					location.href = "Controller?command=gosu_knowhow_write_form";
				} 
			});
			
// 			게시글 클릭시
			$(document).on('click', '.feed_item', function(){
				let feed_item = $(this).find(".category").text();
				//console.log(feed_item);
				
				let idx = $(this).attr("idx");
				alert("postIdx: " + idx);
				location.href="Controller?command=post_detail&post_idx=" + idx;
// 				 location.href="PostViewInsertServlet?post_idx=" + idx;  //조회수 중복 오름


/*				아직 action 안만듬
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
// 			$(".feed_item").on('click',function(){
// 				if($(this).attr('idx') != undefined) {
// // 					location.href="soomgoQnA_Post.jsp?post_idx= " + idx;
// 					
// 				}
// 			});
			
			let selectedIdx = localStorage.getItem("selectedIdx");
			
			if(selectedIdx) {
				$(".topic_item[idx='" + selectedIdx + "']").addClass("selected");
			}
			$(".topic_item").on('click',function (){
			
				let idx = $(this).attr("idx");
				
				/*
				// 일단 모든 topic_item에 selected 클래스를 제거
				$(".topic_item").removeClass("selected");
				
				// 현재 클릭된 요소에 selected 클래스를 추가
				$(this).addClass("selected");
				*/
				
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					// 고수에게 묻다, 함께해요, 고수소식, 고수광장
					location.href="Controller?command=post_list&commuIdx=" + idx; 
				} 
				else if(idx==2) {
					// 고수노하우
					location.href="Controller?command=gosu_knowhow_list&commuIdx=" + idx;
				} else if(idx==5){
					//숨고 이야기
					location.href="Controller?command=post_soomgo_story_list&commuIdx=" + idx;
				} else if(idx==0) {
// 					location.href="Controller?command=post_list&commuIdx=" + idx ;
				}
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
 				location.href = "soomgoCommu.jsp?";   <%-- commuIdx=<%=commuIdx%> --%>
//  				$(this).css('display', 'none');
//  				$(".selected_names").remove();
//  				$(".div_category").css('background','');
//  				$(".div_category.level1").css('display','none');
//  				$(".div_category.level2").css('display','none');
//  				$(".div_town").css('background','');
//  				$(".div_town.level1").css('display','none');
// 				$(".service_btn").css("display", "block"); 						
// 				$(".town_btn").css("display", "block"); 	
// 				$(".serviceName").remove();
// 				$(".feed_item").show();
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
 						
 						let new_location = "Controller?command=post_main_list&";
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
 					
//  					var serviceIdx = $(this).text().trim();
//  					$(".feed_item").hide();
 					
//  					$(".feed_item").each(function(){
//  					/* 선택한 서비스 이름에 맞는 게시글만 조회 */
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
 						/* $("#div_town_layout").css("display","none");
 						$("#greyscreen_filter").css("display","none");
 						let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
 						$("#div_service_town > div:last-child").before(str);
						$(".town_btn").css("display", "none"); 						
 						$(".btn_init").css("display", "inline-block"); */
 						
 						let new_location = "soomgoCommu.jsp?";
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
 			
 			$(".div_slide").click(function(){
 				let idx = $(this).attr("idx");
 				alert(idx);
 				location.href = "Controller?command=post_detail&post_idx=" + idx;
 			});
		});  /* $(function) 마지막 중괄호 */
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
                        <ul class = "header-nav-ul"  style="padding: 0px; !important">
                            <li class = "header-nav-li">
                                <a href = "">
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
                                  <a href = "">
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
<!--                   <div class = "center-section"> -->
<!--                       <div class = "center-section-desktop"> -->
<!--                           <form class = "center-section-form"> -->
<!--                               <div class = "center-section-form-div1"> -->
<!--                                   <div class = "center-section-form-div2"> -->
<!--                                       <img class = "center-section-form-div2-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"> -->
<!--                                   </div> -->
<!--                                   <input type = "text" class = "center-section-form-div2-input" placeholder="어떤 서비스가 필요하세요?" autocomplete="off"> -->
<!--                               </div> -->
<!--                           </form> -->
<!--                       </div> -->
<!--                   </div> -->

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
                          <div id="app" class="center">
                          
                          	<%-- 알림창 여기부터 --%>
							<div class="notification">
							<!-- 								<button class="notice-btn"> -->
							<!-- 								</button> -->
								<div class="notification-overlay">
									<div class="div_notice_box">
										<div class="overlay_header">
											<h2 class="h2">알림</h2>	
											<button class="all-read">전체읽음</button>
										</div>
										<div class="overlay-body">
											<div class="user-notice">
												<ul class="notice-list">
													<%
														for (CommuNoticeDto dto : nList) {
													%>
														<li 
															<%if(dto.getCommentsIdx() != 0) {%>comments_idx="<%=dto.getCommentsIdx()%>" <%}%>
															<%if(dto.getEstimateIdx() != 0) {%>estimate_idx="<%=dto.getEstimateIdx()%>"<%}%>
															<%if(dto.getChatIdx() != 0) {%>chat_idx="<%=dto.getChatIdx()%>"<%}%>
														>
															<div class="user-notice-item">
																<div class="div_row_info">
																	<div class="div_notice_text_box">
																		<div class="type">
																			<span class="notice_text"> 알림 </span>
																		</div>
																	</div>
																	<div class="div_notice_date">
																		<%=dto.getNoticeDate().substring(2,10)%>
																	</div>
																</div>
																<%
																	String msg = dto.getMessage();
											 						if(dto.getName() != null)	
																		msg = msg.replace("@name@", dto.getName());
											 						if(dto.getServiceName() != null)
										 								msg = msg.replace("@svc_name@", dto.getServiceName());
																%>
																<div class="div_row_content">
																	<div class="div_text">
																		<h4 class="title" idx="<%=dto.getEstimateIdx()+dto.getChatIdx()+dto.getCommentsIdx()%>"><%=msg%> </h4>
																	</div>
																	<button class="btn_wrapper">
																	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxOFYxOEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTYgNEwxMiA5LjUgNiAxNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgPC9nPgo8L3N2Zz4K"/>
																	</button>
																</div>
																<p class="content">견적 내용을 자세히 확인해보세요</p>
															</div>
														</li>
													<%
														}
													%>
												</ul>
												<div class="div_more_btn">더 보기</div>
											</div>
											<div class="confirm">
												<p>모든 알림을 삭제하시겠습니까?</p>
												<button class="confirm-btn">예</button>
												<button class="cancel-btn">아니오</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%-- // 알림창 여기까지 --%>
						</div>
                      </div>
                      <% 
                   if (SoomgoHeader != null && !SoomgoHeader.isEmpty()) {
                   for(Soomgo_headerDto shdto : SoomgoHeader){ 
                   %>
                   <div class = "right-section-div2-outter">
                       <div class = "right-section-div2">
                           <div class = "right-section-div2-1">
                               <div class = "right-section-div2-2">
                                <img src = "<%=shdto.getF_img() %>">
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
                                <a href = "">
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
                        <div id="app" class="center">
							<div class="notification">
							<!-- 								<button class="notice-btn"> -->
							<!-- 								</button> -->
								<div class="notification-overlay">
									<div class="div_notice_box">
										<div class="overlay_header">
											<h2 class="h2">알림</h2>	
											<button class="all-read">전체읽음</button>
										</div>
										<div class="overlay-body">
											<div class="user-notice">
												<ul class="notice-list">
													<%
														for (CommuNoticeDto dto : nList) {
													%>
														<li 
															<%if(dto.getCommentsIdx() != 0) {%>comments_idx="<%=dto.getCommentsIdx()%>" <%}%>
															<%if(dto.getEstimateIdx() != 0) {%>estimate_idx="<%=dto.getEstimateIdx()%>"<%}%>
															<%if(dto.getChatIdx() != 0) {%>chat_idx="<%=dto.getChatIdx()%>"<%}%>
														>
															<div class="user-notice-item">
																<div class="div_row_info">
																	<div class="div_notice_text_box">
																		<div class="type">
																			<span class="notice_text"> 알림 </span>
																		</div>
																	</div>
																	<div class="div_notice_date">
																		<%=dto.getNoticeDate().substring(2,10)%>
																	</div>
																</div>
																<%
																	String msg = dto.getMessage();
											 						if(dto.getName() != null)	
																		msg = msg.replace("@name@", dto.getName());
											 						if(dto.getServiceName() != null)
										 								msg = msg.replace("@svc_name@", dto.getServiceName());
																%>
																<div class="div_row_content">
																	<div class="div_text">
																		<h4 class="title" idx="<%=dto.getEstimateIdx()+dto.getChatIdx()+dto.getCommentsIdx()%>"><%=msg%> </h4>
																	</div>
																	<button class="btn_wrapper">
																	<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxOFYxOEgweiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBzdHJva2Utd2lkdGg9IjEuNSIgZD0iTTYgNEwxMiA5LjUgNiAxNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEwNDYgLTE5NykgdHJhbnNsYXRlKDc1MyA1MikgdHJhbnNsYXRlKDAgOSkgdHJhbnNsYXRlKDI0IDgzKSB0cmFuc2xhdGUoMjY5IDUzKSIvPgogICAgPC9nPgo8L3N2Zz4K"/>
																	</button>
																</div>
																<p class="content">견적 내용을 자세히 확인해보세요</p>
															</div>
														</li>
													<%
														}
													%>
												</ul>
												<div class="div_more_btn">더 보기</div>
											</div>
											<div class="confirm">
												<p>모든 알림을 삭제하시겠습니까?</p>
												<button class="confirm-btn">예</button>
												<button class="cancel-btn">아니오</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
                               <h4 class = "usermenu3-dropdown-div1-font"><%=sh2dto.getName() %> 고객님</h4>
                               <a class = "usermenu3-dropdown-div1-a">
                                   <div class = "usermenu3-dropdown-div1-a-1">
                                       <span class = "usermenu3-dropdown-div1-a-1-span1">
                                           <img class = "usermenu3-dropdown-div1-a-1-span1-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo=">
                                           평점 <%=sh2dto.getAvg_score() %>.0
                                       </span>
                                       <span class = "usermenu3-dropdown-div1-a-1-span2"></span>
                                       <span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review() %>개</span>
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
                           	<a href = "Seach.profile2.jsp">
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
<!-- ------------------------------------헤더----------------------------------------- -->
<body>
<div id="div_commu_container">
	<div id="div_commu_header">
		<div class="div_commu_header_inner">
			<h1>커뮤니티</h1>
			<div class="write_btn" > 글쓰기
				<img class="write_img" src="img/숨고글쓰기이미지.png"/>
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
					<%--
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
					--%>
				</ul>
			</div>
		</div>
		<div id="div_commu_header2">
			<div class="div_commu_header2_text"> 숨고생활</div>
			<div class="div_commu_header2_text"> 고수센터</div>
		</div>
		<div id="div_commu_layout">
			<div >
				<div class="topic_item selected" idx="0" >전체</div>
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
							<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M17.8491 11.9203C17.8482 11.7052 17.7549 11.5008 17.593 11.3591L7.39508 2.43559C7.08336 2.16282 6.60954 2.1944 6.33677 2.50612C6.064 2.81785 6.09558 3.29167 6.40731 3.56443L15.9657 11.9283L6.40257 20.4398C6.09315 20.7152 6.06557 21.1892 6.34096 21.4986C6.61634 21.8081 7.09042 21.8356 7.39983 21.5602L17.5978 12.4837C17.7585 12.3407 17.85 12.1355 17.8491 11.9203Z" fill="black"></path>
							</svg>
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
<!-- 										<a href="Controller?command=post_detail&post_idx=" + idx> -->
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
<!-- 										</a> -->
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
<!-- 				<div id="div_service_area" > -->     <!-- 무한 스크롤 메서드에 필터를 추가하지않아서 커뮤 전체에서는 필터 빼기로 -->
<!-- 					<button class="btn_init"> -->
<!-- 						<span>초기화</span> -->
<!-- 					</button> -->
<!-- 					<div class="service_btn">서비스<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTMuNjY2IDhhLjcwOC43MDggMCAwMS45MjktMS4wNjRsLjA3My4wNjMgNS4zMzEgNS4zMzMgNS4zMzMtNS4zMzNhLjcwOC43MDggMCAwMS45My0uMDYzbC4wNzIuMDYzYS43MDguNzA4IDAgMDEuMDY0LjkzTDE2LjMzNCA4bC01LjgzMyA1LjgzM2EuNzA4LjcwOCAwIDAxLS45My4wNjRsLS4wNzItLjA2NEwzLjY2NiA4eiIgZmlsbD0iIzg4OCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+"/></div> -->
<!-- 					<div class="town_btn">지역 <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHBhdGggZD0iTTMuNjY2IDhhLjcwOC43MDggMCAwMS45MjktMS4wNjRsLjA3My4wNjMgNS4zMzEgNS4zMzMgNS4zMzMtNS4zMzNhLjcwOC43MDggMCAwMS45My0uMDYzbC4wNzIuMDYzYS43MDguNzA4IDAgMDEuMDY0LjkzTDE2LjMzNCA4bC01LjgzMyA1LjgzM2EuNzA4LjcwOCAwIDAxLS45My4wNjRsLS4wNzItLjA2NEwzLjY2NiA4eiIgZmlsbD0iIzg4OCIgZmlsbC1ydWxlPSJldmVub2RkIi8+PC9zdmc+"/></div> -->
<!-- 				</div> -->
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
			</div>
		</div>
	</div>
</div>
</body>
</html>

<div id="greyscreen_filter">
	<div id="div_town_layout" class="scroll ">
		<div id="div_town_header">
			<div id="div_service2">서비스</div>
			<div id="div_town2" class="active">지역</div>
			<img class="x" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTkgNy44NjlMMTYuNDM0LjQzNGwxLjEzMiAxLjEzMkwxMC4xMyA5bDcuNDM1IDcuNDM0LTEuMTMyIDEuMTMyTDkgMTAuMTNsLTcuNDM0IDcuNDM1LTEuMTMyLTEuMTMyTDcuODcgOSAuNDM0IDEuNTY2IDEuNTY2LjQzNCA5IDcuODd6Ii8+CiAgICA8L2RlZnM+CiAgICA8dXNlIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgeGxpbms6aHJlZj0iI2EiLz4KPC9zdmc+Cg==" alt="모달 닫기">
			
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
			<img class="x" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTkgNy44NjlMMTYuNDM0LjQzNGwxLjEzMiAxLjEzMkwxMC4xMyA5bDcuNDM1IDcuNDM0LTEuMTMyIDEuMTMyTDkgMTAuMTNsLTcuNDM0IDcuNDM1LTEuMTMyLTEuMTMyTDcuODcgOSAuNDM0IDEuNTY2IDEuNTY2LjQzNCA5IDcuODd6Ii8+CiAgICA8L2RlZnM+CiAgICA8dXNlIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgeGxpbms6aHJlZj0iI2EiLz4KPC9zdmc+Cg==" alt="모달 닫기">
			
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
</div>