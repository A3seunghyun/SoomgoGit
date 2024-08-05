<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
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
//영현이 헤더 
	int users_idx = 0;
	String users_idx_param = request.getParameter("users_idx");
	
	if (users_idx_param != null && !users_idx_param.trim().isEmpty()) {
	    try {
	        users_idx = Integer.parseInt(users_idx_param);
	    } catch (NumberFormatException e) {
	        // 예외 처리: 잘못된 형식의 숫자가 들어온 경우 기본값 0을 사용
	        users_idx = 0;
	    }
	}
	
	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
	HttpSession hs = request.getSession();
	
	try{
		users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
		
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
		}catch(Exception e){
			
		}

	    // 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
	    Integer isgosu = (Integer) hs.getAttribute("isgosu");
	    if (isgosu == null) {	
	    	// 고수일때 실행할 메서드
	    	isgosu = 2; // 기본값 2
	    }//else{
	    	// 고수아닐때 일반회원일때 실행할 메서드
	    	// }
// 헤더-- 
%>
    
    
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
	<link rel="stylesheet" href="css/header.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
    /* 헤더 jquery */
	</script>
 	
 	
 	
 	
 	
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
 						$("#div_service_town_layout").css("display","none");
 						$("#greyscreen_filter").css("display","none");
 						let str = '<div class="selected_names fl">' + name + '<span class="close_x">X</span></div>';
 						$("#div_service_town > div:last-child").before(str);
						$(".service_btn").css("display", "none"); 	// 서비스 버튼 숨기고.	 				
 						$(".btn_init").css("display", "inline-block");  // 초기화 버튼 보이고.

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
	<header class = "header-total">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "soomgo_main.jsp">
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
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
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
                            <a href = "soomgo_main.jsp">
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
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
                                        <span class = "header-nav-li-span">커뮤니티</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class = "center-section">
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
                    </div>

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
	<div>
	</div>
    <header class = "header-total2">
        <div class = "header-inner">
            <section class = "header-section1">
                <div class = "header-div1">
                    <div class = "header-div1-1">
                        <div class = "header-div1-1-logo">
                            <a href = "soomgo_main.jsp">
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
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
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
						<img data-v-fc227e46="" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNzIiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA3MiA0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTQyLjY5IDBoMTUuMjI4YzEuNzU3IDAgMy40My4zNDggNC45NTEuOTc3QzY4LjIxMyAzLjAyIDcyIDguMDc0IDcyIDEzLjk5OWMwIDcuMDkyLTUuNDE4IDEzLjA2NS0xMi40NDUgMTMuOTg2LTEuMDIxLjEzNC0xLjkzNy0uNjMxLTEuOTM3LTEuNjM1di0xLjY0NUg0Mi42OWMtNy4wMDggMC0xMi42OS01LjUzLTEyLjY5LTEyLjM1M0MzMCA1LjUzMSAzNS42ODIgMCA0Mi42OSAwIiBmaWxsPSIjRUVDNDgyIi8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNDEgMTEpIiBmaWxsPSIjRkZGIj4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMiIgY3k9IjIiIHI9IjIiLz4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMTAiIGN5PSIyIiByPSIyIi8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjE4IiBjeT0iMiIgcj0iMiIvPgogICAgICAgIDwvZz4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHBhdGggZD0iTTI5LjMxIDEySDE0LjA4MmMtMS43NTcgMC0zLjQzLjM0OC00Ljk1MS45NzdDMy43ODcgMTUuMDIgMCAyMC4wNzQgMCAyNS45OTljMCA3LjA5MiA1LjQxOCAxMy4wNjUgMTIuNDQ1IDEzLjk4NiAxLjAyMS4xMzQgMS45MzctLjYzMSAxLjkzNy0xLjYzNXYtMS42NDVIMjkuMzFjNy4wMDggMCAxMi42OS01LjUzIDEyLjY5LTEyLjM1M0M0MiAxNy41MzEgMzYuMzE4IDEyIDI5LjMxIDEyIiBmaWxsPSIjRTFBRjYzIi8+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNS42NjcgMjIuMjVoLS44OWMtLjk4MSAwLTEuNzc3Ljc4My0xLjc3NyAxLjc1djUuMjVjMCAuOTY3Ljc5NiAxLjc1IDEuNzc4IDEuNzVoLjg4OWMuNDkgMCAuODg5LS4zOTIuODg5LS44NzV2LTdhLjg4Mi44ODIgMCAwIDAtLjg5LS44NzVtMTEuNTU2IDBoLTQuNDQ0bC43MzQtMi43MDZhMS43MzcgMS43MzcgMCAwIDAtLjczOC0xLjg4bC0uNzg3LS41MTdhLjg5Ny44OTcgMCAwIDAtMS4yODguMzM3bC0yLjAwNCA0LjAzOWEzLjQ1NiAzLjQ1NiAwIDAgMC0uMzYxIDEuNTM2djYuMTkxYzAgLjk2Ny43OTUgMS43NSAxLjc3NyAxLjc1aDYuMDQ0Yy44NDcgMCAxLjU3Ny0uNTg5IDEuNzQzLTEuNDA3bDEuMDY3LTUuMjVjLjIyLTEuMDgyLS42MjItMi4wOTMtMS43NDMtMi4wOTMiIGZpbGw9IiNDMTdGMkEiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" class="guide-icon">
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
						