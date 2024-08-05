<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%--     pageEncoding="UTF-8"%> --%>
<%-- <% --%>
// //영현이 헤더 jquery
// 	int users_idx = 0;
// 	String users_idx_param = request.getParameter("users_idx");
	
// 	if (users_idx_param != null && !users_idx_param.trim().isEmpty()) {
// 	    try {
// 	        users_idx = Integer.parseInt(users_idx_param);
// 	    } catch (NumberFormatException e) {
// 	        // 예외 처리: 잘못된 형식의 숫자가 들어온 경우 기본값 0을 사용
// 	        users_idx = 0;
// 	    }
// 	}
	
// 	ArrayList<Soomgo_headerDto> SoomgoHeader = new ArrayList<>(); // 초기화
// 	ArrayList<Soomgo_header2Dto> SoomgoHeader2 = new ArrayList<>(); // 초기화
	
// 	HttpSession hs = request.getSession();
	
// 	try{
// 		users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
		
// 		Soomgo_headerDao shdao = new Soomgo_headerDao();
// 		SoomgoHeader = shdao.getSoomgoHeader(users_idx);
// 		SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
		
// 		}catch(Exception e){
			
// 		}

// 	    // 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
// 	    Integer isgosu = (Integer) hs.getAttribute("isgosu");
// 	    if (isgosu == null) {	
// 	    	// 고수일때 실행할 메서드
// 	    	isgosu = 2; // 기본값 2
// 	    }//else{
// 	    	// 고수아닐때 일반회원일때 실행할 메서드
// 	    	// }

<%-- %> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- <script> -->
//     $(function(){
//         $(".usermenu-dropdown").hide();
//         $(".usermenu3-dropdown").hide();
//         $(".header-total1").hide();
//         $(".header-total2").hide();
        
//         $(".right-section-div2").click(function(){
//             var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
//             var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
    
//             $(".usermenu-dropdown").toggle();
//             if ($(".right-section-div2-2-img").attr("src") === img1) {
//             $(".right-section-div2-2-img").attr("src", img2);
//              } else {
//              $(".right-section-div2-2-img").attr("src", img1);
//             }
//         });

//         $(".right3-section-div2").click(function(){
//             var img1 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDggNiA0IDIgOCIvPgogICAgPC9nPgo8L3N2Zz4K";
//             var img2 = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K";
    
//             $(".usermenu3-dropdown").toggle();
//             if ($(".right3-section-div2-2-img").attr("src") === img1) {
//             $(".right3-section-div2-2-img").attr("src", img2);
//              } else {
//              $(".right3-section-div2-2-img").attr("src", img1);
//             }
//         });
//         $(".usermenu-dropdown-div2-button").click(function(){
//         	if(g_user != 0){
//             	$(".header-total1").hide();
//             	$(".header-total2").show();
//         	}else{
//         		$(".header-total1").show();
//         		$(".header-total2").hide();
//         		location.href = "Gosu_join.jsp";
//         	}
//         });
//         $(".usermenu3-dropdown-div2-button").click(function(){
//             $(".header-total1").show();
//             $(".header-total2").hide(); 
//         });
        
<%--         let users_idx = <%=users_idx%>;  --%>
//         //alert(users_idx);
       
<%--        let g_user = <%=isgosu%> --%>
//        $(document).ready(function(){
//            if(g_user == 0){
//                $(".header-total").hide();
//                $(".header-total1").show();
//                $(".header-total2").hide();
//            } else if(g_user == 1) {
//                $(".header-total").hide();
//                $(".header-total1").hide();
//                $(".header-total2").show();
//            }
//        });
//        $(".usermenu-dropdown-div3-button").click(function(){
//        	$(".header-total").show();
//            $(".header-total1").hide();
//            $(".header-total2").hide();
//        });
       
//        $(".usermenu-dropdown-div2-button").click(function(){
//       	 if(g_user != 1){
//       		location.href = "/Web/Gosu_join.jsp";
//       		$(".header-total2").hide();
//       		$(".header-total1").show();
//       	 }else{
//       		$(".header-total2").show();
//       		$(".header-total1").hide();
//       	 }
//        });
       
