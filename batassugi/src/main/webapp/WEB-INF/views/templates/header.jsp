<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- 이 파일은 header입니다. header에는 별도의 외부링크 추가 금지--%>
<div class="container">
   <%-- 가장 위쪽 헤더 --%>
	<div class="row">
		<div class="col-xs-1" id="results" style="margin-top: 30px;"></div>
	    <div class="col-xs-2 mainLogo">
			<a href="${pageContext.request.contextPath}/">
				<img src=" ${pageContext.request.contextPath}/resources/img/logo.png" class="img-responsive mainLogo" />
			</a>
		</div><!--
	    --><div class="col-xs-9 vcenter">
   		<ul>
   			<li style="border-left:0px !important;"><a class="choice" href="${pageContext.request.contextPath}/">Home</a></li>
   			<li><a href="${pageContext.request.contextPath}/home/introduction_website">사이트소개</a></li>
           	<li><a href="${pageContext.request.contextPath}/home/crops_dictionary">농작물사전</a></li>
           	<c:choose>
           	<c:when test="${sessionScope.mvo==null}">
           		<li><a href="${pageContext.request.contextPath}/registerView">회원가입</a></li>
	            <li><a href="${pageContext.request.contextPath}/home/loginView">로그인</a></li> 
           	</c:when>
			<c:otherwise>
	            <li><a href="${pageContext.request.contextPath}/common/tradePost">거래게시판</a></li>
	            <li><a href="${pageContext.request.contextPath}/common/getRentList">대여신청</a></li>

	            <li><a href="${pageContext.request.contextPath}/common/accuse_board">신고게시판</a></li>
	            <c:if test="${sessionScope.mvo.memberVo.memberLevel == '관리자'}">
	            	<li><a href="${pageContext.request.contextPath}/admin/admin_Home">관리페이지</a></li>	            
	            </c:if>
	            
	            <c:if test="${sessionScope.mvo.memberVo.memberLevel == '판매자'}">
	            	<li><a href="${pageContext.request.contextPath}/seller/seller_Home">마이페이지</a></li>	            
	            </c:if>
	             <c:if test="${sessionScope.mvo.memberVo.memberLevel == '초급'||sessionScope.mvo.memberVo.memberLevel == '중급'||sessionScope.mvo.memberVo.memberLevel == '고급'}">
	            	<li><a href="${pageContext.request.contextPath}/buyer/buyer_Home">마이페이지</a></li>	            
	            </c:if>
			</c:otherwise>
           	</c:choose>
   		</ul>
   		   		    <div id="memberInfo">
	<c:if test="${sessionScope.mvo!=null}">
			<span id="memberInfoId">${sessionScope.mvo.memberVo.nickname}</span>님(${sessionScope.mvo.memberVo.memberLevel})
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
</div>

    </div> <%-- col-xs-8 vcenter --%>
   </div>  <%-- row --%>
</div> <%-- container --%>
<script type="text/javascript">
$(document).ready(function () {
   var i = 1;
   var city = 'Seoul';
   
   function cityChange(callback){
      callback()
      return setInterval(callback, 3000)
   }
   cityChange(cityData)
   
   function cityData() {
      (i == 1) && (city = 'Seoul'),
      (i == 2) && (city = 'Incheon'),
      (i == 3) && (city = 'Chuncheon'),
      (i == 4) && (city = 'Daejeon'),
      (i == 5) && (city = 'Jeonju'),
      (i == 6) && (city = 'Gwangju'),
      (i == 7) && (city = 'Daegu'),
      (i == 8) && (city = 'Busan'),
      (i == 9) && (city = 'Jeju'),
      (i == 9) && (i=0)
      i++
      weather(city)
   }
   
   function weather(city) {
      $.ajax({
             url: "http://api.wunderground.com/api/9400484a81217f6c/geolookup/conditions/q/KR/"+city+".json",
             dataType: "json",
             success: function (response) {
                 $('#results').empty();
                 $('#results').append("<div>"+"<img src=\"" + response['current_observation']['icon_url'] + "\" style='width: 70%;'></div>");
                 var city1 = response['location']['city']
                 var city2 = '';
                 (city1=='Seoul') && (city2='서울'),
                 (city1=='Incheon') && (city2='인천'),
                 (city1=='Chuncheon') && (city2='춘천'),
                 (city1=='Daejeon') && (city2='대전'),
                 (city1=='Jeonju') && (city2='전주'),
                 (city1=='Gwangju') && (city2='광주'),
                 (city1=='Daegu') && (city2='대구'),
                 (city1=='Busan') && (city2='부산'),
                 (city1=='Jeju') && (city2='제주')
                 
                 $('#results').append("<div>&nbsp;&nbsp;" + city2 + " " + response['current_observation']['temp_c'] + "℃ </div>");
             }
         });
   }
});
</script>
