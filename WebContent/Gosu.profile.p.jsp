<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Gosu_profile_ReservationDto"%>
<%@page import="dto.Gosu_profile_portfolio_innerDto"%>
<%@page import="dto.Gosu_profile_transaction_countDto"%>
<%@page import="dto.Gosu_profile_portfolio_outterDto"%>
<%@page import="dto.Gosu_profile_countDto"%>
<%@page import="dto.Gosu_profile_reviewDto"%>
<%@page import="dto.Gosu_profile_qna_answerDto"%>
<%@page import="dto.Gosu_profile_photo_videoDto"%>
<%@page import="dto.Gosu_profile_careerDto"%>
<%@page import="dto.Gosu_profile_career_yearDto"%>
<%@page import="dto.Gosu_profile_service_plus_titleDto"%>
<%@page import="dto.Gosu_profile_explainDto"%>
<%@page import="dao.Gosu_profileDao"%>
<%@page import="dto.Gosu_profile_header_inforDto"%>
<%@page import="dto.Gosu_profile_member_inforDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%  
	HttpSession hs = request.getSession();

// 세션에서 users_idx를 가져옴, 존재하지 않으면 기본값 0으로 설정
	Integer login_idx = (Integer) hs.getAttribute("L_users_idx");
	if (login_idx == null) {
	    login_idx = 0; // 기본값 0
	}
	
	// 세션에서 g_fuck를 가져옴, 존재하지 않으면 기본값 2 설정
	Integer isgosu = (Integer) hs.getAttribute("isgosu");
	if (isgosu == null) {
		isgosu = 2; // 기본값 2
}

	int users_idx = Integer.parseInt(request.getParameter("users_idx"));
	Gosu_profileDao gpDao = new Gosu_profileDao();
	
	ArrayList<Gosu_profile_member_inforDto> GosuProfileMember = gpDao.getGosuprofileMember(users_idx);
	ArrayList<Gosu_profile_header_inforDto> GosuProfileHeader = gpDao.getGosuprofileHeader(users_idx);
	ArrayList<Gosu_profile_countDto> GosuProfileCount = gpDao.getGosuprofileCount(users_idx);
	ArrayList<Gosu_profile_transaction_countDto> GosuProfileTransactionCount = gpDao.getGosuprofileTransactionCount(users_idx);
	ArrayList<Gosu_profile_explainDto> GosuProfileExplain = gpDao.getGosuprofileExplain(users_idx);
	ArrayList<Gosu_profile_service_plus_titleDto> GosuProfileServicePlus = gpDao.getGosuprofileServicePlus(users_idx);
	ArrayList<Gosu_profile_career_yearDto> GosuProfileCareerYear = gpDao.getGosuprofileCareerYear(users_idx);
	ArrayList<Gosu_profile_careerDto> GosuProfileCareer = gpDao.getGosuprofileCareer(users_idx);
	ArrayList<Gosu_profile_portfolio_outterDto> GosuProfilePortfolioOutter = gpDao.getGosuprofilePortfolioOutter(users_idx);
	ArrayList<Gosu_profile_photo_videoDto> GosuProfilePhotoVideo = gpDao.getGosuprofilePhotoVideo(users_idx);
	ArrayList<Gosu_profile_reviewDto> GosuProfileReview = gpDao.getGosuprofileReview(users_idx);
	ArrayList<Gosu_profile_qna_answerDto> GosuProfileQnaAnswer = gpDao.getGosuprofileQnaAnswer(users_idx);
	ArrayList<Gosu_profile_ReservationDto> GosuProfileReservation = gpDao.getGosuprofileReservation(users_idx);
	
	Soomgo_headerDao shDao = new Soomgo_headerDao();
	ArrayList<Soomgo_headerDto> Soomgoheader = shDao.getSoomgoHeader(login_idx);
	ArrayList<Soomgo_header2Dto> Soomgoheader2 = shDao.getSoomgoHeader2(login_idx);
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <% for(Gosu_profile_header_inforDto hidto: GosuProfileHeader) {%>
  <title><%=hidto.getName() %> 고수의 반려동물 훈련 서비스, 경기도 고양시 - 숨고,숨은고수</title>
  <% } %>
  <link rel="icon" href="./img/favicon_logo.ico">
  <link rel="stylesheet" href="./css/Gosu.profile.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>	
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script>
        $(function(){
        $(".pp-app").hide();
        $(".heart-button").hide();
        $(".review-main-text-more-button").hide();
        $(".review-main-img-li").hide();
        $(".review-click-button-inner-ul").hide();
        $(".review-click-button2").hide();
        $(".review-click-button4").hide();
        $(".usermenu-dropdown").hide();
        $(".usermenu3-dropdown").hide();
        $(".header-total1").hide();
        $(".header-total2").hide();
        $(".app-body-div14-more-button-outter").hide();
        $(".app-body-div14-more-button-outter1").hide();
        $(".photo-video-more-button-outter").hide();
        $(".review-main-more-button-outter").hide();
        $(".review-main-more-button-outter1").hide();
        
        let users_idx = <%= users_idx %>;
        let login_idx = <%= login_idx %>;
        //alert(login_idx);
        //alert(users_idx);
        
        
         let g_user = <%= isgosu %>
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
        
        
        
        $(document).ready(function() {
        	  const textDiv2 = $('.review-main-ul');
        	  const showDiv2 = $('.review-main-more-button-outter');
        	  const moreButtonOutter2 = $('.review-main-more-button-outter');
        	  const moreButtonOutter3 = $('.review-main-more-button-outter1');

        	  // div의 높이를 확인하여 show 클래스를 추가
        	  if (textDiv2.height() >= 200) {
        	    showDiv2.show();
        	  } else {
        	    showDiv2.hide();
        	  }

        	  // moreButtonOutter2 클릭 시 동작
        	  moreButtonOutter2.click(function() {
        	    moreButtonOutter2.toggle();
        	    moreButtonOutter3.toggle();
        	    if (moreButtonOutter3.is(':visible')) {
        	      textDiv2.css('max-height', 'none');
        	    }
        	  });

        	  // moreButtonOutter3 클릭 시 동작
        	  moreButtonOutter3.click(function() {
        	    moreButtonOutter2.toggle();
        	    moreButtonOutter3.toggle();
        	    if (moreButtonOutter2.is(':visible')) {
        	      textDiv2.css('max-height', '37rem');
        	    }
        	  });
        	});
        
        $(document).ready(function() {
      		const showDiv1 = $('.photo-video-more-button-outter');
      		const textDiv1 = $('.photo-video-ul');
      	  
      	  // div의 높이를 확인하여 show 클래스를 추가
      	  if (textDiv1.height() >= 150) {
      	    showDiv1.show();
      	  }
      	  
      	 showDiv1.click(function() {
      		    showDiv1.hide();
      		    if (showDiv1.is(':visible')) {
      		      textDiv1.css('max-height', 'none');
      		    }
      		  });
      	  
      	});
        
        $(document).ready(function() {
        	  const textDiv = $('.app-body-div14-text');
        	  const showDiv = $('.app-body-div14-more-button-outter');
        	  const moreButtonOutter = $('.app-body-div14-more-button-outter');
        	  const moreButtonOutter1 = $('.app-body-div14-more-button-outter1');
        	  
        	  // div의 높이를 확인하여 show 클래스를 추가
        	  if (textDiv.height() >= 300) {
        	    showDiv.show();
        	  }else if (textDiv.height() <= 300){
        		  showDiv.hide();
        	  }
        	  
        	  moreButtonOutter.click(function() {
        		    moreButtonOutter1.toggle();
        		    moreButtonOutter.toggle();
        		    if (moreButtonOutter1.is(':visible')) {
        		      textDiv.css('max-height', 'none');
        		    }
        		  });

        		  moreButtonOutter1.click(function() {
        		    moreButtonOutter1.toggle();
        		    moreButtonOutter.toggle();
        		    if (!moreButtonOutter1.is(':visible')) {
        		      textDiv.css('max-height', '25rem');
        		    }
        		  });
        	  
        	});
        
        
        
        
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
        
        $(".usermenu3-dropdown-div2-button").click(function(){
            $(".header-total1").show();
            $(".header-total2").hide(); 
        });
        
        $(".app-body-div10-info-icon-button1").click(function(){
        	alert("준비중 입니다.");
        });
        
        $(".review-click-button1").click(function() {
            $(".review-click-button1").hide();
            $(".review-click-button2").show();
        });

        $(".review-click-button2").click(function() {
            $(".review-click-button2").hide();
            $(".review-click-button1").show();
        });
        
        $(".review-click-button3").click(function() {
            $(".review-click-button3").hide();
            $(".review-click-button4").show();
        });

        
        $(".review-click-button4").click(function() {
            $(".review-click-button4").hide();
            $(".review-click-button3").show();
        });
        
        $(".review-service-select-li-total").click(function() {
            $(this).addClass("chk1"); 
            $(this).css("background-color","black");
            $(this).css("color","white");
            $(".review-service-select-li1").css("background-color","white");
            $(".review-service-select-li1").css("color","black");
            $(".review-service-select-li2").css("background-color","white");
            $(".review-service-select-li2").css("color","black");
        });

        
        $(".review-service-select-li1").click(function() {
            $(this).removeClass("chk2").addClass("chk1"); 
            $(this).css("background-color","black");
            $(this).css("color","white");
            $(".review-service-select-li-total").css("background-color","white");
            $(".review-service-select-li-total").css("color","black");
            $(".review-service-select-li2").css("background-color","white");
            $(".review-service-select-li2").css("color","black");
            
        });
        $(".review-service-select-li2").click(function() {
            $(this).removeClass("chk2").addClass("chk1"); 
            $(this).css("background-color","black");
            $(this).css("color","white");
            $(".review-service-select-li-total").css("background-color","white");
            $(".review-service-select-li-total").css("color","black");
            $(".review-service-select-li1").css("background-color","white");
            $(".review-service-select-li1").css("color","black");
            
        });
        
        $(document).ready(function() {
            $(".review-click-button-span").text("최신순");

            $(".review-click-button").click(function() {
                $(".review-click-button-inner-ul").show();
            });


            $(".review-click-button-inner-li").click(function() {
                $(".review-click-button-inner-li").removeClass("active1");

                $(this).addClass("active1");

                let gosuselect = $(".review-click-button-inner-li.active1").text();
                $(".review-click-button-span").text(gosuselect);

                $(".review-click-button-inner-ul").hide();
            });
			
            $(".app-body-div10-info-icon-button-inner").click(function() {
                /* $(".heart-no-button").toggle(); */
                
            	 if (login_idx === 0) {
            	        console.log("users_idx가 0입니다. AJAX 요청이 실행되지 않습니다.");
            	        $(".heart-button").hide();
            	        alert("로그인이 필요합니다.");
            	        location.href = "Login.jsp";
            	        return; // users_idx가 0이면 AJAX 요청을 실행하지 않음
            	    }

            	    $(".heart-button").show();
            	    $.ajax({
            	        type: 'post',
            	        data: { login_idx: login_idx, users_idx: users_idx },
            	        dataType: "json",
            	        url: "GosuZimInsertServlet",
            	        success: function(res) {
            	            if (res.status === "success") {
            	                console.log("성공:", res);
            	                alert("찜 목록에 추가되었습니다.");
            	            } else {
            	                console.error("오류:", res.message);
            	            }
            	        },
            	        error: function(r, s, e) {
            	            alert("[에러] 코드:" + r.status + " , 메시지:" + r.responseText + " , 에러 :" + e);
            	        }
            	    });
            	});
        });
        
        $(document).ready(function() {
            var realValue = dto1.getReal(); 

            if (realValue == 1) {
                $('.app-body-div10-info-detail-bages').show(); 
            } else {
                $('.app-body-div10-info-detail-bages').hide(); 
            }
        });
        
        
        
        $('.review-main-img-li').each(function() {
            var imgSrc = $(this).find('img').attr('src');
            if (imgSrc !== 'null') {
                $(this).show();
            }else{
            	$(this).hide();
            }
        });
        
        $(".protfolio-li-item").click(function(){
        	$(".pp-app").show();
        	
        });
        	$(".pp-body-right-inner-button").click(function(){
        		$(".pp-app").hide();
        		
        	});
        	
        	$(".app-body-div10-info-icon-button-inner").click(function() {
                $(".heart-button").show();
            });
        	
        	$(window).scroll(function() {
        	    let here = $(this).scrollTop();

        	    // 섹션들의 위치(top) 계산
        	    let about = $("#about-action").position().top;
        	    let reservation = $("#reservation-move").position().top;
        	    let port = $(".protfolio").position().top;
        	    let photo = $(".photo-video").position().top;
        	    let review = $(".review").position().top;
        	    let qna = $(".gosu-qna").position().top;

        	    // 모든 네비게이션 아이템의 border-bottom 초기화
        	    $(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
        	   

        	    // 현재 스크롤 위치에 따라 border-bottom 추가
        	    if (about <= here) {
        	        $(".app-body-div10-sticky-nav-about-active").css("border-bottom", "2px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-reservation").css("border-bottom", "0px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "0px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","700");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","400");
        	    }
        	    if (reservation <= here) {
        	    	$(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-reservation").css("border-bottom", "2px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "0px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","700");
        	    }
        	    if (port <= here) {
        	    	$(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-reservation").css("border-bottom", "0px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "2px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "0px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","700");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","400");
        	    }
        	    if (photo <= here) {
        	    	$(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
        	    	$(".app-body-div10-sticky-nav-reservation").css("border-bottom", "0px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "2px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "0px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","700");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","400");
        	    }
        	    if (review <= here) {
        	    	$(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
        	    	$(".app-body-div10-sticky-nav-reservation").css("border-bottom", "0px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "2px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "0px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","700");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","400");
        	    }
        	    if (qna <= here) {
        	    	$(".app-body-div10-sticky-nav-about-active").css("border-bottom", "0px solid rgb(50,50,50)");
        	    	$(".app-body-div10-sticky-nav-reservation").css("border-bottom", "0px solid rgb(50,50,50)");
        	        $(".app-body-div10-sticky-nav-portfolio").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-photo-video").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-review").css("border-bottom", "0px solid rgb(50,50,50)");
            	    $(".app-body-div10-sticky-nav-qna").css("border-bottom", "2px solid rgb(50,50,50)");
            	    
            	    $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                    $(".app-body-div10-sticky-nav-font4").css("font-weight","700");
                    $(".app-body-div10-sticky-nav-font5").css("font-weight","400");
        	    }
        	});
        	
        	
        		
        		
        	
        	function removeChkFromAll() {
                $(".app-body-div10-sticky-nav-about-active").removeClass("chk");
                $(".app-body-div10-sticky-nav-portfolio").removeClass("chk");
                $(".app-body-div10-sticky-nav-photo-video").removeClass("chk");
                $(".app-body-div10-sticky-nav-review").removeClass("chk");
                $(".app-body-div10-sticky-nav-qna").removeClass("chk");
            }

            $(".app-body-div10-sticky-nav-about-active").click(function() {
                removeChkFromAll();
                $(this).addClass("active");
                $(".app-body-div10-sticky-nav-font").css("font-weight","700");
                $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                $(".app-body-div10-sticky-nav-portfolio").removeClass("active");
                $(".app-body-div10-sticky-nav-photo-video").removeClass("active");
                $(".app-body-div10-sticky-nav-review").removeClass("active");
                $(".app-body-div10-sticky-nav-qna").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").css("border-bottom","none");
            });

            $(".app-body-div10-sticky-nav-portfolio").click(function() {
                removeChkFromAll();
                $(this).addClass("active");
                $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font1").css("font-weight","700");
                $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                $(".app-body-div10-sticky-nav-about-active").removeClass("active");
                $(".app-body-div10-sticky-nav-photo-video").removeClass("active");
                $(".app-body-div10-sticky-nav-review").removeClass("active");
                $(".app-body-div10-sticky-nav-qna").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").css("border-bottom","none");
            });

            $(".app-body-div10-sticky-nav-photo-video").click(function() {
                removeChkFromAll();
                $(this).addClass("active");
                $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font2").css("font-weight","700");
                $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                $(".app-body-div10-sticky-nav-about-active").removeClass("active");
                $(".app-body-div10-sticky-nav-review").removeClass("active");
                $(".app-body-div10-sticky-nav-qna").removeClass("active");
                $(".app-body-div10-sticky-nav-portfolio").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").css("border-bottom","none");
            });

            $(".app-body-div10-sticky-nav-review").click(function() {
                removeChkFromAll();
                $(this).addClass("active");
                $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font3").css("font-weight","700");
                $(".app-body-div10-sticky-nav-font4").css("font-weight","400");
                $(".app-body-div10-sticky-nav-about-active").removeClass("active");
                $(".app-body-div10-sticky-nav-portfolio").removeClass("active");
                $(".app-body-div10-sticky-nav-photo-video").removeClass("active");
                $(".app-body-div10-sticky-nav-qna").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").css("border-bottom","none");
            });

            $(".app-body-div10-sticky-nav-qna").click(function() {
                removeChkFromAll();
                $(this).addClass("active");
                $(".app-body-div10-sticky-nav-font").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font1").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font2").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font3").css("font-weight","400");
                $(".app-body-div10-sticky-nav-font4").css("font-weight","700");
                $(".app-body-div10-sticky-nav-review").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").removeClass("active");
                $(".app-body-div10-sticky-nav-portfolio").removeClass("active");
                $(".app-body-div10-sticky-nav-photo-video").removeClass("active");
                $(".app-body-div10-sticky-nav-about-active").css("border-bottom","none");
            });
            
            /* $(".protfolio-li").click(function(){
            	let idx = $(this).attr("idx");
            	alert(idx);
            }); */
            
            $(".protfolio-li").click(function(){
            	let p_idx = $(this).attr("idx");
            	// AJAX 요청으로 idx 값 저장
            	$.ajax({
        			type : 'post',
        			url : 'GosuprofilePortServlet',
        			data : {p_idx : p_idx},
        			success : function(response){
        				//alert(response);
        				//$("#input_name").val(response.name);
        				 console.log(response); // JSON 응답을 콘솔에 출력
        		            //alert("포트폴리오 제목: " + response.p_title);
        				 	//<img class = "pp-body-inner8-img" src = "">
        		            // 여기서 필요한 경우 HTML 요소에 값을 설정할 수 있습니다.
        		            //$("#input_name").val(response.name);
        		            $(".pp-body-right-inner-title1-font").text(response.p_title);
         		            $(".pp-body-main-under-sub-font2").text(response.service_amount);
        		            $(".pp-body-main-under-sub-font4").text(response.work_year);
        		            $(".pp-body-inner8-img").attr("src", response.f_img);
        		            $(".pp-body-main-under-sub-font").text(response.s_title);
        		            //$(".pp-body-main-under-sub-font1").text(response.town_name);
        		            $(".pp-body-main-under-sub-font1").text(response.province_name);
        		            $(".pp-body-main-under-text-outter").text(response.contents);
        			},
        			error : function(r, s, e){
        				
        			} 
        		});
           	});

            $(document).ready(function() {
                // 각 .reservation-li 요소를 순회
                $('.reservation-li').each(function() {
                    // 현재 요소 내에서 .reservation-li-amount-font를 찾음
                    var amountElement = $(this).find('.reservation-li-amount-font');
                    var amountText = amountElement.text().trim();
                    
                    // 텍스트 내에서 숫자만 추출하고 포맷팅
                    var formattedAmount = amountText.replace(/\d+/g, function(match) {
                        return match.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                    });
                    
                    // 포맷팅된 텍스트로 대체
                    amountElement.text(formattedAmount);
                });
            });
            
            $(document).ready(function() {
                // 플래그 변수로 초기 설정
                var hideSection = true;

                // 각 .reservation-li 요소를 순회하여 idx 값 확인
                $('.reservation-li').each(function() {
                    var idxValue = $(this).attr('idx');
                    if (idxValue) {
                        hideSection = false;
                        return false; // idx 값이 존재하면 순회를 멈춤
                    }
                });

                // .reservation-li 요소의 idx 값이 null이거나 요소가 없을 때 .reservation-section 숨기기
                if (hideSection) {
                    $('.reservation-section').hide();
                }
            });
            
            $(".pp-body-main-inner-button").click(function(){
            	alert("준비중입니다.");
            });
            
            
            $(document).on("click", ".reservation-li", function(){			
                //$(".gosu-profile-outter1").click(function(){
                	 //let idx = $(this).find(".gosu-profile-outter1").attr("idx");
                	 let idx = $(this).attr("idx");
                	location.href = "soomgo_market_detail.jsp?market_idx=" + idx;
                	//alert(idx);
                });
        });
  </script>
</head>
<body>
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
                                        <span class = "header-nav-li-span"  style = "color : black;">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span"  style = "color : black;">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">커뮤니티</span>
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
                        <a href = "Gosu_join.jsp">
                        <button type = "button" class = "btn-signup">
                            <a href = "Gosu_join.jsp" class = "btn-a">고수가입</a>
                        </button>
                        </a>
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
                                        <span class = "header-nav-li-span"  style = "color : black;">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span"  style = "color : black;">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">커뮤니티</span>
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
                                    <span class = "right-section-nav-li-span1"></span>
                                </li>
                            </ul>
                        </nav>
                        <% for(Soomgo_headerDto shdto : Soomgoheader){ %>
                        <div class = "right-section-div1">
                            <button type = "button" class = "right-section-div1-button">
                                <span class = "right-section-div1-span">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path>
                                    </svg>
                                </span>
                            </button>
                        </div>
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
                                	<a = href= "soomgo_main.jsp">
                                    <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <% } %>
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
                            <a href = "soomgo_main.jsp">
                                <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
                            </a>
                        </div>
                        <nav class = "header-nav">
                            <ul class = "header-nav-ul">
                                <li class = "header-nav-li">
                                    <a href = "sgRequestMain.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">견적요청</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "Seach.profile.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">고수찾기</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgo_market.jsp?category_idx=1">
                                        <span class = "header-nav-li-span"  style = "color : black;">마켓</span>
                                    </a>
                                </li>

                                <li class = "header-nav-li1">
                                    <a href = "soomgoCommu.jsp">
                                        <span class = "header-nav-li-span"  style = "color : black;">커뮤니티</span>
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
                        <% for(Soomgo_header2Dto sh2dto : Soomgoheader2){ %>
                        <div class = "right3-section-div2-outter">
                            <div class = "right3-section-div2">
                                <div class = "right3-section-div2-1">
                                    <div class = "right3-section-div2-2">
                                    	<img src = "<%=sh2dto.getF_img()%>" width = "30px;" height = "30px;" >
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
                                            <span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review()%>회</span>
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
                                	<a = href= "soomgo_main.jsp">
                                    <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </section>
        </div>
    </header>


    <!--중단 전체 보더 박스-->
    <div id = "app" class ="center">
        <div class = "app-body">
            <div class = "app-body-div1">
                <div class = "app-body-div1-1"></div>
            </div>

            <div class = "app-body-div2">
                <div class = "app-body-div3">
                    <div class = "app-body-div4">
                        <div class = "app-body-div5">
                            <div class = "app-body-div6">
                                <div class = "app-body-div7">
                                    <div class = "app-body-div8">
                              <% for(Gosu_profile_header_inforDto hidto: GosuProfileHeader) {%>
                                        <div class = "app-body-div9">
                                        <img src = "<%=hidto.getF_img()%>" width = "180px" hight = "180px" style = "margin-left : ">
                                        </div>
                                    </div>
                                </div>
                                <div class = "app-body-div10-info">
                                    <div class = "app-body-div10-info-header">
                                        <h1 class = "app-body-div10-info-name"><%=hidto.getName()%></h1>
                                        
                                        <div class = "app-body-div10-info-icon-button">
                                            <button class = "app-body-div10-info-icon-button1"></button>

                                            <div class = "app-body-div10-info-icon-button-inner">
                                                <span class = "app-body-div10-info-icon-button-inner1">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path class = "heart-no-button" fill-rule="evenodd" clip-rule="evenodd" d="M9.52438 5.21522C8.7232 4.78429 7.79974 4.64735 6.91069 4.82696C6.02155 5.00658 5.21995 5.49212 4.6431 6.20287C4.06612 6.91378 3.75 7.80581 3.75 8.72728C3.75 11.4761 5.77662 14.1015 8.0045 16.1269C9.09642 17.1195 10.1917 17.9275 11.0155 18.4878C11.4233 18.7651 11.7627 18.9806 12 19.1265C12.2373 18.9806 12.5767 18.7651 12.9845 18.4878C13.8083 17.9275 14.9036 17.1195 15.9955 16.1269C18.2234 14.1015 20.25 11.4761 20.25 8.72728C20.25 7.80581 19.9339 6.91378 19.3569 6.20287C18.7801 5.49212 17.9784 5.00658 17.0893 4.82696C16.2003 4.64735 15.2768 4.78429 14.4756 5.21522C13.6743 5.64624 13.0438 6.34535 12.6933 7.1951C12.5775 7.47589 12.3037 7.6591 12 7.6591C11.6963 7.6591 11.4225 7.47589 11.3067 7.1951C10.9562 6.34535 10.3257 5.64624 9.52438 5.21522ZM12 20C11.6307 20.6528 11.6305 20.6527 11.6303 20.6526L11.6278 20.6511L11.6215 20.6476L11.5995 20.6349C11.5806 20.624 11.5534 20.6082 11.5185 20.5877C11.4487 20.5466 11.3479 20.4864 11.2205 20.4081C10.9659 20.2516 10.6045 20.0223 10.172 19.7281C9.30829 19.1407 8.15358 18.2896 6.9955 17.2368C4.72338 15.1712 2.25 12.1603 2.25 8.72728C2.25 7.46309 2.68357 6.23697 3.47842 5.25761C4.2734 4.2781 5.38101 3.60568 6.61366 3.35666C7.8464 3.10762 9.12621 3.29784 10.2349 3.89419C10.9297 4.2679 11.53 4.78639 12 5.40887C12.47 4.78639 13.0703 4.2679 13.7651 3.89419C14.8738 3.29784 16.1536 3.10762 17.3863 3.35666C18.619 3.60568 19.7266 4.2781 20.5216 5.25761C21.3164 6.23697 21.75 7.46309 21.75 8.72728C21.75 12.1603 19.2766 15.1712 17.0045 17.2368C15.8464 18.2896 14.6917 19.1407 13.828 19.7281C13.3955 20.0223 13.0341 20.2516 12.7795 20.4081C12.6521 20.4864 12.5513 20.5466 12.4815 20.5877C12.4466 20.6082 12.4194 20.624 12.4005 20.6349L12.3785 20.6476L12.3722 20.6511L12.3703 20.6522C12.3701 20.6523 12.3693 20.6528 12 20ZM12 20L12.3693 20.6528C12.1401 20.7824 11.8594 20.7822 11.6303 20.6526L12 20Z" fill="black"></path>
                                                        <path class = "heart-button" d="M11.6303 21.0437L12 20.3911C12.3693 21.0439 12.3701 21.0434 12.3703 21.0433L12.3722 21.0422L12.3785 21.0387L12.4005 21.026C12.4194 21.0151 12.4466 20.9993 12.4815 20.9788C12.5513 20.9377 12.6521 20.8775 12.7795 20.7992C13.0341 20.6427 13.3955 20.4134 13.828 20.1192C14.6917 19.5318 15.8464 18.6807 17.0045 17.6279C19.2766 15.5623 21.75 12.5514 21.75 9.11839C21.75 7.85421 21.3164 6.62808 20.5216 5.64873C19.7266 4.66921 18.619 3.99679 17.3863 3.74777C16.1536 3.49874 14.8738 3.68895 13.7651 4.28531C13.0703 4.65901 12.47 5.1775 12 5.79999C11.53 5.1775 10.9297 4.65901 10.2349 4.28531C9.12621 3.68895 7.8464 3.49874 6.61366 3.74777C5.38101 3.99679 4.2734 4.66921 3.47842 5.64873C2.68357 6.62808 2.25 7.85421 2.25 9.11839C2.25 12.5514 4.72338 15.5623 6.9955 17.6279C8.15358 18.6807 9.30829 19.5318 10.172 20.1192C10.6045 20.4134 10.9659 20.6427 11.2205 20.7992C11.3479 20.8775 11.4487 20.9377 11.5185 20.9788C11.5534 20.9993 11.5806 21.0151 11.5995 21.026L11.6215 21.0387L11.6278 21.0422L11.6303 21.0437Z" fill="black"></path>
                                                    </svg>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                     <div class = "app-body-div10-info-sub-header">
                                        <div class = "app-body-div10-info-category"><%=hidto.getTitle()%></div>
                                        <%
										    int distance = hidto.getDistance();
										    
										    if (distance == 0) {
										        distance = 2;
										    }
										    
										    if (distance == 1) {
										        distance = 5;
										    }
										    if (distance == 2) {
										        distance = 15;
										    }
										    if (distance == 3) {
										        distance = 15;
										    }
										%>
										<div class="app-body-div10-info-address">
										    <%=hidto.getProvince_name() %> <%=hidto.getTown_name() %> / <%= distance %>km 이동가능 
										</div>
                                    </div>
                                    <div class = "app-body-div10-info-intro"><%=hidto.getIntro()%></div>
                                    <div class = "app-body-div10-info-detail">
                                        <div class = "app-body-div10-info-detail-bages">
                                            <span class="app-body-div10-info-detail-badge-item" 
          										style="<%= hidto.getReal() == 0 ? "display: none;" : "display: inline;" %>" real = "<%= hidto.getReal() %>">
        										<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik00IDcuNjI1IDYuODggMTEgMTIgNSIgc3Ryb2tlPSIjMkRDMjYxIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9Im5vbmUiIGZpbGwtdnVscj0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=">
        										본인인증 
    										</span>
                                        </div>
                                        
                                        <div class = "app-body-div10-info-statistics">
                                            <div class = "app-body-div10-info-statistics-item">
                                                <div class = "app-body-div10-info-statistics-item-header">고용</div>
                                                <% for(Gosu_profile_transaction_countDto tcdto : GosuProfileTransactionCount){ %>
                                                <div class = "app-body-div10-info-statistics-item-contents"><%=tcdto.getG_users_idx() %>회</div>
                                                <% } %>
                                            </div>
											<% for(Gosu_profile_countDto cdto : GosuProfileCount){ %>
                                            <div class = "app-body-div10-info-statistics-item-review">
                                                <div class = "app-body-div10-info-statistics-item-review-rate">리뷰</div>
                                                <div class = "app-body-div10-info-item">
                                                        <img class = "app-body-div10-info-item-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
                                                        <span class = "app-body-div10-info-item-rate"><%=cdto.getScore()%>.0</span>
                                                        <span class = "app-body-div10-info-item-count">(<%=cdto.getReview_idx()%>)</span>
                                                </div>
                                            </div>
                                            <% } %>
                                            <div class = "app-body-div10-info-item1">
                                            <% for (Gosu_profile_career_yearDto cydto : GosuProfileCareerYear) {%>
                                                <div class = "app-body-div10-info-item1-header">총 경력</div>
                                                <div class = "app-body-div10-info-item1-contents"><%=cydto.getCareer()%>년</div>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                            <div class = "app-body-div10-background-block"></div>
                            <ul class = "app-body-div10-sticky-nav">
                                <a href = "#about-action">
                                    <li class = "app-body-div10-sticky-nav-about-active">
                                        <span class = "app-body-div10-sticky-nav-font">고수 정보</span>
                                    </li>
                                </a>
								
								<a href = "#reservation-move">
                                    <li class = "app-body-div10-sticky-nav-reservation">
                                        <span class = "app-body-div10-sticky-nav-font5">예약</span>
                                    </li>
                                </a>
								
                                <a href = "#protfolio-move">
                                    <li class = "app-body-div10-sticky-nav-portfolio">
                                        <span class = "app-body-div10-sticky-nav-font1">포트폴리오</span>
                                    </li>
                                </a>

                                <a href = "#photo-video-move">
                                    <li class = "app-body-div10-sticky-nav-photo-video">
                                        <span class = "app-body-div10-sticky-nav-font2">사진/동영상</span>
                                    </li>
                                </a>
	
                                <a href = "#review-move">
                                    <li class = "app-body-div10-sticky-nav-review">
                                    <% for(Gosu_profile_countDto cdto : GosuProfileCount) {%>
                                        <span class = "app-body-div10-sticky-nav-font3">리뷰 <%=cdto.getReview_idx()%></span>
                                        <% } %>
                                    </li>
                                </a>

                                <a href = "#gosu-qna-move">
                                    <li class = "app-body-div10-sticky-nav-qna">
                                        <span class = "app-body-div10-sticky-nav-font4">질문답변</span>
                                    </li>
                                </a>
                            </ul>

                            <div class = "app-body-div11">
                                <section class = "app-body-div12">

                                <a id = "about-action">
                                    <div class = "app-body-div13-profile-info">
                                            <div class = "app-body-div13-profile-info-title">
                                                <h2 class = "app-body-div13-profile-info-title-font">고수 정보</h2>
                                            </div>
                                            
                                            <ul class = "app-body-div13-profile-info-ul"> 
                                            <% for (Gosu_profile_member_inforDto mdto : GosuProfileMember) {%>
                                                <li class = "app-body-div13-profile-info-li1">
                                                   직원<%=mdto.getMember()%> 명
                                                </li>

                                                <li class = "app-body-div13-profile-info-li2">
                                                    연락 가능 시간 : 오전 <%=mdto.getStart_contact()%>시 - 오전 <%=mdto.getEnd_contact()%>시
                                                </li>
                                                
                                                <li class = "app-body-div13-profile-info-li3">
                                                    숨고페이, 계좌이체, 현금결제 가능
                                                </li>
                                                <% } %>
                                            </ul>
                                        </div>
                                    </a>
                                        
                                    <div class = "app-body-div14">
                                        <h2 class = "app-body-div14-font">서비스 상세설명</h2>
                                    </div>
                                    <% for(Gosu_profile_explainDto edto : GosuProfileExplain) { %>
                                    <div class = "app-body-div14-text"><%=edto.getExplain() %>
                                    <% } %>
                                    <div class = "app-body-div14-show"></div>
                                    </div>
                                    <div class = "app-body-div14-more-button-outter">
                                        <button type = "button" class ="app-body-div14-more-button">
                                            상세설명 더보기
                                            <span class ="app-body-div14-more-button-span">
                                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="#00c7ae"></path>
                                                    </svg>
                                            </span>
                                        </button>
                                    </div>
                                    
                                    <div class = "app-body-div14-more-button-outter1">
                                        <button type = "button" class ="app-body-div14-more-button1">
                                            상세설명 접기
                                            <span class ="app-body-div14-more-button-span1">
                                                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="#00c7ae"></path>
                                                    </svg>
                                            </span>
                                        </button>
                                    </div>
                                    

                                    <div class = "app-body-div15">
                                        <h2 class = "app-body-div15-header-font">제공 서비스</h2>
                                        
                                        <div class = "app-body-div15-category">
                                            <ul class = "app-body-div15-category-ul">
                                           <% for(Gosu_profile_service_plus_titleDto spdto : GosuProfileServicePlus) {%>
                                                <li class = "app-body-div15-category-li1">
                                                <%=spdto.getTitle()	%>
                                                </li>
                                                <% } %>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class = "app-body-div16">
                                        <h2 class = "app-body-div16-header-font">경력</h2>
                                        <div class = "app-body-div16-header">
                                            <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xMi42OCAzYzIuMTMzIDAgMy44OTggMS41NSAzLjg5OCAzLjUxMmwtLjAwMS40OTloNC4yODNjLjMyMSAwIC41ODcuMjQyLjYzMy41NTZsLjAwNy4wOTZ2MTEuNjg1YzAgLjM2LS4yODYuNjUyLS42NC42NTJIMy4xNGEuNjQ2LjY0NiAwIDAgMS0uNjQtLjY1MlY3LjY2M2MwLS4zNi4yODYtLjY1MS42NC0uNjUxbDQuMjgyLS4wMDF2LS40OTljMC0xLjkgMS42NTMtMy40MTIgMy42OTMtMy41MDdMMTEuMzIgM3pNNy45MTQgMTQuODM0SDMuNzc5djMuODYySDIwLjIydi0zLjg2MmgtNC4xMzV2Ljg1M2MwIC4zNi0uMjg2LjY1MS0uNjQuNjUxYS42NDQuNjQ0IDAgMCAxLS42MzItLjU1NWwtLjAwNy0uMDk2LS4wMDEtLjg1M0g5LjE5NHYuODUzYzAgLjM2LS4yODYuNjUxLS42NC42NTFhLjY0NC42NDQgMCAwIDEtLjYzMy0uNTU1bC0uMDA2LS4wOTYtLjAwMS0uODUzek0yMC4yMiA4LjMxNUgzLjc4bC0uMDAxIDUuMjE1aDQuMTM1di0uODUyYzAtLjM2LjI4Ny0uNjUyLjY0LS42NTIuMzIyIDAgLjU4OC4yNDEuNjMzLjU1NmwuMDA3LjA5NnYuODUyaDUuNjExdi0uODUyYzAtLjM2LjI4Ny0uNjUyLjY0LS42NTIuMzIyIDAgLjU4OC4yNDEuNjM0LjU1NmwuMDA2LjA5NnYuODUyaDQuMTM1VjguMzE1em0tNy41NC00LjAxMWgtMS4zNmMtMS40NjUgMC0yLjYxOCAxLjAxMi0yLjYxOCAyLjIwOHYuNWg2LjU5NnYtLjVjMC0xLjE0OC0xLjA2My0yLjEyNy0yLjQ0NC0yLjIwM2wtLjE3NC0uMDA1eiIgZmlsbD0iIzAwQzdBRSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
                                            <% for (Gosu_profile_career_yearDto cydto : GosuProfileCareerYear) {%>
                                            <h3 class = "app-body-div16-sub-header-font">총 경력<%=cydto.getCareer()%> 년</h3>
                                            <% } %>
                                        </div>
                                        <% for(Gosu_profile_careerDto cdto : GosuProfileCareer){ %>
                                        <div class = "app-body-div16-career-item">
                                            <div class = "app-body-div16-career-item1">
                                                <div class = "app-body-div16-career-item2">
                                                    <h3 class = "app-body-div16-career-font1"><%=cdto.getTitle()%></h3>
                                                    <div class = "app-body-div16-career-font2" start-date = "<%=cdto.getSt_career()%>"><%=cdto.getSt_career()%> - 현재 · 2년</div>
                                                    <div class = "app-body-div16-career-font3"><%=cdto.getIntro()%></div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>
                                </section>
								
							<a id = "reservation-move">
								<section class = "reservation-section">
                                    <div class = "reservation-section-outter">
                                        <h2 class = "reservation-head-font">예약 가능 서비스</h2>
                                        
                                        <ul class = "reservation-ul">
											<% for(Gosu_profile_ReservationDto prdto : GosuProfileReservation ) {%>
                                            <li class = "reservation-li" idx = "<%=prdto.getMarket_idx() %>">
                                                <div class = "reservation-li-div1">
                                                    <a class = "reservation-li-div1-tag-a" title = "로고제작 합니다~">
                                                        <div class = "reservation-li-div1-tag-a-img">
                                                            <img class = "reservation-li-div1-tag-a-img-inner" src = "<%=prdto.getImg_url() %>">
                                                        </div>
                                                        <div class = "reservation-li-div2">
                                                            <div class = "reservation-li-div2-1">
                                                                <div class = "reservation-li-div2-2">
                                                                    <h3 class = "reservation-li-div2-inner-font"><%=prdto.getName() %></h3>
                                                                </div>
                                                            </div>        
                                                        </div>
                                                        <h4 class = "reservation-li-amount-font"><%=prdto.getPrice() %>~</h4>
                                                    </a>
                                                </div>
                                                <a class = "reservation-li-div1-tag-a1">
                                                    <button class = "reservation-li-button" type = "button" style = "border-color: #00c7ae;">
                                                        <span class = "reservation-li-button-span">
                                                            <svg width="15" height="15" style = "margin-right: 5px;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M7.75 3C8.16421 3 8.5 3.33579 8.5 3.75V5H16V3.75C16 3.33579 16.3358 3 16.75 3C17.1642 3 17.5 3.33579 17.5 3.75V5H19C20.1046 5 21 5.89543 21 7V19C21 20.1046 20.1046 21 19 21H5C3.89543 21 3 20.1046 3 19V7C3 5.89543 3.89543 5 5 5H7V3.75C7 3.33579 7.33579 3 7.75 3ZM16 6.5V7.25C16 7.66421 16.3358 8 16.75 8C17.1642 8 17.5 7.66421 17.5 7.25V6.5H19C19.2761 6.5 19.5 6.72386 19.5 7V10.5H4.5V7C4.5 6.72386 4.72386 6.5 5 6.5H7V7.25C7 7.66421 7.33579 8 7.75 8C8.16421 8 8.5 7.66421 8.5 7.25V6.5H16ZM4.5 12V19C4.5 19.2761 4.72386 19.5 5 19.5H19C19.2761 19.5 19.5 19.2761 19.5 19V12H4.5Z" fill="#00c7ae"></path>
                                                            </svg>
                                                            예약
                                                        </span>
                                                        
                                                    </button>
                                                </a>
                                            </li>
                                        	<% } %>
                                        </ul>
                                    </div>
                                </section>
                             </a> 
                                
								
                                <section class = "reservation"></section>
                                <a id = "protfolio-move">
                                <section class = "protfolio">
                                    <div class = "protfolio-div1">
                                        <h2 class = "protfolio-header-font">포트폴리오</h2>
                                        <ul class = "protfolio-ul">
                                          <% for(Gosu_profile_portfolio_outterDto podto : GosuProfilePortfolioOutter) {%>
                                            <li class ="protfolio-li" idx = "<%=podto.getPortfolio_idx()%>">
                                                <a title = "반려견 모임 세미나" class = "protfolio-li-item">
                                                <div class = "protfolio-li-item-image">
                                                    <img class = "protfolio-li-img"src = "<%=podto.getImg()%>">
                                                </div>
                                                    <div class = "protfolio-li-font-outter">
                                                        <h3 class = "protfolio-li-font1"><%=podto.getP_title() %></h3>
                                                        <p class = "protfolio-li-font2"><%=podto.getS_title() %></p>
                                                    </div>
                                                </a>
                                            </li>
                                         <% } %>

                                        </ul>
                                    </div>
                                </section>
                                </a>
                                

                                <a id = "photo-video-move">
                                <section class = "photo-video">
                                    <div class = "photo-video-div1">
                                        <h2 class = "photo-video-header-font">사진 및 동영상</h2>
                                        <div class = "photo-video-div2">
                                            <ul class = "photo-video-ul">
                                            <% for (Gosu_profile_photo_videoDto pvdto : GosuProfilePhotoVideo){ %>
                                                <li class = "photo-video-li">
                                                    <div class = "photo-video-li-div1" style = "background-image: url(<%=pvdto.getPhoto()%>);"></div>
                                                </li>
											<% } %>
                                            </ul>
                                            <div class = "photo-video-more-button-outter">
                                                <button type = "button" class = "photo-video-more-button">
                                                    사진 및 동영상 더보기
                                                    <span class = "photo-video-more-button-span">
                                                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="#00c7ae"></path>
                                                            </svg>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                </a>

                                <a id = "review-move">
                                <section class = "review">
                                    <div class = "review-div1">
                                        <h2 class = "review-header-font">리뷰</h2>
                                        <div class = "review-div2">
                                            <div class = "review-div3">
                                                <div class = "review-div4">
                                                	<%-- <% for(Gosu_profile_countDto dto6 : GosuProfileCount){ %>
                                                    <div class = "review-score"><%=dto6.getScore()%>.0</div>
                                                    <%} %> --%>
                                                    <% if (GosuProfileCount != null && !GosuProfileCount.isEmpty()) { %>
													    <% for (Gosu_profile_countDto dto6 : GosuProfileCount) { %>
													        <div class="review-score"><%= dto6.getScore() %>.0</div>
													    <% } %>
													<% } else { %>
													    <div class="review-score"></div>
													<% } %>
                                                    <div class = "review-div5">
                                                    
                                                    
                                                    
                                                        <ul class = "review-div5-ul">
                                                        
                                                        	<% 
                                                        	for(Gosu_profile_countDto dto6 : GosuProfileCount){ 
                                                        		for (int i=0;i< dto6.getScore(); i++ ){
                                                        	%>
                                                            <li class = "review-div5-li">
                                                                <img class = "review-div5-li-img"src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg">
                                                            </li>
                                                            <%		} 
                                                        		}
                                                        	%>
                                                           
                                                        </ul>
                                                        <% for(Gosu_profile_countDto dto6 : GosuProfileCount){ %>
                                                        <div class = "review-count"><%=dto6.getReview_idx()%>개 리뷰</div>
                                                        <% } %>
                                                    </div>
                                                </div>
                                                <div class = "hr"></div>
                                            </div>
                                            <div class = "review-service-select-outter">
                                                <div class = "review-service-select-inner">
                                                    <ul class = "review-service-select-ul">
                                                        <li class = "review-service-select-li-total">전체</li>
                                                        <li class = "review-service-select-li1">반려동물 훈련</li>
                                                        <li class = "review-service-select-li2">반려견 산책</li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <ul class = "review-click-button-ul">
                                               <!-- <li class = "review-click-button-li">
                                                    <img class = "review-click-button1" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQxOSAtNDU4KSB0cmFuc2xhdGUoMzc1IDI0NykgdHJhbnNsYXRlKDI4IDE5NSkiPgogICAgICAgICAgICA8cmVjdCB3aWR0aD0iMzYzIiBoZWlnaHQ9Ijc2IiB4PSIuNSIgeT0iLjUiIHN0cm9rZT0iI0UxRTFFMSIgcng9IjQiLz4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNiAxNikgdHJhbnNsYXRlKDEgMSkiPgogICAgICAgICAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgZmlsbD0iI0UxRTFFMSIgcng9IjkiLz4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIyIiBkPSJNNSA4LjY4OEw3Ljg4IDExLjUgMTMgNi41Ii8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
                                                    <img class = "review-click-button2" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQxOSAtNTQ1KSB0cmFuc2xhdGUoMzc1IDI0NykgdHJhbnNsYXRlKDI4IDI4MikiPgogICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNiAxNikgdHJhbnNsYXRlKDEgMSkiPgogICAgICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjE4IiBoZWlnaHQ9IjE4IiBmaWxsPSIjMDBDN0FFIiByeD0iOSIvPgogICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjRkZGIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTUgOC42ODhMNy44OCAxMS41IDEzIDYuNSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
                                                    <span class = "review-click-button-li-font">사진 리뷰</span>
                                                </li>

                                                <li class = "review-click-button-li">
                                                    <img class = "review-click-button3" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQxOSAtNDU4KSB0cmFuc2xhdGUoMzc1IDI0NykgdHJhbnNsYXRlKDI4IDE5NSkiPgogICAgICAgICAgICA8cmVjdCB3aWR0aD0iMzYzIiBoZWlnaHQ9Ijc2IiB4PSIuNSIgeT0iLjUiIHN0cm9rZT0iI0UxRTFFMSIgcng9IjQiLz4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNiAxNikgdHJhbnNsYXRlKDEgMSkiPgogICAgICAgICAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgZmlsbD0iI0UxRTFFMSIgcng9IjkiLz4KICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIyIiBkPSJNNSA4LjY4OEw3Ljg4IDExLjUgMTMgNi41Ii8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=">
                                                    <img class = "review-click-button4" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTQxOSAtNTQ1KSB0cmFuc2xhdGUoMzc1IDI0NykgdHJhbnNsYXRlKDI4IDI4MikiPgogICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxNiAxNikgdHJhbnNsYXRlKDEgMSkiPgogICAgICAgICAgICAgICAgPHJlY3Qgd2lkdGg9IjE4IiBoZWlnaHQ9IjE4IiBmaWxsPSIjMDBDN0FFIiByeD0iOSIvPgogICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjRkZGIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMiIgZD0iTTUgOC42ODhMNy44OCAxMS41IDEzIDYuNSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
                                                    <span class = "review-click-button-li-font">거래인증 리뷰</span>
                                                </li> -->

                                                <div class = "review-click-button-div1">
                                                    <div class = "review-click-button-div2">
                                                        <button type = "button" class = "review-click-button">
                                                            <span class = "review-click-button-span">
                                                                
                                                            </span>
                                                        </button>
                                                        <ul class = "review-click-button-inner-ul">
                                                            <li class = "review-click-button-inner-li">
                                                                최신순
                                                            </li>

                                                            <li class = "review-click-button-inner-li">
                                                                별점 높은순
                                                            </li>

                                                            <li class = "review-click-button-inner-li">
                                                                별점 낮은순
                                                            </li>
                                                        </ul>
                                                        
                                                    </div>
                                                </div>
                                            </ul>
                                            <div class = "review-main">
                                                <ul class = "review-main-ul">
                                                	<% for(Gosu_profile_reviewDto rdto : GosuProfileReview) {%>
                                                    <li class = "review-main-li">
                                                        <article class = "review-main-article">
                                                            <section class = "review-main-header-name">
                                                                <span class = "review-main-name"><%=rdto.getName()%></span>
                                                                <div class = "review-main-badge"></div>
                                                            </section>
                                                            <section class = "review-main-img-outter">
                                                                <div class = "review-main-img-inner">
                                                                    <ul class = "review-main-img-ul">
                                                                        <% if (rdto.getG_users_idx() > 0) { %>
																		    <% 
																		        boolean img1Visible = (rdto.getImg1_url() != null && !rdto.getImg1_url().isEmpty());
																		        boolean img2Visible = (rdto.getImg2_url() != null && !rdto.getImg2_url().isEmpty());
																		        boolean img3Visible = (rdto.getImg3_url() != null && !rdto.getImg3_url().isEmpty());
																		    %>
																		    
																		    <% if (img1Visible) { %>
																		        <li class="review-main-img-li">
																		            <img class="review-main-img-style" src="<%= rdto.getImg1_url() %>">
																		        </li>
																		    <% } %>
																		    
																		    <% if (img2Visible) { %>
																		        <li class="review-main-img-li">
																		            <img class="review-main-img-style" src="<%= rdto.getImg2_url() %>">
																		        </li>
																		    <% } %>
																		    
																		    <% if (img3Visible) { %>
																		        <li class="review-main-img-li">
																		            <img class="review-main-img-style" src="<%= rdto.getImg3_url() %>">
																		        </li>
																		    <% } %>
																		<% } %>
                                                                    </ul>
                                                                </div>
                                                            </section>
                                                            <section class = "review-main-service-score">
                                                                <p class = "review-main-service-font"><%=rdto.getTitle()%></p>
                                                                <img class = "review-main-service-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03LjQ5NiAxLjU5NiAxLjQwNyAyLjc0MiAzLjE0NS40NGMuOTEuMTI3IDEuMjc1IDEuMjA0LjYxNSAxLjgyMmwtMi4yNzYgMi4xMzQuNTM4IDMuMDE1Yy4xNTUuODcyLS43OTcgMS41MzgtMS42MTIgMS4xMjZMNi41IDExLjQ1MmwtMi44MTMgMS40MjNjLS44MTUuNDEyLTEuNzY3LS4yNTQtMS42MTItMS4xMjZsLjUzOC0zLjAxNUwuMzM3IDYuNmMtLjY2LS42MTgtLjI5Ni0xLjY5NS42MTUtMS44MjJsMy4xNDUtLjQ0IDEuNDA3LTIuNzQyQzUuOTEyLjggNy4wODguOCA3LjQ5NiAxLjU5NiIgZmlsbD0iI0ZGQ0UyMSIgZmlsbC1ydWxlPSJldmVub2RkIi8+Cjwvc3ZnPgo=">
                                                                <%=rdto.getScore()%>.0
                                                            </section>

                                                            <div class = "review-main-text-outter">
                                                                <div class = "review-main-text-inner">
                                                                    <p class = "review-main-text-font"><%=rdto.getContents()%></p>
                                                                </div>
                                                                <button type = "button" class = "review-main-text-more-button">더보기</button>
                                                            </div>
                                                           
                                                            <section class = "review-main-date">
                                                                <div class = "review-main-date-div">
                                                                    <span class = "review-main-date-font"><%=rdto.getR_date()%></span>
                                                                </div>
                                                            </section>
                                                        </article>
                                                    </li>
                                                    <%} %>
                                                </ul>
                                                <div class = "review-main-more-button-outter">
                                                    <button type = "button" class = "review-main-more-button">
                                                        리뷰 더보기
                                                        <span class = "review-main-more-button-font">
                                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="#00c7ae"></path>
                                                                </svg>
                                                        </span>
                                                    </button>
                                                </div>
                                                
                                                <div class = "review-main-more-button-outter1">
                                                    <button type = "button" class = "review-main-more-button1">
                                                        리뷰 더보기 접기
                                                        <span class = "review-main-more-button-font1">
                                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M12.0797 17.8489C12.2948 17.848 12.4992 17.7547 12.6409 17.5928L21.5644 7.39483C21.8372 7.08311 21.8056 6.60928 21.4939 6.33652C21.1822 6.06375 20.7084 6.09533 20.4356 6.40705L12.0717 15.9654L3.56025 6.40231C3.28486 6.0929 2.81079 6.06532 2.50138 6.3407C2.19197 6.61609 2.16438 7.09016 2.43977 7.39957L11.5163 17.5975C11.6593 17.7582 11.8645 17.8498 12.0797 17.8489Z" fill="#00c7ae"></path>
                                                                </svg>
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                                </a>

                                <a id = "gosu-qna-move">
                                <section class = "gosu-qna">
                                    <% for (Gosu_profile_qna_answerDto qadto : GosuProfileQnaAnswer) { %>
                                    <div class = "gosu-qna-div1">
                                        <h2 class = "gosu-qna-header-font">질문답변</h2>
                                        <u1 class = "gosu-qna-ul">
                                            <li class = "gosu-qna-li">
                                                <div class = "gosu-qna-li-q">Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?</div>
                                                <div class = "gosu-qna-li-div2">
                                                    <div class = "gosu-qna-li-div3">
                                                        <div class = "gosu-qna-li-div4">
                                                            <p class = "gosu-qna-a"><%=qadto.getAnswer1()%></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class = "gosu-qna-li">
                                                <div class = "gosu-qna-li-q">Q. 어떤 서비스를 전문적으로 제공하나요?</div>
                                                <div class = "gosu-qna-li-div2">
                                                    <div class = "gosu-qna-li-div3">
                                                        <div class = "gosu-qna-li-div4">
                                                            <p class = "gosu-qna-a"><%=qadto.getAnswer2() %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class = "gosu-qna-li">
                                                <div class = "gosu-qna-li-q">Q. 서비스의 견적은 어떤 방식으로 산정 되나요?</div>
                                                <div class = "gosu-qna-li-div2">
                                                    <div class = "gosu-qna-li-div3">
                                                        <div class = "gosu-qna-li-div4">
                                                            <p class = "gosu-qna-a"><%=qadto.getAnswer3() %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class = "gosu-qna-li">
                                                <div class = "gosu-qna-li-q">Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?</div>
                                                <div class = "gosu-qna-li-div2">
                                                    <div class = "gosu-qna-li-div3">
                                                        <div class = "gosu-qna-li-div4">
                                                            <p class = "gosu-qna-a"><%=qadto.getAnswer4() %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class = "gosu-qna-li">
                                                <div class = "gosu-qna-li-q">Q. A/S 또는 환불 규정은 어떻게 되나요?</div>
                                                <div class = "gosu-qna-li-div2">
                                                    <div class = "gosu-qna-li-div3">
                                                        <div class = "gosu-qna-li-div4">
                                                            <p class = "gosu-qna-a"><%=qadto.getAnswer5() %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </u1>
                                    </div>
                                    <% } %>
                                </section>
                                </a>
                                <section class = "space"></section>
                            </div>
                        </div>
                    </div>
                    <div class = "right-aside-outter">
                        <aside class= "right-aside-inner">
                            <div class = "right-aside-div1">
                            <% for(Gosu_profile_header_inforDto hidto: GosuProfileHeader) {%>
                                <p class = "right-aside-font1"><%=hidto.getName()%> 고수에게 원하는 서비스의 견적을 받아보세요</p>
                            <%} %>
                            </div>
							<a href = "sgRequestMain.jsp">
	                            <div class = "right-aside-button-outter">
	                                <button type = "button" class = "right-aside-button">견적 요청</button>
	                            </div>
                            </a>
                            <div class = "response-time">
                                평균
                                <span class = "response-time-font">2시간 내</span>
                                응답하는 고수입니다
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--하단 고정 내용들-->
    <div id = "under-box" class = "center">
        <div id = "under-1" class = "center">
            <div id = "under-1-1" class = "center">
                <div id = "phone-number" class = "center">
                    <p class ="p-number">1599-5319</p>
                </div>
            
                <div id = "operating-time" class = "center">
                    <p class= "operating-time-p">평일 10:00 - 18:00</p>
                    <p class= "operating-time-p">(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</p>
                </div>
                
                <div id = "store-box" class = "center">
                    <div id ="app-store" class ="center">
                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
                            <div id = "app-img" class = "center">
                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" width = "26px" height = "20px" class = "app-img">
                            </div>

                            <div id = "app-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
                                APP STORE
                            </div>
                        </a>
                    </div>

                    <div id ="play-store" class ="center">
                        <a href = "https://soomgo.com/app-download/sender?c=%EB%A9%94%EC%9D%B8&pid=google&af_sub4=footer&af_channel=cpc&af_keywords=%EC%88%A8%EA%B3%A0&af_sub2=%EB%A9%94%EC%9D%B8" >
                            <div id = "play-store-img" class = "center">
                                <img src = "https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" width = "26px" height = "20px" class = "play-store-img">
                            </div>

                            <div id = "play-store-text" class = "center" style = "font-size: 0.75rem; color :#fff; letter-spacing: normal;">
                                PLAY STORE
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div id = "under-1-2" class = "center">
                <div id = "Introduction-to-hiding" class =  "center">
                    <ul>
                        <li class = "under-title">숨고소개</li>
                        <li><a href = "https://soomgo.com/about" class = "under-title-link">회사소개</a></li>
                        <li><a href ="https://www.soomgo.team/career" class = "under-title-link">채용안내</a></li>
                        <li><a href = "https://blog.soomgo.com/"  class = "under-title-link">팀블로그</a></li>
                    </ul>
                </div>

                <div id = "Customer-information" class = "center">
                    <ul>
                        <li class = "under-title">고객안내</li>
                        <li><a href ="https://soomgo.com/how-it-works"  class = "under-title-link">이용안내</a></li>
                        <li><a href ="https://soomgo.com/safety"  class = "under-title-link">안전정책</a></li>
                        <li><a href ="https://soomgo.com/prices"  class = "under-title-link">예상금액</a></li>
                        <li><a href ="https://soomgo.com/search/pro/review_count"  class = "under-title-link">고수찾기</a></li>
                        <li><a href ="https://help.soomgo.com/hc/ko/articles/360056329911--24-04-22-%EC%A0%81%EC%9A%A9-%EC%88%A8%EA%B3%A0%EB%B3%B4%EC%A6%9D-%EC%9D%B4%EC%9A%A9%EC%95%BD%EA%B4%80" class = "under-title-link">숨고보증</a></li>
                        <li><a href ="https://soomgo.com/questions/" class = "under-title-link">고수에게묻다</a></li>
                    </ul>
                </div>

                <div id ="Master-Guide" class= "center">
                    <ul>
                        <li class = "under-title">고수안내</li>
                        <li><a href = "https://soomgo.com/how-soomgo-works"  class = "under-title-link">이용안내</a></li>
                        <li><a href = "https://help.soomgo.com/hc/ko/categories/115001218027"  class = "under-title-link">고수가이드</a></li>
                        <li><a href = "https://soomgo.com/pro"  class = "under-title-link">고수가입</a></li>
                    </ul>
                </div>

                <div id = "customer-service-center" class = "center">
                    <ul>
                        <li class = "under-title">고객센터</li>
                        <li><a href = "https://help.soomgo.com/hc/ko/categories/360002081551-%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD" class = "under-title-link">공지사항</a></li>
                        <li><a href = "https://help.soomgo.com/hc/ko"  class = "under-title-link">자주묻는질문</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div id = "under-2" class = "center">
            <div id = "under-2-1" class = "center">
                <div id = "under-2-1-1" class ="center">
                    <a href = "https://soomgo.com/terms/usage/2023-12-28" class = "text-term">이용약관</a>
                </div>

                <div id = "under-2-1-2" class ="center">
                    <a href = "https://soomgo.com/terms/privacy/2024-04-17" class = "text-term">개인정보처리방침</a>
                </div>

                <div id = "under-2-1-3" class = "center">
                    <a href = "https://soomgo.com/terms/location/2023-02-15" class = "text-term">위치기반 서비스 이용약관</a>
                </div>

                <div id = "under-2-1-4" class = "center">
                    <a href = "https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1208822325" class = "text-term">사업자 정보확인</a>
                </div>
            </div>

            <div id = "under-2-2" class = "center">
                <span class ="under-2-2-text">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 
                    의무와 책임은 거래당사자에게 있습니다.</span>
            </div>

            <ul id = "under-2-3" class = "center">
                <li class = "under-2-3-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li>
                <li class = "under-2-3-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li>
                <li class = "under-2-3-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li>
                <li class = "under-2-3-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li>
            </ul>

            <div id = "under-2-4" class = "center">
                <div id = "under-2-4-1" class = "center">
                    <a href = "https://www.facebook.com/SoomgoKorea/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg">
                    </a>
                </div>

                <div id = "under-2-4-2" class = "center">
                    <a href = "https://www.instagram.com/soomgo_official/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg">
                    </a>
                </div>

                <div id = "under-2-4-3" class = "center">
                    <a href = "https://blog.naver.com/brave_mobile_mkt">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg">
                    </a>
                </div>

                <div id = "under-2-4-4" class = "center">
                    <a href = "https://post.naver.com/brave_mobile_mkt?isHome=1">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg">
                    </a>
                </div>

                <div id = "under-2-4-5" class = "center">
                    <a href = "https://news.soomgo.com/">
                        <img src = "https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg">
                    </a>
                </div>
            </div>
        </div>

    </div>

    
    
</body>

<body>
<form>
    <div class = "pp-app">
        <div class = "pp-app-body">
            <div class = "pp-body">
                <div class = "pp-body-inner">
                   <div class = "pp-body-inner1">
                        <div class  ='pp-body-inner2'>
                            <div class = "pp-body-inner3">
                                <div class = "pp-body-inner4">
                                    <div class = "pp-body-inner5">
                                        <div class = "pp-body-inner6">
                                            <div class = "pp-body-inner7">
                                                <div class = "pp-body-inner8">
                                                    <img class = "pp-body-inner8-img" src = "">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class = "pp-body-right-inner">
                            <div class = "pp-body-right-inner-button-outter">
                                <button class = "pp-body-right-inner-button" type = "button"></button>
                            </div>
                            <div class = "pp-body-right-inner-title">
                                <div class = "pp-body-right-inner-title1">
                                    <h1 class = "pp-body-right-inner-title1-font"></h1>
                                </div>
                            </div>
                            <span class = "pp-body-right-inner-title1-span">조회 116</span>
                            <hr class = "pp-divider">
                            <% for(Gosu_profile_header_inforDto hidto: GosuProfileHeader) {%>
                            <div class = "pp-body-main-inner">
                                <div class = "pp-body-main-inner1">
                                    <div class = "pp-body-main-inner1-img" style = "background-image: url(<%=hidto.getF_img()%>);"></div>
                                </div>

                                <div class = "pp-body-main-inner-text-outter">
           						
                                    <span class = "pp-body-main-inner-text-span">
                                    	<%=hidto.getName() %>
                                    </span>
					
                                    <div class = "pp-body-main-inner-score-outter">
                                        <ul class = "pp-body-main-inner-score-ul">
                                        <% 
                                           for(Gosu_profile_countDto dto6 : GosuProfileCount){ 
                                               for (int i=0;i< dto6.getScore(); i++ ){
                                        %>
                                            <li class = "pp-body-main-inner-score-li">
                                                <img class = "pp-body-main-inner-score-li-img" src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-full.svg">
                                           
											</li>
                                        <% 
                                               }
                                           }
                                        %>
                                        </ul>
                                        <span class = "pp-body-main-inner-score-span"></span>
                                    </div>
                                </div>
                                <button type = "button" class = "pp-body-main-inner-button"></button>
                            </div>
                            <%} %>
                            <div class = "pp-body-main-button-outter">
                                <button class = "pp-body-main-button" type = "button">
                                    견적 요청하기
                                </button>
                            </div>
                            <div class = "pp-body-main-under">
                                <h3 class = "pp-body-main-under-font">서비스종류</h3>
                                <span class = "pp-body-main-under-sub-font"></span>
                                <h3 class= "pp-body-main-under-font1">지역정보</h3>
                                <span class = "pp-body-main-under-sub-font1"></span>
                                <h3 class= "pp-body-main-under-font1">가격대</h3>
                                <span class = "pp-body-main-under-sub-font2"></span>
                                <h3 class= "pp-body-main-under-font1">작업소요시간</h3>
                                <span class = "pp-body-main-under-sub-font3">2시간</span>
                                <h3 class= "pp-body-main-under-font1">작업년도</h3>
                                <span class = "pp-body-main-under-sub-font4"></span>
                            </div>
                            <div class = "pp-body-main-under-text-outter"></div>
                        </div>
                   </div> 
                   
                </div>
            </div>
        </div>
    </div>
</form>
 
</body>
</html>
</html>