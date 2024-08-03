<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>고수프로필관리</title>
  <link rel="stylesheet" href="css/고수프로필관리.css"/>
  <link rel="stylesheet" href="css/clear.css"/>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function showLatLngFromAddress(param_address) {
	    // 주소-좌표 변환 객체를 생성합니다
	    var geocoder = new kakao.maps.services.Geocoder();
	
	    geocoder.addressSearch(param_address, function(result, status) {
	
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            
	            var container = document.getElementById('map');		// 지도를 표시할 div
	            var options = {
	                center: coords, // new kakao.maps.LatLng(37.5595367, 126.9253048),	// 지도의 중심좌표
	                level: 7	// 지도의 확대 레벨
	            };
	    
	            var map = new kakao.maps.Map(container, options); // 지도를 생성
	            
	            // 지도에 표시할 원을 생성
	            var circle = new kakao.maps.Circle({
	            	center : coords, // new kakao.maps.LatLng(37.5595367, 126.9253048),  // 원의 중심좌표
	            	radius : 1000, 	// 미터 단위의 원의 반지름(m 단위)
	           	  	strokeWeight: 2,  // 선의 두께를 2px로 설정
	            	strokeColor: 'red', // 선의 색깔
	                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명함
	                fillColor: '#CFE7FF', // 채우기 색깔
	                fillOpacity: 0.5  // 채우기 불투명도   
	            });
	            circle.setMap(map);
	
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            //map.setCenter(coords);
	        } 
	    }); 
	}
	
	  // 페이지가 로드될 때 로컬 스토리지에서 값(주소검색후 입력한 값)을 불러와 입력 필드에 설정
	  window.onload = function() {
	      if (localStorage.getItem('zipcode')) {
	          document.form1.zipcode.value = localStorage.getItem('zipcode');
	          
	          let zipcode = $("input[name='zipcode']").val();
	          
	          showLatLngFromAddress(zipcode);
	      }
	      
// 	      if (localStorage.getItem('address')) {  내 코드상 address, coords가 없음 -> 아무 의미가 없는 듯한??? 
// 	          document.form1.address1.value = localStorage.getItem('address');
// 	      }
// 	      if (localStorage.getItem('coords')) {
// 	          var coords = JSON.parse(localStorage.getItem('coords'));
// 	          map.setCenter(new kakao.maps.LatLng(coords.lat, coords.lng));
// 	          circle.setPosition(new kakao.maps.LatLng(coords.lat, coords.lng));
// 	      }
	  };
     function sample6_execDaumPostcode() {
 	 	const btn = document.querySelector("#addrBtn")
     	   new daum.Postcode({
            oncomplete: function(data) {
	         	console.log(data);
	         	
	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	             let addr = ''; // 주소 변수
	             let extraAddr = ''; // 참고항목 변수
	
	             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                 addr = data.roadAddress;	
	             } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                 addr = data.jibunAddress;
	             }
	             if(data.userSelectedType == 'R'){
	                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	              if(data.bname !== '' /* && /[동|로|가]$/g.test(data.bname) */){
	                  extraAddr += data.bname;
	              }
	             }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	             if(data.buildingName !== '' /* && data.apartment === 'Y' */){
	                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                 
	             }
	               addr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
	               
	               
	            // 검색한 주소의 값을   <input type = "text" name="zipcode" id = "activity-area-text-outter" readonly> 에 넣음
	               	document.form1.zipcode.value = data.zonecode;
           			document.form1.zipcode.value = addr;
           			
           			
           		   // 입력된 주소값을 로컬 스토리지에 저장 
                    localStorage.setItem('zipcode', data.zonecode);
                    localStorage.setItem('zipcode', addr);
                    
                    showLatLngFromAddress(addr);
            }
        }).open();
    }



    $(function(){
        $("#app-profile-picture").hide();
        $("#gosu-input-outter").hide();
        $("#app").hide();
        $("#one-line-input-outter").hide();
        $("#app-self").hide();
        $("#distance-select-outter").hide();
        $("#contact-option-outter").hide();
        $("#payment-method-input-outter").hide();
        $("#number-of-employees-option-outter").hide();
        $("#gosu-service-detail-intro-input-outter").hide();

        $("#app-portfolio").hide();
        $("#app-photo-video").hide();
        $(".gosu-qna-li-input-outter").hide();
        $("#link-url-img-outter").hide();
        $("#link-input-outter").hide();

        $("#update-img-button").click(function(){
            $("#app-profile-picture").show();
        })

        $("#profile-picture-button2").click(function(){
            $("#app-profile-picture").hide();
        })

        
		// 고수 활동명 수정
        $("#gosu-name-outter3 .update-font").click(function(){
            let text=$(this).text();
//             alert(text); //동작 테스트용
            if(text == "수정"){
                $(this).text("저장").css("color","red");
                $("#gosu-name").hide();
                $("#gosu-input-outter").show();
            }
            else{
                $(this).text("수정").css("color","rgb(0,199,174)");
                $("#gosu-name").text($("#gosu-name-input").val());
                $("#gosu-name").show();
                $("#gosu-input-outter").hide();
            }
            $("#gosu-name-input").keydown(function(){
                let le = $("#gosu-name-input").val();

                if(le.length == ""){
                    $(".gosu-input-count-font1").text("0");
                }
                else{
                    $(".gosu-input-count-font1").text(le.length);
                }
            })

            $("#gosu-name-input").keyup(function(){
                let le = $("#gosu-name-input").val();

                if(le.length == ""){
                    $(".gosu-input-count-font1").text("0");
                }
                else{
                    $(".gosu-input-count-font1").text(le.length);
                }
                if(le.length > 30){
                    $(this).val($(this).val().substr(0,30));
                }
            })
               
        })
        // 고수 대표서비스 등록 버튼 클릭시
        $("#representative-service-main .update-font").click(function(){
            $("#app").show();
        })
        $("#header-close-button").click(function(){
            $("#app").hide();
        })
       
       function toggleClassBetweenButtons(button1, button2) {
            if ($(button1).addClass("chk")) {                   // 버튼1이 chk class를 가질때
                $(button2).removeClass("chk");                  // 버튼1이  
                $("#footer-button").css("background-color","rgb(0,199,174)");
            } else {
                $(button1).addClass("chk");
                $(button2).removeClass("chk");
                $("#footer-button").css("background-color","rgb(0,199,174)");
            }
            ($("#footer-button").click(function(){
                let keyword = $(this).val();
                $("#app").hide();
                $("#registration-select").val("웨딩 케이크");
            }))
            
        }
       	
        // 어디?? =================================
//         $("#body-button1").click(function() {
//             toggleClassBetweenButtons("#body-button1", "#body-button2");
//         });

        
//         $("#body-button2").click(function() {
//             toggleClassBetweenButtons("#body-button2", "#body-button1");
//         });

//         $("#body-button1").click(function() {
//             toggleClassAndImage("#body-button1", "#body-button2");
            
//             $("#registration-select").val("value1");
//         });

//         $("#body-button2").click(function() {
//             toggleClassAndImage("#body-button2", "#body-button1");
            
//             $("#registration-select").val("value2");
//         });

// 	=================   한줄소개 버튼 클릭시 =============================  아래론 수정
//         $("#one-line-header-outter .update-font").click(function(){
//             let text=$(this).text();
//             if(text == "등록하기"){
//                 $(this).text("저장").css("color","red");
//                 $("#one-line-input-outter").show();
//                 $(".one-line-intro-text-font").hide();
//                 $("#one-line-input-text").css("border-color","#00c7ae;")
//             }
//             else{
//                 $(this).text("수정").css("color","");
//                 $(".one-line-intro-text-font").text($("#one-line-input-text").val());
//                 $(".one-line-intro-text-font").show();
//                 $("#one-line-input-outter").toggle();
//             }
//         })

//     	//	저장버튼 클릭시 값 저장
//         $(".update-font"). click(function(){
//         	let inputValue = $("#one-line-input-text").val().trim();
//         	 localStorage.setItem('inputText', inputValue);
//         	 $(".one-line-intro-text-font").text(inputValue);
//         })


// 		한줄소개 버튼 클릭시
		$("#one-line-header-outter .update-font").click(function(){
		    let text = $(this).text();
		    if(text == "등록하기"){
		        $(this).text("저장").css("color", "red");
		        $("#one-line-input-outter").show();
		        $(".one-line-intro-text-font").hide();
		        $("#one-line-input-text").css("border-color", "#00c7ae;");
		        
		        
		        localStorage.setItem('buttonState', '저장');
		    } else {
		        $(this).text("수정").css("color", "");
		        let inputValue = $("#one-line-input-text").val().trim();
		        localStorage.setItem('inputText', inputValue);
		        $(".one-line-intro-text-font").text(inputValue);
		        $(".one-line-intro-text-font").show();
		        $("#one-line-input-outter").toggle();
		    }
		});
		
        // 한줄 소개 텍스트 입력시  텍스트 길이 표시
        $("#one-line-input-text").on('input', function(){
        	let inputValue = $(this).val().trim();
        	let length = inputValue.length;    //keydown 이벤트이니 길이에 +1
        	$(".gosu-input-count-font1").text(length);
        	
        	if(length >= 0) {
	        	$(this).css('box-shadow','none');
	        	$(this).css('border','1px solid rgb(0,199,175)');
	        	$(this).css('box-shadow','rgb(220,251,248) 0px 0px 0px 3px;');
        	}
        })
        // 페이지 새로고침시에 로컬 스토리지에서 값을 불러와  입력값과 입력값 길이 표시해줌
       if (localStorage.getItem('inputText')) {
                let savedValue = localStorage.getItem('inputText');
                $("#one-line-input-text").val(savedValue);
                $("#text-length").text(savedValue.length);
                $(".one-line-intro-text-font").text(savedValue);
                updateInputStyle(savedValue.length);
            }
    

       // 본인 인증 -> 인증받기 버튼 클릭시
       $(".my-self-button-font").click(function(){
           let text=$(this).text();
           if(text == "인증받기"){
           $("#app-self").show();
           }
       })
       // 본인인증 모달창 취소버튼
       $("#self-verification-button2").click(function(){
           let text=$(this).text();
           if(text == "취소"){
               $("#app-self").hide();
           }
       })
//         이동 가능 거리 수정 버튼
       $("#distance-move-title-outter .update-font").click(function(){
           let text=$(this).text();

           if(text == "수정"){
               $(this).text("저장").css("color","red");
               $("#distance-select-outter").show();
               $("#distance-move-text-outter").hide();
               $(".select1").click(function(){
                   if($(".select1").hasClass("dsc")== true){
                       $(".select1").removeClass("dsc");
                   }
                   $(this).addClass("dsc");
               }) 
           }
           if(text== "저장"){
               $(this).text("수정").css("color","#00c7ae");
               $("#distance-move-text-outter").show();
               $("#distance-select-outter").hide();
               let le = $(".select1.dsc").text();
               $("#distance-move-text-outter").text(le+"이동 가능");
           }
       })
       
       // 연락 가능 시간 버튼 클릭시
       $("#contact-time-header-outter .upload-font").click(function(){
           let text=$(this).text();

           if(text == "등록하기"){
               $(this).text("저장").css("color","red");
               $("#contact-option-outter").show();
               $("#contact-start-ul").hide();
               $("#contact-time-text-outter").hide();
               $("#contact-end-ul").hide();
               $("#contact-start-button").click(function(){
                   $("#contact-start-ul").show();
                   if(this){
                       $(".contact-start-option").click(function(){
                           $("#contact-start-ul").hide();
                       })
                   }
               })
               $("#contact-end-button").click(function(){
                   $("#contact-end-ul").show();
                   if(this){
                       $(".contact-end-option").click(function(){
                           $("#contact-end-ul").hide();
                       })
                   }
               })
           }
           
//        연락 가능시간 (시간선택 1)
        $(".contact-start-option").click(function(){
            if($(".contact-start-option").hasClass("active") == true){
                $(".contact-start-option").removeClass("active");
            }
            $(this).addClass("active");

            let st_time = $(".contact-start-option.active a").text();
            let am = st_time.substr(0,2);
            // alert(am);
            let time = st_time.substr(2,st_time.length-3);
            $(".contact-font1").text(am);
            $(".contact-font2").text(time + ":00");

            $("#contact-time-text-outter").text(st_time);
        })
                
//          연락 가능시간 (시간선택 2)
        $(".contact-end-option").click(function(){
            if($(".contact-end-option").hasClass("active") == true){
                $(".contact-end-option").removeClass("active");
            }
            $(this).addClass("active");

            
            let end_time = $(".contact-end-option.active a").text();
            let am = end_time.substr(0,2);
            // alert(am);
            let time = end_time.substr(2,end_time.length-3);
            // alert(am+time);

            $(".contact-font3").text(am);
            $(".contact-font4").text(time + ":00");

            $("#contact-time-text-outter").text(end_time);
            // $("#contact-time-text-outter").text(st_titme+"-"+end_time);
        })
        if(text == "저장"){
            $(this).text("수정").css("color","#00c7ae");
            $("#contact-time-text-outter").show();
            $("#contact-option-outter").hide();
        }
        if(text == "수정"){
            $(this).text("저장").css("color","red");
            $("#contact-option-outter").show();
            $("#contact-start-ul").hide();
            $("#contact-time-text-outter").hide();
            $("#contact-end-ul").hide();
            $("#contact-start-button").click(function(){
                $("#contact-start-ul").show();
                if(this){
                    $(".contact-start-option").click(function(){
                        $("#contact-start-ul").hide();
                    })
                }
            })
            $("#contact-end-button").click(function(){
                $("#contact-end-ul").show();
                if(this){
                    $(".contact-end-option").click(function(){
                        $("#contact-end-ul").hide();
                    })
                }
            })
        }
    })
       $("#link-inner .upload-font").click(function(){
           let text=$(this).text();

           if(text == "등록하기"){
               $(this).text("저장").css("color","red");
               $("#link-input-outter").show();
               $("#link-url-img-outter").hide();
           }
           if(text == "저장"){
               $(this).text("수정").css("color","#00c7ae");
               $("#link-input-outter").hide();
               $("#link-url-img-outter").show();
           }
           if(text == "수정"){
               $(this).text("저장").css("color","red");
               $("#link-input-outter").show();
               $("#link-url-img-outter").hide();
           }
       })
       $("#gosu-qna-button").click(function(){
           let text=$(this).text();
           
           if(text == "등록하기"){
               $(this).text("저장").css("color,red");
               $(".gosu-qna-li-input-outter").show();
               $("#.gosu-qna-text").hide();
           }
           if(text == "저장"){
               $(this).text("수정").css("color","#00c7ae");
               $(".gosu-qna-li-input-outter").hide();
               $(".gosu-qna-text1").text($(".gosu-qna-li-input1").val());
               $(".gosu-qna-text2").text($(".gosu-qna-li-input2").val());
               $(".gosu-qna-text3").text($(".gosu-qna-li-input3").val());
               $(".gosu-qna-text4").text($(".gosu-qna-li-input4").val());
               $(".gosu-qna-text5").text($(".gosu-qna-li-input5").val());
                       
           }
           if(text == "수정"){
               $(this).text("저장").css("color","red");
               $(".gosu-qna-li-input-outter").show();
               $("#.gosu-qna-text").hide();
           }
       })
       $("#number-of-employees-title-outter .upload-font").click(function(){
	         let text=$(this).text();
	
	             
	         if(text == "등록하기"){
	             $(this).text("저장").css("color,red");
	             $("#number-of-employees-option-outter").show();
	             $("#number-of-employees-button").click(function(){
	                 $("#number-of-employees-ul-outter").show();
	             })
	             $(".number-of-employees-option1").click(function(){
	                 $("#number-of-employees-ul-outter").hide();
	             })
	
	             $(".number-of-employees-text").hide();
	             $("#number-of-employees-ul-outter").hide();
	         }
	         if(text == "저장"){
	             $(this).text("수정").css("color","#00c7ae");
	             $("#number-of-employees-option-outter").hide();
	             $(".number-of-employees-text").show();
	             $(".number-of-employees-option1").click(function(){
	             if($(".number-of-employees-option1").hasClass("active") == true){
	                 $(".number-of-employees-option1").removeClass("active");
	             }
                $(this).addClass("active");

                let mb_number = $(".number-of-employees-option1.active a").text();
                // let member = mb_number.substr(0,4);
                
                // $("#number-of-employees-text").text(mb);

                // alert(mb_number);
                
                // alert(am+time);

                // $("#number-of-employees-button").text();
                // $(".contact-font2").text(time + ":00");

                $("#number-of-employees-button").text(mb_number);
                })
            }
                if(text == "수정"){
                    $(this).text("저장").css("color,red");
                    $("#number-of-employees-option-outter").show();
                    $("#number-of-employees-button").click(function(){
                        $("#number-of-employees-ul-outter").show();
                    })
                    $(".number-of-employees-option1").click(function(){
                        $("#number-of-employees-ul-outter").hide();
                    })

                    $(".number-of-employees-text").hide();
                    $("#number-of-employees-ul-outter").hide();
                }
            })

       $(".number-of-employees-option1").click(function(){
               if($(".number-of-employees-option1").hasClass("active") == true){
                   $(".number-of-employees-option1").removeClass("active");
               }
               $(this).addClass("active");

               let mb_number = $(".number-of-employees-option1.active a").text();
               // let member = mb_number.substr(0,4);
               
               // $("#number-of-employees-text").text(mb);

               // alert(mb_number);
               
               // alert(am+time);

               // $("#number-of-employees-button").text();
               // $(".contact-font2").text(time + ":00");

            $("#number-of-employees-button").text(mb_number);
        })
        
        $("#photo-video-button").click(function(){
            $("#app-photo-video").show();
        })
        $("#div-photo-video-close").click(function(){
            $("#app-photo-video").hide();
        })

        $("#portfolio-button").click(function(){
            $("#app-portfolio").show();
        })
        $("#portfolio-close").click(function(){
            $("#app-portfolio").hide();
        })

        $("#gosu-service-detail-intro-header .upload-font").click(function(){
            let text=$(this).text();

            if(text == "등록하기"){
                $(this).text("저장").css("color,red");
                $("#gosu-service-detail-intro-input-outter").show();
                $(".gosu-service-detail-intro-text").hide();
            }
            if(text == "저장"){
                $(this).text("수정").css("color","#00c7ae");
                $("#gosu-service-detail-intro-input-outter").hide();
                $(".gosu-service-detail-intro-text").text($(".gosu-service-detail-intro-input").val());
                $(".gosu-service-detail-intro-text").show();
            }
            if(text == "수정"){
                $(this).text("저장").css("color","red");
                $("#gosu-service-detail-intro-input-outter").show();
            }
        })
	})  // $(function)의 마지막 중괄호
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
                    <span style = "font-size : 14px; font-weight: 400; color:rgb(12, 12, 12);">로그인</span>
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
    <!--중단 전체 보더 박스-->
    <div id = "desktop-1" class ="center">
        <div id = "desktop-outter">
            <div id = "desktop-inner">
                <div id = "desktop-main-outter">
                    <div id = "desktop-main-inner">
                        <div id = "profile-tab-1-1-outter" class = "center">
                            <div id = "profile-tab-1-1-inner" class = "center">
                                <div id  ="profile-tab-1-1-img" class = "center">
                                    <img src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNzIiIGhlaWdodD0iNzIiIHZpZXdCb3g9IjAgMCA3MiA3MiI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iYSIgZD0iTTAgMGg3MnY3MkgweiIvPgogICAgICAgIDxwYXRoIGlkPSJjIiBkPSJNMCAwaDcydjcySDB6Ii8+CiAgICA8L2RlZnM+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxtYXNrIGlkPSJiIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgPHVzZSB4bGluazpocmVmPSIjYSIvPgogICAgICAgIDwvbWFzaz4KICAgICAgICA8ZyBtYXNrPSJ1cmwoI2IpIj4KICAgICAgICAgICAgPG1hc2sgaWQ9ImQiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICAgICAgPHVzZSB4bGluazpocmVmPSIjYyIvPgogICAgICAgICAgICA8L21hc2s+CiAgICAgICAgICAgIDx1c2UgZmlsbD0iI0YyRjJGMiIgeGxpbms6aHJlZj0iI2MiLz4KICAgICAgICAgICAgPHBhdGggZmlsbD0iI0UxRTFFMSIgZD0iTTcwLjY3NyA2Ny4wMzJjLS45NTEtMi44NDQtMi42NzQtNS43MTItNS4yMTUtNy4zODEtNC44OS0zLjIzNi0xMC41ODctNC45NjItMTYuMDk1LTYuODEtMS4zMjktLjQ2NS0yLjY4LS45Ny0zLjg5My0xLjY5LTEuMDg1LS42NDMtMS40OTItMS45Ni0xLjc0My0zLjExNy0uMTEyLS42MTItLjE4LTEuMjQtLjIxNS0xLjg1NyAzLjk5NC01LjQ0OCA2LjY0NC0xNC4zNCA2LjY0NC0yMS42M0M1MC4xNiAxMy4xNzIgNDMuNzEyIDEwIDM1Ljc2IDEwYy03Ljk1NCAwLTE0LjQgMy4xNjYtMTQuNCAxNC41NDMgMCA3LjU1MSAyLjg0IDE2LjgxNCA3LjA3NSAyMi4xOTUtLjAzOS40MjQtLjA5Ljg1LS4xNjYgMS4yNzItLjI1MiAxLjE1Ny0uNjU5IDIuNDUtMS43NDIgMy4wOTItMS4yMTYuNzItMi41NjYgMS4xNzctMy44OTUgMS42NC01LjUwOSAxLjg0OS0xMS4yMDYgMy40NzgtMTYuMDk0IDYuNzE0LTIuNTQyIDEuNjctNC4yNjQgNC43MzItNS4yMTQgNy41NzZDLjM0NiA2OS45ODItLjA1NCA3My42MzguMDA2IDc2LjZoNzEuOTg4Yy4wNi0yLjk2Mi0uMzQtNi42MTctMS4zMTctOS41Njh6IiBtYXNrPSJ1cmwoI2QpIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" width = "100%">        
                                </div>
                                    <button id = "update-img-button" class = "center">
                                        <img src = "/img/카메라.png" style = "cursor: pointer;">
                                    </button>

                                <div id = "profile-tab-1-1-stack" class = "center">
                                    <div id = "tab-1-1stack-outter" class = "center">
                                        <div id = "tab-1-1-name-outter" class = "center">
                                            <p class = "tab-1-1-name-font">뭘봐 띠바</p>
                                        </div>

                                        <ul id = "tab-1-1-stack-detail-outter" class = "center">
                                            <li id = "stack-detail-1" class = "center">
                                                <span class = "stack-detail-font1">리뷰 평점</span>
                                                <span class = "stack-detail-font2">0</span>
                                            </li>

                                            <li id = "stack-detail-2" class = "center">
                                                <span class = "stack-detail-font1">리뷰수</span>
                                                <span class = "stack-detail-font2">0</span>
                                            </li>

                                            <li id = "stack-detail-3" class = "center">
                                                <span class = "stack-detail-font1">고용수</span>
                                                <span class = "stack-detail-font2">0</span>
                                            </li>
                                        </ul>

                                        <a href = "/고수프로필-활동분석.html">
                                            <span class = "activity-analysis-font">내 활동 분석</span>
                                            <img src = "/img/고수프로필관리.화살표1.png" style = "margin-top: 11px; margin-left: 3px;" width = "10px" height = "16px">
                                        </a>

                                    </div>
                                        
                                    <form action="/고수프로필-미리보기.html">
                                    <input type = "submit" value = "미리보기" class = "preview-button">
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div id = "advertisement-outter" class = "center">
                            <div id = "advertisement-inner" class = "center">
                                <span>
                                    <img src = "img/고수프로필 광고1.png" style = "margin-top: 7px; margin-left: 4px; float:left;">
                                </span>

                                <div id = "advertisement-text-outter" class = "center">
                                    <span class = "advertisement-text-font1">고용률 2배 올리고 싶다면</span>
                                    <h4 class = "advertisement-text-font2">리뷰 이벤트 등록하기</h4>
                                </div>

                                <img src = "/img/고수프로필 광고.화살표.png" style = "margin-top: 15px; margin-left: 17px;">
                            </div>
                        </div>

                        <div id = "gosu-name-outter1" class = "center">
                            <div id = "gosu-name-outter2" class = "center">
                                <div id = "gosu-name-outter3" class = "center">
                                    <h2 class = "my-profile-title-font">숨고 활동명</h2>  
                                    <span class = "update-font" style = "margin-top: -27px; margin-right: 1px;">수정</span>
                                </div>
                                
                                <div id = "gosu-use-name-outter" class = "center">
                                    <div id = "gosu-name">뚱이인데요~?</div>
                                    <div id = "gosu-input-outter">
                                    <input type = "text" id = "gosu-name-input">
                                    <small class= "gosu-name-input-intro">이름 또는 업체명을 입력해주세요</small>
                                    <div id = "gosu-name-input-count" class = "center">
                                        <span class= "gosu-input-count-font1">0</span>
                                        <span class= "gosu-input-count-font2">/30자</span>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id = "representative-service-outter" class = "center">
                            <div id = "representative-service-inner" class = "center">
                                <div id = "representative-service-main" class = "center">
                                    <h2 class = "my-profile-title-font">대표서비스</h2> 
                                    <span class = "representative-percent-font">18%</span>
                                    <span class = "update-font" style = "margin-left: 457px;">등록</span>             
                                </div>

                                <div id = "registration-select" class = "center"></div>
                            </div>     
                        </div>

                        <div id = "services-provided-outter" class = "center">
                            <div id = "services-provided-inner" class = "center">
                                <h2 class = "my-profile-title-font">제공 서비스</h2>
                                <span class = "update-font" style = "margin-left: 457px;margin-top:-28px">수정</span>
                            </div>

                            <div id = "middle-body-outter" class = "center">
                                <div id = "authentication-message-outter" class = "center">
                                    <div id = "authentication-message-inner" class = "center">
                                        <div id = "authentication-header">
                                            <i id = "emoticon-outter" class = "center"></i>
                                            <span class = "authentication-message-font">숨고 활동을 위해 인증이 필요해요!</span>
                                            <img src = "img/제공서비스.광고.화살표.png" style = "float:right; margin-right: 5px; margin-top: 2px;">
                                        </div>
                                    </div>
                                </div>

                                <div id = "service-select-outter" class = "center">
                                    <ul id = "service-select-inner" class = "center">
                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button1">+ 서비스 추가</button>
                                        </li>

                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button2" class = "center"style = "float:left">웨딩홀 대관
                                            </button>
                                        </li>

                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button3" class = "center"style = "float:left">스드메/웨딩플래너
                                            </button>
                                        </li>
                                        
                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button4" class = "center"style = "float:left">결혼식 사회자                                                    
                                            </button>
                                        </li>

                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button5" class = "center"style = "float:left">웨딩 헤어/메이크업
                                            </button>
                                        </li>

                                        <li id = "service-select-button1-outter" class = " center">
                                            <button id = "service-select-button6" class = "center"style = "float:left;">웨딩 케이크
                                            </button>
                                        </li>
                                    </ul>
                                </div>

                                <div id = "more-service-outter" class = "center">
                                    <h3 class= "more-service-title-font">추가로 제공 가능한 서비스를 알려주세요.</h3>
                                    <p class = "more-service-text-font">더 많은 고객을 만날 기회가 생깁니다.</p>
                                    <ul id = "more-service-main-outter" class = "center">
                                        <li id = "more-service-1">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">파티/행사기획</p>
                                        </li>

                                        <li id = "more-service-2">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">웨딩 스냅 촬영(스튜디오/야외)</p>
                                        </li>

                                        <li id = "more-service-3">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">웨딩 꽃장식</p>
                                        </li>

                                        <li id = "more-service-4">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">백일상/돌상 대여</p>
                                        </li>

                                        <li id = "more-service-5">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">허니문</p>
                                        </li>

                                        <li id = "more-service-6">
                                            <div id = "plus-img"></div>
                                            <p class = "more-service-text-font" style = "margin-left: 14px; margin-top: -18px;">엽서 제작(초대장/청첩장)</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id = "one-line-intro-outter" class = "center">
                            <div id = "one-line-header-outter" class = "center">
                                <h2 class = "my-profile-title-font">한줄소개</h2>
                                <span class = "update-font" style = "margin-top: -27px; margin-right: 2px; color: red;">등록하기</span>
                            </div>

                            <div id = "one-line-intro-text-outter" class = "center">
                                <p class = "one-line-intro-text-font"></p>
                                <div id = "one-line-input-outter">
                                    <textarea id = "one-line-input-text" placeholder="고수 자신에 대한 소개"></textarea>
                                    <div id = "one-line-text-count-outtet" class = "center">
                                        <div id = "gosu-name-input-count" class = "center">
                                            <span class= "gosu-input-count-font1">0</span>
                                            <span class= "gosu-input-count-font2">/80자</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                         <div id = "my-self-outter" class = "center"> -->
