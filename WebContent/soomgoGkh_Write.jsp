<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuServiceTitleDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
//로그인 수정 0810
	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
	Integer users_idx = (Integer)(session.getAttribute("L_users_idx"));
	Integer isgosu = (Integer)(session.getAttribute("isgosu"));
	
	try{
		Soomgo_headerDao shdao = new Soomgo_headerDao();
		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
	}catch(Exception e){}
 	
	
// 	===============  GosuKnhWriteFormAction으로 이동노노 파일 업로드는 action 노노노ㅗ노 ======================
 	CommunityDao dao = new CommunityDao();
 	ArrayList<CommuServiceTitleDto> listService =  dao.getListServiceFromUsersIdx(users_idx);
 	String serviceTitle = listService.get(0).getServiceTitle();  
 	/* 쿼리상 대표서비스 union 제공서비스로 되어있어 대표서비스가 처음 출력됨 0 번째가 대표서비스  */
	
	
 %>   
 <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고수노하우_글쓰기1</title>
<!-- 	<link rel="stylesheet" href="css/soomgoGosu_knowhow_Write.css"/> -->
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/soomgoGosu_knowhow_Write.css">
<!-- 	<link rel="stylesheet" href="css/soomgoGosu_knowhow_Write2.css"> -->
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
    // 영현이 헤더 jquery
 </script>
	
	<script>
	/* -----------------------서비스인풋태그 클릭시 동작 화면----------------- */
		$(function() {
			$("#div_input_box > input").click(function() {
				$("#greyscreen_filter").css('display','block');
				$("#popup1").css('display','block');
				
// 				adjustGreyScreenPosition();
			});
			
			$("#popup1 > div:nth-child(1) > svg").click(function() {
				$("#greyscreen_filter").css('display','none');
				$("#popup1").css('display','none');
			});
			$("#popup1 > div:not(:nth-child(1))").click(function() {
				$("#popup1 > div:not(:nth-child(1))").removeClass("checked");
				$(this).addClass("checked");
				let text_selected = $(this).text();
				$("#greyscreen_filter").css('display','none');
				$("#popup1").css('display','none');
				$("#div_input_box > input").val(text_selected);
			});
			$(".guide").click(function(){
				alert("준비중입니다.");
			});
		
		   $("#title").on('input', function() {
			   /* 인풋창 입력시 상태 변화  */
		        var inputValue = $(this).val().trim();
		        var length = inputValue.length;
				$(".title_length").css('color','rgb(0, 199, 174)');
		        
		        if (length < 8 ) {
		            $(".limit_text").text("최소 8자 이상, 최대 30자까지 입력해주세요.");
		            $(this).css('outline','none');
		            $(this).css('border','1px solid rgb(250, 89, 99)');
		            $(this).css('box-shadow','rgb(255, 230, 230) 0px 0px 0px 3px');
		            
		        } else if(length >= 8) {
		        	$(this).css('border','none');
		        	$(this).css('box-shadow','none');
		        	$(this).css('border','1px solid rgb(0,199,175)');
		        	$(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
		            $(".limit_text").text("");
		        }
		        if (length > 30) {
		        	/* 텍스트 길이가 30까지만 가게 */
		            inputValue = inputValue.substring(0, 30);
		            $(this).val(inputValue); // 입력 필드에 잘라낸 값 적용
		            length = 30; // 길이 다시 계산
		        }
		        $(this).on('focusout',function(){
		        	if(length <=8 ) {
			        	$(this).css('box-shadow','none');	
			        	$(this).css('border','rgb(255, 230, 230) 0px 0px 0px 3px');
		        	} else if(length >8){
		        		$(this).css('border','1px solid rgb(225, 225, 225)');
		        	}
		        });
		        $(".title_length").text(length);
		        	/* 입력된 문자의 길이 */
		    });
		   // 대표제목 텍스트창 클릭시 border 색상 변경
		   $("#title").click(function(){
			   $(this).css('border','1px solid rgb(0,199,175)');
		   });

		   
		   // 상세정보 - 시작글 
		   $("#start-text").on('input', function(){
			  let inputValue = $(this).val().trim();	// 현재 입력한 값
			  let length = inputValue.length;			// 입력 값의 길이 계산
			   $(".content_length").text(length);		// 글자의 길이 표시
			   
			  $(".content_length").css('color', 'rgb(0, 199, 174)');
			  
			  if(length > 0) {
				  $(this).css('border','1px solid rgb(0,199,175)');
				  $(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
			  }
			  if(length > 150) {
				  inputValue = inputValue.substring(0,150);
				  $(this).val(inputValue);
				  length= 150;
			  }
			  
			   // 텍스트창이 포커스를 잃으면 색생 기존색상으로 돌아옴
		      $(this).on('focusout',function(){
		        	if(length < 1 ) {
			        	$(this).css('box-shadow','none');	
			        	$(this).css('border','rgb(255, 230, 230) 0px 0px 0px 3px');
		        	} else if(length >0){
		        		$(this).css('border','1px solid rgb(225, 225, 225)');
		        	}
		        });
		   });
		   
		   // ====================여기서 부터 상세정보 본문 머리글에 대한 내용 ===========================================
		   // 상세내용  본문 머리글1에 대한 내용 
		   $("#main_content1").on('input', function(){
			   var inputValue = $(this).val().trim();
		        var length = inputValue.length;
		        $(".title_length1").text(length);		// 글자의 길이 표시
				$(".title_length1").css('color','rgb(0, 199, 174)');
		        
		        if (length < 8 ) {
		            $(".limit_text").text("최소 8자 이상, 최대 30자까지 입력해주세요.");
		            $(this).css('outline','none');
		            $(this).css('border','1px solid rgb(250, 89, 99)');
		            $(this).css('box-shadow','rgb(255, 230, 230) 0px 0px 0px 3px');
		            
		        } else if(length >= 8) {
		        	$(this).css('border','none');
		        	$(this).css('box-shadow','none');
		        	$(this).css('border','1px solid rgb(0,199,175)');
		        	$(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
		            $(".limit_text").text("");
		        }
		        if (length > 30) {
		        	/* 텍스트 길이가 30까지만 가게 */
		            inputValue = inputValue.substring(0, 30);
		            $(this).val(inputValue); // 입력 필드에 잘라낸 값 적용
		            length = 30; // 길이 다시 계산
		        }
		        $(this).on('focusout',function(){
		        	if(length <=8 ) {
			        	$(this).css('box-shadow','none');	
			        	$(this).css('border','rgb(255, 230, 230) 0px 0px 0px 3px');
		        	} else if(length >8){
		        		$(this).css('border','1px solid rgb(225, 225, 225)');
		        	}
		        });
		        $("#main_content1, .title_length1").text(length);
		        
		        	/* 입력된 문자의 길이 */
		    });
		   
		// 상세내용  본문 머리글2에 대한 내용 
		   $("#main_content2").on('input', function(){
			   var inputValue = $(this).val().trim();
		        var length = inputValue.length;
		        $(".title_length2").text(length);		// 글자의 길이 표시
				$(".title_length2").css('color','rgb(0, 199, 174)');
		        
		        if (length < 8 ) {
		            $(".limit_text").text("최소 8자 이상, 최대 30자까지 입력해주세요.");
		            $(this).css('outline','none');
		            $(this).css('border','1px solid rgb(250, 89, 99)');
		            $(this).css('box-shadow','rgb(255, 230, 230) 0px 0px 0px 3px');
		            
		        } else if(length >= 8) {
		        	$(this).css('border','none');
		        	$(this).css('box-shadow','none');
		        	$(this).css('border','1px solid rgb(0,199,175)');
		        	$(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
		            $(".limit_text").text("");
		        }
		        if (length > 30) {
		        	/* 텍스트 길이가 30까지만 가게 */
		            inputValue = inputValue.substring(0, 30);
		            $(this).val(inputValue); // 입력 필드에 잘라낸 값 적용
		            length = 30; // 길이 다시 계산
		        }
		        $(this).on('focusout',function(){
		        	if(length <=8 ) {
			        	$(this).css('box-shadow','none');	
			        	$(this).css('border','rgb(255, 230, 230) 0px 0px 0px 3px');
		        	} else if(length >8){
		        		$(this).css('border','1px solid rgb(225, 225, 225)');
		        	}
		        });
		        $("#main_content2, .title_length2").text(length);
		        
		        	/* 입력된 문자의 길이 */
		    });
		   
		// 상세내용  본문 머리글3에 대한 내용 
		   $("#main_content3").on('input', function(){
			   var inputValue = $(this).val().trim();
		        var length = inputValue.length;
		        $(".title_length3").text(length);		// 글자의 길이 표시
				$(".title_length3").css('color','rgb(0, 199, 174)');
		        
		        if (length < 8 ) {
		            $(".limit_text").text("최소 8자 이상, 최대 30자까지 입력해주세요.");
		            $(this).css('outline','none');
		            $(this).css('border','1px solid rgb(250, 89, 99)');
		            $(this).css('box-shadow','rgb(255, 230, 230) 0px 0px 0px 3px');
		            
		        } else if(length >= 8) {
		        	$(this).css('border','none');
		        	$(this).css('box-shadow','none');
		        	$(this).css('border','1px solid rgb(0,199,175)');
		        	$(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
		            $(".limit_text").text("");
		        }
		        if (length > 30) {
		        	/* 텍스트 길이가 30까지만 가게 */
		            inputValue = inputValue.substring(0, 30);
		            $(this).val(inputValue); // 입력 필드에 잘라낸 값 적용
		            length = 30; // 길이 다시 계산
		        }
		        $(this).on('focusout',function(){
		        	if(length <=8 ) {
			        	$(this).css('box-shadow','none');	
			        	$(this).css('border','rgb(255, 230, 230) 0px 0px 0px 3px');
		        	} else if(length >8){
		        		$(this).css('border','1px solid rgb(225, 225, 225)');
		        	}
		        });
		        $("#main_content3, .title_length3").text(length);
		        
		        	/* 입력된 문자의 길이 */
		    });
		   // 다음 클릭시 상세정보 화면 나타남
			$(".next_button").click(function(){
				$("#div_content").hide();
				$("#div_content_p2").show();
				$(".step1").css('color','rgb(181,181,181)');
				$(".step1").css('font-weight','500');
				$(".step2").css('color','black');
				$(".step2").css('font-weight','700');
			});
		   
		   // ====================여기까지 상세정보 본문 머리글에 대한 내용 ===========================================
		   
		   
		   
		   // 본문 추가하기 클릭시 내용
		   $(".main_btn").click(function(){
			   $("#main-text3").slideDown();
			   $(this).hide();
		   })
		   
		   $(".delete_btn").click(function(){
			   $("#main-text3-modal").show();
			   $(".main_btn").show();
			   $("input > #main_content3").val("");   
		   })
		   $(".cancel-btn").click(function(){
			   $("#main-text3-modal").hide();
		   })
		   $(".confirm-btn").click(function(){
			   $("#main-text3-modal").hide();
			   $("#main-text3").hide();
		   })
		   
		   // 이전 클릭시 기본정보 화면이 나타남
		   $(".before_btn").click(function(){
			  $("#div_content_p2").hide();
			  $("#div_content").show();
			  $(".step2").css('color','rgb(181,181,181)');
			  $(".step2").css('font-weight','500');
			  $(".step1").css('color','black');
			  $(".step1").css('font-weight','700');
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
                        <ul class = "header-nav-ul"  style="padding: 0px; !important">
                            <li class = "header-nav-li">
                                <a href = "Seach.profile.jsp">
                                    <span class = "header-nav-li-span">견적요청</span>
                                </a>
                            </li>

                            <li class = "header-nav-li1">
                                <a href = "Seach.profile.jsp">
                                    <span class = "header-nav-li-span" id = "serarch_profile">고수찾기</span>
                                </a>
                            </li>

                            <li class = "header-nav-li1">
                                <a href = "">
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
	                                  <a href = "">
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
                                <a href = "">
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
<body>
<!-- -------------------------------------헤더--------------------------------------------------- -->

<div id="div_layout" >
	<form action="soomgoGkhWriteServlet" method="post" enctype="multipart/form-data">
		<div id="page1">
			<div id="div_layout_inner">
				<div id="div_header" >
					<h1>고수노하우 쓰기</h1>
				</div>
				<div id="div_side_tab" >
					<div id="div_tab1" >
						<div class="step1"> 기본 정보 </div>
						<div class="step2"> 상세 내용 </div>
					</div>
					<div id="div_tab2" >
							<img src ="img/고수노하우쓰기img.png"/>
							<div class="header">이런 내용은 안돼요!</div>
						<ul id="guide">
							<li id="guide_inner" >이메일, 전화번호, 카카오톡, 주소 등의 개인정보</li>
							<li id="guide_inner" >프로모션, 서비스 등을 홍보하는 광고성 글</li>
						</ul>
					</div>
					<button class="guide_btn" style="cursor:pointer">작성가이드</button>
				</div>
			<div id="div_content">
				<h2>기본 정보를 작성해 주세요</h2>
				<div id="div_header_box" >
					<div class="text_bold">대표 사진</div>	
					<p class="text">노하우를 잘 표현한 저작권이 있는 사진을 올려주세요</p>	
					<div width="165" class= "file_list_box">
						<div class="file_upload_box">
							<label class="file_upload"> <!--  for="file_upload" -->
								<input type="file" name="file_0" class="file_input"/> <!-- id="file-Upload" -->
								<svg class="file_input_svg" xmlns="http://www.w3.org/2000/svg">
									<g fill="none" fill-rule="evenodd">
										<path d="M0 0h36v36H0z"></path>
										<g stroke="#00C7AE" stroke-width="1.5" transform="translate(4 4)">
										<path stroke-linecap="round" d="M14 7v14m7-7H7"></path>
										<circle cx="14" cy="14" r="14"></circle>
										</g>	
									</g>
								</svg>
							</label>		
						</div>	
					</div>
				</div>
				<div class="div_service_box">
					<div class="text_bold">서비스 분야</div>
					<div class="text">고수님이 제공하는 서비스만 선택할 수 있어요</div>
					<div id="div_input_box">
					<div style="clear:both"></div>
						<input placeholder="예시) 인테리어/시공"  name="service" readonly value="<%=serviceTitle%>">
						<svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#E1E1E1" class="css-up1ori e1tdl5rx7"><path fill-rule="evenodd" clip-rule="evenodd" d="M12.08 17.849a.75.75 0 0 0 .56-.256l8.924-10.198a.75.75 0 1 0-1.128-.988l-8.364 9.558L3.56 6.402a.75.75 0 0 0-1.12.998l9.076 10.197a.75.75 0 0 0 .564.252Z" fill="currentColor"></path></svg>
						<div class="input_img"></div>
					</div>
				</div>
				<div id="div_title_box" >
					<div class="text_bold">대표 제목</div>
					<input id="title" type="text" name="title" placeholder="예시: 아이폰으로 음식사진 잘 찍는 방법" minlength="8" maxlength="30"/>
					<div class="text_length">
						<span class="limit_text">최소 8자 이상, 최대 30자까지 입력해주세요.</span>
								<span class="content_text">
									<span class="title_length">0</span>
									/
									30
								</span>
							</div>
				</div>
				<div id="div_bottom">
					<p>꼭 확인해 주세요!</p>
					<ul id="guide">
						<li id="guide_inner">등록한 고수노하우 글은 프로필에서 확인할 수 있습니다.</li>
						<li id="guide_inner">고수님이 작성한 고수노하우 글은 숨고를 방문하는 모든 사람들에게 보여집니다.</li>
						<li id="guide_inner">숨고 SNS채널에 고수님의 글과 프로필이 홍보될 수 있습니다.
							<br/>(*선정 시 별도 안내 문자 발송)</li>
						<li id="guide_inner">고수님이 저작권을 소유했거나 무료 배포가 허용된 사진, 동영상만 사용 가능합니다.</li>
						<li id="guide_inner">노하우와 별개로 지나친 광고성 글은 삭제됩니다.</li>
					</ul>
				</div>
				<button type="button" class="next_button" style="cursor:pointer">다음</button>
				<div style="clear:both"></div>
			</div>
					<!-- ===============여기서 부터 상세정보============================= -->
			<div id="div_content_p2">	
				<h2>상세 내용을 작성해 주세요</h2>
				<div id="div_start_box">
					<div id="div_Start_post"> 시작 글</div>
					<textarea  id="start-text" name="startText" placeholder="시작하는 글이에요.&#10;고수님의 자기소개와 함께 노하우에 대한 간단한 설명을 적어주세요."
						rows="4" wrap="soft" maxlength="150" class="textarea_start_post"></textarea>
					<div class="text_length">
						<span class="content_text">
							<span class="content_length">0</span>
							/
							150
						</span>
					</div>
				</div>
				<div class="div_main_text_box">
					<div class="main_text">첫번째 본문 작성</div>
					<div class="main_header_box">
						<div class="main_header_text">본문 머리글</div>
						<input id="main_content1" type="text" name="section1_title" placeholder="본문 머리글을 적어주세요." maxlength="30" >
						<div class="text_length">
							<span class="limit_text">최소 8자 이상, 최대 30자까지 입력해주세요.</span>
							<span class="content_text">
								<span class="title_length1">0</span>
								/
								30
							</span>
						</div>
					</div>
					<div class="main_img_box">
						<div class="main_img_header">본문 사진 (최대 3개)</div>
						<p>단락의 내용과 관련된 저작권이 있는 사진을 올려주세요</p>
						<div class="img_list ">
							<label class="img_upload border" >
								<input type="file" name="img1_1" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" class="css-fhbt6x eb4dvil3"><g fill="none" fill-rule="evenodd"><path d="M0 0h36v36H0z"></path><g stroke="#00C7AE" stroke-width="1.5" transform="translate(4 4)"><path stroke-linecap="round" d="M14 7v14m7-7H7"></path><circle cx="14" cy="14" r="14"></circle></g></g></svg>
							</label>
							<label class="img_upload_2 border">
								<input type="file" name="img1_2" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</label>
							<label class="img_upload_2 border">
								<input type="file" name="img1_3" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</label>
						</div>
					</div>
					<div class="main_body_box">
						<div class="main_body_text">본문 내용</div> 
						<textarea name="section1_contents" placeholder="고객들에게 알려주고 싶은 노하우를 구체적으로 적어주세요.&#10;※ 노하우와 별개로 지나친 광고성 글은 삭제됩니다&#10;※ 이메일, 전화번호, 카카오톡, 주소 등의 개인정보가 포함된 글은 삭제됩니다" rows="10" wrap="soft" maxlength="500" class="textarea_body_post"></textarea>
						<div class="text_length">
							<span class="content_text">
								<span class="content_length">0</span>
								/
								500
							</span>
						</div>
					</div>
				</div>
				
				<div class="div_main_text_box">
					<div class="main_text">두번째 본문 작성</div>
					<div class="main_header_box">
						<div class="main_header_text">본문 머리글</div>
						<input id="main_content2" type="text" name="section2_title" placeholder="본문 머리글을 적어주세요." maxlength="30">
						<div class="text_length">
							<span class="limit_text">최소 8자 이상, 최대 30자까지 입력해주세요.</span>
							<span class="content_text">
								<span class="title_length2">0</span>
								/
								30
							</span>
						</div>
					</div>
					<div class="main_img_box">
						<div class="main_img_header">본문 사진 (최대 3개)</div>
						<p>단락의 내용과 관련된 저작권이 있는 사진을 올려주세요</p>
						<div class="img_list ">
							<label class="img_upload border" >
								<input type="file" name="img2_1" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" class="css-fhbt6x eb4dvil3"><g fill="none" fill-rule="evenodd"><path d="M0 0h36v36H0z"></path><g stroke="#00C7AE" stroke-width="1.5" transform="translate(4 4)"><path stroke-linecap="round" d="M14 7v14m7-7H7"></path><circle cx="14" cy="14" r="14"></circle></g></g></svg>
							</label>
							<label class="img_upload_2 border">
								<input type="file" name="img2_2" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</label>
							<label class="img_upload_2 border">
								<input type="file" name="img2_3" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</label>
						</div>
					</div>
					<div class="main_body_box ">
						<div class="main_body_text ">본문 내용</div> 
						<textarea name="section2_contents" placeholder="고객들에게 알려주고 싶은 노하우를 구체적으로 적어주세요.&#10;※ 노하우와 별개로 지나친 광고성 글은 삭제됩니다&#10;※ 이메일, 전화번호, 카카오톡, 주소 등의 개인정보가 포함된 글은 삭제됩니다" rows="10" wrap="soft" maxlength="500" class="textarea_body_post"></textarea>
						<div class="text_length">
							<span class="content_text">
								<span class="content_length">0</span>
								/
								500
							</span>
						</div>
					</div>
				</div>
				
				
				<div id="main-text3" class="div_main_text_box">
					<div class="main-text-write3">
						<div class="main_text">세번째 본문 작성</div>
						<button type="button" class="delete_btn">
							삭제하기
							<svg width="20" height="20" color="#999999">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M5.25 6.742h-1.5a.75.75 0 0 1 0-1.5h4.5V3.75C8.25 2.784 9.034 2 10 2h4c.966 0 1.75.784 1.75 1.75v1.492h4.5a.75.75 0 0 1 0 1.5h-1.5V20.25A1.75 1.75 0 0 1 17 22H7a1.75 1.75 0 0 1-1.75-1.75V6.742Zm9-1.5V3.75A.25.25 0 0 0 14 3.5h-4a.25.25 0 0 0-.25.25v1.492h4.5ZM10 8.74a.75.75 0 0 1 .75.75v8.5a.75.75 0 0 1-1.5 0v-8.5a.75.75 0 0 1 .75-.75Zm4.75.75a.75.75 0 0 0-1.5 0v8.5a.75.75 0 0 0 1.5 0v-8.5Z" fill="currentColor"></path>
							</svg>
						</button>
					</div>
					<div class="main_header_box">
						<div class="main_header_text">본문 머리글</div>
						<input id="main_content3" type="text" name="section3_title" placeholder="본문 머리글을 적어주세요." maxlength="30">
						<div class="text_length">
							<span class="limit_text">최소 8자 이상, 최대 30자까지 입력해주세요.</span>
							<span class="content_text">
								<span class="title_length3">0</span>
								/
								30
							</span>
						</div>
					</div>
					<div class="main_img_box">
						<div class="main_img_header">본문 사진 (최대 3개)</div>
						<p>단락의 내용과 관련된 저작권이 있는 사진을 올려주세요</p>
						<div class="img_list ">
							<div class="img_upload border" >
								<input type="file" name="img3_1" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" class="css-fhbt6x eb4dvil3"><g fill="none" fill-rule="evenodd"><path d="M0 0h36v36H0z"></path><g stroke="#00C7AE" stroke-width="1.5" transform="translate(4 4)"><path stroke-linecap="round" d="M14 7v14m7-7H7"></path><circle cx="14" cy="14" r="14"></circle></g></g></svg>
							</div>
							<div class="img_upload_2 border">
								<input type="file" name="img3_2" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</div>
							<div class="img_upload_2 border">
								<input type="file" name="img3_3" class="file_input"/> <!-- id="file-Upload" -->
								<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36"><g fill="none" fill-rule="evenodd"><g stroke="#B5B5B5" stroke-width="1.5" transform="translate(4 4)"><rect width="28" height="28" rx="3.5"></rect><circle cx="8.556" cy="8.556" r="2.333"></circle><path d="m28 18.667-7.777-7.779L3.112 28"></path></g><path d="M0 0h36v36H0z"></path></g></svg>
							</div>
						</div>
					</div>
					<div class="main_body_box ">
						<div class="main_body_text ">본문 내용</div> 
						<textarea name="section3_contents" placeholder="고객들에게 알려주고 싶은 노하우를 구체적으로 적어주세요.&#10;※ 노하우와 별개로 지나친 광고성 글은 삭제됩니다&#10;※ 이메일, 전화번호, 카카오톡, 주소 등의 개인정보가 포함된 글은 삭제됩니다" rows="10" wrap="soft" maxlength="500" class="textarea_body_post"></textarea>
						<div class="text_length">
							<span class="content_text">
								<span class="content_length">0</span>
								/
								500
							</span>
						</div>
					</div>
				</div>
				
				<div class="div_main_btn">
					<button type="button" class="main_btn">본문 추가하기</button>
				</div>
				<div style="clear:both"></div>
				<div id="div_bottom">
					<p>꼭 확인해 주세요!</p>
					<ul id="guide">
						<li id="guide_inner">등록한 고수노하우 글은 프로필에서 확인할 수 있습니다.</li>
						<li id="guide_inner">고수님이 작성한 고수노하우 글은 숨고를 방문하는 모든 사람들에게 보여집니다.</li>
						<li id="guide_inner">숨고 SNS채널에 고수님의 글과 프로필이 홍보될 수 있습니다.
							<br/>(*선정 시 별도 안내 문자 발송)</li>
						<li id="guide_inner">고수님이 저작권을 소유했거나 무료 배포가 허용된 사진, 동영상만 사용 가능합니다.</li>
						<li id="guide_inner">노하우와 별개로 지나친 광고성 글은 삭제됩니다.</li>
					</ul>
				</div>
				<div id="div_btn_box">
					<button type="submit"  class="next_btn" style="cursor:pointer">작성 완료</button>
					<button type="button" class="before_btn">이전</button>
				</div>
			</div> <!-- The End of the #div_content_p2 -->
			<div style="clear:both;"></div>
		</div>
	</div> <!-- The End of the page1 -->
	</form>
</div>

<!-- 서비스 선택 -------------- -->
<div id="greyscreen_filter"></div>
<div id="popup1">
<div>서비스 분야 선택<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#000000"><path d="M19.016 5.99a.75.75 0 1 0-1.06-1.061l-6.011 6.01-6.01-6.01a.75.75 0 0 0-1.061 1.06L10.884 12l-6.01 6.01a.75.75 0 1 0 1.06 1.061l6.011-6.01 6.01 6.01a.75.75 0 1 0 1.061-1.06L13.006 12l6.01-6.01Z" fill="currentColor"></path></svg></div>
<%for (CommuServiceTitleDto dto : listService) { %>
<!-- 	<div>가정이사(투룸 이상)<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#00C7AE"><path fill-rule="evenodd" clip-rule="evenodd" d="M20.081 6.452a.75.75 0 0 1 .037 1.06l-9.334 10a.75.75 0 0 1-1.096 0l-4.667-5a.75.75 0 1 1 1.097-1.024l4.118 4.413 8.785-9.413a.75.75 0 0 1 1.06-.036Z" fill="currentColor"></path></svg></div> -->
<!-- 	<div class="checked">국내 이사<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#00C7AE"><path fill-rule="evenodd" clip-rule="evenodd" d="M20.081 6.452a.75.75 0 0 1 .037 1.06l-9.334 10a.75.75 0 0 1-1.096 0l-4.667-5a.75.75 0 1 1 1.097-1.024l4.118 4.413 8.785-9.413a.75.75 0 0 1 1.06-.036Z" fill="currentColor"></path></svg></div> -->
	<div idx=<%=dto.getServiceIdx() %>> <%=dto.getServiceTitle() %><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#00C7AE"><path fill-rule="evenodd" clip-rule="evenodd" d="M20.081 6.452a.75.75 0 0 1 .037 1.06l-9.334 10a.75.75 0 0 1-1.096 0l-4.667-5a.75.75 0 1 1 1.097-1.024l4.118 4.413 8.785-9.413a.75.75 0 0 1 1.06-.036Z" fill="currentColor"></path></svg></div>

 <%} %>
</div>
</body>
</html>


<div id="main-text3-modal">
	<div class="modal-box">
		<div class="modal-box-inner">
			<div class="inner-box">
				<header>
					<h5 class="inner-box-header-text">
						본문을 <br/>
						삭제하시겠어요?
					</h5>
				</header>
				<div class="inner-box-middle-text">삭제된 내용은 복구되지 않습니다
				</div>
				<button type="button" class="confirm-btn">네, 삭제할게요
				</button>
				<button type="button" class="cancel-btn">취소
				</button>
			</div>
		</div>
	</div>
</div>














