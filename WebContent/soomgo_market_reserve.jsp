<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String title = (String)request.getAttribute("title");
    	String optionTitle = (String)request.getAttribute("optionTitle");
    	String optionPrice = (String)request.getAttribute("optionPrice");
    	String year = (String)request.getAttribute("year");
    	String month = (String)request.getAttribute("month");
    	String day = (String)request.getAttribute("day");
    	String dayWeek = (String)request.getAttribute("dayWeek");
    	String time = (String)request.getAttribute("time");
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숨고 마켓 상품 예약하기 -승현</title>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <link rel="shortcut icon" type="image/x-icon" href="https://assets.cdn.soomgo.com/icons/logo/favicon_logo.svg">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/soomgo_market_reserve.css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/clear.css"/>
<script type="module">
	import { v4 as uuidv4 } from 'https://cdn.skypack.dev/uuid';
	window.uuidv4 = uuidv4;
</script>
  <script type="text/javascript">
  
  function payment(data) {
		
		const uid = window.uuidv4();
		
		
		let marketTitle = $("#marketTitle").text();
		let marketPrice = $("#marketPrice").text();
		let marketOption = $("#marketOption").text();
		let reserveDate = $("#reserveDate").text();
		let reserveTime = $("#reserveTime").text();
		
		IMP.init('imp54682524');	// 아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
		
		IMP.request_pay({	// param
			pg: "kakaopay.TC0ONETIME",	// pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
			pay_method: "card",	// 지불 방법
			merchant_uid: uid,	// 가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
			name: marketTitle + " " + marketOption + " " + reserveDate + " " + reserveTime,
			amount: marketPrice, 	// 금액
			buyer_email: "tkswk8093@naver.com",
			buyer_name: "장용준",
			buyer_tel: "01040968093"
		}, function (rsp) {	// callback
			if(rsp.success){
				alert("완료 -> imp_uid : " + rsp.imp_uid + " / merchant_uid(orderKey) : " + rsp.merchant_uid);
			} else {
				alert("실패 : 코드(" + rsp.error_code + ") 메시지(" + rsp.error_msg + ")");
			}
		});
		
	}
  
	$(function () {
		
		$(document).on("click", "#chkBox1, #chkBox2",function(){
			let chkBox1 = $('#chkBox1').is(':checked');
			let chkBox2 = $('#chkBox2').is(':checked');
			if(chkBox1 && chkBox2) {
				$(".pay-button").addClass("complete");
			} else {
				$(".pay-button").removeClass("complete");
			}
		})
		
		$(document).on("click", ".pay-button.complete", function () {
			let marketTitle = $("#marketTitle").text();
			let marketOption = $("#marketOption").text();
			let marketPrice = $("#marketPrice").text();
			let reserveDate = $("#reserveDate").text();
			let reserveTime = $("#reserveTime").text();
			swal({
		        title: "결제 정보 확인\n\n",
		        text: "상품명 : " + marketTitle + "\n\n상품 옵션 : " + marketOption + "\n\n상품 가격 : " + marketPrice + "\n\n예약 날짜 : " + reserveDate + "\n\n예약 시간 : " + reserveTime + "\n\n결제 수단 : Kakao Pay 카카오페이",
		        icon: "info",
		        buttons: true,
		        dangerMode: true,
		    }).then((willPay) => {
		    	if (willPay) {
	                const paymentData = {
	                	marketTitle,
	                    marketOption,
	                    marketPrice,
	                    reserveDate,
	                    reserveTime
	                };
	                payment(paymentData);
		    });
		   });
	});
		
		
		$(".informationPrivacy").click(function () {
			swal("숨고 회원 계정으로 마켓 상품을 구매하는 경우, 주식회사 브레이브모바일(이하 “회사”)은 사이트 이용을 위해 필요한 최소한의 범위로 개인정보를 수집합니다. 회사는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 다음과 같은 목적을 위하여 개인정보를 수집하고 이용합니다.\n\n"+
					"1. 개인정보의 수집 및 이용 목적 : 상품 구매 중개, 구매 및 요금 결제, 상담 및 불만 처리, 상품 구매에 따른 혜택 제공\n\n"+
					"2. 수집하는 개인정보 항목 : 상품 구매정보, 결제수단\n\n"+
					"3. 개인정보의 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보관하며, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 파기합니다.\n\n"+
					"전자상거래 등에서 소비자 보호에 관한 법률\n\n"+
					"1) 계약 또는 청약철회 등에 관한 기록 \n: 5년 보관\n\n"+
					"2) 대금결제 및 재화 등의 공급에 관한 기록 \n: 5년 보관\n\n"+
					"3) 소비자의 불만 또는 분쟁처리에 관한 기록 \n: 3년 보관\n\n"+
					"사용자는 개인정보 수집 및 이용에 대한 동의를 거부할 수 있으며, 동의 거부 시 마켓 상품 구매가 제한됩니다. 그밖의 내용은 회사의 이용약관 및 개인정보처리방침에 따릅니다.");
		})
		
		$(".informationThird").click(function () {
			swal("숨고 회원 계정으로 마켓 상품을 구매하는 경우, 주식회사 브레이브모바일(이하 “회사”)은 거래 당사자 간 원활한 의사소통, 상담, 서비스 제공 등 거래 이행을 위하여 필요한 최소한의 개인정보를 아래와 같이 제공합니다.\n\n" +
					"1. 개인정보를 제공받는 자 : 마켓 상품 판매자\n\n" +
					"2. 제공하는 개인정보 항목 : 이름, 상품 구매정보, 결제수단\n\n" +
					"3. 개인정보를 제공받는 자의 이용 목적 : 판매자와 구매자 간의 원활한 거래 진행, 본인의사의 확인, 상담 및 불만 처리, 서비스 제공, 상품 구매에 따른 혜택 제공\n\n" +
					"4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보관하며, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 파기합니다.\n\n" +
					"사용자는 개인정보 제공에 대한 동의를 거부할 수 있으며, 동의 거부 시 마켓 상품 구매가 제한됩니다. 그밖의 내용은 회사의 이용약관 및 개인정보처리방침에 따릅니다.");
		})
	})
  </script>