//        $(function(){
//     	   $(".usermenu-dropdown-div3-button").click(function(){
//     	  	 $.ajax({
//     	  	        type: "POST",
//     	  	        url: "LogoutServlet", // 로그아웃을 처리하는 서블릿 URL
//     	  	        success: function(data) {
//     	  	            // 로그아웃 성공 시 처리할 코드
//     	  	            // 예를 들어 세션 무효화 후 화면 처리 등을 할 수 있음
//     	  	            console.log("로그아웃 성공");
//     	  	            $(".header-total").show();
//     	  	            $(".header-total1").hide();
//     	  	            $(".header-total2").hide();
//     	  	        },
//     	  	        error: function() {
//     	  	            // 에러 발생 시 처리할 코드
//     	  	            console.error("로그아웃 에러");
//     	  	        }
//     	  	    });
//     	   	});
    	 
//        });
        

        
//     });
<!--   </script> -->
<!-- </head> -->
<!-- <header class = "header-total"> -->
<!--         <div class = "header-inner"> -->
<!--             <section class = "header-section1"> -->
<!--                 <div class = "header-div1"> -->
<!--                     <div class = "header-div1-1"> -->
<!--                         <div class = "header-div1-1-logo"> -->
<!--                             <a href = "soomgo_main.jsp"> -->
<!--                                 <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg"> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <nav class = "header-nav"> -->
<!--                             <ul class = "header-nav-ul"> -->
<!--                                 <li class = "header-nav-li"> -->
<!--                                     <a href = "sgRequestMain.jsp"> -->
<!--                                         <span class = "header-nav-li-span">견적요청</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "Seach.profile.jsp"> -->
<!--                                         <span class = "header-nav-li-span" id = "serarch_profile">고수찾기</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "soomgo_market.jsp?category_idx=1"> -->
<!--                                         <span class = "header-nav-li-span">마켓</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "header-nav-li-span">커뮤니티</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                     </div> -->

<!--                     <div class = "right-section"> -->
<!--                         <nav class = "right-section-nav"> -->
<!--                             <ul class = "right-section-nav-ul"> -->
<!--                                 <li class = "right-section-nav-li"> -->
<!--                                     <a href = "Login.jsp"> -->
<!--                                         <span class = "right-section-nav-li-span">로그인</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "right-section-nav-li1"> -->
<!--                                     <a href = "User.join.jsp"> -->
<!--                                         <span class = "right-section-nav-li-span">회원가입</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                         <button type = "button" class = "btn-signup"> -->
<!--                             <a href = "Gosu_join.jsp" class = "btn-a">고수가입</a> -->
<!--                         </button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </section> -->
<!--         </div> -->
<!--     </header> -->


<!-- 	 <header class = "header-total1"> -->
<!--         <div class = "header-inner"> -->
<!--             <section class = "header-section1"> -->
<!--                 <div class = "header-div1"> -->
<!--                     <div class = "header-div1-1"> -->
<!--                         <div class = "header-div1-1-logo"> -->
<!--                             <a href = "soomgo_main.jsp"> -->
<!--                                 <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg"> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <nav class = "header-nav"> -->
<!--                             <ul class = "header-nav-ul"> -->
<!--                                 <li class = "header-nav-li"> -->
<!--                                     <a href = "sgRequestMain.jsp"> -->
<!--                                         <span class = "header-nav-li-span">견적요청</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "Seach.profile.jsp"> -->
<!--                                         <span class = "header-nav-li-span">고수찾기</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "soomgo_market.jsp?category_idx=1"> -->
<!--                                         <span class = "header-nav-li-span">마켓</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "header-nav-li-span">커뮤니티</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                     </div> -->
<!--                     <div class = "center-section"> -->
<!--                         <div class = "center-section-desktop"> -->
<!--                             <form class = "center-section-form"> -->
<!--                                 <div class = "center-section-form-div1"> -->
<!--                                     <div class = "center-section-form-div2"> -->
<!--                                         <img class = "center-section-form-div2-img"src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgyNHYyNEgweiIvPgogICAgICAgIDxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDQgNCkiIHN0cm9rZT0iI0I1QjVCNSIgc3Ryb2tlLXdpZHRoPSIxLjYiPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGN4PSI2LjUiIGN5PSI2LjUiIHI9IjYuNSIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2UtbGluZWNhcD0icm91bmQiIGQ9Im0xMS41IDExLjUgNSA1Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"> -->
<!--                                     </div> -->
<!--                                     <input type = "text" class = "center-section-form-div2-input" placeholder="어떤 서비스가 필요하세요?" autocomplete="off"> -->
<!--                                 </div> -->
<!--                             </form> -->
<!--                         </div> -->
<!--                     </div> -->

