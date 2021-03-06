<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 이 파일은 layout입니다. layout 변경시에는 SL 이상욱에게 반드시 확인을 맡습니다.-->
<!-- 
	변경 내역: 변경내역은 이곳에 기록하세요
	변경인            변경날짜             변경사유
	=================================================================================
    Team Spider       2018.05.12           최초작성
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- Bootstrap v3.3.7 --%>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-ukyi.css" rel="stylesheet">
<%-- Bootstrap-dialog --%>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap-dialog.css" rel="stylesheet">
<%-- Animate --%>
<link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">
<%-- Favicon --%>
<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<%-- <link href="${pageContext.request.contextPath}/resources/favicon.ico" rel="shortcut icon" type="image/x-icon"> --%>
<%-- Spider (추가css설정 css파일)--%>
<link href="${pageContext.request.contextPath}/resources/css/spider.css" rel="stylesheet">
<%-- jquery-ui v1.12.1 --%>
<link href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" rel="stylesheet">

<%-- Jquery v3.3.1 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<%-- Bootstrap v3.3.7 --%>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<%-- Bootstrap-dialog --%>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-dialog.js"></script>
<%-- Parallax --%>
<script src="${pageContext.request.contextPath}/resources/js/parallax.js"></script>
<%-- jquery-ui v1.12.1 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<%-- Font-awesome v4.7.0 --%>
<script src="https://use.fontawesome.com/a5d5d71388.js"></script>


<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
<div id="openweathermap-widget-15"></div>
	<%-- header --%>
	<tiles:insertAttribute name="header" />
	<%-- main --%>
	<tiles:insertAttribute name="main" />

	<%-- footer --%>
	<tiles:insertAttribute name="footer" />
	
	<%-- 이벤트정의 스크립트 --%>
	<script src="${pageContext.request.contextPath}/resources/js/spider.js"></script>
	<script>
	
/* 	var city = "Pyongtak";
	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=db29ef2e973f23a8cd129feb2cfa1e86";
    $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {
            console.log(resp);
            console.log("현재온도 : "+ (resp.main.temp- 273.15) );
            console.log("현재습도 : "+ resp.main.humidity);
            console.log("날씨 : "+ resp.weather[0].main );
            console.log("상세날씨설명 : "+ resp.weather[0].description );
            console.log("날씨 이미지 : "+ resp.weather[0].icon );
            console.log("바람   : "+ resp.wind.speed );
            console.log("나라   : "+ resp.sys.country );
            console.log("도시이름  : "+ resp.name );
            console.log("구름  : "+ (resp.clouds.all) +"%" );                 
        }
    }) */	
	</script>
</body>
</html>