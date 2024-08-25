<%@page import="dto.CommuNoticeDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuPostLikeViewCommentDto"%>
<%@page import="dto.CommuPostViewCountDto"%>
<%@page import="dto.CommuPostListDto"%>
<%@page import="dto.CommuCommentsChildDto"%>
<%@page import="dto.CommuCommentsDto"%>
<%@page import="dto.CommuLikeCountDto"%>
<%@page import="dto.CommuCommentsCountDto"%>
<%@page import="dto.CommuPostDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 헤더시작 --> 
<%
//영현이 헤더 
	//여기부터 헤더 =================================
	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
//	HttpSession hs = request.getSession();
//	HttpSession hs = (HttpSession)request.getAttribute("hs");
	
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
	// 	로그인한 유저
// 	int loginUsersIdx = 12;    // TODO : later, session으로부터 users_idx를 꺼내야 함.
	CommunityDao dao = new CommunityDao();

	int postIdx = (Integer)(request.getAttribute("postIdx"));
	int commentsIdx = (Integer)(request.getAttribute("commentsIdx"));
	
	int postUsersIdx = dao.getPostUserIdxFromPostIdx(postIdx);
	String alias = dao.getAliasFromUsersIdx(users_idx);

	//CommunityDao pDao = new CommunityDao();	/* 댓글수 값이 안나옴  sql 인설트 등 수정후 커밋 해야함..*/
	
	
// 	if(request.getParameter("post_idx") != null) {
// 		postIdx = Integer.parseInt(request.getParameter("post_idx"));
// 	} else {
// 		try { 
// 			commentsIdx = Integer.parseInt(request.getParameter("comments_idx"));
// 			postIdx = dao.getPostIdxFromCommentsIdx(commentsIdx);
// 		} catch (Exception e) {}   /* 예외가 있으면 아무짓도 하지않고 그냥 넘어가기 위한 catch */
// 	}
	