<!--                     <div class = "right-section"> -->
<!--                         <nav class = "right-section-nav"> -->
<!--                             <ul class = "right-section-nav-ul"> -->
<!--                                 <li class = "right-section-nav-li3"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right-section-nav-li-span">받은견적</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "right-section-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right-section-nav-li-span">채팅</span> -->
<!--                                     </a> -->
<!--                                     <span class = "right-section-nav-li-span1">148</span> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                         <div class = "right-section-div1"> -->
<!--                             <button type = "button" class = "right-section-div1-button"> -->
<!--                                 <span class = "right-section-div1-span"> -->
<!--                                     <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> -->
<!--                                         <path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path> -->
<!--                                     </svg> -->
<!--                                 </span> -->
<!--                             </button> -->
<!--                         </div> -->
<%--                         <%  --%>
//                         if (SoomgoHeader != null && !SoomgoHeader.isEmpty()) {
//                         for(Soomgo_headerDto shdto : SoomgoHeader){ 
<%--                         %> --%>
<!--                         <div class = "right-section-div2-outter"> -->
<!--                             <div class = "right-section-div2"> -->
<!--                                 <div class = "right-section-div2-1"> -->
<!--                                     <div class = "right-section-div2-2"> -->
<%-- 	                                    <img src = "<%=shdto.getF_img() %>"> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <img class = "right-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K"> -->
                                
<!--                             </div> -->
<!--                             <div class = "usermenu-dropdown"> -->
<!--                                 <div class = "usermenu-dropdown-div1"> -->
<%--                                     <h4 class = "usermenu-dropdown-div1-font"><%=shdto.getName()%> 고객님</h4> --%>
<!--                                 </div> -->
<!--                                 <ul class = "usermenu-dropdown-ul"> -->
<!--                                     <li class = "usermenu-dropdown-li"> -->
<!--                                         <a href = ""> -->
<!--                                             <div class = "usermenu-dropdown-li-font">받은 견적</div> -->
<!--                                         </a> -->
<!--                                     </li> -->

<!--                                     <li class = "usermenu-dropdown-li"> -->
<!--                                         <a href = ""> -->
<!--                                             <div class = "usermenu-dropdown-li-font">마이페이지</div> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                                 <div class = "usermenu-dropdown-div2"> -->
<!--                                     <button type = "button" class = "usermenu-dropdown-div2-button"> -->
<!--                                         <img class = "usermenu-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4="> -->
<!--                                         고수전환 -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class = "usermenu-dropdown-div3"> -->
<!--                                 	<a href = "soomgo_main.jsp"> -->
<!--                                     <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button> -->
<!--                                 	</a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<%--                        <%  --%>
//                        		} 
//                        	}
<%--                        %> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </section> -->
<!--         </div> -->
<!--     </header> -->
<!-- 	<div> -->
<!-- 	</div> -->
<!--     <header class = "header-total2"> -->
<!--         <div class = "header-inner"> -->
<!--             <section class = "header-section1"> -->
<!--                 <div class = "header-div1"> -->
<!--                     <div class = "header-div1-1"> -->
<!--                         <div class = "header-div1-1-logo"> -->
<!--                             <a href = "soomgo_main.jsp"> -->
<!--                                 <img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg"> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <nav class = "header-nav"> -->
<!--                             <ul class = "header-nav-ul"> -->
<!--                                 <li class = "header-nav-li"> -->
<!--                                     <a href = "sgRequestMain.jsp"> -->
<!--                                         <span class = "header-nav-li-span">견적요청</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "Seach.profile.jsp"> -->
<!--                                         <span class = "header-nav-li-span">고수찾기</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = "soomgo_market.jsp?category_idx=1"> -->
<!--                                         <span class = "header-nav-li-span">마켓</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "header-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "header-nav-li-span">커뮤니티</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                     </div> -->
                    

<!--                     <div class = "right3-section"> -->
<!--                         <nav class = "right3-section-nav"> -->
<!--                             <ul class = "right3-section-nav-ul"> -->
<!--                                 <li class = "right3-section-nav-li3"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right3-section-nav-li-span">받은견적</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "right3-section-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right3-section-nav-li-span">바로견적</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "right3-section-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right3-section-nav-li-span">채팅</span> -->
<!--                                     </a> -->
<!--                                 </li> -->

