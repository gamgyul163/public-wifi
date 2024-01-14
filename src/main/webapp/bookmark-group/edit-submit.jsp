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
	String name = request.getParameter("name");
	String sortingPriority = request.getParameter("sortingPriority");
	
	
	BookmarkService bookmarkService = new BookmarkService();
	String notice = (bookmarkService.updateBookmarkGroup(id, name, sortingPriority) == 1)
			? "북마크 그룹 정보를 수정하였습니다."
			: "북마크 그룹 정보를 수정하는데 실패하였습니다.";
	%>
</body>
<script>
	alert("<%=notice%>");
	location.href = "bookmark-group.jsp";
</script>
</html>