// 	CommuPostDto postDto = dao.getPostViewSelect(postIdx); // 게시글 정보를 불러오는 메서드
// 	ArrayList<CommuCommentsDto> listCommentDto = dao.getComments(postIdx); // 게시글에 댓글을 불러오는 메서드
// 	CommuPostLikeViewCommentDto likeViewDto = dao.getLikeCommentView(postIdx);	// 게시글의 댓글수,좋아요,조회수를 불러오는 메서드
	
	if(dao.postViewsOnlyOne(postIdx, users_idx)==false)
		dao.postViewInsert(postIdx, users_idx);


	CommuPostDto postDto = (CommuPostDto)request.getAttribute("postDto");
	ArrayList<CommuCommentsDto> listCommentDto = (ArrayList<CommuCommentsDto>)request.getAttribute("listCommentDto");
	CommuPostLikeViewCommentDto likeViewDto = (CommuPostLikeViewCommentDto)request.getAttribute("likeViewDto");
	ArrayList<CommuNoticeDto> nList = (ArrayList<CommuNoticeDto>)request.getAttribute("nList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-묻다,해요,소식 상세페이지</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="css/soomgoQnA_Post.css"/>
	<link rel="stylesheet" href="css/header.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script>
<%-- 		console.log("post_idx: " + <%=postIdx%>); --%>
	</script>
	
	<script>
 	  /* 헤더 jquery */
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
	      		location.href = "Gosu_join.jsp";
	      		$(".header-total2").hide();
	      		$(".header-total1").show();
	      	 }else{
	      		$(".header-total2").show();
	      		$(".header-total1").hide();
	      	 }
	       });
	       
    	   $(".right-section-div1-button").click(function(){
    		   alert("!");
				$(".notification-overlay").toggle();
				$(".usermenu-dropdown").hide();	
    	   });
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
    /* 헤더 jquery */
	</script>
	
	<script>
	// 알림
	function func_on_message(e) {
// 			댓글 등록 버튼을 누르면 알림을 받아와서 뿌려줌
			alert("notice!");
			let str = e.data;
			let arr = str.split("||");
			//alert(arr[1]);	//(게시글 작성자)idx
			//alert(<%=users_idx%>);	// 댓글을 단 유저 idx 
			//alert(arr[0]);  // Notice ?
			//alert(arr[1]);  // 21 ?
			//alert(arr[1]=="<%=users_idx%>");  // true?
			if(arr[0]=="Notice" && arr[1]=="<%=users_idx%>") {
 				//alert("moonjang : " + arr[2]);   // before toast testing.
				let params = { user_idx : <%=users_idx%> };
				
				$.ajax({
					type: "get",
					url: "AjaxNoticeListServlet",
					data: params,
					success: function(res) {
						//alert("?");
 						console.log(res);     // CHECK, res = JSON ARRAY.
 						$(".notice-list").html("");
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
			$("#div_message").append("<p class='chat'>" + e.data + "</p>");
		}
	
	
		function func_on_open(e) {
				alert("websocket connected.");
		}
		function func_on_error(e) {
			alert("Error!");
		}
		
		let webSocket = new WebSocket("ws://localhost:9095/SHProject/broadcast_notice");
		webSocket.onmessage = func_on_message;
		webSocket.onopen = func_on_open;
		webSocket.onerror = func_on_error;

		$(function() {
			// 댓글 등록을 클릭시 웹소켓을? 메인에 알림을 보내줌?
			$("#form_comment input[type='submit']").click(function() {
				webSocket.send("Notice||<%=postUsersIdx%>||게시글에 <%=alias%>님이 댓글을 남겼습니다");				
			});

			$(".category_subject").click(function(){
				location.href="soomgoCommu.jsp";
			});
			$(".category_subject2").click(function(){
				let commuIdx = $(this).attr("commuIdx");
				location.href = "soomgoQnA2.jsp?commuIdx=" + commuIdx;
			});
			$("#div_like").click(function() {
				alert("TODO - 작업준비중");
			});
			$("#div_comment").click(function() {
				alert("TODO - 작업준비중");
			alert("TODO) id -> class로 변경해야 할 것들 다수. / 작업 후 이벤트핸들러들 달아야. ")
			});
		
		
		
			$(".btn1").click(function() {	// 댓글의 [댓글달기] 버튼 클릭시.	
				// 다 닫아 일단.
				$(".div_comment_input_box.reply").css('display', 'none');
			    $(".div_post_reply_comment .div_comment_input_box").hide();
				
				/* 댓글달기 클릭시 댓글입력창 켜졌다 사라졌다 */  
				let name = $(this).parents(".div_post_comment").find(".user_name").text();
				 /* 댓글 작성자 이름(user_name)을 찾아 변수 name에 넣어줌 */
				$(this).parents(".div_post_comment").find(".reply_user_name").text(name);	
				 // (대댓글창에 댓글유저명이 나오게 )  변수 name에 넣어준 댓글 작성자 name을 적용
				 
				let the_input_box = $(this).parents(".div_post_comment").find(".div_comment_input_box");
				 
				 if(the_input_box.css('display')=='none') {
					  $(".div_post_reply_comment .div_comment_input_box").css('display', 'none'); 
				} else {
//일단은.					 $(".comment_cancel_layout").css('display','block');
					 // 댓글달기 재클릭시 취소팝업 화면이 나타남.
				} 
				$(this).parents(".div_post_comment").next(".div_comment_input_box.reply").show();
				//(대댓글 입력창을 감싸고있는) 최고 조상을 찾아 자자손손중(div_comment_input_box)를 찾아 show을 적용
											// -> 팝업창에서 확인or취소 선택에 따라 input창 사라짐 여부 따짐 그래서 show로 해놓음
				$(".btn1").click(function(){
					$(this).parents(".div_post_comment").next(".div_comment_input_box.reply").toggle();
				});
			});

			$(".drop_icon").click(function(){
				$(".post_dropDown_menu").toggle();
			});
			
// 			게시글 수정하기 버튼
			$(".post_dropDown_menu > li:nth-child(1) > div").click(function(){
<%-- 				<%=postDto.getCommuTitle()%> /* 왜 가져왔을까? 무슨이윯..? */      --%>
<%-- 				<%=postDto.getServiceTitle()%> --%>
<%-- 				<%=postDto.getTownName()%> --%>
<%-- 				<%=postDto.getPostContents()%> --%>
				let postIdx = <%=postIdx%>;
 				console.log(postIdx); 
				location.href = "Controller?command=post_update_form&post_idx=" + postIdx;
			});
			
// 			게시글 삭제하기 버튼
			$(".post_dropDown_menu > li:nth-child(2) > div").click(function(){
				$(".dropdown_greyfilter").show();
				$(".post_dropDown_menu").hide();
				
			});
// 			삭제하기 -> 확인버튼 클릭시
			$(".modal_confirm_btn").click(function(){
				let postIdx = <%=postIdx%>;
				alert(postIdx);
				location.href = "PostDeleteServlet?post_idx=" + postIdx;
			});
			
			$(".modal_cancel_btn").click(function() {
				$(".dropdown_greyfilter").hide();
			});
			 $(".cancel_btn").click(function(){
				 // 댓글작성 취소창에서  (취소)를 누르면 input창, 입력값 그대로 남아있음
				$(".comment_cancel_layout").css('display','none');
				$(".comment_keyUp").css('display', '');  
			});
			 $(".confirm_btn").click(function(){
				 $(".comment_cancel_layout").css('display','none');
				 
				//display, none 할때 입력했던 값을 지움
				$(".comment_text").val('');
				$(".div_post_reply_comment").find(".div_comment_input_box.reply").css('display','none');
				 
			 });
			
			// 대댓글의 댓글달기btn 클릭시 입력창 껐다 켰다.
			$(".comment_btn").click(function() {	// 대댓글의 [댓글달기] 클릭시.
				// 다 닫아 일단.
//not WOrking				$(".div_comment_input_box.child").css('display', 'none');
				
			    // 댓글 작성자 이름을 가져와서 대댓글 입력 창에 표시
			    let name = $(this).closest(".comment_infor").find(".comment_user_name").text();
//alert("제대로 가져오라고 쫌 name = " + name);			    
				$(this).closest("ul.comment_reply_list").next().find(".reply_user_name").text(name);
				
			    // 현재 클릭된 버튼의 대댓글 입력 창.
			    let input_box = $(this).closest(".div_post_reply_comment").find(".div_comment_input_box.child");
			    input_box.hide();  // 대댓글 입력창을 전부 닫아.
				$(".div_post_reply_comment .div_comment_input_box").hide();   // 댓글 입력창을 전부 닫아.
				$(this).closest("ul.comment_reply_list").next().show();
				
		    // 모든 대댓글 입력 창을 숨김
/* 			    if ($(".div_post_reply_comment .div_comment_input_box").not(input_box).hide()){
				    // 현재 클릭된 버튼의 부모요소 의 input_box들을 다 숨김				클릭된 input_box를 제외하고	
				    
				    // display, none 할때 입력했던 값을 지움
			    	 $(".comment_text").val('');	
			    	 $(".comment_keyUp").css('display', '');
			    } 
 */			
			});
			$(".comment_text").on('keyup', function(event) {
		        let keyUp = $(this).closest(".div_comment_input_box").find(".comment_keyUp");

		        if ($(this).val().length > 0) {
		            keyUp.css('display', 'block');
		        } else {
		            keyUp.css('display', 'none');
		        }
		        
// 		        if (event.keyCode === 13) {

// 		            alert("댓글이 등록되었습니다: " + $(this).val());
// 		            $(this).val(''); // 댓글 등록 후 입력창을 비움
// 		            keyUp.css('display', 'none'); // 등록 문구를 숨김
// 		        }
		    });
			
			
			$("#div_sticky_nav").hide();
				/* 스크롤 내릴때 내려오는 게시글 제목 숨겨놓음 */
			$(window).scroll(function(){
				let target = $("#div_sticky_nav");   // target 변수에 상단 게시글 제목을 담은 div값을 저장
				let targetTop = target.offset().top;  // targetTop 변수에  target의 페이지 맨위에서으 위치를 저장
				
				if($(this).scrollTop() >= targetTop) {
					target.show();
				} 
				if($(this).scrollTop() <= 0) {
					target.hide();
				} 
			});
			//$(".div_like:NOT(.on)").click(function(){
			// 좋아요 클릭했을때 좋아요 수 오름
			$(document).on("click", ".div_like:NOT(.on)", function() {
				alert("좋아요 on");
// 				alert("!!!");
				let params = { post_idx:<%=request.getParameter("post_idx")%>, users_idx:<%=users_idx%>};
				let _this = $(this);
				$.ajax({
				    type : "get",            // HTTP method type(GET, POST) 형식이다.
				    url : "AjaxPostLIkeServlet",      // 컨트롤러에서 대기중인 URL 주소이다.
				    data : params,            // Json 형식의 데이터이다.
				    success : function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        //alert("성공!");
// 				    	alert(res.result);
				    	_this.addClass('on');
				    	$("#likeImg1").hide();
				    	$("#likeImg2").show();
				    	
				    	let cnt = Number($(".like_count").text());
				    	$(".like_count").text(cnt+1);
				    },
				    error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				        alert("통신 실패.")
				    }
				});
			});
				// 좋아요 취소 기능
			$(document).on("click", ".div_like.on", function() {
				alert("좋아요 off");
				let params = { post_idx:<%=request.getParameter("post_idx")%>, user_idx:<%=users_idx%>};
				let _this = $(this);
				$.ajax({
				    type : "get",            // HTTP method type(GET, POST) 형식이다.
				    url : "AjaxPostLikeDeleteServlet",      // 컨트롤러에서 대기중인 URL 주소이다.
				    data : params,            // Json 형식의 데이터이다. 서버로 전송할 데이터 (postIdx, usersIdx를 서버로 보냄, 인설트 메서드의 파라미터 값으로 사용하기 위함)
				    success : function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				        //alert("성공!");
// 				    	alert(res.result);
				    	_this.removeClass('on');
				    	$("#likeImg2").hide();
				    	$("#likeImg1").show();
				    	let cnt = Number($(".like_count").text());
				    	$(".like_count").text(cnt-1);
				    },
				    error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				        alert("통신 실패.")
				    }
				});
			});
			
 // 		serviceTitle, townName의 받아온 값을 변수에 저장
 			<%if(postDto != null) {%>
				let serviceTitle = "<%=postDto.getServiceTitle()%>";
				let townName = "<%=postDto.getTownName()%>";
				console.log(serviceTitle);
				console.log(townName);
 			<%}%>
 			
			if(serviceTitle === null || serviceTitle === "null") {
	//				서비스idx가 null 일때 공백문자 출력
				serviceTitle = "";
			}
			if(townName === null || townName === "null") {
	// 				지역idx가 null 일때 공백문자 출력
				townName = "";
			}
			$("#div_post_service_name").text(serviceTitle);
			$(".post_address").text(townName); 
			
			$([document.documentElement, document.body]).animate({ // 댓글위치에 맞게 스크롤 이동
			    scrollTop: $(".div_post_comment[idx='<%=commentsIdx%>']").offset().top
			}, 500);
			
		});  //마지막 중괄호 $(function)의 끝.
		
	</script>	