<!--                                 <li class = "right3-section-nav-li1"> -->
<!--                                     <a href = ""> -->
<!--                                         <span class = "right3-section-nav-li-span">프로필</span> -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </nav> -->
<!--                         <a href= "" class = "right3-section-cash-outter"> -->
<!--                             <span class = "right3-section-cash-span1"> -->
<!--                                 <svg width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"> -->
<!--                                     <g fill="none" fill-rule="evenodd"> -->
<!--                                         <path fill="none" d="M0 0h20v20H0z"></path> -->
<!--                                         <path d="M10 20c5.523 0 10-4.477 10-10S15.523 0 10 0 0 4.477 0 10s4.477 10 10 10z" fill="#FFBF0D"></path> -->
<!--                                         <path d="M7.916 7.341a3.312 3.312 0 0 1 2.316-.912 3.32 3.32 0 0 1 2.293.974.714.714 0 1 0 1.005-1.015A4.75 4.75 0 0 0 10.25 5a4.74 4.74 0 0 0-3.313 1.301 5.066 5.066 0 0 0-1.562 3.264 5.124 5.124 0 0 0 .989 3.49 4.806 4.806 0 0 0 3.038 1.878 4.703 4.703 0 0 0 3.467-.773c.325-.224.62-.486.879-.778a.714.714 0 1 0-1.069-.948 3.453 3.453 0 0 1-.621.55 3.274 3.274 0 0 1-2.416.541 3.377 3.377 0 0 1-2.133-1.323 3.695 3.695 0 0 1-.71-2.517A3.637 3.637 0 0 1 7.915 7.34z" stroke="#FFF" stroke-width=".833" fill="#FFF"></path> -->
<!--                                     </g> -->
<!--                                 </svg> -->
<!--                             </span> -->
<!--                         </a> -->
<!--                         <div class = "right3-section-div1"> -->
<!--                             <button type = "button" class = "right3-section-div1-button"> -->
<!--                                 <span class = "right3-section-div1-span"> -->
<!--                                     <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> -->
<!--                                         <path fill-rule="evenodd" clip-rule="evenodd" d="M12.001 2.06079L11.999 2.06079C9.97499 2.06349 8.05941 2.98877 6.66424 4.5908C5.27192 6.18956 4.50296 8.33834 4.50071 10.5608V14.4899C4.50071 14.5503 4.47888 14.6086 4.43924 14.6541L3.4303 15.8127C3.15284 16.1313 3 16.5395 3 16.962V17.3108C3 18.2773 3.7835 19.0608 4.75 19.0608H8.32868C8.47595 19.7683 8.82956 20.423 9.35253 20.9399C10.0562 21.6354 11.0087 22.0245 12.0001 22.0245C12.9915 22.0245 13.944 21.6354 14.6477 20.9399C15.1707 20.423 15.5243 19.7683 15.6715 19.0608H19.25C20.2165 19.0608 21 18.2773 21 17.3108V16.962C21 16.5395 20.8472 16.1313 20.5697 15.8127L19.5608 14.6541C19.5211 14.6086 19.4993 14.5503 19.4993 14.4899V10.56C19.497 8.33758 18.7281 6.18956 17.3358 4.5908C15.9406 2.98877 14.025 2.06349 12.001 2.06079ZM14.1158 19.0608H9.88446C9.99491 19.3628 10.1719 19.6407 10.407 19.873C10.828 20.2892 11.4009 20.5245 12.0001 20.5245C12.5993 20.5245 13.1722 20.2892 13.5933 19.873C13.8283 19.6407 14.0053 19.3628 14.1158 19.0608ZM7.79542 5.57591C8.93058 4.27244 10.4456 3.56317 12 3.56079C13.5544 3.56317 15.0694 4.27244 16.2046 5.57591C17.3428 6.88293 17.9974 8.67461 17.9993 10.5616V14.4899C17.9993 14.9124 18.1521 15.3206 18.4296 15.6392L19.4385 16.7978C19.4782 16.8433 19.5 16.9016 19.5 16.962V17.3108C19.5 17.4489 19.3881 17.5608 19.25 17.5608H4.75C4.61193 17.5608 4.5 17.4489 4.5 17.3108V16.962C4.5 16.9016 4.52183 16.8433 4.56147 16.7978L5.57042 15.6392C5.84788 15.3206 6.00071 14.9124 6.00071 14.4899V10.5611C6.00273 8.67432 6.65726 6.88282 7.79542 5.57591Z" fill="black"></path> -->
<!--                                     </svg> -->
<!--                                 </span> -->
<!--                             </button> -->
<!--                         </div> -->
<%--                          <%  --%>
//                         		if (SoomgoHeader2 != null && !SoomgoHeader2.isEmpty()) {
//                         		for(Soomgo_header2Dto sh2dto : SoomgoHeader2){ 
<%--                         	%> --%>
<!--                         <div class = "right3-section-div2-outter"> -->
<!--                             <div class = "right3-section-div2"> -->
<!--                                 <div class = "right3-section-div2-1"> -->
<!--                                     <div class = "right3-section-div2-2"> -->
<%--                                     	<img src = "<%=sh2dto.getF_img()%>" width = "30px;" height = "30px;"> --%>
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <img class = "right3-section-div2-2-img" src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzg4OCIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K"> -->
                                
