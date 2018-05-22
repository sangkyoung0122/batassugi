var $a = $('a'),
	$rentListA = $('.rentList a'),
	$applySeller = $('#applySeller'),
	$applyingSeller = $('.components').children('li:nth-child(2)');
	
	// 모달에 넣을 판매자신청 하는 form
var $applyForm = '<form action="registerApplySeller" id="ApplySellerForm" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return false;">';	
	$applyForm += '<div class="form-group">';
	$applyForm += '<label class="control-label col-xs-4">농지문서</label>';
	$applyForm += '<div class="col-xs-5">';
	$applyForm += '<input type="file" name="file" class="form-control" placeholder="농지문서추가" required></div></div>';
	$applyForm += '<div class="form-group">';
	$applyForm += '<label class="control-label col-xs-4">신청사유</label>';
	$applyForm += '<div class="col-xs-5">';
	$applyForm += '<input type="text" name="applyReason" class="form-control" placeholder="신청사유" required></div></div>';
	$applyForm += '<div class="form-group">';
	$applyForm += '<div class="col-xs-offset-4 col-xs-5">';
	$applyForm += '<button type="submit" class="btn btn-primary btn-block">신청하기</button></div></div></form>';
	
// 메뉴버튼 슬라이드 애니메이션
$('#sidebarCollapse').on('click', function() {
	$('#sidebar').toggleClass('active');
	$(this).toggleClass('active');
}); // $('#sidebarCollapse').on('click', function(){})

// 판매자신청 모달
function applyInfo(applyVo) { // ${applyVo}의 EL 값을 매개변수로 받아옴.
	if(applyVo.applyState === '') { // ${applySellerVo.applyState} 값이 없으면. 즉 판매자신청을 안했을경우
		
		$applySeller.on('click',function() { // 판매자 신청버튼을 클릭 시
			
			var $applyModal = new BootstrapDialog({ // 모달객체를 선언
				title : '<i class="fa fa-address-card-o fa-lg"></i> 판매자신청',
				message : $applyForm,
				closable : true
			}); //var $applyModal = new BootstrapDialog({})
			
			$applyModal.realize(); // modal.open()메서드를 사용하면 자동으로 호출되지만, 모달이 호출되기전에 조작을 하기위해서 사용.
			var $ApplySellerForm = $applyModal.getModalBody().find('#ApplySellerForm'); // 모달안에 있는 form을 담음.
			$ApplySellerForm.on('submit', function() { // 모달 안에 있는 신청하기 버튼을 눌렀을시
				$applyModal.close(); // 모달을 닫음.
				$applyModal.onHidden(function() { // 모달이 닫히고 나서 실행되는 function
					$ApplySellerForm.attr('onsubmit','return true;').submit(); // 디폴트 return false;의 값을 return true;로 바꾸고 submit 전송
				}) // $applyModal.onHidden(function(){})
			}); // $ApplySellerForm.on('submit', function(){})
			$applyModal.open(); // 모달을 호출.
		}); // $applySeller.on('click',function(){})
	} else { // ${applyVo.applyState} 값이 빈 값이 아니라면, 즉 판매자 신청을 했을 경우.
		$applySeller.removeAttr('id','applySeller'); // 판매자 신청 a태그의 id값을 제거.
		$applyingSeller.html('<a> <i class="fa fa-user-plus fa-lg"></i>판매자신청 정보보기</a>') // 판매자 신청 a태그에 판매자 신청 정보 보기로 바꿈.
		
		$applyingSeller.on('click',function() { // 판매자 신청 정보보기를 클릭 시
			var info = applyingInfo(applyVo); // 모달안에 넣어줄 table태그를 ${applySellerVo}값을 넣어서 반환받음
			var $applyingModal = new BootstrapDialog({ // 모달 객체 선언
				title : '<i class="fa fa-address-card-o fa-lg"></i> 판매자신청',
				message : info.applyingForm,
				closable : true
			}); // $applyingSeller.on('click',function(){})
			
			$applyingModal.realize(); // modal.open()메서드를 사용하면 자동으로 호출되지만, 모달이 호출되기전에 조작을 하기위해서 사용.
			$applyingModal.getModalBody().find('#doc').on('click', function() { // 모달 안에 문서보기 버튼을 클릭시 
				BootstrapDialog.alert({
					title : '<i class="fa fa-info-circle fa-lg"></i> 농지정보',
					message : info.farmerDocument,
					closable : true
				}); // BootstrapDialog.alert()
			}); // $applyingModal.getModalBody().find('#doc').on('click', function(){})
			
			$applyingModal.getModalBody().find('#confirm').on('click', function() { // 모달안에 확인버튼을 클릭시 
				$applyingModal.close(); // 모달을 닫음.
			}) // $applyingModal.getModalBody().find('#confirm').on('click', function(){})
			$applyingModal.open(); // 모달을 호출
		}); // $applyingSeller.on('click',function(){})
	} // else
} // function applyInfo(applyVo)

