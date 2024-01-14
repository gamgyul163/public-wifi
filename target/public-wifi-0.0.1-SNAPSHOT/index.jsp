<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<header>
		<h1>와이파이 정보 구하기</h1>
	</header>
	<nav>
		<%@include file="navigation.jsp"%>
	</nav>
	<br />
	<div id="input">
		<label for="lat">LAT:</label> <input type="text" id="lat" name="lat">
		<label for="lnt">LNT:</label> <input type="text" id="lnt" name="lnt">
		<button onclick="getLocation()">내 위치 가져오기</button>
		<button onclick="getNearbyWifi()">근처 WIFI 정보 보기</button>
	</div>
	<script>
    function getLocation() {
    	if (navigator.geolocation) {
    		navigator.geolocation.getCurrentPosition(getPositionSuccess,getPositionError);
    	} else {
    		alert("이 브라우저에서는 위치 정보를 가져올 수 없습니다.")
    	}
    }

    function getPositionSuccess(position) {
        let latitude = position.coords.latitude;
        let longitude = position.coords.longitude;

        document.getElementById("lat").value = latitude;
        document.getElementById("lnt").value = longitude;
    }

    function getPositionError(error) {
        switch (error.code) {
            case error.PERMISSION_DENIED:
                alert("위치 정보 접근이 거부되었습니다.");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("위치 정보를 사용할 수 없습니다.");
                break;
            case error.TIMEOUT:
                alert("위치 정보를 가져오는데 시간이 초과되었습니다.");
                break;
            case error.UNKNOWN_ERROR:
                alert("알 수 없는 오류가 발생했습니다.");
                break;
        }
    }

    function getNearbyWifi() {
        // 여기에 근처 WIFI 정보를 가져오는 로직을 추가
        // AJAX 등을 사용하여 서버에 요청하고 응답을 처리할 수 있습니다.
        alert("근처 WIFI 정보를 가져오는 기능을 구현하세요.");
    }
</script>
</body>
</html>