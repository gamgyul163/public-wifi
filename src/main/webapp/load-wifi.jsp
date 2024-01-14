
<%@page import="service.ApiService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<h1 class="center">
		<%
		ApiService apiService = new ApiService();
		int cnt = apiService.getAllWifi();
		String dest;
		String text;
		if (cnt != apiService.getWifiTotalCount()) {
			out.print("정보가 비정상적으로 저장되었습니다. 다시 시도해 주십시오.");
			dest = "load-wifi.jsp";
			text = "다시 불러오기";
		} else {
			out.print(cnt + "개의 WIFI정보가 저장되었습니다.");
			dest = "/";
			text = "홈으로 가기";
		}
		%>
	</h1>
	<div class="center">
	<a id="load-wifi" href="<%=dest%>"><%=text%></a>
	</div>
</body>
</html>