<!--                             <div id = "my-self-header-outter" class = "center"> -->
<!--                                 <div id = "my-self-title-outter" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font" stlye="float:left;">본인 인증</h2> -->
<!--                                     <span class = "representative-percent-font" style = "margin-left: 75px; margin-top:-25px; float:left;">18%</span> -->
<!--                                     <span class= "my-self-button-font" style = "margin-top: -23px; margin-right: 1px;">인증받기</span> -->
<!--                                 </div> -->

<!--                                 <div id = "my-self-text-outter" class= "center"> -->
<!--                                     <p class= "my-self-text-font">인증이 완료되면 고객에게 인증마크가 보여지며, 인증한 번호로 고객과 연락하실 수 있어요</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                       <form action="" name="form1">
                       <div id = "activity-area-outter" class = "center">
                           <div id = "activity-area-header-outter" class = "center">
                               <div id = "activity-area-title-outter" >
                                   <h2 class = "my-profile-title-font">활동 지역</h2>
                                   <input type = "button" id="addrBtn" class = "update-font" style = " float:left; margin-top: -27px; margin-left : 582px; border:none; background-color: #fff;" value = "수정" onclick="sample6_execDaumPostcode()"></span>
                               </div>
                               			<!-- 주소검색후 여기에 값이 담김 -->
                                   <input type = "text" name="zipcode" id = "activity-area-text-outter" readonly>  
                           </div>
                       </div>
                       </form>
                        <div id = "distance-move-outter" class = "center">
                            <div id = "distance-move-inner" class = "center">
                                <div id = "distance-move-header-outter" class = "center">
                                    <div id = "distance-move-title-outter" class= "center">
                                        <h2 class = "my-profile-title-font">이동 가능 거리</h2>
                                        <span class = "update-font" style = "margin-top: -27px; margin-right: 2px;">수정</span>
                                    </div>
                                </div>       
                                
                                <div id = "distance-move-info-outter" class = "center">
                                    <div id = "distance-move-text-outter" class = "center"> 10Km 이동 가능 </div>
                                    <div id="map" style="width:620px;height:200px;"></div>
                                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e859e64191da3096ba185a534a48af0d&libraries=services"></script>
                                    
                                </div>
                            </div>
                            <div id = "distance-select-outter" class = "center">
                                <ul id = "distance-select-ul">
                                    <li id = "distance-select1" class = "select1">2Km</li>
                                    <li id = "distance-select1" class = "select1">5Km</li>
                                    <li id = "distance-select1" class = "select1">10Km</li>
                                    <li id = "distance-select1" class = "select1">25Km</li>
                                    <li id = "distance-select1" class = "select1">50Km</li>
                                    <li id = "distance-select1" class = "select1">100Km</li>
                                    <li id = "distance-select1" class = "select1">전국</li>
                                </ul>
                            </div>
                        </div>

                        <div id = "contact-time-outter" class = "center">
                            <div id = "contact-time-header-outter" class = "center">
                                <h2 class = "my-profile-title-font">연락 가능 시간</h2>
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                                <div id = "contact-time-text-outter"></div>
                                <div id = "contact-option-outter" class = "center">
                                    <div id = "contact-start-outter" class = "center">
                                        <div id = "contact-start-inner">
                                            <button id = "contact-start-button">
                                                <span class = "contact-font1">오전</span>
                                                <span class = "contact-font2">2:00</span>
                                            </button>
                                            <ul id = "contact-start-ul">
                                                <li id = "contact-start-option" class = "contact-start-option active">
                                                    <a id = "contact-start-font3">오전 12시</a>
                                                </li>
                                                
                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 1시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 2시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 3시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 4시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 5시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 6시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 7시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 8시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 9시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 10시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오전 11시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 12시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 1시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 2시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 3시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 4시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 5시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 6시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 7시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 8시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 9시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 10시</a>
                                                </li>

                                                <li id = "contact-start-option" class = "contact-start-option">
                                                    <a id = "contact-start-font3">오후 11시</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <span id = "contact-text-font3">부터</span>
                                    <div id = "contact-end-outter" class = "center">
                                        <div id = "contact-end-inner">
                                            <button id = "contact-end-button">
                                                <span class = "contact-font3">오전</span>
                                                <span class = "contact-font4">3:00</span>
                                            </button>
                                            <ul id = "contact-end-ul">
                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3" >오전 12시</a>
                                                </li>
                                                
                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 1시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 2시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 3시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 4시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 5시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 6시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 7시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 8시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 9시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 10시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오전 11시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 12시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 1시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 2시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 3시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 4시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 5시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 6시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 7시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 8시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 9시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 10시</a>
                                                </li>

                                                <li id = "contact-end-option" class = "contact-end-option">
                                                    <a id = "contact-start-font3">오후 11시</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <span id = "contact-text-font3">까지</span>
                                </div>
                            </div>
                        </div>

