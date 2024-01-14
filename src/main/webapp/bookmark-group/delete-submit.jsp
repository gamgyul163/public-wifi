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
	String notice = (bookmarkService.deleteBookmarkGroup(id) == 1) ? "북마크 그룹 정보를 삭제하였습니다." : "북마크 그룹 정보 삭제에 실패하였습니다.";
	%>
</body>
<script>
	alert("<%=notice%>");
	location.href = "bookmark-group.jsp";
</script>
</html>