<%@page import="api.ApiManager"%>
<%@page import="okhttp3.Request"%>
<%@page import="okhttp3.OkHttpClient"%>
<%@page import="okhttp3.HttpUrl"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>와이파이 정보 가져오기</title>
</head>
<body>
	<%
	ApiManager apiManager = new ApiManager();
	out.println(apiManager.getWifiTotalCount());
	%>
</body>
</html>