<!--                         <div id = "payment-method-outter" class = "center"> -->
<!--                             <div id = "payment-method-header-outter" class = "center"> -->
<!--                                 <div id = "payment-method-title-outter" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font">결제 수단</h2> -->
<!--                                     <span class = "representative-percent-font" style = "margin-left: 77px; margin-top: -25px; float:left">18%</span> -->
<!--                                     <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div id = "payment-method-text-outter" class= "center"> -->
<!--                                 <div id = "payment-method-text-1" class = "center"> -->
<!--                                     <span class = "payment-method-text-1-font">Tip</span> -->
<!--                                 </div> -->
<!--                                 <span class = "payment-method-text-font">숨고페이로 거래하고 고용 횟수를 올려보세요.</span> -->
<!--                             </div> -->
<!--                             <div id = "payment-method-input-outter" class = "border center"> -->
<!--                                 <p class = "payment-method-font1">제공 가능한 결제 수단을 알려주세요</p> -->
<!--                                 <ul id = "payment-method-input-ul-outter" class = "border center"> -->
<!--                                     <li id = "payment-method-input-li-1" class = "border center"> -->
<!--                                         <div id = "payment-method-input-li-1-1"> -->
<!--                                             <input type = "checkbox" > -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div id = "soomgo-pay-outter" class = "center"> -->
<!--                             <div id = "soomgo-pay-header-outter" class = "center"> -->
<!--                                 <div id = "payment-method-title-outter" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font">숨고페이 정산정보</h2> -->
<!--                                     <span class = "representative-percent-font" style = "margin-left: 140px; margin-top: -25px; float:left">18%</span> -->
<!--                                     <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div id = "soomgo-pay-text-outter" class= "center"> -->
<!--                                 <span class = "business-registration-text-font">정산정보를 미리 입력하고 빠르게 정산받으세요</span> -->
<!--                             </div> -->
<!--                         </div> -->

                        <div id = "number-of-employees-outter" class = "center">
                            <div id = "number-of-employees-title-outter" class = "center">
                                <h2 class = "my-profile-title-font">직원수</h2>
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                                <div id = "number-of-employees-text" class = "number-of-employees-text">직원</div>
                                <div id = "number-of-employees-option-outter" class = "center">
                                    <div id = "number-of-employees-option-inner" class = "center">
                                        <button id = "number-of-employees-button">
                                        
                                        </button>

                                    <ul id = "number-of-employees-ul-outter" class = "center">
                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 1명 (본인포함)
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 2명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 3명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 4명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 5명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 10명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 20명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 30명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 40명
                                            </a>
                                        </li>

                                        <li id = "number-of-employees-option1" class = "number-of-employees-option1">
                                            <a id = "number-of-employees-option1-1">
                                                직원 50명
                                            </a>
                                        </li>
                                        
                                    </ul>                                            
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         <div id = "business-registration" class = "center"> -->
<!--                             <div id = "business-registration-header" class = "center"> -->
<!--                                 <div id = "business-registration-title" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font">사업자등록증</h2> -->
<!--                                     <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span> -->
<!--                                 </div> -->