<!--                             </div> -->
<!--                             <div class = "usermenu3-dropdown"> -->
<!--                                 <div class = "usermenu3-dropdown-div1"> -->
<%--                                     <h4 class = "usermenu3-dropdown-div1-font"><%=sh2dto.getName() %> 고객님</h4> --%>
<!--                                     <a class = "usermenu3-dropdown-div1-a"> -->
<!--                                         <div class = "usermenu3-dropdown-div1-a-1"> -->
<!--                                             <span class = "usermenu3-dropdown-div1-a-1-span1"> -->
<!--                                                 <img class = "usermenu3-dropdown-div1-a-1-span1-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxwYXRoIGZpbGw9IiNFMUUyRTYiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlPSIjRTFFMkU2IiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iLjUiIGQ9Ik04IDFsMi4xNjMgNC4zODJMMTUgNi4wODlsLTMuNSAzLjQwOS44MjYgNC44MTZMOCAxMi4wMzlsLTQuMzI2IDIuMjc1LjgyNi00LjgxNkwxIDYuMDg5bDQuODM3LS43MDd6Ii8+Cjwvc3ZnPgo="> -->
<%--                                                 평점 <%=sh2dto.getAvg_score() %>.0 --%>
<!--                                             </span> -->
<!--                                             <span class = "usermenu3-dropdown-div1-a-1-span2"></span> -->
<%--                                             <span class = "usermenu3-dropdown-div1-a-1-span3">리뷰 <%=sh2dto.getCount_review() %>개</span> --%>
<!--                                         </div> -->
<!--                                     </a> -->
<!--                                 </div> -->
<!--                                 <ul class = "usermenu3-dropdown-ul"> -->
<!--                                     <li class = "usermenu3-dropdown-li"> -->
<!--                                         <a href = ""> -->
<!--                                             <div class = "usermenu3-dropdown-li-font">받은 견적</div> -->
<!--                                         </a> -->
<!--                                     </li> -->

<!--                                     <li class = "usermenu3-dropdown-li"> -->
<!--                                         <a href = ""> -->
<!--                                             <div class = "usermenu3-dropdown-li-font">마이페이지</div> -->
<!--                                         </a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                                 <div class = "usermenu3-dropdown-div2"> -->
<!--                                     <button type = "button" class = "usermenu3-dropdown-div2-button"> -->
<!--                                         <img class = "usermenu3-dropdown-div2-button-img" src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMyIgaGVpZ2h0PSIxMSI+PGcgZmlsbD0ibm9uZSIgZmlsbC1ydWxlPSJldmVub2RkIiBzdHJva2U9IiMzMjMyMzIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjIiPjxwYXRoIGQ9Ik0xMiAxLjV2M0g5bS04IDV2LTNoMyIvPjxwYXRoIGQ9Ik0yLjI1NSA0QTQuNSA0LjUgMCAwIDEgOS42OCAyLjMyTDEyIDQuNW0tMTEgMmwyLjMyIDIuMThBNC41IDQuNSAwIDAgMCAxMC43NDUgNyIvPjwvZz48L3N2Zz4="> -->
<!--                                         고객전환 -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class = "usermenu3-dropdown-div3"> -->
<!--                                 	<a href = "soomgo_main.jsp"> -->
<!--                                     <button type = "button" class = "usermenu-dropdown-div3-button">로그아웃</button> -->
<!--                                     </a> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<%--                             	<% --%>
// 		                            }
// 		                        }
<%--                         		%> --%>
<!--                     </div> -->
<!--                 </div> -->
<!--             </section> -->
<!--         </div> -->
<!--     </header> -->

<!-- <body> -->


<!-- </body> -->
<!-- </html> -->