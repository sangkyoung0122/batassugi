<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <form class="form-horizontal" action="${pageContext.request.contextPath}/register" method="post"name="register" 
      id="register" enctype="multipart/form-data" >
        <%-- 판넬 헤드 : 회원가입 --%>
        <div class="panel-heading">
          <div class="panel-title text-left">
            <h3>회원가입</h3>
          </div>
        </div>

        <%-- 로그인을 panel form에 넣음 --%>
        <div class="panel panel-default">
          <%-- 필수 입력정보 헤드 --%>
          <div class="panel-heading">
            <div class="panel-title text-left">필수정보 입력</div>
          </div>
          <%-- 필수 입력정보 내용 : 2단 --%>
          <div class="row">
         	<%-- 1단 --%> 	
            <div class="col-md-6">
              <%-- 아이디 --%>
              <div class="form-group formFirst">
                <label class="control-label col-sm-3">아이디 <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="text" class="form-control" name="memberVo.id" id="id" 
                    placeholder="아이디를 입력하세요(영문, 3~10자 사이)" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"></span> <small id="checkIdView">  </small>
                  </div>
                </div>
              </div>
              <%-- 패스워드 --%>
              <div class="form-group">
                <label class="control-label col-sm-3"> 패스워드입력 <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="password" class="form-control" name="memberVo.password" id="password" 
                    placeholder="패스워드를 입력하세요" required="required">
                  </div>
                </div>
              </div>

              <%-- 패스워드 확인 --%>
              <div class="form-group">
                <label class="control-label col-sm-3">패스워드 확인 <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="password" class="form-control" id="cpassword" placeholder="패스워드 확인" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"></span> <small id="checkPasswordView"> </small>
                  </div>
                </div>
              </div>

              <%-- 회원이름 --%>
              <div class="form-group">
                <label class="control-label col-sm-3"> 이름 <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="text" class="form-control" name="memberVo.name" id="name" placeholder="당신의 이름을 넣어주세요" required="required">
                  </div>
                </div>
              </div>

              <%-- 회원 닉네임 --%>
              <div class="form-group">
                <label class="control-label col-sm-3"> 닉네임 <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="text" class="form-control" name="memberVo.nickname" id="nickname" placeholder="닉네임을 넣어주세요" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"></span> <small id="checknicknameView"></small>
                  </div>
                </div>
              </div>
            </div>
            
            <%-- 2단 --%>            
            <div class="col-md-6">
              <%-- 회원 이메일 --%>
               <div class="form-group formFirst">
                <label class="control-label col-sm-3"> 이메일 <span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 넣어주세요" required="required">
                  </div>
                </div>
              </div> 

              <%-- 회원 전화번호 --%>
              <div class="form-group">
                <label class="control-label col-sm-3">전화번호<span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="text" class="form-control" name="tel" id="tel" placeholder="전화번호를 입력하세요" required="required">
                  </div>
                </div>
              </div>

              <%-- 회원 주소 --%>
               <div class="form-group">
                <label class="control-label col-sm-3">주소<span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-8">
                  <div class="input-group col-xs-offset-1">
					<input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-sm" value="주소 검색"><br>
					<input type="text" class="form-control" name="address" id="sample6_address" placeholder="주소를 검색하세요" readonly="readonly">
                    <span class="input-group-addon"></span>
                  </div>
                </div>
              </div> 

              <%-- 회원 생년월일 --%>
              <div class="form-group">
                <label class="control-label col-sm-3">생년월일<span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="date" class="form-control" name="birthday" id="birthday" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"></span> <small id="checkBirthdayView">  </small>
                  </div>
                </div>
              </div> 

              <%-- 회원 성별 --%>
              <div class="form-group">
                <label class="control-label col-sm-3">Gender <span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <label> <input name="gender" type="radio" value="남성" checked> 남자 </label>    
                    <label> <input name="gender" type="radio" value="여성"> 여자 </label>
                  </div>
                </div>
              </div> 
              
              <%-- 현재 등급 --%>
              <div class="form-group">
                <label class="control-label col-sm-3">현재 등급 <span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <label> 현재 당신의 등급은 <span style="color: blue">초급</span>입니다. </label>    
                  </div>
                </div>
              </div> 
              
              
            </div>            
          </div><%-- 필수 입력정보 끝 --%>
          
          <%-- 부가정보 : 등급정보, 이미지 업로드 --%>
          
          <div class="panel-heading">
            <div class="panel-title text-left">부가정보 입력</div>
          </div>

		 <div class="row">
           <%--1단 --%>
           <div class="subInfo">
				<div class="col-md-6">
					<div class="form-group">
						<label class="control-label col-sm-3"> 
						<img src="${pageContext.request.contextPath}/resources/img/profile_img/default.png"
							width="100px" id="previewImg" /><br> 프로필 미리보기
						</label>
						<div class="col-md-8 col-sm-8">
							<div class="input-group formFirst">
								<div class="filebox"><div style="width: 30%;">&nbsp;</div>
									<input class="upload-name" value="파일선택" disabled="disabled" style="margin-left: 30px;">
									<label class="btn btn-primary" for="file">업로드</label>
									<input type="file" name="file" id="file" class="form-control upload upload-hidden" placeholder="프로필을 넣어주세요" onchange="LoadImg(this);" aria-describedby="file_upload" accept=".gif, .jpg, .png">
									<button type="button" class="btn btn-danger" onclick="ResetImgvalue();">취소</button>
								</div>
							</div>
						</div>
					</div>
				</div>
            <%-- 2단 --%> 
            <%-- 기호작물 --%>
            <div class="col-md-6">
            <div class="form-group">
          	<label class="control-label col-sm-3">기호 작물(3개까지 체크) <span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-9">
                  <%-- <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <c:forEach var="item" items="${list}">
        				<label > <input name="likeCrops" id="likeCrops${item.cropsVo.cropsNo}" type="checkbox" value="${item.cropsVo.cropsNo}"> ${item.cropsVo.cropsName} </label>
       				 </c:forEach> 
                  </div> --%>
                  <div class="col-xs-8">
					<select id="cropsSelect" class="form-control" style="margin-left: 10px;">
						<option value="">-----------선택-----------</option>
						<c:forEach items="${list}" var="item">
						<option value="${item.cropsVo.cropsNo}">${item.cropsVo.cropsName}</option>
						</c:forEach>
					</select>
					<span class="regCropsList" style="display: inline;">
					</span>
					<div class="" id="choise">
					</div>
					</div>
                </div>
			</div>
            </div>
            </div> <!-- subInfo -->
            </div><%--row --%>
            <%--제출 버튼 --%>
          
        </div>	<!-- 판넬 폼 종료 -->
              <div class="col-xs-12 registerBtn">
                <input name="submit" type="submit" value="회원가입" class="btn btn-primary">
              </div>
      </form><%-- form 영역 --%>
    </div><%-- 메인영역 --%>
  </div><%-- 전체 row --%>
