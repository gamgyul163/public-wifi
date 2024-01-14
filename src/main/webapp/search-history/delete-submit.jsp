<%@page import="service.WifiService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	WifiService wifiService = new WifiService();
	String notice = (wifiService.deleteSearchHistory(id) == 1) ? "위치 히스토리 정보를 삭제하였습니다." : "위치 히스토리 정보를 삭제하는데 실패하였습니다.";
	%>
</body>
<script>
	alert("<%=notice%>");
	location.href = "search-history.jsp";
</script>
</html>