<!--                                 <div id = "business-registration-text" class = "center"> -->
<!--                                     <p class = "business-registration-text-font">허위정보에 대한 모든 책임은 본인에게 있습니다</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div id = "document-outter" class = "center"> -->
<!--                             <div id = "document-header" class = "center"> -->
<!--                                 <div id = "document-title" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font">자격증 및 기타 서류 등록</h2> -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div id = "document-info" class = "center"> -->
<!--                                 <div id = "document-info-header" class = "center"> -->
<!--                                     <div id = "document-info-title" class = "document-info-title-font">자격증 및 기타 서류</div> -->
<!--                                </div> -->
                                
<!--                                <div id = "document-warning-text-outter" class = "center"> -->
<!--                                     <div id = "document-warning-text-inner" class = "center"> -->
<!--                                         <img src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEwyMCAwIDIwIDIwIDAgMjB6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzIgLTMwMSkgdHJhbnNsYXRlKDE2IDI4MSkgdHJhbnNsYXRlKDE2IDIwKSIvPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiMzMjMyMzIiIGZpbGwtcnVsZT0ibm9uemVybyIgZD0iTTEwIDJjLTQuNDE2IDAtOCAzLjU4NC04IDhzMy41ODQgOCA4IDggOC0zLjU4NCA4LTgtMy41ODQtOC04LTh6bS44IDEySDkuMlY5LjJoMS42VjE0em0wLTYuNEg5LjJWNmgxLjZ2MS42eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTMyIC0zMDEpIHRyYW5zbGF0ZSgxNiAyODEpIHRyYW5zbGF0ZSgxNiAyMCkiLz4KICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgPC9nPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" width = "20px" height = "20px"> -->
<!--                                         <span class = "document-warning-text-font">개인/민감 정보를 삭제 후 등록해야 하며, 허위정보에 대한 모든 책임은 본인에게 있습니다.</span> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                                 <div id = "document-input-img-outter" class = "center"> -->
<!--                                     <ul id = "document-input-img-inner" class = "center"> -->
<!--                                         <li id = "document-img1" class = "center"> -->
<!--                                             <div id = "document-img1-1" class = "center"></div> -->
<!--                                         </li> -->

<!--                                         <li id = "document-img2" class = "center"> -->
<!--                                             <div id = "document-img1-2" class = "center"></div> -->
<!--                                         </li> -->

<!--                                         <li id = "document-img2" class = "center"> -->
<!--                                             <div id = "document-img1-2" class = "center"></div> -->
<!--                                         </li> -->

<!--                                         <li id = "document-img2" class = "center"> -->
<!--                                             <div id = "document-img1-2" class = "center"></div> -->
<!--                                         </li> -->
<!--                                         <li id = "document-img2" class = "center"> -->
<!--                                             <div id = "document-img1-2" class = "center"></div> -->
<!--                                         </li> -->
<!--                                     </ul> -->
<!--                                 </div>      -->
<!--                             </div> -->
<!--                         </div> -->

<!--                         <div id = "issuance-of-invoice-outter" class = "center"> -->
<!--                             <div id = "issuance-of-invoice-header" class = "center"> -->
<!--                                 <h2 class = "my-profile-title-font">세금계산서 발행</h2> -->
<!--                                 <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span> -->
<!--                             </div> -->
<!--                             <div id = "issuance-of-invoice-click-outter" style = "margin-top: 10px;"> -->
<!--                                 <div id = "issuance-of-invoice-meassge"> -->
<!--                                     <div id = "issuance-of-invoice-meassge-img"> -->
<!--                                         <span data-v-d0ae0926="" data-v-fa166398="" class="sg-icon-legacy black-100" style="width: 18px; height: 18px;"><svg width="20" height="20" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2Zm1 15h-2v-6h2v6Zm0-8h-2V7h2v2Z" fill="#000" fill-rule="evenodd"></path></svg> -->
<!--                                         </span> -->
<!--                                     </div> -->
<!--                                     서비스 금액 거래 증빙을 위한 세금계산서는 서비스 제공자(고수)가 서비스 의뢰인(고객)에게 발행해주는 것이 원칙입니다. -->
<!--                                 </div> -->
<!--                             </div> -->

<!--                             <div id = "issuance-of-invoice-click-inner"> -->
<!--                                 <div id = "issuance-of-invoice-click-inner-1"> -->
<!--                                     <div id = "issuance-of-invoice-click1"> -->
<!--                                         <input type = "radio" class = "issuance-of-invoice-click1-radio"> -->
<!--                                         <label class = "issuance-of-invoice-click1-label"> -->
<!--                                             <span class = "issuance-of-invoice-radio-outter1"> -->
<!--                                                 <span class = "issuance-of-invoice-radio-font1">네, 가능합니다</span> -->
<!--                                                 <span class = "issuance-of-invoice-radio-font2">아니요, 불가합니다</span> -->
<!--                                             </span> -->
<!--                                         </label> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

                        <div id = "gosu-service-detail-intro-outter" class = "center">
                            <div id = "gosu-service-detail-intro-header" class = "center">
                                <h2 class = "my-profile-title-font">고수 서비스 상세설명</h2>
                                <span class = "representative-percent-font" style = "margin-left: 160px; margin-top:-25px; float:left;">18%</span>
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                            </div>
                            <div class = "gosu-service-detail-intro-text" style = "margin-top: 10px; float:left;"></div>

                            <div id = "gosu-service-detail-intro-input-outter" style = "margin-top: 10px; float:left;">
                                <textarea id = "gosu-service-detail-intro-input" class = "gosu-service-detail-intro-input" placeholder="고객이 가장 꼼꼼히 보는 공간입니다. 고수님의 장점과 함께 서비스 특징, 서비스 제공 방법, 준비 사항을 자세히 적어주세요!"></textarea>
                                <div class = "gosu-service-detail-intro-count-outter">
                                    <div class = "gosu-service-detail-intro-count-inner">
                                        최소 30자
                                    </div>
                                </div>
                            </div>
                        </div>

<!--                         <div id = "price-outter" class = "center"> -->
<!--                             <div id = "price-header" class = ".center"> -->
<!--                                 <div id = "price-title" class = "center"> -->
<!--                                     <h2 class = "my-profile-title-font">가격</h2> -->
<!--                                     <span class = "price-font">βeta</span> -->
<!--                                     <a href = "/고수프로필-가격등록.html"> -->
<!--                                     <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span> -->
<!--                                     </a> -->
<!--                                 </div> -->

