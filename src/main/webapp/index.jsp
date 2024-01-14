<%@page import="service.WifiService"%>
<%@page import="java.util.List"%>
<%@page import="dto.WifiDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>와이파이 정보 구하기</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<%
	String lat = (request.getParameter("lat") == null) ? "0.0" : request.getParameter("lat");
	String lnt = (request.getParameter("lnt") == null) ? "0.0" : request.getParameter("lnt");
	%>
	<div class="setMargin">
		<label for="lat">LAT:</label><input type="text" id="lat"
			value=<%=lat%>> <label for="lnt">LNT:</label><input
			type="text" id="lnt" value=<%=lnt%>>

		<button onclick="getLocation()">내 위치 가져오기</button>
		<button onclick="getNearbyWifi()">근처 WIFI 정보 보기</button>
	</div>
	<table class="setMargin">
		<thead>
			<tr>
				<th>거리(km)</th>
				<th>관리번호</th>
				<th>자치구</th>
				<th>와이파이명</th>
				<th>도로명 주소</th>
				<th>상세 주소</th>
				<th>설치위치(층)</th>
				<th>설치유형</th>
				<th>설치기관</th>
				<th>서비스구분</th>
				<th>망종류</th>
				<th>설치년도</th>
				<th>실내외구분</th>
				<th>WIFI접속환경</th>
				<th>x좌표</th>
				<th>y좌표</th>
				<th>작업일자</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (request.getParameter("lat") != null && request.getParameter("lnt") != null) { // 파라미터로 넘어온 0.0과 기본값 0.0 구분
				WifiService wifiService = new WifiService();
				List<WifiDTO> wifiList = wifiService.getNearbyWifiList(lat, lnt, 20);
				if (wifiList != null && wifiList.size() > 0) {
					for (int i = 0; i < wifiList.size(); i++) {
						WifiDTO wifiDTO = wifiList.get(i);
						String evenCheck = (i % 2 != 0) ? "evenRow" : "oddRow";
			%>
			<tr id=<%=evenCheck%>>
				<td><%=String.format("%.4f", wifiDTO.getDistance())%></td>
				<td><%=wifiDTO.getMgrNo()%></td>
				<td><%=wifiDTO.getWrdofc()%></td>
				<td><a
					href="detail.jsp?mgrNo=<%=wifiDTO.getMgrNo()%>&distance=<%=wifiDTO.getDistance()%>"><%=wifiDTO.getName()%></a></td>
				<td><%=wifiDTO.getAddress1()%></td>
				<td><%=wifiDTO.getAddress2()%></td>
				<td><%=wifiDTO.getInstlFloor()%></td>
				<td><%=wifiDTO.getInstlTy()%></td>
				<td><%=wifiDTO.getInstlMby()%></td>
				<td><%=wifiDTO.getSvcSe()%></td>
				<td><%=wifiDTO.getCmcwr()%></td>
				<td><%=wifiDTO.getCnstcYear()%></td>
				<td><%=wifiDTO.getInoutDoor()%></td>
				<td><%=wifiDTO.getRemars3()%></td>
				<td><%=wifiDTO.getLnt()%></td>
				<td><%=wifiDTO.getLat()%></td>
				<td><%=wifiDTO.getWorkDttm()%></td>
			</tr>
			<%
			}
			} else {
			%>
			<td colspan="17" class="center">정보가 존재하지 않습니다.</td>
			<%
			}
			%>
			<%
			} else {
			%>
			<td colspan="17" class="center">위치 정보를 입력하신 후에 조회해 주세요.</td>
			<%
			}
			%>
		</tbody>
	</table>
	<script>
		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(getPositionSuccess,
						getPositionError);
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
			let latitude = document.getElementById("lat").value;
			let longitude = document.getElementById("lnt").value;
			window.location.assign("http://localhost:8080?lat=" + latitude
					+ "&lnt=" + longitude);
		}
	</script>
</body>
</html>