</head>
<!-- ---------------------------------------헤더------------------------------------------ -->
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
                                	<a href = "Controller?command=main_page">
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
                                	<a href = "Controller?command=main_page">
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
<body>
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

<!-- ---------------------------------------여기까지 헤더------------------------------------------ -->
<div id="div_sticky_nav" >
	<div class="fixed_show_box">
		<div class="fixed_wrapper">
			<h2><%=postDto.getPostTitle()%></h2>
			<div class="btn_box">
				<div class="btn_round"></div>
			</div>
			<img style="float:right" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9Ij
					AgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMC43N
					yAxNS4xNzRjLjM3IDAgLjY3NS4yNzYuNzIzLjYzNGwuMDA3LjA5OXY1Ljg2YzAgLjM3MS0uMjc1LjY3OC0uNjMy
					LjcyNmwtLjA5OS4wMDdIMy4yMzFhLjczMi43MzIgMCAwIDEtLjcyNC0uNjMzbC0uMDA3LS4xdi01Ljg2YS43Mz
					IuNzMyIDAgMCAxIDEuNDU1LS4xbC4wMDcuMXY1LjEyOGgxNi4wNzZ2LTUuMTI4YzAtLjM3LjI3NS0uNjc3LjYz
					Mi0uNzI2bC4xLS4wMDd6TTEyLjQxMiAxLjYyOGwuMDkuMDcyIDYuMzc3IDYuMDVhLjczNC43MzQgMCAwIDEgLj
					AyOCAxLjAzNi43My43MyAwIDAgMS0uOTQ5LjA5OGwtLjA4NC0uMDY5LTUuMTQ1LTQuODgxdjExLjk3M2EuNzMyL
					jczMiAwIDAgMS0xLjQ1NC4xbC0uMDA3LS4xVjMuOTMzTDYuMTI1IDguODE1YS43My43MyAwIDAgMS0uOTUzLjA
					0NWwtLjA4LS4wNzRhLjczNC43MzQgMCAwIDEtLjA0NS0uOTU1bC4wNzMtLjA4IDYuMzc4LTYuMDUuMDQ2LS4wMz
					lhLjczNC43MzQgMCAwIDEgLjAxNC0uMDFsLS4wNi4wNDhhLjczLjczIDAgMCAxIC4yMTMtLjE0Yy4wMDUgMCAuM
					DA5LS4wMDIuMDEzLS4wMDRhLjcyNC43MjQgMCAwIDEgLjY5LjA3MnoiIGZpbGw9IiMyRDJEMkQiIGZpbGwtcnVsZ
					T0iZXZlbm9kZCIvPgo8L3N2Zz4K"/>
		</div>