<!--                                 <div id = "price-text" class = "center"> -->
<!--                                     <p class = "business-registration-text-font">고수님과 채팅방이 활성화된 고객에게만 고수프로필에서 노출됩니다.</p>    -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

                        <div id = "career-outter" class = "center">
                            <div id = "career-header-outter" class = "center">
                                <div id = "career-title-outter" class = "center">
                                    <h2 class = "my-profile-title-font">경력</h2>
                                    <span class = "price-font" style = "font-size:.625rem;">NEW</span>
                                    <span class = "representative-percent-font" style = "margin-left: 80px; margin-top:-25px; float:left;">18%</span>
                                    <span class = "update-font" style = "margin-left: 457px; margin-top: -25px;">수정</span>             
                                </div>
                            </div>

                            <div id = "career-text-outter" class = "center">
                                <div id = "career-text-inner" class = "center">
                                    <div id = "career-text" class = "center">
                                        상세한 경력을 작성하고<br/>
                                        경쟁력있는 프로필을 만들어보세요.      
                                    </div>
                                    <form action="/고수프로필-경력.html">
                                    <button id = "career-button">경력 등록하기</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div id = "education-outter" class = "center">
                            <div id = "education-inner" class = "center">
                                <h2 class = "my-profile-title-font">학력</h2>
                                <span class = "price-font" style = "font-size:.625rem;">NEW</span>
                                <span class = "representative-percent-font" style = "margin-left: 80px; margin-top:-25px; float:left;">18%</span>
                                <a href = "고수프로필-학력.html">
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                                </a>
                            </div>
                        </div>

                        <div id = "portfolio-outter" class = "center">
                            <div id = "portfolio-inner" class = "center">
                                <h2 class = "my-profile-title-font">포트폴리오</h2>
                                <img src = "img/고수프로필관리느낌표.png" width = "18px" height = "18px" style = "float:left; margin-left: 85px; margin-top: -22px; cursor: pointer;">
                                <span class = "price-font" style = "margin-left: 110px;font-size: .625rem;">NEW</span>
                                <span class = "representative-percent-font" style = "margin-left: 150px; margin-top:-25px; float:left;">18%</span>
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                            </div>

                            <div id = "portfolio-text-outter" class = "center">
                                <div id = "portfolio-text-inner" class = "center">
                                    <div id = "portfolio-text-body" class = "center">
                                        <p class = "portfolio-inner-title-font">고수님의 멋진 작업물을 보여주세요</p>
                                        <span class = "portfolio-inner-text-font">
                                        작업사진과 과정을 포함한 포트폴리오를<br/>
                                        등록할 경우 고수님을 선택할 확률이 높아집니다
                                        </span>
                                    </div>
                                    
                                    <button id = "portfolio-button">포트폴리오 등록하기</button>
                    
                                </div>
                            </div>
                        </div>

                        <div id = "photo-video-outter" class = "center">
                            <div id = "photo-video-header" class = "center">
                                <h2 class = "my-profile-title-font">사진 및 동영상</h2>
                                <span class = "representative-percent-font" style = "margin-left: 115px; margin-top:-25px; float:left;">18%</span>
                            </div>

                            <div id = "photo-video-body" class = "center">
                                <img src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTY0IC00NTApIHRyYW5zbGF0ZSg0OCAyMTkpIHRyYW5zbGF0ZSgxNiAxNDQpIHRyYW5zbGF0ZSgwIDg3KSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjEyIiBmaWxsPSIjRUFGQUY5Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS4yNjkiIGQ9Ik0wIDUuNzY2bDMuMTA4LTIuODgzaDQuMDY4TDEwLjQxNiAwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg2LjUgNi41KSIvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzAwQzdBRSIgZD0iTTIuMDAyIDguMDZjLjIzMiAwIC40Mi4xODcuNDIuNDE4djIuMzY5YzAgLjIzMS0uMTg4LjQxOS0uNDIuNDE5SC40MmMtLjIzMSAwLS40MTktLjE4OC0uNDE5LS40MlY4LjQ3OWMwLS4yMzEuMTg4LS40MTkuNDE5LS40MTloMS41ODN6bTQuMDM1LTIuNDA2Yy4yMzIgMCAuNDIuMTg4LjQyLjQydjQuNzczYzAgLjIzMS0uMTg4LjQxOS0uNDIuNDE5SDQuNDU0Yy0uMjMxIDAtLjQxOS0uMTg4LS40MTktLjQyVjYuMDc0YzAtLjIzMS4xODgtLjQxOS40Mi0uNDE5aDEuNTgyem00LjQ0LTIuMDA0Yy4yMyAwIC40MTguMTg4LjQxOC40MnY2Ljc3N2MwIC4yMzEtLjE4Ny40MTktLjQxOS40MTlIOC44OTNjLS4yMzEgMC0uNDE5LS4xODgtLjQxOS0uNDJWNC4wN2MwLS4yMzEuMTg4LS40MTkuNDItLjQxOWgxLjU4MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDYuNSA2LjUpIi8+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" width = "24px" height = "24px" style= "float:left;" >
                                <p class = "photo-video-body-font">평균
                                    <strong class = "photo-video-st-font">8개의 사진/동영상</strong>
                                    을 고수들이 등록했어요.
                                </p>
                            </div>

                            <div id = "photo-video-img-outter" class = "center">
                                <ul id = "photo-video-img-inner" class = "center">
                                    <li id = "photo-video-img1" class = "center">
                                        <div id = "photo-video-img1-1" class = "center"></div>
                                    </li>

                                    <li id = "photo-video-img2" class = "center">
                                        <div id = "photo-video-img1-2" class = "center"></div>
                                    </li>

                                    <li id = "photo-video-img2" class = "center">
                                        <div id = "photo-video-img1-2" class = "center"></div>
                                    </li>

                                    <li id = "photo-video-img3" class = "center">
                                        <div id = "photo-video-img1-3" class = "center"></div>
                                    </li>
                                    
                                    <li id = "photo-video-img2" class = "center">
                                        <div id = "photo-video-img1-2" class = "center"></div>
                                    </li>

                                    <li id = "photo-video-img2" class = "center">
                                        <div id = "photo-video-img1-2" class = "center"></div>
                                    </li>
                                    

                                    
                                </ul>

                                <div id = "photo-video-button-outter" class = "center">
                                   <p class = "photo-video-inner-font">고수님을 나타내는 사진과 동영상<br/>
                                    을 등록하고 고수님을 표현해보세<br/>
                                    요 (장비, 업무환경 등)
                                    </p> 

                                    <button id = "photo-video-button">사진/동영상 등록하기</button>
                                </div>
                            </div>
                        </div>

                        <div id = "gosu-qna-outter" class = "center">
                            <div id = "gosu-qna-header-title-outter">
                                <div id = "gosu-qna-header-title-inner">
                                    <h2 class = "gosu-qna-header-title-font">질문답변</h2>
                                    <span class = "gosu-qna-percentage">10%</span>
                                    <div id = "gosu-qna-button-outter">
                                        <div id = "gosu-qna-button-inner">
                                            <div id = "gosu-qna-button">등록하기</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id = "gosu-qna-main-outter">
                                <ul id = "gosu-qna-main-inner">
                                    <li class = "gosu-qna-li-outter">
                                        <div class = "gosu-qna-li-inner">
                                            Q. 서비스가 시작되기 전 어떤 절차로 진행하나요?
                                            <div class = "gosu-qna-text1" style = "margin-top: 5px;"></div>
                                        </div>
                                        <div class = "gosu-qna-li-input-outter">
                                            <textarea class = "gosu-qna-li-input1" placeholder="상담, 예약,서비스 진행,대금 나부까지 어떻게 진행하는지 자세히 적어주세요."></textarea>
                                            <div class = "gosu-qna-li-length-count-outter">
                                                <div class = "gosu-qna-li-length-count-inner">
                                                    최소 30자
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li class = "gosu-qna-li-outter">
                                        <div class = "gosu-qna-li-inner">
                                            Q. 어떤 서비스를 전문적으로 제공하나요?
                                            <div class = "gosu-qna-text2" style = "margin-top: 5px;"></div>
                                        </div>
                                        <div class = "gosu-qna-li-input-outter">
                                            <textarea class = "gosu-qna-li-input2" placeholder="제공하는 서비스를 조금 더 구체적으로 설명해주세요."></textarea>
                                            <div class = "gosu-qna-li-length-count-outter">
                                                <div class = "gosu-qna-li-length-count-inner">
                                                    최소 30자
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li class = "gosu-qna-li-outter">
                                        <div class = "gosu-qna-li-inner">
                                            Q. 서비스의 견적은 어떤 방식으로 산정 되나요?
                                            <div class = "gosu-qna-text3" style = "margin-top: 5px;"></div>
                                        </div>
                                        <div class = "gosu-qna-li-input-outter">
                                            <textarea class = "gosu-qna-li-input3" placeholder="답변을 추가해주세요."></textarea>
                                            <div class = "gosu-qna-li-length-count-outter">
                                                <div class = "gosu-qna-li-length-count-inner">
                                                    최소 30자
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li class = "gosu-qna-li-outter">
                                        <div class = "gosu-qna-li-inner">
                                            Q. 완료한 서비스 중 대표적인 서비스는 무엇인가요? 소요 시간은 얼마나 소요 되었나요?
                                            <div class = "gosu-qna-tex4t" style = "margin-top: 5px;"></div>
                                        </div>
                                        <div class = "gosu-qna-li-input-outter">
                                            <textarea class = "gosu-qna-li-input4" placeholder="답변을 추가해주세요."></textarea>
                                            <div class = "gosu-qna-li-length-count-outter">
                                                <div class = "gosu-qna-li-length-count-inner">
                                                    최소 30자
                                                </div>
                                            </div>
                                        </div>
                                    </li>

                                    <li class = "gosu-qna-li-outter">
                                        <div class = "gosu-qna-li-inner">
                                            Q. A/S 또는 환불 규정은 어떻게 되나요?
                                            <div class = "gosu-qna-text5" style = "margin-top: 5px;"></div>
                                        </div>
                                        <div class = "gosu-qna-li-input-outter">
                                            <textarea class = "gosu-qna-li-input5" placeholder="답변을 추가해주세요."></textarea>
                                            <div class = "gosu-qna-li-length-count-outter">
                                                <div class = "gosu-qna-li-length-count-inner">
                                                    최소 30자
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div id = "link-outter" class = "center">
                            <div id = "link-inner" class = "center">
                                <h2 class = "my-profile-title-font">링크</h2>
                                <span class = "upload-font" style = "margin-top: -25.5px;">등록하기</span>
                                <ul id = "link-input-outter" class = "center">
                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">홈페이지</span>
                                        <input id = "link-input-inner"type = "text" placeholder="홈페이지 URL을 입력하세요.">
                                    </li>

                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">페이스북</span>
                                        <input id = "link-input-inner"type = "text" placeholder="페이스북 URL을 입력하세요.">
                                    </li>

                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">트위터</span>
                                        <input id = "link-input-inner"type = "text" placeholder="트위터 URL을 입력하세요.">
                                    </li>

                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">인스타그램</span>
                                        <input id = "link-input-inner"type = "text" placeholder="인스타그램 URL을 입력하세요.">
                                    </li>

                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">블로그</span>
                                        <input id = "link-input-inner"type = "text" placeholder="블로그 URL을 입력하세요.">
                                    </li>

                                    <li id = "home-page-input-outter" class = "center">
                                        <span class = "link-input-font">카카오 스토리</span>
                                        <input id = "link-input-inner"type = "text" placeholder="카카오 스토리 URL을 입력하세요.">
                                    </li>
                                </ul>
                                
                                <ul id = "link-url-img-outter">
                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img1"></div>
                                        </li>
                                    </a>
                                    
                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img2"></div>
                                        </li>
                                    </a>

                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img3"></div>
                                        </li>
                                    </a>
                                    
                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img4"></div>
                                        </li>
                                    </a>

                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img5"></div>
                                        </li>
                                    </a>

                                    <a href = "">
                                        <li id = "link-url-img-inner">
                                            <div id = "link-url-img6"></div>
                                        </li>
                                    </a>
                                </ul>
                            </div>
                        </div>

                        <div id = "review-event-outter" class = "center">
                                <div id = "review-event-inner" class = "center">
                                    <div id = "review-event-main" class = "center">
                                        <h2 class = "my-profile-title-font">리뷰</h2>
                                        <span class = "representative-percent-font" style = "margin-left: 40px; margin-top:-25px; float:left;">18%</span>
                                    </div>
                                </div>

                                <div id = "advertisement-outter" class = "center" style = "margin-bottom: 16px;">
                                    <div id = "advertisement-inner" class = "center">
                                        <span>
                                            <img src = "img/고수프로필 광고1.png" style = "margin-top: 7px; margin-left: 4px; float:left;">
                                        </span>
    
                                        <div id = "advertisement-text-outter" class = "center">
                                            <span class = "advertisement-text-font1">고용률 2배 올리고 싶다면</span>
                                            <h4 class = "advertisement-text-font2">리뷰 이벤트 등록하기</h4>
                                        </div>
    
                                        <img src = "/img/고수프로필 광고.화살표.png" style = "margin-top: 15px; margin-left: 17px;">
                                    </div>
                                </div>

                                <div id = "review-summary" class = "center">
                                    <div id = "summary-1" class = "center summary-1-font">0</div>
                                    <div id = "summary-2" class = "center">
                                        <ul id = "summary-2-inner" class = "center">
                                            <li id = "summary-2-img-outter">
                                                <img src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" width = "24px" height="18" style = "margin-top: -11px;">
                                            </li>

                                            <li id = "summary-2-img-outter">
                                                <img src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" width = "24px" height="18" style = "margin-top: -11px;">
                                            </li>

                                            <li id = "summary-2-img-outter">
                                                <img src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" width = "24px" height="18" style = "margin-top: -11px;">
                                            </li>

                                            <li id = "summary-2-img-outter">
                                                <img src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" width = "24px" height="18" style = "margin-top: -11px;">
                                            </li>

                                            <li id = "summary-2-img-outter">
                                                <img src = "https://assets.cdn.soomgo.com/icons/icon-common-review-star-small-empty.svg" width = "24px" height="18" style = "margin-top: -11px;">
                                            </li>
                                        </ul>

                                        <div id = "summary-2-text">0개 리뷰</div>
                                    </div>
                                </div>
                            </div>

                            <div id = "last-section" class ="center">
                                <button id = "last-section-button">
                                    <div id = "img-outter" class = "center">
                                        <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8ZGVmcz4KICAgICAgICA8cGF0aCBpZD0iNHR3b2gyYTBnYSIgZD0iTTAgMGgzMnYzMkgweiIvPgogICAgICAgIDxwYXRoIGQ9Ik00LjIzNi4xODVhLjY5Ni42OTYgMCAwIDAtLjY1My40NzdMLjE2IDExLjMzN0MtLjEyOCAxMi40OTEtLjkzNiAxOCA3LjcxIDIzLjk3NEEuMTUuMTUgMCAwIDAgNy44IDI0YzEwLjU3OC0uNTkgMTIuODg4LTUuNjc1IDEzLjI3Mi02LjgwM2wyLjkwNC0xMC44MmEuNjczLjY3MyAwIDAgMC0uMjk0LS43NDNMMTQuODE2IDAgNC4yMzYuMTg1eiIgaWQ9InJ5Z3NyNXJ6dGMiLz4KICAgICAgICA8cGF0aCBkPSJNMy4wMDUuMTQyYS4yMjUuMjI1IDAgMCAwLS4yMTIuMTU1TC4xNjcgOC41MjhzLTEuNjczIDQuNTkxIDUuNTcyIDkuNjI4Yy4wMjYuMDE4LjA2LjAyNy4wOTEuMDI2IDguODY3LS41IDkuOTM0LTUuMjYyIDkuOTM0LTUuMjYybDIuMjI5LTguMzQzYS4yMi4yMiAwIDAgMC0uMDk2LS4yNDJMMTEuMTA3IDAgMy4wMDUuMTQyeiIgaWQ9ImlnaGI0N3Z1dmciLz4KICAgICAgICA8bGluZWFyR3JhZGllbnQgeDE9IjYxLjM0MiUiIHkxPSIxLjMyOSUiIHgyPSIzMi43NjIlIiB5Mj0iOTguNDI0JSIgaWQ9IjdwcWN4ZHdiNWQiPgogICAgICAgICAgICA8c3RvcCBzdG9wLWNvbG9yPSIjQjFGRkZDIiBvZmZzZXQ9IjAlIi8+CiAgICAgICAgICAgIDxzdG9wIHN0b3AtY29sb3I9IiM0OUM2RkYiIG9mZnNldD0iMTAwJSIvPgogICAgICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgICAgICAgPGxpbmVhckdyYWRpZW50IHgxPSI2MC4wMzclIiB5MT0iLTIuMzE0JSIgeDI9IjMwLjU0NiUiIHkyPSIxMDAlIiBpZD0iMHY2Ymg0dWppaCI+CiAgICAgICAgICAgIDxzdG9wIHN0b3AtY29sb3I9IiNGREZFRkYiIG9mZnNldD0iMCUiLz4KICAgICAgICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iI0M1RUNGRiIgb2Zmc2V0PSI5OS4zMiUiLz4KICAgICAgICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iI0M1RUNGRiIgb2Zmc2V0PSIxMDAlIi8+CiAgICAgICAgPC9saW5lYXJHcmFkaWVudD4KICAgICAgICA8ZmlsdGVyIHg9Ii0xNTAlIiB5PSItMTQ4LjUlIiB3aWR0aD0iNDAwJSIgaGVpZ2h0PSIzOTclIiBmaWx0ZXJVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIGlkPSIwYW50YXdhbG5mIj4KICAgICAgICAgICAgPGZlT2Zmc2V0IGR4PSIyIiBkeT0iNCIgaW49IlNvdXJjZUFscGhhIiByZXN1bHQ9InNoYWRvd09mZnNldE91dGVyMSIvPgogICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSI1IiBpbj0ic2hhZG93T2Zmc2V0T3V0ZXIxIiByZXN1bHQ9InNoYWRvd0JsdXJPdXRlcjEiLz4KICAgICAgICAgICAgPGZlQ29sb3JNYXRyaXggdmFsdWVzPSIwIDAgMCAwIDAuMjE5NjA3ODQzIDAgMCAwIDAgMC42IDAgMCAwIDAgMC44NzA1ODgyMzUgMCAwIDAgMC43MDkzNTMxNDcgMCIgaW49InNoYWRvd0JsdXJPdXRlcjEiIHJlc3VsdD0ic2hhZG93TWF0cml4T3V0ZXIxIi8+CiAgICAgICAgICAgIDxmZU1lcmdlPgogICAgICAgICAgICAgICAgPGZlTWVyZ2VOb2RlIGluPSJzaGFkb3dNYXRyaXhPdXRlcjEiLz4KICAgICAgICAgICAgICAgIDxmZU1lcmdlTm9kZSBpbj0iU291cmNlR3JhcGhpYyIvPgogICAgICAgICAgICA8L2ZlTWVyZ2U+CiAgICAgICAgPC9maWx0ZXI+CiAgICA8L2RlZnM+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxtYXNrIGlkPSI4OHUycTl0YnhiIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgPHVzZSB4bGluazpocmVmPSIjNHR3b2gyYTBnYSIvPgogICAgICAgIDwvbWFzaz4KICAgICAgICA8ZyBtYXNrPSJ1cmwoIzg4dTJxOXRieGIpIj4KICAgICAgICAgICAgPHBhdGggZD0ibTI3LjExMiAxOC4zNTctLjE2OC0xMS4xM2EuNjY0LjY2NCAwIDAgMC0uNDg0LS42MjZMMTYuNDI4IDMuNjggNi4zNCA2Ljc2MmEuNjkzLjY5MyAwIDAgMC0uNDk2LjYzNGwtLjM3IDExLjEzNFM0Ljk5NCAyNC45OCAxNi4xNTEgMjguN2MuMDMuMDEuMDY1LjAxLjA5NSAwIDExLjIyNi0zLjkwMiAxMC44NjUtMTAuMzQzIDEwLjg2NS0xMC4zNDMiIGZpbGw9IiMxNTgyQUQiLz4KICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJyb3RhdGUoLTE2IDI4LjczIC0zLjc4OCkiPgogICAgICAgICAgICAgICAgPG1hc2sgaWQ9Im16M2g5N2t1d2UiIGZpbGw9IiNmZmYiPgogICAgICAgICAgICAgICAgICAgIDx1c2UgeGxpbms6aHJlZj0iI3J5Z3NyNXJ6dGMiLz4KICAgICAgICAgICAgICAgIDwvbWFzaz4KICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik00LjIzNi4xODVhLjY5Ni42OTYgMCAwIDAtLjY1My40NzdMLjE2IDExLjMzN0MtLjEyOCAxMi40OTEtLjkzNiAxOCA3LjcxIDIzLjk3NEEuMTUuMTUgMCAwIDAgNy44IDI0YzEwLjU3OC0uNTkgMTIuODg4LTUuNjc1IDEzLjI3Mi02LjgwM2wyLjkwNC0xMC44MmEuNjczLjY3MyAwIDAgMC0uMjk0LS43NDNMMTQuODE2IDAgNC4yMzYuMTg1eiIgZmlsbD0idXJsKCM3cHFjeGR3YjVkKSIgbWFzaz0idXJsKCNtejNoOTdrdXdlKSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxnIGZpbHRlcj0idXJsKCMwYW50YXdhbG5mKSIgdHJhbnNmb3JtPSJyb3RhdGUoLTE2IDM3LjU4IC0xNS45MTYpIj4KICAgICAgICAgICAgICAgIDxtYXNrIGlkPSJ4dHNmNjNyZXhpIiBmaWxsPSIjZmZmIj4KICAgICAgICAgICAgICAgICAgICA8dXNlIHhsaW5rOmhyZWY9IiNpZ2hiNDd2dXZnIi8+CiAgICAgICAgICAgICAgICA8L21hc2s+CiAgICAgICAgICAgICAgICA8cGF0aCBkPSJNMy4wMDUuMTQyYS4yMjUuMjI1IDAgMCAwLS4yMTIuMTU1TC4xNjcgOC41MjhzLTEuNjczIDQuNTkxIDUuNTcyIDkuNjI4Yy4wMjYuMDE4LjA2LjAyNy4wOTEuMDI2IDguODY3LS41IDkuOTM0LTUuMjYyIDkuOTM0LTUuMjYybDIuMjI5LTguMzQzYS4yMi4yMiAwIDAgMC0uMDk2LS4yNDJMMTEuMTA3IDAgMy4wMDUuMTQyeiIgZmlsbD0idXJsKCMwdjZiaDR1amloKSIgbWFzaz0idXJsKCN4dHNmNjNyZXhpKSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDxwYXRoIGQ9Im0xMy4zNDkgMTUuNDM4IDEuNzE4Ljc0OWEuMjU1LjI1NSAwIDAgMCAuMjM1LS4wMmw0LjUwOC0yLjg1MmMuMjI4LS4xNDQuNDc5LjExMS4yOTkuMzA1bC00LjE2NiA0LjQ4Yy0uMjQ3LjI2Ny0uNjg3LjI3MS0uOTA4LjAxbC0xLjk4NC0yLjM0MmMtLjE0Ny0uMTc1LjA3OS0uNDI1LjI5OC0uMzMiIGZpbGw9IiMyMzc0QTYiLz4KICAgICAgICAgICAgPHBhdGggZD0ibTE1Ljk0MyAxOC4xIDQuMTY2LTQuNDguMDAzLS4wMDNhLjIzNi4yMzYgMCAwIDAtLjMxLS4wMzVsLTQuNTA4IDIuODUxYS4yNTUuMjU1IDAgMCAxLS4yMzUuMDJsLTEuNzE4LS43NDdhLjI1LjI1IDAgMCAwLS4yODguMDY0bDEuOTgyIDIuMzRjLjIyLjI2MS42Ni4yNTcuOTA4LS4wMSIgZmlsbD0iIzAwOTJFRSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" width = "32px" height = "32px" style = "float: left;">
                                        <span class = "last-section-text">숨고 활동을 위해 인증이 필요해요!</span>
                                    </div>

                                    <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Im03IDE0IDUtNS01LTUiIHN0cm9rZT0iI0ZGRiIgc3Ryb2tlLXdpZHRoPSIxLjUiIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIi8+Cjwvc3ZnPgo=" width = "18px" height = "18px" style = "float:right; margin-top: 6px;">
                                </button>
                            </div>
                      
                        

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

    <div id = "app">
        <div id = "app-inner">
        <div id = "div" class = "center">
            <div id = "div-header-outter" class ="center">
                <h5 class= "header-font">대표서비스</h5>
                <button id = "header-close-button">x</button>
            </div>
    
            <div id = "div-body-outter" class = "center">
                <b class = "body-title-font">고수님의 대표 서비스를 선택해주세요.</b>
                <p class = "body-text-font">
                    <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTguNzE3IDE3Ljk5MUE4Ljk5NiA4Ljk5NiAwIDEgMSA5LjI4My4wMWE4Ljk5NiA4Ljk5NiAwIDAgMS0uNTY2IDE3Ljk4MnoiIGZpbGw9IiMwMEM3QUUiLz4KICAgICAgICA8cGF0aCBkPSJNMTAuNzkgNC4xNjNBLjU2Ni41NjYgMCAwIDAgMTAuMzkyIDRoLTQuODNBLjU2LjU2IDAgMCAwIDUgNC41NTZ2OC44ODhhLjU2LjU2IDAgMCAwIC41NjMuNTU2aDcuODc1Yy4zMSAwIC41NjItLjI0OS41NjItLjU1NnYtNS44OGEuNTUyLjU1MiAwIDAgMC0uMTY1LS4zOTNMMTAuNzkgNC4xNjN6bS0uMTY1IDEuMzVjMC0uMTQ4LjE4Mi0uMjIyLjI4OC0uMTE3bDEuNjc0IDEuNjUzYS4xNjYuMTY2IDAgMCAxLS4xMi4yODRoLTEuNjczYS4xNjguMTY4IDAgMCAxLS4xNjktLjE2NlY1LjUxM3ptLTQuMjE5LjcxYS4yOC4yOCAwIDAgMC0uMjgxLjI3N3YuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N0g5LjIyYS4yOC4yOCAwIDAgMCAuMjgxLS4yNzdWNi41YS4yOC4yOCAwIDAgMC0uMjgxLS4yNzhINi40MDZ6bS0uMjgxIDMuMDU1QS4yOC4yOCAwIDAgMSA2LjQwNiA5aDYuMTg4YS4yOC4yOCAwIDAgMSAuMjgxLjI3OHYuNTU1YS4yOC4yOCAwIDAgMS0uMjgxLjI3OEg2LjQwNmEuMjguMjggMCAwIDEtLjI4MS0uMjc4di0uNTU1em0uMjgxIDEuOTQ0YS4yOC4yOCAwIDAgMC0uMjgxLjI3OHYuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N2g2LjE4OGEuMjguMjggMCAwIDAgLjI4MS0uMjc3VjExLjVhLjI4LjI4IDAgMCAwLS4yODEtLjI3OEg2LjQwNnoiIGZpbGw9IiNGRkYiLz4KICAgIDwvZz4KPC9zdmc+Cg==" width = "18px">
                    아이콘 표시된 서비스를 제공하기 위해서는 사업자등록증 및 자격증/필수서류 인증이 필요합니다.
                </p>
                <p class = "body-text-font" style = "margin-bottom: 32px;">인증이 필요한 서비스를 제공하는 경우, 해당 서비스만 대표서비스로 선택할 수 있어요.</p>
    
                <div id = "body-button-outter" class = "center">
                    <button id = "body-button1">
                        <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTguNzE3IDE3Ljk5MUE4Ljk5NiA4Ljk5NiAwIDEgMSA5LjI4My4wMWE4Ljk5NiA4Ljk5NiAwIDAgMS0uNTY2IDE3Ljk4MnoiIGZpbGw9IiMwMEM3QUUiLz4KICAgICAgICA8cGF0aCBkPSJNMTAuNzkgNC4xNjNBLjU2Ni41NjYgMCAwIDAgMTAuMzkyIDRoLTQuODNBLjU2LjU2IDAgMCAwIDUgNC41NTZ2OC44ODhhLjU2LjU2IDAgMCAwIC41NjMuNTU2aDcuODc1Yy4zMSAwIC41NjItLjI0OS41NjItLjU1NnYtNS44OGEuNTUyLjU1MiAwIDAgMC0uMTY1LS4zOTNMMTAuNzkgNC4xNjN6bS0uMTY1IDEuMzVjMC0uMTQ4LjE4Mi0uMjIyLjI4OC0uMTE3bDEuNjc0IDEuNjUzYS4xNjYuMTY2IDAgMCAxLS4xMi4yODRoLTEuNjczYS4xNjguMTY4IDAgMCAxLS4xNjktLjE2NlY1LjUxM3ptLTQuMjE5LjcxYS4yOC4yOCAwIDAgMC0uMjgxLjI3N3YuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N0g5LjIyYS4yOC4yOCAwIDAgMCAuMjgxLS4yNzdWNi41YS4yOC4yOCAwIDAgMC0uMjgxLS4yNzhINi40MDZ6bS0uMjgxIDMuMDU1QS4yOC4yOCAwIDAgMSA2LjQwNiA5aDYuMTg4YS4yOC4yOCAwIDAgMSAuMjgxLjI3OHYuNTU1YS4yOC4yOCAwIDAgMS0uMjgxLjI3OEg2LjQwNmEuMjguMjggMCAwIDEtLjI4MS0uMjc4di0uNTU1em0uMjgxIDEuOTQ0YS4yOC4yOCAwIDAgMC0uMjgxLjI3OHYuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N2g2LjE4OGEuMjguMjggMCAwIDAgLjI4MS0uMjc3VjExLjVhLjI4LjI4IDAgMCAwLS4yODEtLjI3OEg2LjQwNnoiIGZpbGw9IiNGRkYiLz4KICAgIDwvZz4KPC9zdmc+Cg==" width = "18px">
                        웨딩 케이크
                    </button>
    
                    <button id = "body-button2">
                        <img src = "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTguNzE3IDE3Ljk5MUE4Ljk5NiA4Ljk5NiAwIDEgMSA5LjI4My4wMWE4Ljk5NiA4Ljk5NiAwIDAgMS0uNTY2IDE3Ljk4MnoiIGZpbGw9IiMwMEM3QUUiLz4KICAgICAgICA8cGF0aCBkPSJNMTAuNzkgNC4xNjNBLjU2Ni41NjYgMCAwIDAgMTAuMzkyIDRoLTQuODNBLjU2LjU2IDAgMCAwIDUgNC41NTZ2OC44ODhhLjU2LjU2IDAgMCAwIC41NjMuNTU2aDcuODc1Yy4zMSAwIC41NjItLjI0OS41NjItLjU1NnYtNS44OGEuNTUyLjU1MiAwIDAgMC0uMTY1LS4zOTNMMTAuNzkgNC4xNjN6bS0uMTY1IDEuMzVjMC0uMTQ4LjE4Mi0uMjIyLjI4OC0uMTE3bDEuNjc0IDEuNjUzYS4xNjYuMTY2IDAgMCAxLS4xMi4yODRoLTEuNjczYS4xNjguMTY4IDAgMCAxLS4xNjktLjE2NlY1LjUxM3ptLTQuMjE5LjcxYS4yOC4yOCAwIDAgMC0uMjgxLjI3N3YuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N0g5LjIyYS4yOC4yOCAwIDAgMCAuMjgxLS4yNzdWNi41YS4yOC4yOCAwIDAgMC0uMjgxLS4yNzhINi40MDZ6bS0uMjgxIDMuMDU1QS4yOC4yOCAwIDAgMSA2LjQwNiA5aDYuMTg4YS4yOC4yOCAwIDAgMSAuMjgxLjI3OHYuNTU1YS4yOC4yOCAwIDAgMS0uMjgxLjI3OEg2LjQwNmEuMjguMjggMCAwIDEtLjI4MS0uMjc4di0uNTU1em0uMjgxIDEuOTQ0YS4yOC4yOCAwIDAgMC0uMjgxLjI3OHYuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N2g2LjE4OGEuMjguMjggMCAwIDAgLjI4MS0uMjc3VjExLjVhLjI4LjI4IDAgMCAwLS4yODEtLjI3OEg2LjQwNnoiIGZpbGw9IiNGRkYiLz4KICAgIDwvZz4KPC9zdmc+Cg==" width = "18px">
                        웨딩 헤어/메이크업
                    </button>
    
                    <button id = "body-button3">
                        웨딩홀 대관
                    </button>
    
                    <button id = "body-button4">
                        스드메/웨딩플래너
                    </button>
    
                    <button id = "body-button5">
                        결혼식 사회자
                    </button>
                </div>
    
                <button id = "del-button">대표서비스 삭제</button>
            </div>
    
            <footer id = "footer-outter" class = "center">
                <button id = "footer-button">등록하기</button>
            </footer>
        </div>
        </div>
    </div>

    <div id = "app-self">
        <div id = "app-self-inner" class = "center">
            <div id = "self-verification-outter" class = "center">
                <h2 class = "self-header-font">본인인증</h2>
            </div>
    
            <div id  = "self-verification-text-outter" class = "center">
                <div id = "self-verification-text-inner">안전한 고수님의 활동을 위해 휴대폰 본인인증이 필요합니다.</div>
            </div>
    
            <div id = "self-verification-button-outter" class = "center">
                <button id = "self-verification-button1">본인 인증하기</button>
                <button id = "self-verification-button2">취소</button>
            </div>
        </div>
    </div>

    <div id = "app-profile-picture">
        <div id = "app-profile-picture-inner" class = "center">
            <div id = "app-profile-picture-body" class = "center">
                <header id = "profile-picture-header">
                    <h5 class = "profile-picture-title-font">프로필 사진 등록</h5>
                </header>
    
                <div id = "profile-picture-button-outter">
                    <button id = "profile-picture-button1">사진 등록하기</button>
                    <button id = "profile-picture-button2">취소</button>
                </div>
            </div>
        </div>
    </div>

    <div id = "app-photo-video">
        <div id = "app-photo-video-inner">
        <div id = "div-photo-video" class = "center">
            <header id = "div-photo-video-header" class = "center">
                <h5 id = "div-photo-video-header-title">사진 및 동영상</h5>
                <button id = "div-photo-video-close"></button>
            </header>
        
            <div id = "div-photo-video-body-outter" class = "center">
                <div id = "div-photo-video-body-title-outter" class = "center">
                    <img src = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTY0IC00NTApIHRyYW5zbGF0ZSg0OCAyMTkpIHRyYW5zbGF0ZSgxNiAxNDQpIHRyYW5zbGF0ZSgwIDg3KSI+CiAgICAgICAgICAgICAgICAgICAgICAgIDxjaXJjbGUgY3g9IjEyIiBjeT0iMTIiIHI9IjEyIiBmaWxsPSIjRUFGQUY5Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggc3Ryb2tlPSIjMDBDN0FFIiBzdHJva2UtbGluZWNhcD0icm91bmQiIHN0cm9rZS1saW5lam9pbj0icm91bmQiIHN0cm9rZS13aWR0aD0iMS4yNjkiIGQ9Ik0wIDUuNzY2bDMuMTA4LTIuODgzaDQuMDY4TDEwLjQxNiAwIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg2LjUgNi41KSIvPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iIzAwQzdBRSIgZD0iTTIuMDAyIDguMDZjLjIzMiAwIC40Mi4xODcuNDIuNDE4djIuMzY5YzAgLjIzMS0uMTg4LjQxOS0uNDIuNDE5SC40MmMtLjIzMSAwLS40MTktLjE4OC0uNDE5LS40MlY4LjQ3OWMwLS4yMzEuMTg4LS40MTkuNDE5LS40MTloMS41ODN6bTQuMDM1LTIuNDA2Yy4yMzIgMCAuNDIuMTg4LjQyLjQydjQuNzczYzAgLjIzMS0uMTg4LjQxOS0uNDIuNDE5SDQuNDU0Yy0uMjMxIDAtLjQxOS0uMTg4LS40MTktLjQyVjYuMDc0YzAtLjIzMS4xODgtLjQxOS40Mi0uNDE5aDEuNTgyem00LjQ0LTIuMDA0Yy4yMyAwIC40MTguMTg4LjQxOC40MnY2Ljc3N2MwIC4yMzEtLjE4Ny40MTktLjQxOS40MTlIOC44OTNjLS4yMzEgMC0uNDE5LS4xODgtLjQxOS0uNDJWNC4wN2MwLS4yMzEuMTg4LS40MTkuNDItLjQxOWgxLjU4MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDYuNSA2LjUpIi8+CiAgICAgICAgICAgICAgICAgICAgICAgIDwvZz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=" width = "24px" height = "24px">
                    <p id = "div-photo-video-body-text-outter" class = "center">평균
                        <strong class = "div-photo-video-body-text2">8개의 사진/동영상</strong>
                        을 고수들이 등록했어요.
                    </p>
                </div>
        
                <div id = "div-photo-video-body2-outter" class = "center">
                    <p class = "div-photo-video-body2-font1">사진 등록</p>
                    <p class = "div-photo-video-body2-font2">
                        직접 일하는 사진은 고객들에게 큰 도움이 됩니다
                        <br/>
                        (전/후 결과, 작업 과정, 장비 등)  
                    </p>
                    <button id = "div-photo-video-body2-button">사진 등록하기</button>
                </div>
        
                <div id = "div-photo-video-body3-outter" class = "center">
                    <p class = "div-photo-video-body2-font1">유튜브 등록</p>
                    <p class = "div-photo-video-body2-font2">
                        유튜브에 올린 고수님의 영상 URL을 입력하세요 
                    </p>
                    <input id = "photo-video-input-outter"type = "text" placeholder="URL 입력">
                    <button id = "div-photo-video-body2-button">유튜브 URL 등록하기</button>
                </div>
            </div>
        </div>    
        </div>
        </div>
    
        <div id = "app-portfolio">
            <div id = "app-portfolio-inner">
                <div id = "div-portfolio-outter" class = "border center">
                    <header id = "portfolio-header">
                        <h5 class = "portfolio-header-title">포트폴리오</h5>
                        <button id = "portfolio-close"></button>
                    </header>
        
                    <div id = "portfolio-body-outter">
                        <h4 class = "portfolio-body-title">서비스를 선택해 주세요</h4>
                        <div id = "portfolio-body2-outter">
                            <ul id = "portfolio-body2-inner">
                                <li id = "portfolio-check1-outter">
                                    <div id = "portfolio-check1-inner">
                                        <a href="/고수프로필-포트폴리오-2.html">
                                        <input type = "radio" style = "display: none;">
                                        <label id = "portfolio-check1-label">
                                            <span id = "portfolio-check1-radio"></span>
                                            <span class = "portfolio-check1-font">웨딩홀 대관</span>
                                        </label>
                                    </div>
                                </li>
            
                                <li id = "portfolio-check1-outter">
                                    <div id = "portfolio-check1-inner">
                                        <input type = "radio" style = "display: none;">
                                        <label id = "portfolio-check1-label">
                                            <span id = "portfolio-check1-radio"></span>
                                            <span class = "portfolio-check1-font">스드메/웨딩플래너</span>
                                        </label>
                                    </div>
                                </li>
            
                                <li id = "portfolio-check1-outter">
                                    <div id = "portfolio-check1-inner">
                                        <input type = "radio" style = "display: none;">
                                        <label id = "portfolio-check1-label">
                                            <span id = "portfolio-check1-radio"></span>
                                            <span class = "portfolio-check1-font">결혼식 사회자</span>
                                        </label>
                                    </div>
                                </li>
            
                                <li id = "portfolio-check1-outter">
                                    <div id = "portfolio-check1-inner">
                                        <input type = "radio" style = "display: none;">
                                        <label id = "portfolio-check1-label">
                                            <span id = "portfolio-check1-radio"></span>
                                            <span class = "portfolio-check1-font">웨딩 헤어/메이크업</span>
                                        </label>
                                    </div>
                                </li>
            
                                <li id = "portfolio-check1-outter">
                                    <div id = "portfolio-check1-inner">
                                        <input type = "radio" style = "display: none;">
                                        <label id = "portfolio-check1-label">
                                            <span id = "portfolio-check1-radio"></span>
                                            <span class = "portfolio-check1-font">웨딩 케이크</span>
                                        </label>
                                    </div>
                                </li>
                            </a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>


