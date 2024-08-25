<%@page import="dao.Soomgo_headerDao"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dto.CommunityDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

	
	Integer commuIdx = 0;	// 받아온 값이 없으면 0 (전체)가 기본값
	Integer townIdx = null;
	Integer serviceIdx = null;
	if(request.getAttribute("commuIdx") != null)
		commuIdx = (Integer)request.getAttribute("commuIdx");
	if(request.getAttribute("townIdx") != null)
		townIdx = (Integer)request.getAttribute("townIdx");
	if(request.getAttribute("serviceIdx") != null)
		serviceIdx = (Integer)request.getAttribute("serviceIdx");
	
	
// 	CommunityDao cDao = new CommunityDao();
// 	ArrayList<CommunityDto> category = cDao.commuTitleSelect();

	ArrayList<CommunityDto> category = (ArrayList<CommunityDto>)request.getAttribute("category");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숨고생활-숨고이야기</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="css/soomgoStory.css"/>
	<link rel="stylesheet" href="css/header.css"/>
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
		$(function(){
			$(".topic_item").click(function (){
 				/* 커뮤 카테고리 클릭시 해당 카테고리로 이동 */
				let idx = $(this).attr("idx").trim();
				if(idx == 1 || idx == 3 || idx == 4 || idx == 6) {
					location.href = "Controller?command=post_list&commuIdx=" + idx; 
				} else if(idx==2) {
					location.href = "soomgoG_knowHow.jsp?commuIdx=" + idx
				} else if (idx = 5) {
					location.href = "soomgoQnA2.jsp?commuIdx=" + idx
				} else {
					location.href="Controller?command=post_main_list";
				}   
			});		// jquery의 마지막 중괄호
			
			
			
			
			
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
                                <a href = "Controller?command=market_list">
                                    <span class = "header-nav-li-span">마켓</span>
                                </a>
                            </li>

                            <li class = "header-nav-li1">
                                <a href = "Controller?command=main_page">
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
                                  <a href = "Controller?command=main_page">
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
                                <a href = "Controller?command=main_page">
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
						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNzIiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA3MiA0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTQyLjY5IDBoMTUuMjI4YzEuNzU3IDAgMy40My4zNDggNC45NTEuOTc3QzY4LjIxMyAzLjAyIDcyIDguMDc0IDcyIDEzLjk5OWMwIDcuMDkyLTUuNDE4IDEzLjA2NS0xMi40NDUgMTMuOTg2LTEuMDIxLjEzNC0xLjkzNy0uNjMxLTEuOTM3LTEuNjM1di0xLjY0NUg0Mi42OWMtNy4wMDggMC0xMi42OS01LjUzLTEyLjY5LTEyLjM1M0MzMCA1LjUzMSAzNS42ODIgMCA0Mi42OSAwIiBmaWxsPSIjODBEQkI0Ii8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNDEgMTEpIiBmaWxsPSIjRkZGIj4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMiIgY3k9IjIiIHI9IjIiLz4KICAgICAgICAgICAgPGNpcmNsZSBjeD0iMTAiIGN5PSIyIiByPSIyIi8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjE4IiBjeT0iMiIgcj0iMiIvPgogICAgICAgIDwvZz4KICAgICAgICA8Zz4KICAgICAgICAgICAgPHBhdGggZD0iTTI5LjMxIDEySDE0LjA4MmMtMS43NTcgMC0zLjQzLjM0OC00Ljk1MS45NzdDMy43ODcgMTUuMDIgMCAyMC4wNzQgMCAyNS45OTljMCA3LjA5MiA1LjQxOCAxMy4wNjUgMTIuNDQ1IDEzLjk4NiAxLjAyMS4xMzQgMS45MzctLjYzMSAxLjkzNy0xLjYzNXYtMS42NDVIMjkuMzFjNy4wMDggMCAxMi42OS01LjUzIDEyLjY5LTEyLjM1M0M0MiAxNy41MzEgMzYuMzE4IDEyIDI5LjMxIDEyIiBmaWxsPSIjNDVDNTlCIi8+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0xNS42NjcgMjIuMjVoLS44OWMtLjk4MSAwLTEuNzc3Ljc4My0xLjc3NyAxLjc1djUuMjVjMCAuOTY3Ljc5NiAxLjc1IDEuNzc4IDEuNzVoLjg4OWMuNDkgMCAuODg5LS4zOTIuODg5LS44NzV2LTdhLjg4Mi44ODIgMCAwIDAtLjg5LS44NzVtMTEuNTU2IDBoLTQuNDQ0bC43MzQtMi43MDZhMS43MzcgMS43MzcgMCAwIDAtLjczOC0xLjg4bC0uNzg3LS41MTdhLjg5Ny44OTcgMCAwIDAtMS4yODguMzM3bC0yLjAwNCA0LjAzOWEzLjQ1NiAzLjQ1NiAwIDAgMC0uMzYxIDEuNTM2djYuMTkxYzAgLjk2Ny43OTUgMS43NSAxLjc3NyAxLjc1aDYuMDQ0Yy44NDcgMCAxLjU3Ny0uNTg5IDEuNzQzLTEuNDA3bDEuMDY3LTUuMjVjLjIyLTEuMDgyLS42MjItMi4wOTMtMS43NDMtMi4wOTMiIGZpbGw9IiMxNTlBNkQiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="/>
					</div>
					<div id="div_service_town" >
<!-- 						<div id="div_service" class="border"> -->
<!-- 							<span>서비스 -->
<!-- 							</span> -->
<!-- 								<img src="img/숨고서비스화살표.png"/> -->
<!-- 						</div> -->
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
					
		














