<!-- 		<div style="clear:both;"></div> -->
	</div>
</div>
<div id="div_post_layout" class="border2">
	<div id="div_post_header">
		<div id="div_category_subject">
			<span class="category_subject">커뮤니티</span> 
			<img src="img/왼화살표이미지.png"/>
			<span class="category_subject2" commuIdx="<%=postDto.getCommuIdx()%>"><%=postDto.getCommuTitle()%></span>
		</div>
		<div id="div_post_header_title">
			<div id="div_post_service_name">
				<%=postDto.getServiceTitle()%>
			</div>
			<div class="header_title">
				<%=postDto.getPostTitle()%>
			</div>
			<div class="post_address">
				<%=postDto.getTownName()%>
			</div>
		</div>
		<div id="div_uesr_profile"  post_users_idx = "<%=postUsersIdx%>">
			<div class="user.profile_container">
				<div class="user_profile_wrapper">
					<div id="div_user_profile_area">
						<img class="user_img" src="<%=postDto.getUserImg()%>"/>
						<div id="div_profile_info">
							<div class="user_name" class="border"><%=postDto.getUserName()%></div>
							<div class="post_date" class="border"><%=postDto.getWriteDate().substring(2,10)%>· 조회 <%=likeViewDto.getViewCount()%></div> 
						</div>
					</div>
					<div class="post_actions">
						<img data-v-5bbf4b7a="" data-v-71844fb9="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMC43NyAxNS4xNzRjLjM3IDAgLjY3NS4yNzYuNzIzLjYzNGwuMDA3LjA5OXY1Ljg2YzAgLjM3MS0uMjc1LjY3OC0uNjMyLjcyNmwtLjA5OS4wMDdIMy4yMzFhLjczMi43MzIgMCAwIDEtLjcyNC0uNjMzbC0uMDA3LS4xdi01Ljg2YS43MzIuNzMyIDAgMCAxIDEuNDU1LS4xbC4wMDcuMXY1LjEyOGgxNi4wNzZ2LTUuMTI4YzAtLjM3LjI3NS0uNjc3LjYzMi0uNzI2bC4xLS4wMDd6TTEyLjQxMiAxLjYyOGwuMDkuMDcyIDYuMzc3IDYuMDVhLjczNC43MzQgMCAwIDEgLjAyOCAxLjAzNi43My43MyAwIDAgMS0uOTQ5LjA5OGwtLjA4NC0uMDY5LTUuMTQ1LTQuODgxdjExLjk3M2EuNzMyLjczMiAwIDAgMS0xLjQ1NC4xbC0uMDA3LS4xVjMuOTMzTDYuMTI1IDguODE1YS43My43MyAwIDAgMS0uOTUzLjA0NWwtLjA4LS4wNzRhLjczNC43MzQgMCAwIDEtLjA0NS0uOTU1bC4wNzMtLjA4IDYuMzc4LTYuMDUuMDQ2LS4wMzlhLjczNC43MzQgMCAwIDEgLjAxNC0uMDFsLS4wNi4wNDhhLjczLjczIDAgMCAxIC4yMTMtLjE0Yy4wMDUgMCAuMDA5LS4wMDIuMDEzLS4wMDRhLjcyNC43MjQgMCAwIDEgLjY5LjA3MnoiIGZpbGw9IiMyRDJEMkQiIGZpbGwtcnVsZT0iZXZlbm9kZCIvPgo8L3N2Zz4K" alt="공유하기" class="icon">
						<div class="drop_icon">
							<img class="drop_btn" src="img/세로점3.png"/>
						</div>
						<ul class="post_dropDown_menu">
							<li class="presentation">
								<div class="post_dropdown_item">수정하기</div>
							</li>
							<li class="presentation">
								<div class="post_dropdown_item">삭제하기</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="div_body_content">
		<div class="contents">
			<p class="contents-text">
					<%=postDto.getPostContents()%>
			</p>
			<div class="div_content_img">
	 			<ul class="img_wrapper"> 
	 				<li class="content_img_box">
	 	 			<img class="content_img" src="https://static.cdn.soomgo.com/upload/media/1ca348e2-c7de-40bd-bf47-85da37ede90c.jpg?webp=1"/> 
	 				<img class="content_img" src="https://static.cdn.soomgo.com/upload/media/1ca348e2-c7de-40bd-bf47-85da37ede90c.jpg?webp=1"/> 
					</li> 	
	 			</ul>	 
			</div>
		</div>
	<div id="div_post_like_comment">
		<div class="div_like <%=(dao.isLikePost(users_idx, postIdx)==1 ? "on" : "")%>">
			 <img id="likeImg1" src="img/좋아요이미지1.png" class="like_img <%=(dao.isLikePost(users_idx, postIdx)==1 ? "hidden" : "")%>"> 			
		    <img id="likeImg2" src="img/좋아요이미지2.png" class="like_img <%=(dao.isLikePost(users_idx, postIdx)==1 ? "" : "hidden")%>">
			<span> 좋아요 
				<span class="like_count">
					 <%=likeViewDto.getLikeCount()%> 
				</span>
			</span>
		</div>	
		<div class="div_comment">		
			<img src="img/게시글 댓글수이미지.png"/>
			<span> 댓글
				<span class="comment_count">
					 <%=likeViewDto.getCommentCount()%>
				 </span> 
			</span>
		</div>
	</div>
	<div class="post_commenets_container">
		<div id="div_best">
			<svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
			    <g fill="none" fill-rule="evenodd">
			        <path fill="none" d="M0 0h20v20H0z"></path>
			        <path d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z" fill="#FFBF0D"></path>
			        <path d="M7.916 7.341a3.312 3.312 0 0 1 2.316-.912 3.32 3.32 0 0 1 2.293.974.714.714 0 1 0 1.005-1.015A4.75 4.75 0 0 0 10.25 5a4.74 4.74 0 0 0-3.313 1.301 5.066 5.066 0 0 0-1.562 3.264 5.124 5.124 0 0 0 .989 3.49 4.806 4.806 0 0 0 3.038 1.878 4.703 4.703 0 0 0 3.467-.773c.325-.224.62-.486.879-.778a.714.714 0 1 0-1.069-.948 3.453 3.453 0 0 1-.621.55 3.274 3.274 0 0 1-2.416.541 3.377 3.377 0 0 1-2.133-1.323 3.695 3.695 0 0 1-.71-2.517A3.637 3.637 0 0 1 7.915 7.34z" stroke="#FFF" stroke-width=".833" fill="#FFF"></path>
			    </g>
			</svg>
			<div id="div_text">베스트 댓글 선정시 1000캐시 적립</div>
		</div>
		<form id="form_comment" action="commentWriteAction.jsp" method="post">
