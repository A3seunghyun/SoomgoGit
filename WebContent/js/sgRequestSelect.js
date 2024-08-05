$(function(){
		/* 전체 비활성화 */
		$(".message_wrapper").css("display", "none");
		
		/* modal On/Off */
		$(".info_button").click(function(){
			$(".modal_hidden").css("display","block");
			$("#app").css("position","fixed");
		});
		$(".modal_close_btn").click(function() {
			$(".modal_hidden").css("display", "none");
			$("#app").css("position", "");
		});
		// 모든 .wrapper 요소들 배열 형태로 관리 
		const $questionWrappers = $('.questions');	
		const $answerWrappers = $('.answers');	
		
		/*인덱스 설정*/
		let messageIndex = 0;
		let $qSection = $('#question_' + messageIndex);
		let $aSection = $('#answer_' + messageIndex)
		function updateIndex(messageIndex) {	// messageIndex 관리
			$qSection = $('#question_' + messageIndex);
			$aSection = $('#answer_' + messageIndex)
		}
		
		$("#service_infor_message").fadeIn(300 ,function() {	// 설명 + 첫요소 fadein
			$($questionWrappers.eq(0)).fadeIn(300);	
		});

		/* 순차적 fadeIn : 버튼 클릭 시 인덱스 증가, 다음 메세지박스 fadeIN  */
		$(".btn.btn_submit,.btn_primary").on("click", function() {
			nextMessageWrapper();
		});
		
		/* 다음 메세지박스 함수 */
		function nextMessageWrapper() {
			hasInputAnswer()	// 답변 호출
			$($qSection).find(".answer_sheet").fadeOut(300, function() {	
				$($aSection).fadeIn(300, function() {	// answer fadeIn + 인덱스 1 증가
					updateProgress();
					updateIndex(++messageIndex);
					if( ((messageIndex + 1) == $questionWrappers.length)) {	// 마지막 질문 이후 로그인 등장
						$("#last_login").fadeIn(300);
					}
					else {
						$($qSection).fadeIn(300);		// 다음 질문 등장
					}
					console.log("현재 인덱스" + messageIndex);
				});
			});
		}
		
		/* checkbox/radio/textarea 여부 확인 ->  선택/작성한 답변 출력 */
		function hasInputAnswer() {
			const $inputType = $qSection.find('input:first, textarea');
			let hasInput ="";
			if($inputType.length > 0){
				hasInput = $inputType.prop('type');
				console.log("타입 : " + hasInput)
			} // else if(인풋 있고 텍스트도 있을 때) { } 생각해보기
			else {
				return;
			}
			$aSection.find('.answer_text').text('');
			switch(hasInput) {
				case "checkbox" :
					let $myAnswerChecked = $qSection.find('.active');		// 체크된 답변 저장
					$myAnswerChecked.each(function(index) {
						let inputText = $(this).find(".text").contents().first().text().trim();
						console.log(inputText);
						if (index < $myAnswerChecked.length - 1) 
							$aSection.find('.answer_text').append("∙ "+ inputText + "<br>");	
						else
							$aSection.find('.answer_text').append("∙ "+ inputText);
					});
					break;
				case "radio" :
					let $myAnswerRadio = $qSection.find('.active');
					// let inputId = $myAnswerRadio.attr('id');
					// let inputText = $("label[for=" + inputId + "]").find(".text").contents().first().text().trim();
					let inputText = $myAnswerRadio.find(".text").contents().first().text().trim();
					$aSection.find('.answer_text').text(inputText);
					break;
				case "textarea" : 
					let $myAnswerTextarea = $qSection.find('textarea');
					let inputTextarea = $myAnswerTextarea.val();
					$aSection.find('.answer_text').text(inputTextarea);
					break;
				defalut : console.log("hasInput 오류 발생"); break;
			}
		};

		/* 버튼 관리 : checkbox */
		$(".checkbox_label").on("click", function() {
			const $checkboxLabel = $(this);	
			const isActive = $checkboxLabel.hasClass("active");

			if(isActive) {	// 이미 클릭 상태
				$checkboxLabel.removeClass("active");
				$checkboxLabel.find("img.box_icon").attr("src", "img/icon/img_icon_checkbox_none.PNG");
			} else {	// 미클릭 상태 
				$checkboxLabel.addClass("active");
      	 		$checkboxLabel.find("img.box_icon").attr("src", "img/icon/img_icon_checkbox_check.PNG");
			}
			ButtonState();
		});

		/* 버튼 관리 : radio */
		$(".circle_label").on("click", function() {
			const $circleLabel = $(this);
			const isActive = $(this).hasClass("active");
			if(!isActive) {	// 미클릭 상태 : 다른 버튼 비활성화, 누른 버튼 활성화
				$qSection.find(".circle_label").removeClass("active");
				$qSection.find(".circle_icon").attr("src", "img/icon/img_icon_radio_none.PNG");
				$circleLabel.find("img.circle_icon").attr("src", "img/icon/img_icon_radio_check.PNG");
				$circleLabel.addClass("active");
			}
			ButtonState();
		});

		/* 버튼 관리 : textarea */
		$(".textarea_field").on("input", function() {
			ButtonState();
		});
		
		/* 버튼 활성화 */
		function ButtonState() {
			const hasActiveCheckbox = $qSection.find(".checkbox_label.active").length > 0;
			const hasActiveCircle = $qSection.find(".circle_label.active").length > 0;
			const isTextarea = $qSection.find(".textarea_field").val();
			const hasActiveText = isTextarea !== "" 
								&& isTextarea !== null 
								&& isTextarea !== undefined;	
			if(hasActiveCheckbox || hasActiveCircle || hasActiveText) {	
				$qSection.find(".btn.btn_submit").removeClass("disable");
			} else {
				$qSection.find(".btn.btn_submit").addClass("disable");
			}
		}

		/* 수정 버튼 클릭 시 -> 몇 번 질문이었는지 정보 받고 수정해야 함 -> 수정 버튼마다 index 할당하고 해당 index 질문으로 연결??*/
		$(".btn.edit").on("click", function() {	
			$($aSection).hide();
			let tmp = messageIndex;
			let editIndex = $(this).parent().parent().attr('id').split('_')[1];
			messageIndex = editIndex;
			updateIndex(messageIndex);
			$qSection.find(".answer_sheet").fadeIn(300);
			messageIndex = tmp-1;
		});

		/* textarea 글자수 확인하기 */
		$(".text_length").on("input", function() {
			let content = $(this).val();
			if (content.length == 0 || content == '')
				$(this).parent().find(".input_length").text('0');
			else 
			$(this).parent().find(".input_length").text(content.length);
		});

		// 진행도 progressbar
		function updateProgress() {
			let nowPercent = messageIndex / $questionWrappers.length  * 100;
			document.getElementById('progress').value = nowPercent;	// HTML DOM 객체로 가져오기
			$('#progress_percent').text(Math.round(nowPercent) + "%"); 
		}
		
		
		
		
		
		
		
		
		
		
		
});