// 모달에 판매자신청 정보를 출력하기 위한 펑션
function applyingInfo(applyVo) {
	var applyingForm = '<table class="table table-condensed text-center"><thead><tr>';
		applyingForm += '<th class="text-center" style="width: 20%;">신청일</th>';
		applyingForm += '<th class="text-center">처리현황</th>';
		applyingForm += '<th class="text-center">신청사유</th>';
		applyingForm += '<th class="text-center">농지문서정보</th>';
		applyingForm += '</tr></thead><tbody><tr>';
		applyingForm += '<td>'+applyVo.applyDate+'</td>';
		applyingForm += '<td>'+applyVo.applyState+'</td>';
		applyingForm += '<td>'+applyVo.applyReason+'</td>';
		applyingForm += '<td><a id="doc" class="btn btn-primary">문서보기</a></td>';
		applyingForm += '</tr></tbody></table>';
		applyingForm += '<div class="text-right"><button id="confirm" class="btn btn-default">확인</button></div>';
	var farmerDocument = '<img src="'+applyVo.farmerDocument+'" class="img-thumbnail">';
	var info = {
		'applyingForm' : applyingForm,
		'farmerDocument' : farmerDocument
	} // info
	return info;
} // function applyingInfo(applyVo){})
	
// 헤더 애니메이션 이벤트 추가
$a.on('mouseenter', function() {
	$(this).addClass('animated pulse');
}).on('mouseleave', function() {
	$(this).removeClass('animated pulse');
}); // $a.on('mouseenter', function(){}).on('mouseleave', function(){})

// post전송 function
function sendPost(path, params) {
	var $f = $('<form></form>').attr({
		action : path,
		method : 'post'
	});
	for ( var key in params) {
		var value = params[key];
		var $objs = $('<input type="hidden"/>').attr({
			name : key,
			value : value
		});
		$f.append($objs);
	} // for ( var key in params){})
	$('body').append($f);
	$f.submit();
} // sendPost(path, params)

// 대여신청 상세정보 뷰 출력 event
var rentList = {
	paging : function(target, previous, end, path) {
		var param;
		if (target.is('#previousPage')) {
			param = previous;
		} else if (target.is('#nextPage')) {
			param = end;
		} else {
			param = target.text();
		}
		sendPost(path, {
			'pageNum' : param
		}) // sendPost(path, {})
	}, // paging
	detail : function(target, path, params) {
		sendPost(path, params)
	} // detail
} // rentList

// 대여신청 취소하기 이벤트
$rentListA.click(function() {
	var flag = '';
	var $rentNo = $(this).parents().children('td:nth(0)').text()
	BootstrapDialog.confirm({
		type : 'danger',
		message : "신청취소 하시겠습니까?",
		onhidden: function() {
			flag == 'true' ? sendPost('deleteRentByRentNo', {'rentNo':$rentNo}) : '';
			// flag가 true이면 post전송.
		},
		callback: function(result) {
			flag = [result == true ? 'true' : '']
			// result가 true면 flag에 'true'를 담음.
		} // callback;
	}); // BootstrapDialog.confirm({})
}); // $rentListA.click(function(){})