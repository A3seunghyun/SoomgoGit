<%@page import="dto.Gosu_join_selectDto"%>
<%@page import="dao.Gosu_join_selectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
	int category_idx = Integer.parseInt(request.getParameter("category_idx"));
	Gosu_join_selectDao gjsDao = new Gosu_join_selectDao();

	ArrayList<Gosu_join_selectDto> GosuJoinSelect = gjsDao.getGosuJoinSelect(category_idx);
%>   
 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <% for(Gosu_join_selectDto gjsdto : GosuJoinSelect) {%>
  <title><%=gjsdto.getC_title()%> 고수 가입하기 - 숨고, 숨은고수 - 숨고, 숨은고수</title>
  <% } %>
  <link rel="icon" href="./img/favicon_logo.ico">
  <link rel="stylesheet" href="./css/Gosu.join.select2.css"/>
  <link rel="stylesheet" href="./css/clear3.css"/>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
      $(function(){
    	  $(".body1-main").hide();
          $(".footer1-outter").hide();
          $(".body2-main").hide();
          $(".step-body").hide();
          $(".footer2-outter").hide();
          $(".step-body-name-note-font").hide();
          $(".step-body-name-note-font1").hide();
          $(".email-input-note-font").hide();
          $(".pw-input-note-font").hide();
          $(".phone-input-note-font").hide();
    	  
          $(".custom-label").click(function() {
            var ariaInvalid = $(this).attr("aria-invalid") === "true";
            $(this).attr("aria-invalid", !ariaInvalid);
             });
          
               $(".footer-button2").click(function(){
                  $(".body-main").hide();
                  $(".body1-main").show();
                  $(".footer-outter").hide();
                  $(".footer1-outter").show();
                  $(".app-body-progress-inner2").css("width","80%");
                  $(".app-body-progress-font").text("80%");
               });

               $(".footer1-button1").click(function(){
                  $(".body-main").show();
                  $(".body1-main").hide();
                  $(".footer-outter").show();
                  $(".footer1-outter").hide();
                  $(".app-body-progress-inner2").css("width","50%");
                  $(".app-body-progress-font").text("50%");
               });
          
       
         /*  $(".footer1-button2").click(function(){
              $(".body-main").hide();
              $(".body1-main").hide();
              $(".footer-outter").hide();
              $(".footer1-outter").hide();
              $(".step-body").show();
              $(".body2-main").show();
              $(".footer2-outter").show();
              $(".app-body-progress-inner2").css("width","100%");
              $(".app-body-progress-font").text("100%");
           }); */
          
          

           $(document).ready(function() {
  // .step-body-name-input 요소 클릭 이벤트 핸들러
  $(".step-body-name-input").click(function(e) {
      if (!$(this).hasClass("chk1") && !$(this).hasClass("chk2")) {
          $(this).addClass("chk1");
      }
      $(this).css("box-shadow", "rgb(0, 199, 174) 0px 0px 10px");
      $(".step-body-name-note-font1").show();
      $(".step-body-name-note-font").hide();
  });

  // document 클릭 이벤트 핸들러
  $(document).click(function(e) {
      if (!$(e.target).is(".step-body-name-input")) {
          $(".step-body-name-input").each(function() {
              if ($(this).val().length === 0) {
                  $(this).removeClass("chk1").addClass("chk2");
                  $(this).css("border-color", "red");
                  $(this).css("box-shadow", "none");
                  $(".step-body-name-note-font1").hide();
                  $(".step-body-name-note-font").show();
              } else {
                  $(this).css("border-color", "#e1e1e1");
                  $(".step-body-name-note-font").hide();
                  $(".step-body-name-note-font1").hide();
                  $(this).css("box-shadow", "none");
              }
          });
      }
  });  
  $(document).ready(function() {
	    let list_idx;
	    let service_idx;

	    // .select-box-list 클릭 시 list_idx 값을 저장
	    $(document).on("click", ".select-box-list", function() {
	        list_idx = $(this).attr("idx");
	    });

	    // .footer-button2 클릭 시 저장된 list_idx 값을 서버로 전송하여 데이터를 가져옴
	    $(".footer-button2").click(function() {
	        if (list_idx) {
	            //alert("선택된 idx: " + list_idx);

	            $.ajax({
	                type: 'POST',
	                url: "GosuJoinServlet",
	                data: { list_idx: list_idx },
	                dataType: 'json',
	                success: function(response) {
	                    console.log("AJAX 요청 성공:", response);

	                    // .select1-box의 기존 내용을 지우기
	                    $(".select1-box").empty();

	                    // 응답 데이터가 배열이라고 가정하고, 반복하여 HTML 요소를 생성
	                    response.forEach(function(item) {
	                        console.log("item:", item);

	                        let service_idx = item.service_idx;
	                        let title = item.title;
	                        let middle_category_idx = item.middle_category_idx;

	                        console.log("service_idx:", service_idx);
	                        console.log("title:", title);
	                        console.log("middle_category_idx:", middle_category_idx);

	                        // 일반 문자열 연결 방식으로 HTML 생성
	                        let str = '<div class="select1-box-list" service_idx="' + service_idx + '" middle_category_idx="' + middle_category_idx + '">';
	                        str += '<div class="check1-box">';
	                        str += '<div class="custom1-check">';
	                        str += '<input type="checkbox" class="custom1-control-input" aria-invalid="true">';
	                        str += '<label class="custom1-label" aria-invalid="true">' + title + '</label>';
	                        str += '</div>';
	                        str += '</div>';
	                        str += '</div>';

	                        // .select1-box에 HTML 추가
	                        $(".select1-box").append(str);
	                        console.log("Generated HTML:", str);
	                    });
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.error("AJAX 요청 실패:", textStatus, errorThrown);
	                    console.log("응답 텍스트:", jqXHR.responseText);
	                }
	            });
	        } else {
	            alert("목록 항목을 먼저 선택하세요.");
	        }
	    });

	    // 이벤트 위임을 사용하여 .custom1-label 클릭 이벤트 처리
	    $(document).on("click", ".custom1-label", function() {
	        var ariaInvalid = $(this).attr("aria-invalid") === "true";
	        $(this).attr("aria-invalid", !ariaInvalid);
	    });
		
	    $(document).on("click", ".select1-box-list", function() {
            service_idx = $(this).attr("service_idx");
            
	    // .footer1-button2 클릭 시 페이지 요소 숨기기 및 보이기
	    $(".footer1-button2").click(function() {
	        $(".body-main").hide();
	        $(".body1-main").hide();
	        $(".footer-outter").hide();
	        $(".footer1-outter").hide();
	        $(".step-body").show();
	        $(".body2-main").show();
	        $(".footer2-outter").show();
	        $(".app-body-progress-inner2").css("width", "100%");
	        $(".app-body-progress-font").text("100%");
	        //alert(service_idx);  // service_idx 값을 알림으로 표시

	        

	            $.ajax({
	                type: 'POST',
	                url: "GosuJoinServlet",
	                data: { service_idx: service_idx },
	                success: function(response) {
	                    console.log("service_idx 전송 성공");
	                    // 추가 로직을 여기에 작성
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.error("service_idx 전송 실패:", textStatus, errorThrown);
	                }
	            });
	        });
	    });
	});
});
           
 $(".footer2-button1").click(function(){
    $(".body1-main").show();
          	  
            });          

      // .gender-radio-inner1를 클릭했을 때
$(".gender-radio-inner1").click(function() {
  // .gender-radio-inner1에 .active 추가
  $(this).addClass("active");
  // .gender-radio-inner2에서 .active 제거
  $(".gender-radio-inner2").removeClass("active");
});

//.gender-radio-inner2를 클릭했을 때
$(".gender-radio-inner2").click(function() {
  // .gender-radio-inner2에 .active 추가
  $(this).addClass("active");
  // .gender-radio-inner1에서 .active 제거
  $(".gender-radio-inner1").removeClass("active");
});

$(".email-input").blur(function() {
      var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
      if (emailPattern.test($(this).val())) {
          $(this).css({
              "border-color": "#e1e1e1"
              // "box-shadow": "0 0 10px #00c7ae"
          });
          $(".email-input-note-font").hide();
      } else {
          $(".email-input-note-font").show();
          $(this).css({
              "border-color": "red",
              "box-shadow": "none"
          });
      }
  });

  
  $(".pw-input").blur(function() {
      if ($(this).val().length >= 5) {
          $(".pw-input-note-font").hide();
          $(this).css({
              "border-color": "#e1e1e1",
              // "box-shadow": "none"
          });
      } else {
          $(".pw-input-note-font").show();
          $(this).css({
              "border-color": "red",
              "box-shadow": "none"
          });
      }
  });

  $(".phone-input").on('input', function() {
      var phonePattern = /^(\d{3})(\d{3,4})(\d{4})$/;
      var inputVal = $(this).val().replace(/-/g, '');

      if (phonePattern.test(inputVal)) {
          var formattedPhone = inputVal.replace(phonePattern, '$1-$2-$3');
          $(this).val(formattedPhone);
          if (inputVal.startsWith("010")) {
              $(this).css({
                  "border-color": "#00c7ae",
              });
              $(".phone-input-note-font").hide();
              $(".phone-button").css("background-color", "#00c7ae");
              $(".phone-button").attr("disabled",false);
          } else {
              $(".phone-input-note-font").show();
              $(this).css({
                  "border-color": "red"
              });
          }
      } else {
          $(".phone-input-note-font").show();
          $(this).css({
              "border-color": "red"
          });
      }
  });

       
       
        $(".custom-label").click(function() {
          var ariaInvalid = $(this).attr("aria-invalid") === "true";
          $(this).attr("aria-invalid", !ariaInvalid);

           });

           $(document).ready(function() {
  $(".check-inner1-li-label::before").click(function() {
      $(this).toggleClass("active");
      if ($(this).hasClass("active")) {
          $(this).css("display", "none");
          $(".check-inner1-li-label::after").css("background-image", "url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0ibm9uZSI+PHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik00IDJhMiAyIDAgMDAtMiAydjE2YTIgMiAwIDAwMiAyaDE2YTIgMiAwIDAwMi0yVjRhMiAyIDAgMDAtMi0ySDR6bTEzLjU0MyA3LjQ3MmEuNzUuNzUgMCAxMC0xLjA4Ni0xLjAzNGwtNi4xMjQgNi40My0yLjc5LTIuOTNhLjc1Ljc1IDAgMTAtMS4wODYgMS4wMzRsMy4zMzMgMy41YS43NS43NSAwIDAwMS4wODYgMGw2LjY2Ny03eiIgZmlsbD0iIzAwQzdBRSIvPjwvc3ZnPg==)");
          $(".check-inner1-li-label::after").css("display", "block");
      } else {
          $(this).css("display", "block");
          $(".check-inner1-li-label::after").css("background-image", "url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgZmlsbD0ibm9uZSI+PHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0yMCAzLjVINGEuNS41IDAgMDAtLjUuNXYxNmEuNS41IDAgMDAuNS41aDE2YS41LjUgMCAwMC41LS41VjRhLjUuNSAwIDAwLS41LS41ek00IDJhMiAyIDAgMDAtMiAydjE2YTIgMiAwIDAwMiAyaDE2YTIgMiAwIDAwMi0yVjRhMiAyIDAgMDAtMi0ySDR6IiBmaWxsPSIjRTFFMUUxIi8+PC9zdmc+)");
          $(".check-inner1-li-label::after").css("display", "none");
      }
  });
});
       
          
      });
    </script>
  </head>
  <body class = "body">
      <!--상단 로그인 박스-->
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
                                          <span class = "header-nav-li-span" style = "color : black;">견적요청</span>
                                      </a>
                                  </li>
  
                                  <li class = "header-nav-li1">
                                      <a href = "Seach.profile.jsp">
                                          <span class = "header-nav-li-span" style = "color : black;">고수찾기</span>
                                      </a>
                                  </li>
  
                                  <li class = "header-nav-li1">
                                      <a href = "soomgo_market.jsp?category_idx=1">
                                          <span class = "header-nav-li-span" style = "color : black;">마켓</span>
                                      </a>
                                  </li>
  
                                  <li class = "header-nav-li1">
                                      <a href = "soomgoCommu.jsp">
                                          <span class = "header-nav-li-span" style = "color : black;">커뮤니티</span>
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
  
     
    <!--중단 전체 보더 박스-->
    <div class = "app">
        <div class = "app-body">
            <form class = "app-body-form">
                <div class = "app-body-progress">
                    <div class = "app-body-progress-inner1">
                        <div class = "app-body-progress-inner2"></div>
                    </div>
                    <div class = "app-body-progress-font">50%</div>
                </div>

                <div class  = "body-main">
                    <h1 class = "body-main-header-font">어떤 서비스를 제공할 수 있나요?</h1>

                    <div class = "select-box">
                    <% for(Gosu_join_selectDto jsdto : GosuJoinSelect) { %>
                        <div class = "select-box-list" idx = "<%=jsdto.getMiddle_category_idx()%>">
                            <div class = "check-box">
                                <div class = "custom-check">
                                    <input type = "checkbox" class = "custom-control-input" aria-invalid="true">
                                    <label class = "custom-label">
                                    	<%=jsdto.getTitle() %>
                                    </label>
                                </div>
                            </div>
                        </div>
					<% } %>
                    </div>
                </div>
                
                <div class  = "body1-main">
                    <h1 class = "body1-main-header-font">구체적으로 어떤 서비스를 진행 할 수 있나요?</h1>

                    <div class = "select1-box">
                        <div class = "select1-box-list">
                            <div class = "check1-box">
                                <div class = "custom1-check">
                                    <input type = "checkbox" class = "custom1-control-input" aria-invalid="true">
                                    <label class = "custom1-label">
                                    
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class  = "body2-main">
                    <h1 class = "body2-main-header-font">마지막으로 필수 정보를 입력해주세요.</h1>      
                </div>

                <div class = "step-body">
                    <div class = "step-body-name-outter">
                        <label class = "step-body-name">이름</label>
                        <input class = "step-body-name-input" type="text" name = "name" placeholder="이름(실명)을 입력해주세요." minlength="2" maxlength="7" autofocus>
                        <div class = "step-body-name-note">
                            <p class = "step-body-name-note-font">이름을 입력해주세요.</p>
                        </div>

                        <div class = "step-body-name-note1">
                            <p class = "step-body-name-note-font1">이름(성명)을 입력해주세요.</p>
                        </div>
                    </div>
                    <div class = "prevent-callout-wrap">
                        <div class = "prevent-callout-wrap-inner">
                            <span class = "prevent-callout-wrap-font">타인 명의로 가입 시 계정이 정지되고 재가입이 불가능합니다.</span>
                        </div>
                    </div>
                    <div class = "gender">
                        <label class = "gender-label-font">성별</label>
                    <div class = "gender-radio">
                        <span class = "gender-radio-outter1">
                            <div class = "gender-radio-inner1">남자</div>
                        </span>
                        <span class = "gender-radio-outter2">
                            <div class = "gender-radio-inner2">여자</div>
                        </span>
                    </div>
                    </div>
                    <div class = "email">
                        <label class = "email-label-font">이메일</label>
                        <input type = "email" name = "email" class = "email-input" placeholder="id@soomgo.com" maxlength="255">
                        <div class = "email-input-note">
                            <p class = "email-input-note-font">이메일 주소를 입력해주세요.</p>
                        </div>
                    </div>

                    <div class = "pw">
                        <label class = "pw-label-font">비밀번호</label>
                        <input type="password" class = "pw-input" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." name = "pw">
                        <div class = "pw-input-note">
                            <p class = "pw-input-note-font">비밀번호를 입력해주세요.</p>
                        </div>
                    </div>

                    <div class = "phone">
                        <div class = "phone-div1">
                            <fieldset class = "phone-fieldset">
                                <div>
                                    <label class = "phone-label-font">휴대전화 번호 인증</label>
                                    <div class = "phone-input-outter">
                                        <input type = "tel" class = "phone-input" name = "phone" placeholder="예) 010-1234-5678" maxlength="13">
                                        <div class = "phone-button-outter">
                                            <button type = "button" class = "phone-button" >전송</button>
                                        </div>
                                    </div>
                                    <div class = "phone-input-note">
                                        <p class = "phone-input-note-font">휴대전화 번호를 입력해주세요.</p>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class = "check2-box">
                        <section class = "check2-box-section">
                            <div class = "section2-div1">
                                <div class = "section2-div1-all-check">
                                    <input type="checkbox" class = "custom2-check" aria-invalid="true">
                                    <label class = "checkbox2-label">
                                        <span class = "checkbox2-label-font">약관 전체 동의</span>
                                    </label>
                                </div>
                            </div>
                            
                            <div class = "check2-inner">
                                <div class = "check2-inner1" role="group">
                                    <ul class = "check2-inner1-ul">
                                        <li class = "check2-inner1-li">
                                            <div class = "check2-inner1-li-div1">
                                                <input type="checkbox" class = "custon2-input" aria-invalid="true">
                                                <label class = "check2-inner1-li-label">
                                                    <p class = "check2-label-font">
                                                        <span class = "check2-label-font1">만 14세 이상입니다</span>
                                                        <span class = "check2-label-font2">(필수)</span>
                                                    </p>
                                                </label>
                                            </div>
                                        </li>

                                        <li class = "check2-inner1-li1">
                                            <div class = "check2-inner1-li1-div1">
                                                <input type ="checkbox" class = "custom3-check" aria-invalid="true">
                                                <label class = "check2-inner1-li1-label">
                                                    <span class = "check2-label-font3">이용약관 동의</span>
                                                    <span class = "check2-label-font2">(필수)</span>
                                                </label>
                                            </div>
                                        </li>

                                        <li class = "check2-inner1-li1">
                                            <div class = "check2-inner1-li1-div1">
                                                <input type ="checkbox" class = "custom3-check" aria-invalid="true">
                                                <label class = "check2-inner1-li1-label">
                                                    <span class = "check2-label-font3">개인정보 수집 및 이용 동의</span>
                                                    <span class = "check2-label-font2">(필수)</span>
                                                </label>
                                            </div>
                                        </li>

                                        <li class = "check2-inner1-li1">
                                            <div class = "check2-inner1-li1-div1">
                                                <input type ="checkbox" class = "custom3-check" aria-invalid="true">
                                                <label class = "check2-inner1-li1-label">
                                                    <span class = "check2-label-font3">선택정보 수집 및 이용 동의</span>
                                                    <span class = "check2-label-font2">(필수)</span>
                                                </label>
                                            </div>
                                        </li>

                                        <li class = "check2-inner1-li1">
                                            <div class = "check2-inner1-li1-div1">
                                                <input type ="checkbox" class = "custom3-check" aria-invalid="true">
                                                <label class = "check2-inner1-li1-label">
                                                    <span class = "check2-label-font3">개인정보 마케팅 활용 동의</span>
                                                    <span class = "check2-label-font2">(필수)</span>
                                                </label>
                                            </div>
                                        </li>

                                        <li class = "check2-inner1-li1">
                                            <div class = "check2-inner1-li1-div1">
                                                <input type ="checkbox" class = "custom3-check" aria-invalid="true">
                                                <label class = "check2-inner1-li1-label">
                                                    <span class = "check2-label-font3">마케팅 알림 수신 동의</span>
                                                    <span class = "check2-label-font2">(필수)</span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </section>
                    </div>
                    </div>
                
                

                <div id = "footer-outter" class = "footer-outter">
                    <div id = "footer-button-outter" class = "center">
                        <span id = "footer-button1-outter" class = "center">
                            <button id = "footer-button1">이전</button>
                        </span>

                        <span id = "footer-button2-outter">
                            <button id = "footer-button2" type = "button" class = "footer-button2">다음</button>
                        </span>
                    </div>
                </div>
                
                <div id = "footer1-outter" class = "footer1-outter">
                    <div id = "footer1-button-outter" class = "center">
                        <span id = "footer1-button1-outter" class = "center">
                            <button id = "footer1-button1" class = "footer1-button1" type = "button">이전</button>
                        </span>

                        <span id = "footer1-button2-outter">
                            <button id = "footer1-button2" class = "footer1-button2" type = "button">다음</button>
                        </span>
                    </div>
                </div>
                
                <div id = "footer2-outter" class = "footer2-outter">
                    <div id = "footer2-button-outter" class = "footer2-button-outter">
                        <span id = "footer2-button1-outter" class = "footer2-button1-outter">
                            <button id = "footer2-button1" class = "footer2-button1">이전</button>
                        </span>
                        <span id = "footer2-button2-outter" class = "footer2-button2-outter">
                            <button id = "footer2-button2" class = "footer2-button2">가입완료</button>
                        </span>
                    </div>
                </div>

            </form>
            </div>
        </div>
  

    
    
</body>
</html>