<!-- <div id="modal_layout"> -->
<!-- 	<div class="modal_dialog "> -->
<!-- 		<div class="modal_content "> -->
<!-- 			<header id="modal_header"> -->
<!-- 				<h5 id="modal_title">대표서비스</h5> -->
<!-- 				<button type="button" class="close">×</button> -->
<!-- 			</header> -->
<!-- 			<div id="modal_body" class="modal_body"> -->
<!-- 				<p class="title">고수님의 대표 서비스를 선택해주세요.</p> -->
<!-- 				<P class="desc">인증이 필요한 서비스를 제공하는 경우, 해당 서비스만 대표서비스로 선택할 수 있어요.</P> -->
<!-- 				<div class="chip_wrap"> -->
<!-- 					<button class="service_icon"> -->
<!-- 						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgP -->
<!-- 						HBhdGggZD0iTTguNzE3IDE3Ljk5MUE4Ljk5NiA4Ljk5NiAwIDEgMSA5LjI4My4wMWE4Ljk5NiA4Ljk5NiAwIDAgMS0uNTY2IDE3Ljk4MnoiIGZpbGw9IiMwMEM3QUUiLz4KICAgICAgICA8cGF0aCBkPSJNMTAuNzkgNC4xNjNBLjU2Ni41NjYgMCAwIDAgMTAuMzkyIDRoLTQuODNBLj -->
<!-- 						U2LjU2IDAgMCAwIDUgNC41NTZ2OC44ODhhLjU2LjU2IDAgMCAwIC41NjMuNTU2aDcuODc1Yy4zMSAwIC41NjItLjI0OS41NjItLjU1NnYtNS44OGEuNTUyLjU1MiAwIDAgMC0uMTY1LS4zOTNMMTAuNzkgNC4xNjN6bS0uMTY1IDEuMzVjMC0uMTQ4LjE4Mi0uMjIyLjI4OC0uMTE3bDEu -->
<!-- 						Njc0IDEuNjUzYS4xNjYuMTY2IDAgMCAxLS4xMi4yODRoLTEuNjczYS4xNjguMTY4IDAgMCAxLS4xNjktLjE2NlY1LjUxM3ptLTQuMjE5LjcxYS4yOC4yOCAwIDAgMC0uMjgxLjI3N3YuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N0g5LjIyYS4yOC4yOCAwIDAgMCAuMjgxLS4yNzdWNi -->
<!-- 						41YS4yOC4yOCAwIDAgMC0uMjgxLS4yNzhINi40MDZ6bS0uMjgxIDMuMDU1QS4yOC4yOCAwIDAgMSA2LjQwNiA5aDYuMTg4YS4yOC4yOCAwIDAgMSAuMjgxLjI3OHYuNTU1YS4yOC4yOCAwIDAgMS0uMjgxLjI3OEg2LjQwNmEuMjguMjggMCAwIDEtLjI4MS0uMjc4di0uNTU1em0uMjgxI -->
<!-- 						DEuOTQ0YS4yOC4yOCAwIDAgMC0uMjgxLjI3OHYuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N2g2LjE4OGEuMjguMjggMCAwIDAgLjI4MS0uMjc3VjExLjVhLjI4LjI4IDAgMCAwLS4yODEtLjI3OEg2LjQwNnoiIGZpbGw9IiNGRkYiLz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="사업자 등록증 또는 자격증/필수서류 인증이 필요할 때 보이는 아이콘"/> -->
<!-- 							국내이사 -->
<!-- 					</button> -->
<!-- 					<button class="service_icon"> -->
<!-- 						<img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgP -->
<!-- 						HBhdGggZD0iTTguNzE3IDE3Ljk5MUE4Ljk5NiA4Ljk5NiAwIDEgMSA5LjI4My4wMWE4Ljk5NiA4Ljk5NiAwIDAgMS0uNTY2IDE3Ljk4MnoiIGZpbGw9IiMwMEM3QUUiLz4KICAgICAgICA8cGF0aCBkPSJNMTAuNzkgNC4xNjNBLjU2Ni41NjYgMCAwIDAgMTAuMzkyIDRoLTQuODNBLj -->
<!-- 						U2LjU2IDAgMCAwIDUgNC41NTZ2OC44ODhhLjU2LjU2IDAgMCAwIC41NjMuNTU2aDcuODc1Yy4zMSAwIC41NjItLjI0OS41NjItLjU1NnYtNS44OGEuNTUyLjU1MiAwIDAgMC0uMTY1LS4zOTNMMTAuNzkgNC4xNjN6bS0uMTY1IDEuMzVjMC0uMTQ4LjE4Mi0uMjIyLjI4OC0uMTE3bDEu -->
<!-- 						Njc0IDEuNjUzYS4xNjYuMTY2IDAgMCAxLS4xMi4yODRoLTEuNjczYS4xNjguMTY4IDAgMCAxLS4xNjktLjE2NlY1LjUxM3ptLTQuMjE5LjcxYS4yOC4yOCAwIDAgMC0uMjgxLjI3N3YuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N0g5LjIyYS4yOC4yOCAwIDAgMCAuMjgxLS4yNzdWNi -->
<!-- 						41YS4yOC4yOCAwIDAgMC0uMjgxLS4yNzhINi40MDZ6bS0uMjgxIDMuMDU1QS4yOC4yOCAwIDAgMSA2LjQwNiA5aDYuMTg4YS4yOC4yOCAwIDAgMSAuMjgxLjI3OHYuNTU1YS4yOC4yOCAwIDAgMS0uMjgxLjI3OEg2LjQwNmEuMjguMjggMCAwIDEtLjI4MS0uMjc4di0uNTU1em0uMjgxI -->
<!-- 						DEuOTQ0YS4yOC4yOCAwIDAgMC0uMjgxLjI3OHYuNTU2YS4yOC4yOCAwIDAgMCAuMjgxLjI3N2g2LjE4OGEuMjguMjggMCAwIDAgLjI4MS0uMjc3VjExLjVhLjI4LjI4IDAgMCAwLS4yODEtLjI3OEg2LjQwNnoiIGZpbGw9IiNGRkYiLz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="사업자 등록증 또는 자격증/필수서류 인증이 필요할 때 보이는 아이콘"/> -->
<!-- 							가정이사(투룸이상) -->
<!-- 					</button> -->
<!-- 					<button disabled="disabled" class="service_icon_primary"> -->
<!-- 						ERP 개발 -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<button type="button" class="btn_reset">대표서비스 삭제 -->
<!-- 				</button> -->
<!-- 			</div> -->
<!-- 			<footer id="modal_footer"> -->
<!-- 				<button type="button" disabled="disabled" class="btn_primary">등록하기</button> -->
<!-- 			</footer> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->