</head>
<body>
<div id ="total-header" class="sticky">
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

<!--------------------------------------------------------------------------------------------------------------->
    <!--중단 전체 보더 박스-->
<div id="app-body" class="center">
	<div id="app-container" class="center">
		<div id="app-container-inner" class="center">
   			<div id="app-header" class="center">
    			<h1>예약하기</h1>
   			</div>
   			<div id="reserve-notice" class="center border_radius">
   				<div>
   					<span style="width:20px; height:20px;">
   						<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" ;>
	   						<path d="M21.25 12C21.25 17.1086 17.1086 21.25 12 21.25C6.89137 21.25 2.75 17.1086 2.75 12C2.75 6.89137 6.89137 2.75 12 2.75C17.1086 2.75 21.25 6.89137 21.25 12ZM12.8628 10.2729C13.3926 9.97204 13.75 9.40276 13.75 8.75C13.75 7.7835 12.9665 7 12 7C11.0335 7 10.25 7.7835 10.25 8.75C10.25 9.40276 10.6074 9.97204 11.1372 10.2729C10.7518 10.5443 10.5 10.9928 10.5 11.5V16C10.5 16.8284 11.1716 17.5 12 17.5C12.8284 17.5 13.5 16.8284 13.5 16V11.5C13.5 10.9928 13.2482 10.5443 12.8628 10.2729Z" fill="rgb(80, 128, 250)" stroke="grey" stroke-width="1.5"></path>
   						</svg>
					</span>
					<span id="notice-content">
						결제금액은 서비스 완료 후 고수에게 전달됩니다
					</span>
				</div>
   			</div>
   			
   			<div id="product-summary" class="center">
   				<div id="product-summary-container" class="center">
   					<div id="summary-title-box">
   						<h3>예약 상품</h3>
   					</div>
   					<ul>
	   					<li>
	   						<span>상품명</span>
	   						<p id="marketTitle"><%=title %></p>
	   					</li>
	   					<li>
	   						<span>상품 옵션</span>
	   						<p id="marketOption"><%=optionTitle %></p>
	   					</li>
	   					<li>
	   						<span>상품 가격</span>
	   						<p id="marketPrice"><%=optionPrice %></p>
	   					</li>
   					</ul>
   				</div>
   			</div>
   			
   			<div id="product-reservation" class="center">
   				<div class="center">
   					<div id="reservation-title-box" class="center">
   						<h3>일정 정보</h3>
   						<p>예약 일시는 서비스 진행 당일입니다</p>
   					</div>
   					<table id="reservation-table">
   						<tr id="tr-row1">
   							<th>예약 날짜</th>
   							<td id="reserveDate"><%=year %>년 <%=month %>월 <%=day %>일 (<%=dayWeek %>)</td>
   						</tr>   						
   						<tr id="tr-row2">
   							<th>예약 시간</th>
   							<td id="reserveTime"><%=time %></td>
   						</tr>   						
   					</table>
   					
   				</div>
   			</div>
   			
   			<div id="payment-methods" class="center">
   				<h3>결제 수단</h3>
   				<div id="payment-methods-list" class="center">
   					<div id="payment-control">
   						<input type="radio" checked>
   						<span>Kakao Pay 카카오페이</span>
   					</div>
   				</div>
   			</div>
   			
   			<div id="amount" class="center">
   				<h3>결제 금액</h3>
   				<table id="amount-table">
   					<tr id="amount-tr-row1">
   						<th>서비스 금액</th>
   						<td>
   							<p><%=optionPrice %></p>
   						</td>
   					</tr>
   					<tr id="amount-tr-row2">
   						<th>최종 결제금액</th>
   						<td>
   							<p><%=optionPrice %></p>
   						</td>
   					</tr>
   				</table>
   				<div id="refund-policy" class="center">
   					<strong>💰 취소/환불은 어떻게 진행되나요?</strong>
   					<p class="policy-highlight">결제 직후 3시간 이내로 취소 시 전액 환불처리됩니다.</p>
   					<p class="policy-normal">결제 직후 3시간 이후엔 주문취소가 불가하며 고수님과 환불을 위한 별도의 협의가 필요합니다.</p>
   					<p class="policy-normal">주문취소는 구매내역에서 가능하며, 고수가 서비스를 취소한 경우 고객님의 결제금액이 전액 환불됩니다.</p>
   				</div>
   			</div>
   			
   			<div id="terms" class="center">
   				<h3>이용동의</h3>
   				<div id="payment-terms" class="center">
   					<ul>
   						<li>
   							<div>
   								<label>
   									<input type="checkbox" id="chkBox1"/>
   									<p>개인정보 수집 및 이용 동의(필수)</p>
   								</label>
   							</div>
   							<button type="button" class="informationPrivacy">보기</button>
   						</li>
   						<li>
   							<div>
   								<label>
   									<input type="checkbox" id="chkBox2"/>
   									<p>제 3자 정보 공유 동의(필수)</p>
   								</label>
   							</div>
   							<button type="button" class="informationThird ">보기</button>
   						</li>
   					</ul>
   				</div>
   				<div id="phone-number-notice" class="center">
   					<p>결제 후 실제 고객님의 휴대전화번호 대신 안심번호가 고수님에게 제공됩니다.</p>
   				</div>
   			</div>
   			
   			<div id="pay-button" class="center">
   				<button class="pay-button">결제하기</button>
   			</div>
   			
   		</div>
   	</div>
</div>
<!--------------------------------------------------------------------------------------------------------------->
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
<!--     <div class=modal-outer> -->
<!-- 		<div class="modal-body"> -->
<!-- 			<div class="modal-dialog center"> -->
<!-- 				<span tabindex="0"> </span> -->
<!-- 				<div class="modal-contents"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h5 class="modal-title"></h5> -->
<!-- 						<button type="button" class="modal-btn-close">x</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<span tabindex="0"></span> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>