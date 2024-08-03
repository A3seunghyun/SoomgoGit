<%@page import="dao.CommunityDao"%>
<%@page import="dto.CommuServiceTitleDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 	int usersIdx = 20; // 로그인 기능합치고 다시
 	
 	CommunityDao dao = new CommunityDao();
 	ArrayList<CommuServiceTitleDto> listService =  dao.getListServiceFromUsersIdx(usersIdx);
 	
 	String serviceTitle = listService.get(0).getServiceTitle();  
 	/* 쿼리상 대표서비스 union 제공서비스로 되어있어 대표서비스가 처음 출력됨 0 번째가 대표서비스  */
 %>   
 <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>고수노하우_글쓰기1</title>
	<link rel="stylesheet" href="css/soomgoGosu_knowhow_Write.css"/>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
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
						<ul >
							<li >이메일, 전화번호, 카카오톡, 주소 등의 개인정보</li>
							<li>프로모션, 서비스 등을 홍보하는 광고성 글</li>
						</ul>
					</div>
					<button class="guide" style="cursor:pointer">작성가이드</button>
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
					<ul>
						<li>등록한 고수노하우 글은 프로필에서 확인할 수 있습니다.</li>
						<li>고수님이 작성한 고수노하우 글은 숨고를 방문하는 모든 사람들에게 보여집니다.</li>
						<li>숨고 SNS채널에 고수님의 글과 프로필이 홍보될 수 있습니다.
							<br/>(*선정 시 별도 안내 문자 발송)</li>
						<li>고수님이 저작권을 소유했거나 무료 배포가 허용된 사진, 동영상만 사용 가능합니다.</li>
						<li>노하우와 별개로 지나친 광고성 글은 삭제됩니다.</li>
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
					<ul>
						<li>등록한 고수노하우 글은 프로필에서 확인할 수 있습니다.</li>
						<li>고수님이 작성한 고수노하우 글은 숨고를 방문하는 모든 사람들에게 보여집니다.</li>
						<li>숨고 SNS채널에 고수님의 글과 프로필이 홍보될 수 있습니다.
							<br/>(*선정 시 별도 안내 문자 발송)</li>
						<li>고수님이 저작권을 소유했거나 무료 배포가 허용된 사진, 동영상만 사용 가능합니다.</li>
						<li>노하우와 별개로 지나친 광고성 글은 삭제됩니다.</li>
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