</div><%-- 전체 container --%>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.jibunAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_address').value = fullAddr;
                $('#sample6_address').css('width', $('#sample6_address')[0].scrollWidth + 10);
            }
        }).open();
    }
    
     function LoadImg(value) {
          if(value.files && value.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                    $('#previewImg').attr('src', e.target.result);                    
               }
               reader.readAsDataURL(value.files[0]);
          }
          $('#previewImg').attr('src', "${pageContext.request.contextPath}/resources/img/profile_img/default.png");
          if ($('#previewImg').attr('class')=="animated fadeIn") {
     		 $('#previewImg').removeClass("animated fadeIn")
 		} else {
 			$('#previewImg').addClass("animated fadeIn")
 		}
     }
     
     
     function ResetImgvalue() {
    	// 프로필 이미지 리셋
	 	$("#file").val("");
	 	$('.upload-name').val('파일선택')
    	// 미리보기 이미지 리셋
    	$('#previewImg').attr('src', "${pageContext.request.contextPath}/resources/img/profile_img/default.png");
    	 if ($('#previewImg').attr('class')=="animated fadeIn") {
    		 $('#previewImg').removeClass("animated fadeIn")
		} else {
			$('#previewImg').addClass("animated fadeIn")
		}
	}
     
    $(document).ready(function() {
    	
    	
		//checkbox 개수제한
		
		$("input[name='likeCrops']").on("click" , function(){
			var cnt = $("input:checked[name='likeCrops']").length;
			if(cnt > 3){
				
				$(this).prop("checked" , false);
				BootstrapDialog.alert("선택은 3개까지 가능합니다.");
			}
		});
    	
    	
    	   // 아이디 중복확인
    		$("#id").keyup(function(){
    	      var id=$(this).val().trim();
    	      if(id.length<3 || id.length>10){
    	         $("#checkIdView").html("아이디는 3자이상 10자 이하여야 합니다.").css("color","#edbf71");
    	         checkResultId="";
    	         return;
    	      }
    	      else 
    	         $("#checkIdView").html("");
    	      $.ajax({
    	         type:"get",
    	         url:"${pageContext.request.contextPath}/checkId",            
    	         data:"id="+id,   
    	         success:function(data){   
    	            if(data=="fail"){
    	               $("#checkIdView").html(id+"은 이미 존재하거나 탈퇴한 회원의 아이디입니다.").css("color","#f35b56");
    	               checkResultId="";
    	            }else{               
    	               $("#checkIdView").html(id+"는 사용 가능한 아이디입니다.").css("color","#1e878d");      
    	               checkResultId=id;
    	            }               
    	         }//success      
    	      });//ajax
    	   });//keyup  
    	   
    	   // 패스워드 confirm 확인
    	   $("#password").keyup(function(){
    		      var passwordCon = $("#cpassword").val();
    		      var password = $("#password").val();
    		      var checkResultPassword="";
    		      if(passwordCon!="" && password != passwordCon) {//비밀번호와 비밀번호 확인이 일치하지 않는 경우
    		         $("#checkPasswordView").html("패스워드와 일치하지 않습니다").css("color","#f35b56");
    		         checkResultPassword="";
    		      }else if (passwordCon=="") {
    		         $("#checkPasswordView").html("");
    		         checkResultPassword="";
    		      }else {//비밀번호와 비밀번호 확인이 일치하여 진행 가능한 경우
    		         $("#checkPasswordView").html("패스워드와 일치합니다").css("color","#1e878d");
    		         checkResultPassword=password;
    		      }
    		   });//keyup
    		   $("#cpassword").keyup(function(){
     		      var passwordCon = $("#cpassword").val();
     		      var password = $("#password").val();
     		      if(passwordCon!="" && password != passwordCon) {//비밀번호와 비밀번호 확인이 일치하지 않는 경우
     		         $("#checkPasswordView").html("패스워드와 일치하지 않습니다").css("color","#f35b56");
     		         checkResultPassword="";
     		      }else if (passwordCon=="") {
     		         $("#checkPasswordView").html("");
     		         checkResultPassword="";
     		      }else {//비밀번호와 비밀번호 확인이 일치하여 진행 가능한 경우
     		         $("#checkPasswordView").html("패스워드와 일치합니다").css("color","#1e878d");
     		         checkResultPassword=password;
     		      }
     		   });//keyup
     		   
    		   //닉네임 중복확인
    		   $("#nickname").keyup(function(){
    	      var nickname=$(this).val().trim();
    	      if(nickname.length<3 || nickname.length>10){
    	         $("#checknicknameView").html("닉네임은 3자이상 10자 이하여야 합니다.").css("color","#edbf71");
    	         checkResultnickname="";
    	         return;
    	      }
    	      else 
    	         $("#checknicknameView").html("");
    	      $.ajax({
    	         type:"get",
    	         url:"${pageContext.request.contextPath}/checkNickname",            
    	         data:"nickname="+nickname,   
    	         success:function(data){   
    	            if(data=="fail"){
    	               $("#checknicknameView").html(nickname+"은 이미 존재하는 닉네임입니다.").css("color","#f35b56");
    	               checkResultnickname="";
    	            }else{               
    	               $("#checknicknameView").html(nickname+"는 사용 가능한 닉네임입니다.").css("color","#1e878d");      
    	               checkResultnickname=nickname;
    	            }               
    	         }//success      
    	      });//ajax
    	   });//keyup  
    		       		   
    	   $("#password").keyup(function(){
 		      var passwordCon = $("#cpassword").val();
 		      var password = $("#password").val();
 		      var checkResultPassword="";
 		      if(passwordCon!="" && password != passwordCon) {//비밀번호와 비밀번호 확인이 일치하지 않는 경우
 		         $("#checkPasswordView").html("패스워드와 일치하지 않습니다").css("color","#f35b56");
 		         checkResultPassword="";
 		      }else if (passwordCon=="") {
 		         $("#checkPasswordView").html("");
 		         checkResultPassword="";
 		      }else {//비밀번호와 비밀번호 확인이 일치하여 진행 가능한 경우
 		         $("#checkPasswordView").html("패스워드와 일치합니다").css("color","#1e878d");
 		         checkResultPassword=password;
 		      }
 		   });//keyup
  		   
 		   // 오늘 날짜 이후는 선택되지 않도록 처리
 		   $("#birthday").change(function(){
  		      var now = new Date();
  		      var nowYear = now.getFullYear();
  		      var nowMonth = now.getMonth()+1;
	  		      if((nowMonth+"").length < 2){
	  		    	nowMonth = "0"+nowMonth;
			      }
  		      var nowDate = now.getDate();
	  		      if((nowDate+"").length < 2){
	  		    	nowDate= "0"+nowDate;
	  		      }
  		      var today = nowYear+""+nowMonth+""+nowDate;
  		      var birthday = $("#birthday").val();
   		      var dateSplit = birthday.split("-");
  		      var year = dateSplit[0];
  		      var month = dateSplit[1];
  		      var day = dateSplit[2];
  		      var splitBirthday = year+""+month+""+day;
  		      
    		  if(parseInt(splitBirthday)>parseInt(today)) { //오늘 이후의 날짜를 선택했을 경우
  		         $("#checkBirthdayView").html("오늘 이후의 날짜는 선택할 수 없습니다").css("color","#f35b56");
  		         checkResultBirthday="";
  		      }else { //오늘 이전의 날짜를 선택했을 경우
  		         $("#checkBirthdayView").html("생년월일 확인이 완료되었습니다").css("color","#1e878d");
  		       checkResultBirthday=birthday;
  		      }
  		   });//change
 		   
    		   //submit		   
    		   $("#register").submit(function(){
    		      if(checkResultId==""){
    		         BootstrapDialog.alert({
    		        	   type : 'danger',
    		        	   title : '아이디 확인',
    		        	   message : '아이디 중복체크를 다시 하세요',
    		        	   size:"size-small"
    		       	});    
    		         return false;
    		      }
    		      else if (checkResultPassword=="") {
    		    	  BootstrapDialog.alert({
   		        	   type : 'danger',
   		        	   title : '비밀번호 확인',
   		        	   message : '비밀번호 확인을 다시 하세요',
   		        		size:"size-small"
   		       	}); 
    		         return false;
    		      }
    		      else if(checkResultnickname==""){
    		    	  BootstrapDialog.alert({
   		        	   type : 'danger',
   		        	   title : '닉네임 확인',
   		        	   message : '닉네임 중복체크를 다시 하세요',
   		        	   size:"size-small"
   		       	}); 
     		         return false;
    		      }
    		      else if(checkResultBirthday==""){
    		    	  BootstrapDialog.alert({
   		        	   type : 'danger',
   		        	   title : '생년월일 확인',
   		        	   message : '생년월일을 다시 확인 하세요',
   		        	   size:"size-small"
   		       	}); 
     		         return false;
    		      }
    		      else if( $("#sample6_address").val()==""){
    		    	  BootstrapDialog.alert({
   		        	   type : 'danger',
   		        	   title : '주소 확인',
   		        	   message : '주소를 입력해주세요',
   		        	   size:"size-small"
   		       	}); 
     		         return false;
    		      }
    		   });//submit
    		   
       		   var fileTarget = $('.filebox .upload-hidden'); 
       		   fileTarget.on('change', function(){ // 값이 변경되면 
       			 /*   if(window.FileReader){ // modern browser 
       				   var filename = $(this)[0].files[0].name; 
       			   } else { // old IE 
       				   var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
      				   } // 추출한 파일명 삽입 
      				   $(this).siblings('.upload-name').val(filename);  */
      	              var $filename;
      	              $(this).val() != '' ? $filename = $(this)[0].files[0].name : $filename = '파일선택';
      	              $(this).siblings('.upload-name').val($filename); 
       			});
       		   
    		var $cropsSelect = $('#cropsSelect')
   			,$cropsList = $('.regCropsList')
   	    	,$farmRegister = $('#farmRegister')
   			,$choise = $('body').find('#choise');
    		
       		$cropsSelect.on('change', function() {
    			if($(this).val() !== ""){
	    	    	var $cropsName = $(this).find("option[value='" + $(this).val() + "']").text()
	    	    		,$cropsA = $('<a id="'+$cropsName+'" class="btn btn-link" data-placement="bottom" data-toggle="popover" data-container="body" data-trigger="hover" title="" data-content="'+$cropsName+'"></a>')
	    	    		,$cropsImg = $('<img class="'+$cropsName+'" src="${pageContext.request.contextPath}/resources/img/crops_illur/'+$cropsName+'.png">')
	    				,$inputCrops = $('<input id="'+$cropsName+'" type="hidden" name="likeCropsNo" value="'+$(this).val()+'" />')
    			}
    			if ($(this).parents().find('.regCropsList img').length < 3) {
    		    	if($cropsName != $cropsList.find('#'+$cropsName).attr('id')) {
    		    		$cropsList.append($cropsA.append($cropsImg))
    		    		$choise.append($inputCrops)
    		    	} // if
    			} // if
    	   		$('[data-toggle="popover"]').popover()
    	   		
    		    $('.'+$cropsName).on('click',function(){
    		    	$(this).parents().find('#'+$cropsName).popover('destroy')
    		    	$(this).parents().find('#'+$cropsName).remove()
    		    	$choise.find('#'+$cropsName).remove()
    		    }) // click
    	    }) // change
    		   
	})//ready
     
	
</script>