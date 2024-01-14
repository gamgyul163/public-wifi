
<%@page import="service.BookmarkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");

	BookmarkService bookmarkService = new BookmarkService();
	String notice = (bookmarkService.deleteBookmark(id) == 1) ? "북마크 정보를 삭제하였습니다." : "북마크 정보를 삭제하는데 실패하였습니다.";
	%>
</body>
<script>
	alert("<%=notice%>");
	location.href = "bookmark.jsp";
</script>
</html>