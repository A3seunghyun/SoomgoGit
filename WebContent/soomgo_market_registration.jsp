<%@page import="dto.Soomgo_headerDto"%>
<%@page import="dto.Soomgo_header2Dto"%>
<%@page import="dao.Soomgo_headerDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		// 영현이 헤더
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
		
		try {
			users_idx =	 Integer.parseInt(hs.getAttribute("L_users_idx").toString());
			
			Soomgo_headerDao shdao = new Soomgo_headerDao();
			SoomgoHeader = shdao.getSoomgoHeader(users_idx);
			SoomgoHeader2 = shdao.getSoomgoHeader2(users_idx);
			
			} catch(Exception e){
				
		}
	
		// 세션에서 isgosu를 가져옴, 존재하지 않으면 기본값 2 설정
		Integer isgosu = (Integer) hs.getAttribute("isgosu");
		
		if (isgosu == null) {	
		// 고수일때 실행할 메서드
		isgosu = 2; // 기본값 2
		}//else{
		// 고수아닐때 일반회원일때 실행할 메서드
		// }
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨고 마켓 상품 등록하기 -승현</title>
	<link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"> <!-- clear css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear3.css"/> <!-- clear3 css 꼭 추가하기 -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/soomgo_market_registration.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/header.css"> <!-- 헤더 css 꼭 추가하기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script> <!--헤더 jquery 시작 -->
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
				if(g_user != 1) {
					location.href = "Gosu_join.jsp";
					$(".header-total2").hide();
					$(".header-total1").show();
				} else {
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
	</script> <!--헤더 jquery 끝 -->
	
	<script type="text/javascript">
		function uploadFile(input) {
			if (input.files && input.files[0]) {
				let reader = new FileReader();
				
				reader.onload = function (e) {
					let cnt =  $("#basic-information").children().length;
					
					if(cnt == 4){
						$("#basic-information .preview-image-dummy").hide();
					}
					
					if(cnt <= 13){
						let htmlData = "<article class=\"preview-image-dummy\">" +
										"<div class=\"image-wrap\">" +
										"<div class=\"dummy-image\">" +
										"<img src=\"\" style=\"display: none\">" +
										"<img class=\"thumbnail_img\" src=\""+ e.target.result +"\">"+
										"</div>" +
										"</div>" +
										"</article>";
						
						$("#basic-information").append(htmlData);
	
						let cnt2 = $("#basic-information .custom-file input[type='file']").length + 1;
						let newLabel = 'custom-file-label-'+cnt2;
						let inputNewFile = '<input type="file" name="thumbnail_img_'+cnt2+'" class="custom-file-input" id="custom-file-label-'+cnt2+'" onchange="uploadFile(this)"/>';
						$("#basic-information .custom-file").append(inputNewFile);
						$("#basic-information .custom-file label").attr('for', newLabel);

						$("input[name='sizeThumbnailImgs']").val(cnt2-1);
						
	
					} else {
						alert("대표 이미지 최대 10장입니다.");
					}
					
				};
				console.log("uploadFile() - input.files[0] : " + input.files[0]);
				reader.readAsDataURL(input.files[0]);
				console.log(input.value);
			}
		}
		
		function detailUploadFile(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function (e) {
					$("#detatil-file-label").val("");
					let cnt =  $("#detatil-information").children().length;
					
					if(cnt == 5){
						$("#detatil-information .preview-image-dummy").hide();
					}
					
					if(cnt <= 23){
						let htmlData = "<article class=\"preview-image-dummy\">" +
						"<div class=\"image-wrap\">" +
						"<div class=\"dummy-image\">" +
						"<img src=\"\" style=\"display: none\">" +
						"<img class=\"detail-img\" src=\""+ e.target.result +"\">"+
						"</div>" +
						"</div>" +
						"</article>";
						
						$("#detatil-information").append(htmlData);
					} else {
						alert("상세 이미지 최대 20장입니다.");
					}
					
				};
				reader.readAsDataURL(input.files[0]);
				console.log(input.value);
			}
		}
		
		$(function () {
			
			$(".component-container > article").hide();
			$(".component-container > article:nth-child(1)").show();
			$(".title-feedback").hide();
			$(".detail-feedback").hide();
			$(".btn-submit").hide();
			
			$(".step-info").click(function () {
				$(".component-container > article").hide();
				let stepTitle = $(this).find(".btn-step").text();
				$(".step-title").text(stepTitle);
				
				if($(".btn-step").hasClass("active")){
					$(".btn-step").removeClass("active");
				}
				$(this).find(".btn-step").addClass("active");
				
				if($(".step-info").hasClass("active")){
					$(".step-info").removeClass("active");
				}
				$(this).addClass("active");
				
				let index = $(this).index();
				if(index == 1){
					$(".step-info").removeClass("complete");
					$(".progress-bar").css("width","0%");
					$(".component-container > article:nth-child(1)").show();
					$(".btn-submit").hide();
				} else if(index == 2){
					$(".step-info").eq(0).addClass("complete");
					$(".step-info").eq(1).removeClass("complete");
					$(".step-info").eq(2).removeClass("complete");
					$(".progress-bar").css("width","50%");
					$(".component-container > article").hide();
					$(".component-container > article:nth-child(2)").show();
					$(".btn-submit").hide();
				} else {
					$(".step-info").eq(0).addClass("complete");
					$(".step-info").eq(1).addClass("complete");
					$(".progress-bar").css("width","100%");
					$(".component-container > article:nth-child(3)").show();
					$(".btn-submit").show();
				}
				
			})
			$(".btn-step").hover(function () {
				$(this).css("background-color","rgb(242, 242, 242)")
			},function(){
				$(this).css("background-color","rgb(255, 255, 255)")
			});
			
			$(".body-form-control").on("keydown keypress keyup", function () {
				let content = $(this).val();
					$(".title-feedback").show();
				if(content.length == 0 || content == ""){
					$("#itemTitle-text-count > span").text(0);
				} else {
					$("#itemTitle-text-count > span").text(content.length);
				}
				
				if(content.length > 0 && content.length <10){
					$(".title-feedback").text("10자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else if(content.length == 0 || content == "") {
					$(".title-feedback").text("상품 이름을 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".title-feedback").hide();
				}
				
				if (content.length > 50) {
			    	// 50자 부터는 타이핑 되지 않도록
			    	$("#itemTitle-text-count > span").text(50);
			        $(this).val($(this).val().substring(0, 50));
			    };
			})
			
			$(".body-form-control").focus(function () {
				var text = $(this).val();
				var feedback = $(".title-feedback").text();
				
				if(text.length == 0 && feedback.length == 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".title-feedback").show();
				} else if (text.length > 0 && text.length < 10){
					$(this).css("box-shadow","0 0 4px red");
					$(".title-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".title-feedback").hide();
				}
			})
			
			$(".body-form-control").blur(function () {
				var text = $(this).val();
				if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".title-feedback").text("상품 이름을 입력해 주세요.");
					$(".title-feedback").show();
				} else if(text.length > 0 && text.length <10){
					$(".title-feedback").text("10자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
					$(".title-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".title-feedback").hide();
				}
			})
			
			$("#online-btn").click(function () {
				$(this).toggleClass("checked");
				if($(this).hasClass("checked")){
					$("#online").val(1);
				} else {
					$("#online").val(0);
				}
			})
			
			$("#meet-btn").click(function () {
				$(this).toggleClass("checked");
				if($(this).hasClass("checked")){
					$("#meet").val(1);
				} else {
					$("#meet").val(0);
				}
			})
			
			$("#detail-textarea").focus(function () {
				var text = $(this).val();
				var feedback = $(".detail-feedback").text();
				
				if(text.length == 0 && feedback.length == 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".detail-feedback").show();
				} else if (text.length > 0 && text.length < 500){
					$(this).css("box-shadow","0 0 4px red");
					$(".detail-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".detail-feedback").hide();
				}
			})
			
			$("#detail-textarea").blur(function () {
				var text = $(this).val();
				if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".detail-feedback").text("상품 상세 설명을 입력해 주세요.");
					$(".detail-feedback").show();
				} else if(text.length > 0 && text.length <500){
					$(".detail-feedback").text("500자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
					$(".detail-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".detail-feedback").hide();
				}
			})
			
			$("#detail-textarea").on("keydown keypress keyup", function () {
					let content = $(this).val();
					$(".detail-feedback").show();
				if(content.length == 0 || content == ""){
					$("#detail-text-count > span").text(0);
				} else {
					$("#detail-text-count > span").text(content.length);
				}
				
				if(content.length > 0 && content.length < 500){
					$(".detail-feedback").text("500자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else if(content.length == 0 || content == "") {
					$(".detail-feedback").text("상품 상세 설명을 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".detail-feedback").hide();
				}
				
				if (content.length > 5000) {
			    	// 5000자 부터는 타이핑 되지 않도록
			    	$("#detail-text-count > span").text(5000);
			        $(this).val($(this).val().substring(0, 5000));
			    };
			})
			
			$("#ask-refund-textarea").focus(function () {
				var text = $(this).val();
				var feedback = $(".ask-refund-feedback").text();
				
				if(text.length == 0 && feedback.length == 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".ask-refund-feedback").show();
				} else if (text.length > 0 && text.length < 30){
					$(this).css("box-shadow","0 0 4px red");
					$(".ask-refund-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".ask-refund-feedback").hide();
					$("#ask-refund-text-count > span").text(text.length);
				}
			})
			
			$("#ask-refund-textarea").blur(function () {
				var text = $(this).val();
				if(text.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$(".ask-refund-feedback").text("취소 및 환불 안내를 입력해 주세요.");
					$(".ask-refund-feedback").show();
				} else if(text.length > 0 && text.length < 30){
					$(".ask-refund-feedback").text("30자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
					$(".ask-refund-feedback").show();
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".ask-refund-feedback").hide();
				}
			})
			
			$("#ask-refund-textarea").on("keydown keypress keyup", function () {
				let content = $(this).val();
				$(".ask-refund-feedback").show();
				if(content.length == 0 || content == ""){
					$("#ask-refund-text-count > span").text(0);
				} else {
					$("#ask-refund-text-count > span").text(content.length);
				}
				
				if(content.length > 0 && content.length < 30){
					$(".ask-refund-feedback").text("30자 이상 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else if(content.length == 0 || content == "") {
					$(".ask-refund-feedback").text("취소 및 환불 안내를 입력해 주세요.");
					$(this).css("box-shadow","0 0 4px red");
				} else {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$(".ask-refund-feedback").hide();
				}
				
				if (content.length > 500) {
			    	// 500자 부터는 타이핑 되지 않도록
			    	$("#ask-refund-text-count > span").text(500);
			        $(this).val($(this).val().substring(0, 500));
			    };
			    
			    
			})
			
			$(document).on("focus",".faq-title-input", function () {
				$(this).css("border","1px solid rgb(0, 199, 174)");
			});
			
			$(document).on("blur", ".faq-title-input", function () {
				$(this).css("border","1px solid rgb(225, 225, 225)");
			});
			
			$(document).on("click", ".faq-btn-add", function () {
				let title = $(this).closest(".faq-item").find("#faq-title").val();
				let answer = $(this).closest(".faq-item").find("#faq-answer").val();
				
				if(title.length > 0 && answer.length > 0){
					$(this).closest(".faq-item").find(".faq-title").text(title);
					$(this).closest(".faq-item").find(".faq-answer").text(answer);
					$(this).closest(".faq-item").find(".faq-title-input").hide();
					$(this).hide();
					$(this).siblings(".faq-btn-edit").css("display","flex");
				} else if(title.length == 0) {
					alert("질문을 입력해주세요.");
				} else if(answer.length == 0){
					alert("답변을 입력해주세요.");
				} 
				
			})
			
			$(document).on("click", ".faq-btn-edit", function () {
				let title = $(this).closest(".faq-item").find(".faq-title").text();
				let answer = $(this).closest(".faq-item").find(".faq-answer").text();
				
				$(this).closest(".faq-item").find("#faq-title").val(title);
				$(this).closest(".faq-item").find("#faq-answer").val(answer);
				
				$(this).closest(".faq-item").find(".faq-title-input").show();
				
				$(this).closest(".faq-item").find(".faq-title").text("");
				$(this).closest(".faq-item").find(".faq-answer").text("");
				
				$(this).css("display","none");
				$(this).siblings(".faq-btn-add").show();
				
			})
			
			$(document).on("click", ".faq-btn-del", function () {
				let cnt = $("#product-faq-group").children().length;
				if(cnt == 3){
					alert("자주 묻는 질문/답변은 최소 1개 이상입니다.")
				} else {
					$(this).closest(".faq-item").remove();
				}
			})
			
			$("#product-faq-add").click(function () {
				let html ="<article class=\"faq-item\">" +
							"<header>" +
								"<span class=\"faq-badge\">FAQ</span>" +
									"<div class=\"faq-btn-group\">" +
										"<button type=\"button\" class=\"faq-btn-add\">등록</button>" +
										"<button type=\"button\" class=\"faq-btn-edit\">수정</button>" +
										"<i class=\"divider\"></i>" +
										"<button type=\"button\" class=\"faq-btn-del\">삭제</button>" +
									"</div>" +
								"</header>" +
								"<input type=\"text\" class=\"faq-title-input\" id=\"faq-title\" placeholder=\"질문을 입력해주세요.\">" +
								"<div class=\"faq-title-clamp\">" +
								"<div class=\"faq-title-line-clamp\">" +
										"<p class=\"faq-title\"></p>" +
									"</div>" +
								"</div>" +
								"<input type=\"text\" class=\"faq-title-input\" id=\"faq-answer\" placeholder=\"답변을 입력해주세요.\">" +
								"<div class=\"faq-answer-clamp\">" +
									"<div class=\"faq-answer-line-clamp\">" +
										"<p class=\"faq-answer\"></p>" +
									"</div>" +
								"</div>" +									
							"</article>";
							
					var cnt = $(".form-group.product-faq-form > div").children().length;
					
					if(cnt < 7){
						$(".form-group.product-faq-form > div").append(html);
					} else if (cnt >= 7){
						alert("최대 5개 입니다.")
					}
			})
			
			$(document).on("click",".btn-submit", function () {
				
				let serviceName = $(".category-choice").val(); // 마켓 카테고리
				
				let itemTitle = $("#itemTitle").val(); // 마켓 상품명
				
				let $thumbnail_img = $(".thumbnail_img"); // 마켓 대표이미지
				
				let thumbnail_imgs = [];
				
				$thumbnail_img.each(function (index) {
					let img = $thumbnail_img.eq(index).attr("src");
					//insert index만큼 반복
					
					let thumbnails = {
							thumbnail: img
					};
					
					thumbnail_imgs.push(thumbnails);
				})
				
				let online = $("#online").val(); // 온라인 여부
				let meet =$("#meet").val(); // 대면 여부
				
				let detailText = $("#detail-textarea").val(); // 상세 설명
				
				let $detail_img = $(".detail-img"); // 마켓 상세이미지
				
				let detail_imgs = [];
				
				$detail_img.each(function (index) {
					let img = $detail_img.eq(index).attr("src");
					//insert index만큼 반복
					
					let detail_img = {
						detail_img: img	
					};
					
					detail_imgs.push(detail_img);
				})
				
				let $option = $(".price-option-item"); // 옵션별 가격
				
				let options = [];
				
				$option.each(function (index) {
					let price = $option.eq(index).find(".item-price").text().replaceAll(",","").replace("원","");
					let title = $option.eq(index).find(".item-title").text();
					let content = $option.eq(index).find(".item-detail").text();
					
					let option = {
							price: price,
							title: title,
							content: content
					};
					
					options.push(option);
				});
				
				let $schedule = $(".gUser-schedule-list .main-schedule-list"); // 상품 일정
				
				let schedules = [];
				
				$schedule.each(function (index) {
					let day = $schedule.eq(index).find(".day").text().replaceAll("요일","");
					let st_time = $schedule.eq(index).find(".sc-time").text().substring(0, 10);
					let ed_time =  $schedule.eq(index).find(".sc-time").text().substring(13, 23);
					
					let schedule = {
						day: day,
						st_time: st_time,
						ed_time: ed_time
					};
					schedules.push(schedule);
					
				})
				
				let $faq = $(".faq-item"); // 자주묻는 질문 답변
				
				let faqs = [];
				
				$faq.each(function (index) {
					let title = $faq.eq(index).find(".faq-title").text();
					let answer = $faq.eq(index).find(".faq-answer").text();
					
					let faq = {
						title: title,
						answer: answer
					};
					
					faqs.push(faq);
				})
				
				let ask_refund = $("#ask-refund-textarea").val(); // 취소환불
				
				
				let insert = [
					serviceName,
					
					itemTitle,
					
					JSON.stringify(thumbnail_imgs),

					online,

					meet,

					detailText,
					
					detail_imgs,

					options,

					schedules,

					faqs,

					ask_refund
					
				];
				
				// 카테고리 타이틀
				console.log(serviceName);
				$("#the_form > input[name='serviceName_val']").val(serviceName);
				
				// 상품명
				console.log(itemTitle);
				$("#the_form > input[name='itemTitle_val']").val(itemTitle);
				
				// 대표이미지
				// $("#the_form > input[name='sizeThumbnailImgs']").val(thumbnail_imgs.length);	// 여기서 하지 말고... uploadFile() 에서.
				for(let i=0; i<=thumbnail_imgs.length-1; i++) {
					console.log(thumbnail_imgs[i].thumbnail);
					let str = "<input type='hidden' name='thumbnail_imgs_" + i + "' value='" + thumbnail_imgs[i].thumbnail + "'/>";
					$("#the_form").append(str);
				}
				
				// 온라인 여부
				console.log(online);
				$("#the_form > input[name='online_val']").val(online);
				
				// 대면 여부
				console.log(meet);
				$("#the_form > input[name='meet_val']").val(meet);
				
				// 상세 설명
				console.log(detailText);
				$("#the_form > input[name='detailText_val']").val(detailText);
				
				// 상세이미지
				$("#the_form > input[name='sizeDetailImgs']").val(detail_imgs.length);
				for(let i = 0; i <= detail_imgs.length-1; i++){
					let str = "<input type='hidden' name='detail_imgs_'"+i+"' value='"+ detail_imgs[i] +"'/>";
					$("#the_form").append(str);
				}
				
				// 가격 옵션
				console.log(options);
				$("#the_form > input[name='sizeOptions']").val(options.length);
				for(let i = 0; i <= options.length-1; i++){
					
					let price = "<input type='hidden' name='option_price_"+i+"' value='"+options[i].price+"'/>";
					let title = "<input type='hidden' name='option_title_"+i+"' value='"+options[i].title+"'/>";
					let content = "<input type='hidden' name='option_content_"+i+"' value='"+options[i].content+"'/>";
					
					$("#the_form").append(price);
					$("#the_form").append(title);
					$("#the_form").append(content);
					
				}
				
				// 스케쥴
				console.log(schedules);
				$("#the_form > input[name='sizeSchedules']").val(schedules.length);
				for(let i = 0; i <= schedules.length-1; i++){
					
					let day = "<input type='hidden' name='schedule_day_"+i+"' value='"+schedules[i].day+"'/>";
					let st_time = "<input type='hidden' name='schedule_st_time_"+i+"' value='"+schedules[i].st_time+"'/>";
					let ed_time = "<input type='hidden' name='schedule_ed_time_"+i+"' value='"+schedules[i].ed_time+"'/>";
					
					$("#the_form").append(day);
					$("#the_form").append(st_time);
					$("#the_form").append(ed_time);
					
				}
				
				// 질문답변
				console.log(faqs);
				$("#the_form > input[name='sizeFaqs']").val(faqs.length)
				for(let i = 0; i <= faqs.length-1; i++){
					
					let title = "<input type='hidden' name='faq_title_"+i+"' value='"+faqs[i].title+"'/>";
					let answer = "<input type='hidden' name='faq_answer_"+i+"' value='"+faqs[i].answer+"'/>";
					
					$("#the_form").append(title);
					$("#the_form").append(answer);
					
				}
				
				// 취소/환불
				console.log(ask_refund);
				$("#the_form > input[name='ask_refund_val']").val(ask_refund);
				
				// submit button
				$("#the_form").submit();
				
			})
			
			function checkAndToggleSubmitButton() {
			    let serviceName = $("#serviceName").val(); // 길이 1이상
			    let itemTitle = $("#itemTitle").val(); // 길이 10이상
			    let basic_img =  $("#basic-information").children().length; // 자식 요소 5개 이상
			    let online = $("#online").val(); 
			    let meet = $("#meet").val(); // online meet 둘 중 하나라도 1
			    let detailText = $("#detail-textarea").val(); // 길이 500이상
			    let detail_img =  $("#detatil-information").children().length; // 자식 요소 6개 이상
			    let price_option  = $("#price-option-group").children().length; // 자식 요소 3개 이상
			    let faq_title = $(".form-group.product-faq-form .faq-item .faq-title").text(); // 1이상
			    let faq_answer = $(".form-group.product-faq-form .faq-item .faq-answer").text(); // 1이상
			    let ask_refund = $("#ask-refund-textarea").val(); // 길이 30이상

			    if(serviceName.length >= 1 && itemTitle.length >= 10 && basic_img >= 5 && (online == 1 || meet == 1) && detailText.length >= 500 && 
			        detail_img >= 6 && price_option >= 3 && faq_title.length >= 1 && faq_answer.length >= 1 && ask_refund.length >= 30){
			        
			        $(".btn-submit").addClass("complete");
			    } else {
			        $(".btn-submit").removeClass("complete");
			    }
			}

			function attachEventListeners() {
			    $("#serviceName, #itemTitle, #online, #meet, #detail-textarea, #ask-refund-textarea").on("input", function () {
			        checkAndToggleSubmitButton();
			    });

			    $("#basic-information, #detatil-information, #price-option-group, .form-group.product-faq-form").on("DOMNodeInserted DOMNodeRemoved", function () {
			        checkAndToggleSubmitButton();
			    });
			    
			    $(window).on("click", function () {
			    	checkAndToggleSubmitButton();
				});

			    // 초기 로딩 시 한 번 검사
			    checkAndToggleSubmitButton();
			}

			$(document).ready(function() {
			    attachEventListeners();
			});
			
		})
	</script>
</head>
<body>
	<header class = "header-total"> <!-- 헤더 HTML 시작 -->
		<div class = "header-inner">
			<section class = "header-section1">
				<div class = "header-div1">
					<div class = "header-div1-1">
						<div class = "header-div1-1-logo">
							<a href = "https://soomgo.com/">
								<img class = "header-logo"src = "https://assets.cdn.soomgo.com/icons/logo/navigation_logo.svg">
							</a>
						</div>
						<nav class = "header-nav">
							<ul class = "header-nav-ul">
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
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
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
							<a href = "https://soomgo.com/">
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
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
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
							<a href = "https://soomgo.com/">
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
									<a href = "soomgo_market.jsp?category_idx=1">
										<span class = "header-nav-li-span">마켓</span>
									</a>
								</li>
								<li class = "header-nav-li1">
									<a href = "">
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
	</header> <!-- 헤더 HTML 끝 -->
	<div id="app" class="center">
		<div id="app-body">
			<div class="container center">
				<main>
					<div class="main-container center">
						<div class="page-header"><h1>상품 등록</h1></div>
						<article class="product-form">
							<div class="product-form-left">
								<div class="sticky-wrap">
									<header class="form-header">
										<section class="progress-indicator">
											<div class="progress">
												<div class="progress-bar"></div></div>
											<div class="step-info active">
												<i class="pointer"></i>
												<button type="button" class="btn-step active">기본 정보</button>
											</div>
											<div class="step-info">
												<i class="pointer"></i>
												<button type="button" class="btn-step">상세 정보</button>
											</div>
											<div class="step-info">
												<i class="pointer"></i>
												<button type="button" class="btn-step">자주 묻는 질문</button>
											</div>
										</section>
									</header>
									<div class="sign-container">
										<div class="sign-container-header">
											<div class="sign-container-title">
												<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHZpZXdCb3g9IjAgMCAxNiAxNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0ibTExLjQyOCAxLjAwMyAzLjUwOSAzLjQ0OGMuMjc1LjI3LjQzMS42MzkuNDM1IDEuMDI1bC4wNDMgNC45MmMuMDAzLjM4NS0uMTQ3Ljc1Ni0uNDE4IDEuMDMybC0zLjQ0OCAzLjUwOWMtLjI3LjI3NS0uNjM5LjQzMS0xLjAyNS40MzVsLTQuOTIuMDQzYTEuNDU1IDEuNDU1IDAgMCAxLTEuMDMyLS40MThMMS4wNjMgMTEuNTVhMS40NTUgMS40NTUgMCAwIDEtLjQzNS0xLjAyNWwtLjA0My00LjkyYTEuNDU1IDEuNDU1IDAgMCAxIC40MTgtMS4wMzJMNC40NSAxLjA2M0M0LjcyLjc4OCA1LjA5LjYzMiA1LjQ3Ni42MjhsNC45Mi0uMDQzYy4zODUtLjAwMy43NTYuMTQ3IDEuMDMyLjQxOHoiIGZpbGw9IiNGQTU5NjMiLz4KICAgICAgICA8ZyBmaWxsPSIjRkZGIiBmaWxsLXJ1bGU9Im5vbnplcm8iPgogICAgICAgICAgICA8cGF0aCBkPSJNNi45NzMgNS41Yy4xNjQgMCAuMjkzLjA1OC4zODguMTcuMDg5LjEwNC4xMzkuMjYuMTM5LjQ3djMuNjQ3YzAgLjIzNC0uMDUzLjQwNy0uMTQ3LjUyMy0uMS4xMjMtLjI0Ny4xOS0uNDQ5LjE5YS42NjMuNjYzIDAgMCAxLS40NzUtLjE3OCAxLjIxOCAxLjIxOCAwIDAgMS0uMTc2LS4yMDJjLS4wNS0uMDctLjEtLjE0NC0uMTUtLjIyTDQuNTYgNy40ODdWOS44NmMwIC4yMS0uMDUyLjM2NC0uMTQ3LjQ3YS40OS40OSAwIDAgMS0uMzgzLjE3LjQ4Ni40ODYgMCAwIDEtLjM4OS0uMTczYy0uMDkxLS4xMDctLjE0Mi0uMjYxLS4xNDItLjQ2N1Y2LjI4MmMwLS4xNjguMDItLjI5OS4wNTctLjM5N2EuNjA3LjYwNyAwIDAgMSAuMjMzLS4yNzguNjIuNjIgMCAwIDEgLjM0OS0uMTA3Yy4wOTkgMCAuMTgzLjAxOC4yNTQuMDVhLjYxLjYxIDAgMCAxIC4xODUuMTMzYy4wNDguMDUuMDk4LjExNi4xNDguMTk2bC4xNDQuMjMgMS41ODQgMi40NVY2LjE0YzAtLjIxLjA1LS4zNjUuMTM4LS40N2EuNDczLjQ3MyAwIDAgMSAuMzgtLjE3ek0xMC40MzUgNS41Yy40NzUgMCAuODgyLjEwMyAxLjIyMi4zMDYuMzQ0LjIwNS42MDQuNDk3Ljc4MS44NzYuMTc0LjM3Mi4yNjIuODEuMjYyIDEuMzEyIDAgLjM3LS4wNDguNzA2LS4xNDMgMS4wMWEyLjI0OCAyLjI0OCAwIDAgMS0uNDM0Ljc5OGMtLjE5My4yMjYtLjQzMS40LS43MTMuNTJhMi40MjYgMi40MjYgMCAwIDEtLjk1Ny4xNzhjLS4zNTggMC0uNjc4LS4wNjEtLjk2LS4xODNhMS45MyAxLjkzIDAgMCAxLS43MTYtLjUyMSAyLjI1IDIuMjUgMCAwIDEtLjQzMy0uODA2QTMuMzY3IDMuMzY3IDAgMCAxIDguMiA3Ljk4N2MwLS4zNjguMDUtLjcwNi4xNS0xLjAxNC4xMDItLjMxMS4yNS0uNTc2LjQ0My0uNzk1LjE5My0uMjIuNDI5LS4zODguNzA3LS41MDUuMjc0LS4xMTUuNTg2LS4xNzMuOTM1LS4xNzN6bTAgLjk1MWMtLjE2NCAwLS4zMTUuMDMyLS40NTQuMDk3YS45OTUuOTk1IDAgMCAwLS4zNTUuMjgyIDEuNCAxLjQgMCAwIDAtLjI0LjQ4MWMtLjA2LjItLjA5LjQyNi0uMDkuNjc2IDAgLjI1My4wMy40OC4wOS42ODUuMDYuMTk4LjE0MS4zNjMuMjQ4LjQ5My4xMDUuMTI4LjIyNi4yMjUuMzYyLjI4OC4xMzcuMDY0LjI4Ny4wOTYuNDUxLjA5Ni4yMSAwIC40MDMtLjA1NS41NzktLjE2NmExLjEzIDEuMTMgMCAwIDAgLjQxNy0uNTEzYy4xMDgtLjIzOS4xNi0uNTMzLjE2LS44ODMgMC0uMzIzLS4wNDgtLjYwNC0uMTQ3LS44NGExLjExNiAxLjExNiAwIDAgMC0uNDA4LS41MiAxLjA4NSAxLjA4NSAwIDAgMC0uNjEzLS4xNzZ6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K">
												<span class="sign-container-title-content">이런 내용은 안돼요!</span>
											</div>
											<div class="notification-guide-text">
												<p>고수님의 이메일, 전화번호, 카카오톡, 온라인/오프라인 주소</p>
												<p style="margin-top: 8px;">가격 옵션에 없는 내용 및 가격 (예: 추가 출장비, 원본 별도 비용)</p>
											</div>
										</div>
									</div>
									<a class="btn-guide" href="https://soomgo.notion.site/cd8baa936bcf443982b143de6a9f90b8">작성 가이드</a>
								</div>
							</div>
							<form id="the_form" class="product-form-right" action="SoomgoMarketRegistrationServlet" method="post" enctype="multipart/form-data">
								<section class="step-header">
									<h5 class="step-title">기본 정보</h5>
									<p>필수</p>
								</section>
								<section class="component-container">
									<article> <!-- 첫번째 form -->
										<fieldset class="form-group">
											<legend class="form-label">상품 카테고리를 선택해 주세요</legend>
											<div>
												<div class="input-wrap">
													<input class="category-choice" type="text" name="serviceName" id="serviceName" value="인테리어/시공" placeholder="예시) 인테리어/시공">
												</div>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<legend class="form-label">상품 이름을 지어주세요</legend>
											<div>
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>이런 이름이 좋아요!
													</div>
													<ul>
														<li>
															<p class="main">이력을 강조한 이름</p>
															<p class="sub">대기업 출신, 10년 차, 자격증 보유 등</p>
														</li> 
														<li>
															<p class="main">추천 대상을 강조한 이름</p>
															<p class="sub">입시생, 취준생, 신혼부부, 음치박치 등</p>
														</li> 
													</ul>
												</div>
												<div class="input-wrap">
													<input class="body-form-control" type="text" name="itemTitle" id="itemTitle" placeholder="예시) 내 집처럼 꼼꼼히 시공하는 친환경 도배 시공">
												</div>
												<div class="info-wrap">
													<div class="title-feedback"></div>
													<span class="text-count" id="itemTitle-text-count"><span>0</span>/50자</span>
												</div>
											</div>
										</fieldset>
										<fieldset class="form-group product-image-uploader">
											<legend class="form-label">대표 이미지를 올려주세요 (최대 10장)</legend>
											<div>
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>이런 사진이 좋아요!
													</div>
													<div class="main-images-guide">
														<div class="sample">
															<img src="https://assets.cdn.soomgo.com/images/market/img-profile-sample.png?webp=1">
															<p class="sub">프로필 사진 사용</p>
														</div>
														<div class="sample">
															<img src="https://assets.cdn.soomgo.com/images/market/img-product-sample.png?webp=1">
															<p class="sub">상품 결과 사진 사용</p>
														</div>
													</div>
													<ul>
														<li>
															<p class="main">가로가 긴 3:2 비율의 이미지</p>
														</li> 
														<li>
															<p class="main">주목도가 높은 선명한 이미지</p>
														</li>
														<li>
															<p class="main">제공할 상품과 연관된 이미지</p>
														</li> 
													</ul>
												</div>
												<div class="images-dummy" id="basic-information">    
													<div class="aspect-wrap">
														<div class="custom-file">
															<input type="file" name="thumbnail_img_1" class="custom-file-input" id="custom-file-label" onchange="uploadFile(this)"/>															
															<label for="custom-file-label" class="custom-file-label">
																<span class="d-block"></span>
															</label>
														</div>
														<input type="text" name="itemMainImages" style="display: none;">
													</div>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
												</div>
											</div>
										</fieldset>
									</article>
									<article>  <!-- 두번째 form -->
										<div class="location-form">
											<fieldset class="form-group" style="margin-bottom: 0px;">
												<legend class="form-label">서비스 진행 방식을 선택해 주세요 (중복가능)</legend>
												<div>
													<div class="custom-control-checkbox">
														<input type="checkbox" class="custom-control-input" id="online" name="online" value="0"/>
														<label class="custom-control-label" for="online" id="online-btn">온라인으로 진행</label>
													</div>
													<div class="custom-control-checkbox">
														<input type="checkbox" class="custom-control-input" id="meet" name="meet" value="0"/>
														<label class="custom-control-label" for="meet" id="meet-btn" style="margin-top: 14px;">만나서 진행 (지역 선택 필수)</label>
													</div>
												</div>
											</fieldset>
										</div>
										<fieldset class="form-group">
											<legend class="form-label">상품 상세 설명을 적어주세요</legend>
											<div>
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>아래 내용을 포함해주세요!
													</div>
													<ul>
														<li>
															<p class="main">진행 과정</p>
														</li> 
														<li>
															<p class="main">추천 대상</p>
														</li>
														<li>
															<p class="main">고수 정보 - 이력, 경력, 자격증 등</p>
														</li>
														<li>
															<p class="main">상품 정보 - 가격 옵션, 추가요금, 프로모션 등</p>
														</li> 
														<li>
															<p class="main">기타 - 준비물, 준비사항, 수업자료 여부 등</p>
														</li> 
													</ul>
												</div>
												<div class="input-wrap">
													<textarea rows="8" class="form-control-textarea" id="detail-textarea" name ="detail-text" placeholder="예시) 왜 AA 도배 시공을 선택해야 할까요?
01. 합리적인 가격
AA 도배 시공은 최고의 자재만을 사용합니다. 하지만 마진을 최소화하고 합리적인 가격으로 고객님께 제공합니다.
02. 철저한 AS
도배 시공 후 도배지가 울어서 스트레스 받으셨나요? 걱정하지 마세요. AA 도배 시공은 가만히 있지 않습니다."></textarea>
												</div>
												<div class="info-wrap">
													<div class="detail-feedback"></div>
													<span class="text-count" id="detail-text-count"><span>0</span>/5000</span>
												</div>
											</div>
										</fieldset>
										<fieldset class="form-group product-image-uploader">
											<legend class="form-label">상품 상세 이미지를 올려주세요 (최대 20장)</legend>
											<div>
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>고객은 이런 이미지를 좋아해요!
													</div>
													<ul>
														<li>
															<p class="main">상품 결과, 비포애프터, 과정을 잘 보여주는 이미지</p>
														</li> 
														<li>
															<p class="main">최소 5장 이상의 이미지</p>
														</li>
														<li>
															<p class="main">10MB 이하의 고화질 이미지</p>
														</li>
													</ul>
												</div>
												<div class="images-dummy detail" id="detatil-information">
													<div class="aspect-wrap">
														<div class="custom-file">
															<input type="file" class="custom-file-input" id="detatil-file-label" onchange="detailUploadFile(this)"/>
															<label for="detatil-file-label" class="custom-file-label">
																<span class="d-block"></span>
															</label>
														</div>
													</div>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
													<article class="preview-image-dummy">
														<div class="image-wrap">
															<div class="dummy-image">
																<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNCA0KSIgc3Ryb2tlPSIjQjVCNUI1IiBzdHJva2Utd2lkdGg9IjEuNSI+CiAgICAgICAgICAgIDxyZWN0IHdpZHRoPSIyOCIgaGVpZ2h0PSIyOCIgcng9IjMuNSIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSI4LjU1NiIgY3k9IjguNTU2IiByPSIyLjMzMyIvPgogICAgICAgICAgICA8cGF0aCBkPSJtMjggMTguNjY3LTcuNzc3LTcuNzc5TDMuMTEyIDI4Ii8+CiAgICAgICAgPC9nPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzZ2MzZIMHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==">
															</div>
														</div>
													</article>
												</div>
											</div>
										</fieldset>
										<fieldset class="form-group product-options">
											<legend class="form-label">가격 옵션을 입력해 주세요 (최대 10개)</legend>
											<div id="price-option-group">
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>가격 옵션을 여러 개 등록한다면?
													</div>
													<ul>
														<li>
															<p class="main">옵션들 간의 차이가 명확히 드러나도록 작성</p>
														</li> 
													</ul>
												</div>
												<button type="button" class="product-option-add" id="product-option-add">
													<span class="add-icon">
														<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
															<path d="M12.6953 2.75C12.6953 2.33579 12.3595 2 11.9453 2C11.5311 2 11.1953 2.33579 11.1953 2.75L11.1953 11.25H2.69531C2.2811 11.25 1.94531 11.5858 1.94531 12C1.94531 12.4142 2.2811 12.75 2.69531 12.75H11.1953L11.1953 21.25C11.1953 21.6642 11.5311 22 11.9453 22C12.3595 22 12.6953 21.6642 12.6953 21.25L12.6953 12.75H21.1953C21.6095 12.75 21.9453 12.4142 21.9453 12C21.9453 11.5858 21.6095 11.25 21.1953 11.25H12.6953L12.6953 2.75Z" fill="rgb(0, 199, 174)"></path>
														</svg>
													</span>
													가격 입력
												</button>
											</div>
										</fieldset>
										<fieldset class="form-group schedule-setting">
											<legend class="form-label">상품 제공 가능한 일정을 등록해 주세요 (선택)</legend>
											<div>
												<section>
													<ul class="gUser-schedule-list">
									
													</ul>
													<button type="button" class="product-option-add" id="product-schedule-add">
														<span class="add-icon">
															<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path d="M12.6953 2.75C12.6953 2.33579 12.3595 2 11.9453 2C11.5311 2 11.1953 2.33579 11.1953 2.75L11.1953 11.25H2.69531C2.2811 11.25 1.94531 11.5858 1.94531 12C1.94531 12.4142 2.2811 12.75 2.69531 12.75H11.1953L11.1953 21.25C11.1953 21.6642 11.5311 22 11.9453 22C12.3595 22 12.6953 21.6642 12.6953 21.25L12.6953 12.75H21.1953C21.6095 12.75 21.9453 12.4142 21.9453 12C21.9453 11.5858 21.6095 11.25 21.1953 11.25H12.6953L12.6953 2.75Z" fill="rgb(0, 199, 174)"></path>
															</svg>
														</span>
													일정 설정
													</button>
												</section>
											</div>
										</fieldset>
									</article>
									<article>  <!-- 세번째 form -->
										<fieldset class="form-group product-faq-form">
											<legend class="form-label">자주 묻는 질문을 등록해 주세요</legend>
											<div id="product-faq-group">
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>아래 내용을 포함해 주세요!
													</div>
													<ul>
														<li>
															<p class="main">작업 시간, AS 기간</p>
														</li>
														<li>
															<p class="main">고객이 신뢰할 수 있는 상세한 질문과 답변</p>
														</li>
													</ul>
												</div>
												<button type="button" class="product-option-add" id="product-faq-add">
													<span class="add-icon">
														<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
															<path d="M12.6953 2.75C12.6953 2.33579 12.3595 2 11.9453 2C11.5311 2 11.1953 2.33579 11.1953 2.75L11.1953 11.25H2.69531C2.2811 11.25 1.94531 11.5858 1.94531 12C1.94531 12.4142 2.2811 12.75 2.69531 12.75H11.1953L11.1953 21.25C11.1953 21.6642 11.5311 22 11.9453 22C12.3595 22 12.6953 21.6642 12.6953 21.25L12.6953 12.75H21.1953C21.6095 12.75 21.9453 12.4142 21.9453 12C21.9453 11.5858 21.6095 11.25 21.1953 11.25H12.6953L12.6953 2.75Z" fill="rgb(0, 199, 174)"></path>
														</svg>
													</span>
													질문 추가
												</button>
												<article class="faq-item">
													<header>
														<span class="faq-badge">FAQ</span>
														<div class="faq-btn-group">
															<button type="button" class="faq-btn-add">등록</button>
															<button type="button" class="faq-btn-edit">수정</button>
															<i class="divider"></i>
															<button type="button" class="faq-btn-del">삭제</button>
														</div>
													</header>
													<input type="text" class="faq-title-input" id="faq-title" placeholder="질문을 입력해주세요.">
													<div class="faq-title-clamp">
														<div class="faq-title-line-clamp">
															<p class="faq-title"></p>
														</div>
													</div>
													<input type="text" class="faq-title-input" id="faq-answer" placeholder="답변을 입력해주세요.">
													<div class="faq-answer-clamp">
														<div class="faq-answer-line-clamp">
															<p class="faq-answer"></p>
														</div>
													</div>													
												</article>
											</div>
										</fieldset>
										<fieldset class="form-group">
											<legend class="form-label">취소 및 환불 안내를 작성해 주세요</legend>
											<div>
												<div class="registration-guide">
													<div class="registration-guide-title">
														<span>TIP</span>아래 내용을 포함해 주세요!
													</div>
													<ul>
														<li>
															<p class="main">고객과의 분쟁 방지를 위한 구체적인 규정</p>
														</li>
													</ul>
												</div>
												<div class="input-wrap">
													<textarea rows="8" class="form-control-textarea" id="ask-refund-textarea" placeholder="예시) - 구매 취소는 구매 직후 3시간 안에 가능합니다. - 구매 3시간 뒤에는 고수와 상호 협의하에 구매 취소가 가능합니다. 접수 후 구매 금액 환불까지는 영업일 기준 3-5일이 소요될 수 있습니다." style="height: 312px;">・ 구매 취소는 구매 직후 3시간 안에 가능합니다. 구매내역 페이지에서 구매취소 버튼을 눌러주세요. 즉시 구매 금액이 환불됩니다.
・ 구매 3시간 뒤에는 고수와 상호 협의하에 구매 취소가 가능합니다. 협의가 되면 환불 접수가 진행됩니다. 접수 후 구매 금액 환불까지는 영업일 기준 3-5일이 소요될 수 있습니다.
・ 고수가 서비스를 이행할 수 없는 경우, 고객님의 구매 금액 전체가 환불됩니다.
・ 단, 서비스 진행이 완료된 후에는 취소 및 환불이 불가합니다.</textarea>
												</div>
												<div class="info-wrap">
													<div class="ask-refund-feedback"></div>
													<span class="text-count" id="ask-refund-text-count"><span>0</span>/500</span>
												</div>
											</div>
										</fieldset>
									</article>
								</section>
								<section class="sticky-btn-group">
									<button type="button" class="btn-submit">상품 등록 신청</button>
								</section>
								<input type="hidden" name="serviceName_val"/>
								<input type="hidden" name="itemTitle_val"/>
								<input type="hidden" name="sizeThumbnailImgs"/>
								<input type="hidden" name="online_val"/>
								<input type="hidden" name="meet_val"/>
								<input type="hidden" name="detailText_val"/>
								<input type="hidden" name="sizeDetailImags"/>
								<input type="hidden" name="sizeOptions"/>
								<input type="hidden" name="sizeSchedules"/>
								<input type="hidden" name="sizeFaqs"/>
								<input type="hidden" name="ask_refund_val"/>
							</form>
						</article>
					</div>
				</main>
			</div>
		</div>
		<div id="app-footer" class="center">
				<div id="footer-container" class="center">
					<div id="col-content">
						<p id="col-content-text">1599-5319</p>
						<p id="col-content-text-middle">
							평일 10:00 - 18:00<br/>
							(점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)
						</p>
						<a class="footer-download" style="margin-right: 8px;">
							<img src="https://assets.cdn.soomgo.com/icons/icon-download-appstore.svg" class="footer-download-img">
							APP STORE 
						</a>
						<a class="footer-download">
							<img src="https://assets.cdn.soomgo.com/icons/icon-download-palystore.svg" class="footer-download-img">
							PLAY STORE 
						</a>
					</div>
					<div id="col-content-right">
						<ul id="content-list">
							<li class="content-list">
								<span class="content-list-category">숨고소개</span>
								<div>
									<a class="content-list-text">회사소개</a>
									<a class="content-list-text">채용안내</a>
									<a class="content-list-text">팀블로그</a>
								</div>
							</li>
							<li class="content-list">
								<span class="content-list-category">고객안내</span>
								<div>
									<a class="content-list-text">이용안내</a>
									<a class="content-list-text">안전정책</a>
									<a class="content-list-text">예상금액</a>
									<a class="content-list-text">고수찾기</a>
									<a class="content-list-text">숨고보증</a>
									<a class="content-list-text">고수에게묻다</a>
								</div>
							</li>
							<li class="content-list">
								<span class="content-list-category">고수안내</span>
								<div>
									<a class="content-list-text">이용안내</a>
									<a class="content-list-text">고수가이드</a>
									<a class="content-list-text">고수가입</a>
								</div>
							</li>
							<li class="content-list">
								<span class="content-list-category">고객센터</span>
								<div>
									<a class="content-list-text">공지사항</a>
									<a class="content-list-text">자주묻는질문</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="footer-container-row" class="center">
					<div id="footer-container-row-term">
						<div class="row-term-content">
							<div class="row-term-list">
								<div class="row-term-list-terms-group" style="margin-right: 30px;">
									<a class="terms-text" style="margin-right: 30px;">이용약관</a>
									<a class="terms-text">개인정보처리방침</a>
								</div>
								<div class="row-term-list-terms-group">
									<a class="terms-text" style="margin-right: 30px;">위치기반 서비스 이용약관</a>
									<a class="terms-text">사업자 정보확인</a>
								</div>
							</div>
							<div class="row-term-list">
								<span class="terms-text-span">(주)브레이브모바일은 통신판매중개자로서 통신판매의 당사자가 아니며 개별 판매자가 제공하는 서비스에 대한 이행, 계약사항 등과 관련한 의무와 책임은 거래당사자에게 있습니다.</span>
							</div>
							<ul class="row-term-content-guide">
								<li class="content-guide-text">상호명:(주)브레이브모바일 · 대표이사:KIM ROBIN H · 개인정보책임관리자:김태우 · 주소:서울특별시 강남구 테헤란로 415, L7 강남타워 5층</li>
								<li class="content-guide-text">사업자등록번호:120-88-22325 · 통신판매업신고증:제 2021-서울강남-00551 호 · 직업정보제공사업 신고번호:서울청 제 2019-21호</li>
								<li class="content-guide-text">고객센터:1599-5319 · 이메일:support@soomgo.com</li>
								<li class="content-guide-text">Copyright ©Brave Mobile Inc. All Rights Reserved.</li>
							</ul>
						</div>
						<div class="row-term-content-badge">
							<a class="footer-badge">
								<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-facebook.svg" class="footer-badge-img">
							</a>
							<a class="footer-badge">
								<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-instagram.svg" class="footer-badge-img">
							</a>
							<a class="footer-badge">
								<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverblog.svg" class="footer-badge-img">
							</a>
							<a class="footer-badge">
								<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-naverpost.svg" class="footer-badge-img">
							</a>
							<a class="footer-badge">
								<img src="https://assets.cdn.soomgo.com/icons/icon-footer-sns-tistory.svg" class="footer-badge-img">
							</a>
						</div>
					</div>
				</div>
			</div>
	</div>
	
	<script type="text/javascript">
		$(function () {
			$("#poduct-price-modal").hide();
			
			$("#product-option-add").click(function () {
				$("#poduct-price-modal").show();
				$("#modal-option-title").focus();
				$(".modal-add-btn").addClass("new");
			})
			
			$(".close-btn").click(function () {
				$("#poduct-price-modal").hide();
			})
			
			$("#modal-option-title").focus(function () {
				var titleText = $(this).text();
				var feedbackText = $("#modal-option-feedback").text();
				if(titleText.length == 0 && feedbackText.length == 0) {
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if(titleText.length == 0 && feedbackText.length > 0){
					$(this).css("box-shadow","0 0 4px red");
				}
			})
			
			$("#modal-option-title").blur(function () {
				var titleText = $(this).val();
				var feedbackText = $("#modal-option-feedback").text();
				if(titleText.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-feedback").text("옵션 이름을 입력해 주세요.");
				} else if(titleText.length > 0){
					$(this).css("box-shadow","none");
					$("#modal-option-feedback").text("");
				}
			})
			
			$("#modal-option-title").on("keydown keypress keyup",function(){
				var titleText = $(this).val();
				if(titleText.length > 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$("#modal-option-feedback").text("");
				} else if(titleText.length == 0 || titleText == ""){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-feedback").text("옵션 이름을 입력해 주세요.");
				}
				
				if(titleText.length == 0 || titleText == ""){
					$("#modal-option-feedback-text-count > span").text(0);
				} else {
					$("#modal-option-feedback-text-count > span").text(titleText.length);
				}
				
				if (titleText.length > 50) {
			    	// 50자 부터는 타이핑 되지 않도록
			    	$("#modal-option-feedback-text-count > span").text(50);
			        $(this).val($(this).val().substring(0, 50));
			    };
			})
			
			$("#modal-option-detail-info").focus(function () {
				var detailText = $(this).val();
				var feedbackText = $("#modal-option-detail-feedback").text();
				
				if(detailText.length == 0 && feedbackText.length == 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if((detailText.length < 30) && (feedbackText.length > 0)){
					$(this).css("box-shadow","0 0 4px red");
				}
			})
			
			$("#modal-option-detail-info").blur(function () {
				var detailText = $(this).val();
				var feedbackText = $("#modal-option-detail-feedback").val();
				if(detailText.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-detail-feedback").text("옵션 상세 정보를 입력해 주세요.");
				} else if(detailText.length < 30){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-detail-feedback").text("30자 이상 입력해 주세요.");
				} else if(detailText.length >= 30){
					$(this).css("box-shadow","none");
				}
			})
			
			$("#modal-option-detail-info").on("keydown keypress keyup",function(){
				var detailText = $(this).val();
				
				if(detailText.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-detail-feedback").text("옵션 상세 정보를 입력해 주세요.");
				} else if(detailText.length > 0 && detailText.length < 30){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-detail-feedback").text("30자 이상 입력해 주세요.");
				} else if(detailText.length >= 30){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$("#modal-option-detail-feedback").text("");
				}
				
				if(detailText.length == 0 || detailText == ""){
					$("#modal-option-detail-info-text-count > span").text(0);
				} else {
					$("#modal-option-detail-info-text-count > span").text(detailText.length);
				}
				
				if (detailText.length > 500) {
			    	// 500자 부터는 타이핑 되지 않도록
			    	$("#modal-option-detail-info-text-count > span").text(500);
			        $(this).val($(this).val().substring(0, 500));
			    };
			})
			
			$("#modal-option-price").focus(function () {
				var priceText = $(this).val();
				var feedbackText = $("#modal-option-price-feedback").text();
				
				if(priceText.length == 0 && feedbackText.length == 0){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
				} else if((priceText.length  < 5) && (feedbackText.length > 0)) {
					$(this).css("box-shadow","0 0 4px red");
				}
				
			})
			
			$("#modal-option-price").blur(function () {
				var priceText = $(this).val();
				var feedbackText = $("#modal-option-price-feedback").text();
				if(priceText.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-price-feedback").text("상품금액을 입력해 주세요");
				} else if (priceText.length < 5){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-price-feedback").text("최소 1,000원 이상부터 입력 가능합니다.");
				} else if (priceText.length >= 5){
					$(this).css("box-shadow","none");
					$("#modal-option-price-feedback").text("");
				}
			})
			
			$("#modal-option-price").on("keydown keypress keyup", function(){
				var priceText = $(this).val();
				
				$(this).val($(this).val().replace(/\,/g, '').replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
				
			    let priceVal = Number($(this).val().replaceAll(",",""));
			    
				if(priceText.length == 0){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-price-feedback").text("상품금액을 입력해 주세요");
				} else if(priceVal < 1000){
					$(this).css("box-shadow","0 0 4px red");
					$("#modal-option-price-feedback").text("최소 1,000원 이상부터 입력 가능합니다.");
				} else if(priceVal >= 1000){
					$(this).css("box-shadow","0 0 4px rgb(0, 199, 174)");
					$("#modal-option-price-feedback").text("");
				}
				
				if (priceText.length > 10) {
			    	// 100,000,000 부터는 타이핑 되지 않도록
			        $(this).val("100,000,000");
			    };
			    
			    
			})
			
			$("#modal-option-title, #modal-option-price, #modal-option-detail-info").keyup(function () {
				var titleText = $("#modal-option-title").val();
				var infoText = $("#modal-option-detail-info").val();
				var priceText = $("#modal-option-price").val();
				
				let priceVal = Number(priceText.replaceAll(",",""));
				 
				if(titleText.length > 0 && infoText.length >= 30 && priceVal >= 1000){
					$(".modal-add-btn").addClass("complete");
				} else if(titleText.length == 0 || infoText.length < 30 || priceVal < 1000) {
					$(".modal-add-btn").removeClass("complete");
				}
			})
			
			var num = 1;
			
			$(document).on("click",".modal-add-btn.new" ,function () {
				var titleText = $("#modal-option-title").val();
				var infoText = $("#modal-option-detail-info").val();
				var priceText = $("#modal-option-price").val();
				
				let priceVal = Number(priceText.replaceAll(",",""));
				
				
				let addHtml =	"<section id="+num+">" +
								"<article class=\"price-option-item\">" +
								"<header>" +
								"<strong class=\"item-price\" name=\"product-option-price\" >"+priceText+"원</strong>" +
								"<div class=\"price-btn-group\">" +
								"<button type=\"button\" class=\"price-btn-edit\">수정</button>" +
								"<i class=\"divider\"></i>" +
								"<button type=\"button\" class=\"price-btn-del\">삭제</button>" +
								"</div>" +
								"</header>" +
								"<p class=\"item-title\" name=\"product-option-title\" >"+titleText+"</p>" +
								"<div class=\"item-detail-clamp\">" +
								"<div class=\"line-clamp\" style=\"max-height: 72px; -webkit-line-clamp: 3;\">" +
								"<p class=\"item-detail\" name=\"product-option-detatil\" >"+infoText+"</p>" +
								"</div>" +
								"<button type=\"button\" class=\"btn-toggle\">" +
								"<span>더보기</span>" +
								"<img src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTIiIGhlaWdodD0iMTIiIHZpZXdCb3g9IjAgMCAxMiAxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxMnYxMkgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iIzAwQzdBRSIgc3Ryb2tlLXdpZHRoPSIxLjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTEwIDQgNiA4IDIgNCIvPgogICAgPC9nPgo8L3N2Zz4K\">" +
								"</button>" +
								"</div>" +
								"</article>" +
								"</section>";
								
								num = num +1;
								
				if(titleText.length > 0 && infoText.length >= 30 && priceVal >= 1000){
					$("#price-option-group").append(addHtml);
					var titleText = $("#modal-option-title").val("");
					var infoText = $("#modal-option-detail-info").val("");
					var priceText = $("#modal-option-price").val("");
					$(".modal-add-btn").removeClass("complete");
					$(".modal-add-btn").removeClass("new");
					$("#poduct-price-modal").hide();
					
				} else if(titleText.length == 0 || infoText.length < 30 || priceVal < 1000) {
					alert("옵션 이름, 상세정보, 금액 확인해주세요.")
				}
				
				
			})
			
			$(document).on('click', '.price-btn-del', function() {
				$(this).closest("section").remove();
			});
			
			$(document).on('click', '.price-btn-edit', function() {
				var priceText = $(this).closest("section").find(".item-price").text().replaceAll("원","");
				var titleText = $(this).closest("section").find(".item-title").text();
				var detailText = $(this).closest("section").find(".item-detail").text();
				
				$("#modal-option-title").val(titleText);
				$("#modal-option-detail-info").val(detailText);
				$("#modal-option-price").val(priceText);
				$("#poduct-price-modal").show();
				
				$(".modal-add-btn").addClass("edit");
				
				let price = Number(priceText.replaceAll(",",""));
				
				if(titleText.length > 0 && detailText.length >= 30 && price >= 1000){
					$(".modal-add-btn").addClass("complete");
				} else if(titleText.length == 0 || infoText.length < 30 || price < 1000) {
					$(".modal-add-btn").removeClass("complete");
				}
				
				var idNum = $(this).closest("section").attr("id");
				
				$(document).one("click",".modal-add-btn.edit.complete",function(){
					var priceText = $("#modal-option-price").val().replaceAll("원","");
					var titleText = $("#modal-option-title").val();
					var detailText = $("#modal-option-detail-info").val();
					
					
					$("section[id="+idNum+"]").find(".item-price").text(priceText);
					$("section[id="+idNum+"]").find(".item-title").text(titleText);
					$("section[id="+idNum+"]").find(".item-detail").text(detailText);
					
					console.log($("section[id="+idNum+"]"));
					
					$("#modal-option-title").val("");
					$("#modal-option-detail-info").val("");
					$("#modal-option-price").val("");
					
					$("#poduct-price-modal").hide();
				});
				
			});
			
			$(document).on("click",".btn-toggle", function () {
				$(this).closest(".item-detail-clamp").find(".line-clamp").css({"max-height":"","-webkit-line-clamp":""});
				$(this).hide();
			})
			
			
			$(".close-btn").click(function () {
				$("#modal-option-title").val("");
				$("#modal-option-detail-info").val("");
				$("#modal-option-price").val("");
				$("#poduct-price-modal").hide();
				$(".modal-add-btn").removeClass("complete");
				$(".modal-add-btn").removeClass("edit");
				$(".modal-add-btn").removeClass("new");
				$("#modal-option-title").css("box-shadow","none");
				$("#modal-option-feedback").text("");
				$("#modal-option-detail-info").css("box-shadow","none");
				$("#modal-option-detail-feedback").text("");
				$("#modal-option-price").css("box-shadow","none");
				$("#modal-option-price-feedback").text("");
			})

			
		})
	</script>
	
	<!-- 가격 입력 Modal -->
	<div class="modal-outer" id="poduct-price-modal">
		<div class="modal-body">
			<div class="modal-dialog center">
				<span tabindex="0"></span>
				<div class="modal-content">
					<header class="modal-content-header">
						<h5>가격옵션</h5>
						<button class="close-btn"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTkgNy44NjlMMTYuNDM0LjQzNGwxLjEzMiAxLjEzMkwxMC4xMyA5bDcuNDM1IDcuNDM0LTEuMTMyIDEuMTMyTDkgMTAuMTNsLTcuNDM0IDcuNDM1LTEuMTMyLTEuMTMyTDcuODcgOSAuNDM0IDEuNTY2IDEuNTY2LjQzNCA5IDcuODd6Ii8+CiAgICA8L2RlZnM+CiAgICA8dXNlIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgeGxpbms6aHJlZj0iI2EiLz4KPC9zdmc+Cg=="></button>
					</header>
					<div class="modal-content-body">
						<fieldset class="modal-form-group">
							<legend class="modal-form-label">
								옵션 이름을 입력해 주세요
							</legend>
							<div>
								<div class="modal-input-wrap">
									<input class="modal-option-title" id="modal-option-title" placeholder="예시) 작은 방 1개, 큰 방 1개, 거실 1개" maxlength="50" />
								</div>
								<div class="modal-info-wrap">
									<div class="modal-info-feedback" id="modal-option-feedback"></div>
									<span class="text-count" id="modal-option-feedback-text-count"><span>0</span>/50자</span>
								</div>
							</div>
						</fieldset>
						<fieldset class="modal-form-group">
							<legend class="modal-form-label">
								옵션 상세 정보를 입력해 주세요
							</legend>
							<div>
								<div class="modal-input-wrap">
									<textarea class="modal-option-title" id="modal-option-detail-info" rows="8" minlength="30" placeholder="예시) 12.75m² (3.86평) 방 1개 도배 시공 - 친환경 도배지로 작업 진행" style="height: auto; resize: none;"></textarea>
								</div>
								<div class="modal-info-wrap">
									<div class="modal-info-feedback" id="modal-option-detail-feedback"></div>
									<span class="text-count" id="modal-option-detail-info-text-count"><span>0</span>/500자</span>
								</div>
							</div>
						</fieldset>
						<fieldset class="modal-form-group">
							<legend class="modal-form-label">
								상품금액을 입력해 주세요
							</legend>
							<div>
								<div class="modal-input-wrap">
									<input class="modal-option-title" id="modal-option-price" placeholder="예시) 400,000" maxlength="50" value="">
								</div>
								<div class="modal-info-wrap">
									<div class="modal-info-feedback" id="modal-option-price-feedback"></div>
								</div>
							</div>
						</fieldset>
					</div>
					<footer class="modal-content-footer">
						<button class="modal-add-btn">등록하기</button>
					</footer>
				</div>
				<span tabindex="0"></span>
			</div>
		</div>
		<div class="modal-backdrop"></div>
	</div>
	
	<!-- 일정 설정 Modal -->
	<script type="text/javascript">
		$(function () {
			$("#poduct-schecule-modal").hide();
			$(".regular-schedule").hide();
			$(".time-box").hide();
			$(".dropdown-menu").hide();
			$(".time-picker-group").hide();
			
			$("#product-schedule-add").click(function () {
				$("#poduct-schecule-modal").show();
			})
			
			$(".schedule-form-tab").click(function () {
				$(".schedule-form-tab > img").toggleClass("down-arrow");
				$(".regular-schedule").toggle();
			})
			
			$(".days-box > span").click(function () {
				if($(".days-box > span").hasClass("active")){
					$(".days-box > span").removeClass("active");
				}
				$(this).addClass("active");
				
				$(".time-box").show();
			})
			
			$("#custom-time-control-label").click(function () {
				if($(".days-box > span").hasClass("active")){
					if($(this).hasClass("checked")){
						$(this).removeClass("checked");
					}
					
					$(this).addClass("checked");
				} else {
					alert("요일 먼저 선택해주세요.")
				}
			})
			
			$("#custom-time-control-label").click(function () {
				if($(".days-box > span").hasClass("active")){
					$(this).parent().parent().addClass("selected");
					$(".time-picker-group").show();
				}
			})
			
			$("#custom-no-time-control-label").click(function () {
				alert("준비중입니다.")
			})
			
			$(".days-box > span").click(function () {
				$(".time-picker-group").hide();
				$("#st-time").text("시간 선택");
				$("#ed-time").text("시간 선택");
				$(".custom-time-control-label").removeClass("checked");
			})
			
			$(".drop-down-btn").click(function () {
				
				if($(this).parent(".schedule-time-picker-drop-down").find("ul").css("display") == "none"){
					$(".dropdown-menu").hide();
					$(this).parent(".schedule-time-picker-drop-down").find("ul").css("display","block");
				} else if($(this).parent(".schedule-time-picker-drop-down").find("ul").css("display") == "block"){
					$(".dropdown-menu").hide();
					$(this).parent(".schedule-time-picker-drop-down").find("ul").css("display","none");
				};
			})
			
			$("#st-time-list").click(function () {
				$("#st-time").text("시간 선택");
				$("#ed-time").text("시간 선택");
			})
			
			$(".ampm-group > li").click(function name() {
				if($(this).parent(".ampm-group").find("li").hasClass("active")){
					$(this).parent(".ampm-group").find("li").removeClass("active");
				}
				$(this).addClass("active");
			})
			
			$(".time-confirm-btn").click(function () {

				let day = $(".days-box > span.active").text(); //요일
				let ampm = $(this).parent(".dropdown-menu").find(".b-dropdown-form >li:nth-child(1)").find(".active").text(); //오전, 오후
				let hour = $(this).parent(".dropdown-menu").find(".b-dropdown-form >li:nth-child(2)").find(".active").text(); //시
				let minute = $(this).parent(".dropdown-menu").find(".b-dropdown-form >li:nth-child(3)").find(".active").text(); //분
				
				let val = $(this).parent(".dropdown-menu").find(".b-dropdown-form >li:nth-child(2)").find(".active").val();
				
				
				let result = "시간 선택";
				
				if(val < 10) {
					result = (ampm+" 0"+hour+" : "+minute).replaceAll("시","").replaceAll("분","")
				} else if(val >= 10) {
					result = (ampm+" "+hour+" : "+minute).replaceAll("시","").replaceAll("분","")
				}
				
				if($("#st-time").text() == result){
					alert("시작시간과 종료시간은 같을 수 없습니다.");
					$(".dropdown-menu").hide();
					$(".ampm-group > li").removeClass("active");
				} else if($("#st-time").text().match("오전")){
					if(ampm == "오전"){
						if(Number($("#st-time").text().slice(3,5).replaceAll("0","") > val)){
							alert("종료시간은 시작시간보다 빠를 수 없습니다.");
							$(".dropdown-menu").hide();
							$(".ampm-group > li").removeClass("active");
						} else {
							$(this).parent(".dropdown-menu").prev().find("div").text(result);
							$(".dropdown-menu").hide();
							$(".ampm-group > li").removeClass("active");
						}
					} else {
						$(this).parent(".dropdown-menu").prev().find("div").text(result);
						$(".dropdown-menu").hide();
						$(".ampm-group > li").removeClass("active");
					}
				} else if($("#st-time").text().match("오후")){
					if(ampm == "오전"){
						alert("종료시간은 시작시간보다 빠를 수 없습니다.");
						$(".dropdown-menu").hide();
						$(".ampm-group > li").removeClass("active");
					} else {
						if(Number($("#st-time").text().slice(3,5).replaceAll("0","") > val)){
							alert("종료시간은 시작시간보다 빠를 수 없습니다.");
							$(".dropdown-menu").hide();
							$(".ampm-group > li").removeClass("active");
						} else {
							$(this).parent(".dropdown-menu").prev().find("div").text(result);
							$(".dropdown-menu").hide();
							$(".ampm-group > li").removeClass("active");
						}
					}
				} else {
					$(this).parent(".dropdown-menu").prev().find("div").text(result);
					$(".dropdown-menu").hide();
					$(".ampm-group > li").removeClass("active");
				}
				
				let st = $("#st-time").text();
				let ed = $("#ed-time").text();
				
				if(st.length > 5 && ed.length > 5){
					$(".schedule-time-add-btn").addClass("complete");
				}
				
			})
			
			$(document).on("click",".schedule-time-add-btn.complete", function () {
				let day = $(".days-box > span.active").text(); //요일
				let st = $("#st-time").text(); //시간시간
				let ed = $("#ed-time").text(); //종료시간
				
				let html = "<li class=\"main-schedule-list\">" +
							"<div>" +
								"<span class=\"day\">"+day+"요일</span>" +
								"<span class=\"sc-time\">"+st+" ~ "+ed+"</span>" +
								"</div>" +
								"<img src=\"data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxkZWZzPgogICAgICAgIDxjbGlwUGF0aCBpZD0iOWNydTFlZTRmYSI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02NzYwIDB2NTk4MkgwVjBoNjc2MHoiLz4KICAgICAgICA8L2NsaXBQYXRoPgogICAgICAgIDxjbGlwUGF0aCBpZD0iajU3bXhjcmMxYiI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik0xMy43NS4yNTVjLjMwNy4zMS4zMzEuNzk1LjA3NCAxLjEzM2wtLjA3OC4wODlMOC4yMiA3bDUuNTI3IDUuNTIzLjA3OC4wODlhLjg2Ny44NjcgMCAwIDEtLjA3NCAxLjEzMy44NTcuODU3IDAgMCAxLTEuMjE3LjAwNEw3IDguMjE4bC01LjUzMyA1LjUzYS44NTcuODU3IDAgMCAxLTEuMjE3LS4wMDMuODY3Ljg2NyAwIDAgMS0uMDc0LTEuMTMzbC4wNzgtLjA4OUw1Ljc4IDcgLjI1NCAxLjQ3N2wtLjA3OC0uMDg5QS44NjcuODY3IDAgMCAxIC4yNS4yNTUuODU3Ljg1NyAwIDAgMSAxLjQ2Ny4yNWw1LjUzMiA1LjUzIDUuNTM0LTUuNTNhLjg1Ny44NTcgMCAwIDEgMS4yMTcuMDA0eiIvPgogICAgICAgIDwvY2xpcFBhdGg+CiAgICA8L2RlZnM+CiAgICA8ZyBjbGlwLXBhdGg9InVybCgjOWNydTFlZTRmYSkiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC00MjQzIC0zOTIwKSI+CiAgICAgICAgPGcgY2xpcC1wYXRoPSJ1cmwoI2o1N214Y3JjMWIpIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg0MjQ4IDM5MjUpIj4KICAgICAgICAgICAgPHBhdGggZmlsbD0iI0I1QjVCNSIgZD0iTTAgMGgxNHYxNEgwVjB6Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K\">" +
							"</li>";
				
				$(".schedule-list").append(html);
				
				$("#st-time").text("시간 선택");
				$("#ed-time").text("시간 선택");
				$(".ampm-group > li").removeClass("active");
				
				$(".schedule-time-add-btn").removeClass("complete");
				
				$(".modal-add-btn").addClass("complete");
			})
			
			$(document).on("click",".schedule-list > li > img", function () {
				$(this).parent("li").remove();
				if($(".schedule-list").children().length < 1){
					$(".modal-add-btn").removeClass("complete");
				}
			})
			
			
			$(document).on("click","#schedul-close-btn", function () {
				$(".ampm-group > li").removeClass("active");
				$(".days-box > span").removeClass("active");
				$(".custom-time-control-label").removeClass("checked");
				$("#st-time").text("시간 선택");
				$("#ed-time").text("시간 선택");
				$(".time-picker-group").hide();
				
				$(".gUser-schedule-list > li").remove();
				let a = $(".regular-schedule > .schedule-list").html();
				$(".gUser-schedule-list").append(a);
				$(".gUser-schedule-list > li > img").remove();
				alert("수정된 내용으로 저장됩니다.");
				$("#poduct-schecule-modal").hide();
			})
			
			$(document).on("click","#schedule-add-complete",function () {
				if($(".modal-add-btn").hasClass("complete")){
					$(".gUser-schedule-list > li").remove();
					let a = $(".regular-schedule > .schedule-list").html();
					$(".gUser-schedule-list").append(a);
					$(".gUser-schedule-list > li > img").remove();
					$("#poduct-schecule-modal").hide();
				}
			})
		})
	</script>
	<div class="modal-outer" id="poduct-schecule-modal">
		<div class="modal-body">
			<div class="modal-dialog center">
				<span tabindex="0"></span>
				<div class="modal-content">
					<header class="modal-content-header">
						<h5 style="padding-left: 16px;">일정 설정</h5>
						<button class="close-btn" id="schedul-close-btn"><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTkgNy44NjlMMTYuNDM0LjQzNGwxLjEzMiAxLjEzMkwxMC4xMyA5bDcuNDM1IDcuNDM0LTEuMTMyIDEuMTMyTDkgMTAuMTNsLTcuNDM0IDcuNDM1LTEuMTMyLTEuMTMyTDcuODcgOSAuNDM0IDEuNTY2IDEuNTY2LjQzNCA5IDcuODd6Ii8+CiAgICA8L2RlZnM+CiAgICA8dXNlIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgeGxpbms6aHJlZj0iI2EiLz4KPC9zdmc+Cg=="></button>
					</header>
					<div class="modal-content-body" style="padding: 0px; min-height: 489px;">
						<section class="sign-alert-section">
							<div class="sign-container">
								<div class="sign-header">
									<div class="sign-title">
										<img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEwyMCAwIDIwIDIwIDAgMjB6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzIgLTMwMSkgdHJhbnNsYXRlKDE2IDI4MSkgdHJhbnNsYXRlKDE2IDIwKSIvPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTEwIDJjLTQuNDE2IDAtOCAzLjU4NC04IDhzMy41ODQgOCA4IDggOC0zLjU4NCA4LTgtMy41ODQtOC04LTh6bS44IDEySDkuMlY5LjJoMS42VjE0em0wLTYuNEg5LjJWNmgxLjZ2MS42eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTMyIC0zMDEpIHRyYW5zbGF0ZSgxNiAyODEpIHRyYW5zbGF0ZSgxNiAyMCkiLz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==">
										<span class="sign-content">정기 일정은 오늘 기준 향후 최대 180일(약 6개월)까지 설정됩니다.</span>
									</div>
								</div>
							</div>
						</section>
						<section class="schedule-show">
							<div class="schedule-form-tab">
								정기 일정 설정
								<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMThoMThWMEgweiIvPgogICAgICAgIDxwYXRoIHN0cm9rZT0iI0UxRTFFMSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIGQ9Im0xNC40MzQgNi43NTEtNS40IDUuNC01LjQtNS40Ii8+CiAgICA8L2c+Cjwvc3ZnPgo=">
							</div>
							<div class="regular-schedule">
								<fieldset class="regular-schedule-form">
									<legend class="modal-form-label">요일 선택</legend>
									<div>
										<div class="days-box">
											<span>월</span>
											<span>화</span>
											<span>수</span>
											<span>목</span>
											<span>금</span>
											<span>토</span>
											<span>일</span>
										</div>
										<div class="time-box">
											<div class="time-select-radio-group">
												<div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" value="time" id="time-control-input"/>
														<label class="custom-time-control-label" for="time-control-input" id="custom-time-control-label">
															<div>
																<div class="radio-label">시간 설정</div>
																<p class="sub-text">중복이 되지않는 시간대로 추가 설정이 가능합니다.</p>
															</div>
														</label>
													</div>
													<div class="time-picker-group">
														<div class="schedule-time-picker-drop-down">
															<button type="button" class="drop-down-btn" id="st-time-list"><div id="st-time">시간 선택</div></button>
															<ul class="dropdown-menu">
																<li class="dropdown-menu-presentation">
																	<form tabindex="-1" class="b-dropdown-form">
																		<li class="ampm-btn">
																			<ul class="ampm-group">
																				<li>오전</li>
																				<li>오후</li>
																			</ul>
																		</li>
																		<li class="hour-group">
																			<ul class="ampm-group">
																				<li value="1">1시</li>
																				<li value="2" style="margin: 4px 0px;">2시</li>
																				<li value="3" style="margin: 4px 0px;">3시</li>
																				<li value="4" style="margin: 4px 0px;">4시</li>
																				<li value="5" style="margin: 4px 0px;">5시</li>
																				<li value="6" style="margin: 4px 0px;">6시</li>
																				<li value="7" style="margin: 4px 0px;">7시</li>
																				<li value="8" style="margin: 4px 0px;">8시</li>
																				<li value="9" style="margin: 4px 0px;">9시</li>
																				<li value="10" style="margin: 4px 0px;">10시</li>
																				<li value="11" style="margin: 4px 0px;">11시</li>
																				<li value="12" >12시</li>
																			</ul>
																		</li>
																		<li class="ampm-btn">
																			<ul class="ampm-group">
																				<li style="margin: 16px 0px 4px 0px;">00분</li>
																			</ul>
																		</li>
																	</form>
																</li>
																<button type="button" class="time-confirm-btn">확인</button>
															</ul>
														</div>
														<span class="dash"></span>
														<div class="schedule-time-picker-drop-down">
															<button type="button" class="drop-down-btn"><div id="ed-time">시간 선택</div></button>
															<ul class="dropdown-menu" id="ed-time-menu">
																<li class="dropdown-menu-presentation">
																	<form tabindex="-1" class="b-dropdown-form">
																		<li class="ampm-btn">
																			<ul class="ampm-group">
																				<li>오전</li>
																				<li>오후</li>
																			</ul>
																		</li>
																		<li class="hour-group">
																			<ul class="ampm-group">
																				<li value="1" >1시</li>
																				<li value="2" style="margin: 4px 0px;">2시</li>
																				<li value="3" style="margin: 4px 0px;">3시</li>
																				<li value="4" style="margin: 4px 0px;">4시</li>
																				<li value="5" style="margin: 4px 0px;">5시</li>
																				<li value="6" style="margin: 4px 0px;">6시</li>
																				<li value="7" style="margin: 4px 0px;">7시</li>
																				<li value="8" style="margin: 4px 0px;">8시</li>
																				<li value="9" style="margin: 4px 0px;">9시</li>
																				<li value="10" style="margin: 4px 0px;">10시</li>
																				<li value="11" style="margin: 4px 0px;">11시</li>
																				<li value="12">12시</li>
																			</ul>
																		</li>
																		<li class="ampm-btn">
																			<ul class="ampm-group">
																				<li style="margin: 16px 0px 4px 0px;">00분</li>
																			</ul>
																		</li>
																	</form>
																</li>
																<button type="button" class="time-confirm-btn">확인</button>
															</ul>
														</div>
													</div>
												</div>
												<div class="custom-control custom-radio">
													<input type="radio" class="custom-control-input" value="no-time" id="no-time-control-input"/>
													<label class="custom-time-control-label" for="no-time-control-input" id="custom-no-time-control-label">
														<div>
															<div class="radio-label">협의 후 시간 결정</div>
															<p class="sub-text">서비스 진행 시간은 고객과 상담을 통해 조율하세요.</p>
														</div>
													</label>
												</div>
											</div>
											<button type="button" class="schedule-time-add-btn">추가하기</button>
										</div>
									</div>
								</fieldset>
								<ul class="schedule-list">
									
								</ul>
							</div>
						</section>
					</div>
					<footer class="modal-content-footer">
						<button class="modal-add-btn" id="schedule-add-complete">완료하기</button>
					</footer>
				</div>
				<span tabindex="0"></span>
			</div>
		</div>
		<div class="modal-backdrop"></div>
	</div>
</body>
</html>