<%@page import="service.BookmarkService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String bookMarkGroupId = request.getParameter("bookMarkGroupId");
	String mgrNo = request.getParameter("mgrNo");

	BookmarkService bookmarkService = new BookmarkService();
	String notice = (bookmarkService.createBookmark(bookMarkGroupId, mgrNo) == 1)
			? "북마크 정보를 추가하였습니다."
			: "북마크 정보를 추가하는데 실패하였습니다.";
	%>
</body>
<script>
	alert("<%=notice%>");
	location.href = "bookmark.jsp";
</script>
</html>