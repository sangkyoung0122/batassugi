<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

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
              <div class="form-group">
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
               <div class="form-group">
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
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <input type="text" class="form-control" name="address" id="address" placeholder="주소를 입력하세요" required="required">
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
            </div>            
          </div><%-- 필수 입력정보 끝 --%>
          
          <%-- 부가정보 : 등급정보, 이미지 업로드 --%>
          
          <div class="panel-heading">
            <div class="panel-title text-left">부가정보 입력</div>
          </div>

		 <div class="row">
           <%--1단 --%>
           <div class="col-md-6">
          	<div class="form-group">
	          	<label class="control-label col-sm-3">
	          		<img src="${pageContext.request.contextPath}/resources/img/profile_img/default.png" width="100px" id="previewImg"/><br>
	                프로필 미리보기
	          	</label>
	          	<div class="col-md-8 col-sm-8">
                  <div class="input-group">
                    <span class="input-group-addon" id="file_upload"></span> 
                    <input type="file" name="file" id="file" class="form-control upload" placeholder="프로필을 넣어주세요" 
                     onchange="LoadImg(this);" aria-describedby="file_upload">
                    <button type="button" onclick="ResetImgvalue();">취소</button>
                    </div>
                </div>
			</div>
            </div>
            <%-- 2단 --%> 
            <div class="col-md-6">
            <div class="form-group">
          	<label class="control-label col-sm-3">기호 작물(3개까지 체크) <span class="text-danger">*</span></label>
                <div class="col-md-7 col-sm-9">
                  <div class="input-group">
                    <span class="input-group-addon"></span> 
                    <label> <input name="likeCrops" id="likeCrops" type="checkbox" value="1"> 감자 </label>    
                    <label> <input name="likeCrops" id="likeCrops" type="checkbox" value="2"> 고구마 </label>
                    <label> <input name="likeCrops" id="likeCrops" type="checkbox" value="3"> 토마토 </label>                    
                  </div>
                </div>
			</div>
            </div>
            
            </div><%--row --%>
            <%--제출 버튼 --%>
            <div class="form-group">
              <div class="col-xs-offset-3 col-xs-10">
                <input name="submit" type="submit" value="회원가입" class="btn btn-primary">
              </div>
            </div>            
        </div>	<!-- 판넬 폼 종료 -->
      </form><%-- form 영역 --%>
    </div><%-- 메인영역 --%>
  </div><%-- 전체 row --%>
</div><%-- 전체 container --%>


<script>	
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
    	// 미리보기 이미지 리셋
    	$('#previewImg').attr('src', "${pageContext.request.contextPath}/resources/img/profile_img/default.png");
    	 if ($('#previewImg').attr('class')=="animated fadeIn") {
    		 $('#previewImg').removeClass("animated fadeIn")
		} else {
			$('#previewImg').addClass("animated fadeIn")
		}
	}
     
    $(document).ready(function() {
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
    	               $("#checkIdView").html(id+"은 이미 존재하는 아이디입니다.").css("color","#f35b56");
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
    		   });//submit
	})//ready
     
</script>