<!-- 			댓글을 작성하고 등록버튼(submit)을 클릭가면 name에 담김 입력값을 담아서 넘겨줌 -->
			<input type="hidden" name="post_idx" value="<%=postDto.getPostIdx()%>" />
<!-- 			댓글을 작성한 postIDX의 값을 name에 담아서 넘김 -->
			<div class="div_comment_input_box">
				<img src="img/카메라img2.png"/>
				<textarea class="comment_text" name="contents" placeholder="주의! 고수 개인 연락처는 남길 수 없어요." rows="1" wrap="soft"></textarea>
<!-- 				댓글 내용을 contents에 담아서 넘김 -->
				<input type="submit" class="comment_keyUp" value="등록"/> 
<!-- 				다음페이지로 이동하기 위한 submit 버튼 -->
			</div>
		</form>
		<div class="div_post_reply_comment">
			<%
				for (CommuCommentsDto commentsDto : listCommentDto) {
					int writerUserIdx = commentsDto.getUsersIdx();
					String strAlias = null;
					if(dao.isGosu(writerUserIdx)) { 
						strAlias = dao.getGosuAliasFromUsersIdx(writerUserIdx);
					} else {
						strAlias = commentsDto.getUserAlias();
					}
					
					String fileUrl = commentsDto.getUserImg();
					if(fileUrl != null) {
						if(fileUrl.startsWith("http://") || fileUrl.startsWith("https://")) {
						} else {
							fileUrl = "${pageContext.request.contextPath}/upload/img/" + fileUrl;
						}
					}
			%>
				<div class="div_post_comment" idx="<%=commentsDto.getCommentsIdx()%>" >
					<div class="div_profile_img">
						<% if(commentsDto.getUserImg() == null) { %>
							<img class="profile_img" src="https://static.cdn.soomgo.com/upload/profile/221eb2b1-fb7f-443b-bec2-1d59fdc40a53.jpg?h=110&w=110&webp=1" style="width:100%; height:32px"/>
						<% } else { %>
							<img class="profile_img" src="<%=fileUrl%>" style="width:100%; height:32px"/>
						<% } %>
						<div style="clear:both;"></div>
					</div>
					<div class="div_comment_info">
						<div style="clear:both;"></div>
						<div class="div_user_info">
							<div style="clear:both;"></div>
							<div class="user_info">
								<div class="user_name" usersIdx="<%=commentsDto.getUsersIdx()%>"><%=strAlias%> </div>
								<div class="user_service"><%-- TODO TODO TODO TODO TODO "미장 시공 + 1개 서비스 고수" --%>
									<span><%=postDto.getServiceTitle()%></span>
									<span>+5개 서비스 </span>
									<span>고수</span>
								</div>
							</div>
							<button>견적요청</button>
						</div>
						<div class="div_content_span">
							<%=commentsDto.getContents()%>
						</div>
						<div class="div_post_comment_actions">
							<div class="div_comment_date">
								<div class="div_date">
									<%=commentsDto.getCommentDate().substring(2,10)%>
								</div>
								<div class="div_option">
									<div class="div_icon2">
										<img class="op_img" src="img/세로점3.png"/>
									</div>
								</div>
							</div>
							<div class="div_comment_action_container" >
								<button class="btn1">
									<img src="img/게시글 댓글수이미지.png"/> 
									댓글달기
								</button>
								<button>
									<img src="img/좋아요이미지1.png"/>
									도움이 돼요 2
								</button>
							</div>
						</div>
					</div>
					<div style="clear:both;"></div>
				</div>
<!-- 				<form action="commentChildWirteAction.jsp" method="post" class="comment_child_form"> -->
<%-- 					<input type="hidden" name="parent_idx" value="<%=commentsDto.getCommentsIdx() %>" /> --%>
				 	<div class="div_comment_input_box reply" >
						<img src="img/카메라img2.png"/>
						<span class="reply_user_name"><%=commentsDto.getUserAlias()%></span>
						<textarea class="comment_text sub" name="comment-input" placeholder="주의! 여기는 대댓글입니다." rows="1" wrap="soft"></textarea>
						<input type="submit" class="comment_keyUp" value="등록"/> 
	<!-- 					<span class="comment_keyUp">등록</span> -->
					</div>
<!-- 				</form> -->
				<!-- ==================밑에는 대댓글 ================-->
				<ul class="comment_reply_list">
					<li class="comment_reply_list">
						<%
							ArrayList<CommuCommentsChildDto> listCommentsChild = dao.getCommentsChild(commentsDto.getCommentsIdx());
							for (CommuCommentsChildDto ccDto : listCommentsChild) {
						%>
							<div class="comment_reply">   
								<div class="comment_reply_profile_img">
									<img src="https://static.cdn.soomgo.com/upload/profile/18930225-da1e-4c18-b42f-ed21708bf5e6.jpg?h=110&w=110&webp=1"/>
								</div>
								<div class="comment_infor">
									<div class="comment_user_info">
										<div class="comment_user_info_wrapper">
											<div class="comment_user">
												<span class="comment_user_name"><%=ccDto.getUserAlias()%></span>
												<span class="comment_badge">작성자</span>
											</div>
										</div>
									</div>
									<div class="comment_contents">
										<span class="contents_text"></span>
										<p class="text_comment">
											<span><%=ccDto.getCommentsContents() %></span>
										</p>
									</div>
									<div class="post_comment_actions">
										<div class="comment_write_date">
											<span class="comment_write"><%=ccDto.getCommentDate().substring(2,10) %></span>
											<div class="dropdown">
												<button class="dropdown_btn"></button>
												<ul class="drop_down_menu">
													<li class="menu">
														<a class="dropdown_item"></a>
													</li>
												</ul>
											</div>
										</div>
										<div class="comment_footer">
											<button class="comment_btn">
												<img src="img/게시글 댓글수이미지.png"/>
												댓글 달기
											</button>
											<button>
												<img src="img/좋아요이미지1.png"/>
												도움이 돼요
											</button>
										</div>
									</div>
								</div>
							</div>
						<%
							}
						%>
					</li>
				</ul>
				<div class="div_comment_input_box child" >
					<img src="img/카메라img2.png"/>
					<span class="reply_user_name">장요준</span>
					<textarea class="comment_text" name="comment-input" placeholder="주의! 고수 개인 연락처는 남길 수 없어요." rows="1" wrap="soft"></textarea>
					<span class="comment_keyUp">등록</span>
				</div>
			<% } %>	
		</div> 
	</div>
		<!-- ---------------------------------------- 여기까지, 임시 -->
		<div id="div_related__posts">
				<span>Ai 추천</span>
				<h2>이런 글도 확인해 보세요!</h2>
			<div id="div_ui">
				<span>
					시스템 선반 칸 추가 하고 싶어요.
					<img class="a_img" src="img/화살표1.png"/>
				</span>
				<span>
					업소용 다리미판
					<img class="a_img" src="img/화살표1.png"/>
				</span>
				<span>
					로봇청소기장
					<img class="a_img" src="img/화살표1.png"/>
				</span>
			</div>
		</div>
		<div id="div_popular_provider">
			<div id="div_popular_provider_heading">
				<div >'<%= postDto.getServiceTitle() %>' <br/> 인기 고수 추천</div>
				<div>전체보기</div>
			</div>
			<div id="div_content">
				<div class="div_slide">
					<div class=" div_slide_inner">
						<div class=" div_profile_container">
							<img class="profile_img" src="https://static.cdn.soomgo.com/upload/profile/50cbf295-0c71-4d60-a617-767b5a0e9ec9.jpg?webp=1&h=320&w=320"/>
							<h3 class="profile_title">유남우</h3>
							<div class="profile_subtitle">경기도 남양주시  · 경력 40년</div>
						</div>
						<div class=" div_review_container">
							<div class="div_pro_rate">
								<div class="avg_score">
									<img class="avg_score" src="img/별.png"/>
									<div class="score">5</div>
								</div>
							</div>
							<div class="review_comment">
									“저희는 까사미아 캄포(클래식)를 구입해서 잘쓰고 있었어요. 부모님 댁 이태리 가죽소파 (까사미아) 를 바꾸려고 까사미아 캄포(슬림) 를 고민했어요. 
									사이즈, 모양, 구입 당시 가격까지 생각이 많았어요. 결국 리폼을 결정했고 마음에 드네요. 빠르게 (7일 이내) 작업했지만 결과물 좋아요. 
									가격은 좀 부담이지만 완성도는 추천합니다. ”
							</div>
						</div>
					</div>
				</div>
				<div class="div_slide">
					<div class=" div_slide_inner">
						<div class=" div_profile_container">
							<img class="profile_img" src="https://static.cdn.soomgo.com/upload/profile/50cbf295-0c71-4d60-a617-767b5a0e9ec9.jpg?webp=1&h=320&w=320"/>
							<h3 class="profile_title">유남우</h3>
							<div class="profile_subtitle">경기도 남양주시  · 경력 40년</div>
						</div>
						<div class=" div_review_container">
							<div class="div_pro_rate">
								<div class="avg_score">
									<img class="avg_score" src="img/별.png"/>
									<div class="score">5</div>
								</div>
							</div>
							<div class="review_comment">
									“저희는 까사미아 캄포(클래식)를 구입해서 잘쓰고 있었어요. 부모님 댁 이태리 가죽소파 (까사미아) 를 바꾸려고 까사미아 캄포(슬림) 를 고민했어요. 
									사이즈, 모양, 구입 당시 가격까지 생각이 많았어요. 결국 리폼을 결정했고 마음에 드네요. 빠르게 (7일 이내) 작업했지만 결과물 좋아요. 
									가격은 좀 부담이지만 완성도는 추천합니다. ”
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="div_recommend_request">
			<div id="div_recommend_request_header">
				<div id="div_title"> 커뮤니티 인기 서비스 TOP 8 바로 견적을 요청해보세요!</div>
				<div id="div_view_total">전체보기</div>
			</div>
			<div id="div_request_list">
				<a>피아노/키보드 레슨</a>
				<a>골프 레슨</a>
				<a>퍼스널트레이딩(PT)</a>
				<a>보컬 레슨</a>
				<a>수학 과외</a>
				<a>에어컨 설치 및 수리</a>
				<a>문 설치 및 수리</a>
				<a>수도 관련 설치 및 수리</a>
			</div>
		</div>
		<div id="div_popular_post" >
			<div id="div_post_heading" >
				<h2 class="h2"> 지금 가장 뜨거운 🔥 커뮤니티 게시글 </h2>
			</div>
			<div class="div_curation_list">
				<div class="div_curation" >
					<div class="topic_name">숨고이야기</div>
					<div class="curation_title">🔭 18살에 유럽 프로 리그 데뷔전 2위! 축구 레슨 허민영 고수</div>
					<div class="curation_content">'좋은 축구 선수가 되기 위해 365일 중 360일 훈련했어요.' 국내 K-리그부터 우리에게 잘 알려진 영국 프리미어리그, 분데스리가, 세리에 A, 라리가뿐 아니라 세계 각국의 프로 축구팀에서 세계적으로 뛰어난 실력의 선수들을 영입하고 신예를 발굴한다. 세계적인 기량의...</div>
					<div class="cureation_reaction">
						<div class="view_count">
							<img class="view_img" src="img/조회수이미지.png"/>
							<div class="view_count">2,052</div>
							<img class="comment_img" src="img/댓글수이미지.png"/>
							<div class="comment_count">21</div>
						</div>
					</div>
				</div>
				<div>
					<img class="post_img" src="https://static.cdn.soomgo.com/upload/soomgoLifeAdmin/c116964a-313e-4dc1-9630-fc421d191f55.png?h=128&w=128&webp=1"/>
				</div>
				<div style="clear:both"></div>
			</div>
			<div class="div_curation_list">
				<div class="div_curation" >
					<div class="topic_name">고수에게 묻다</div>
					<div class="curation_title">에어컨 결로현상...? 문의 드립니다.</div>
					<div class="curation_content">'검색해본 결과 에어컨 결로 현상인것 같은데수리 비용이 어느정도 될까요..?
					</div>
					<div class="cureation_reaction">
						<div class="view_count">
							<img class="view_img" src="img/조회수이미지.png"/>
							<div class="view_count">177</div>
							<img class="comment_img" src="img/댓글수이미지.png"/>
							<div class="comment_count">11</div>
						</div>
					</div>
				</div>
				<div>
					<img class="post_img" src="https://static.cdn.soomgo.com/upload/media/567dd9fa-0477-4f4d-9ecc-be13c7660cd7.jpg?h=128&w=128&webp=1"/>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</div>
	<div class="comment_cancel_layout">
		<div class="comment_cancel_box">
			<div class="cancel_header">
				<h2 class="header_text">댓글 작성 취소</h2>
			</div>
			<div class="cancel_content">
				<div class="content_text">
					<span class="content_text"> 작성중인 내용이 저장되지 않고 사라집니다. </span>
				 </div>
			</div>
			<div class=cancel_actions>
				<button class="confirm_btn">확인</button>
				<button class="cancel_btn">취소</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>

<div class="dropdown_greyfilter" style="display:none;">
	<div class="greyfilter_modal">
		<div class="modal_header">
			<h2 class="modal_title">게시글 삭제<h2>
		</div>
		<div class="modal_content">
			<div class="modal_inner_content">게시글을 정말 삭제하시겠습니까?</div>
		</div>
		<div class="modal_action">
			<button class="modal_confirm_btn">확인</button>
			<button class="modal_cancel_btn">취소</button>
		</div>
		<div class="modal_footer" style="display:none;"></div>
	</div>
</div>


