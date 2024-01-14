<%@page import="service.BookmarkService"%>
<%@page import="dto.BookmarkDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>북마크 삭제</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<%
	String id = request.getParameter("id");
	BookmarkService bookmarkService = new BookmarkService();
	BookmarkDTO bookmarkDTO = bookmarkService.getBookmark(id);
	%>
	<table class="setMargin">
		<form method="post" action="delete-submit.jsp" id="bookmarkDeleteForm">
			<input type="hidden" name="id" value="<%=id%>">
			<tr>
				<th>북마크 그룹</th>
				<td id="oddRow"><%=bookmarkDTO.getBookmarkGroupName()%></td>
			</tr>
			<tr>
				<th>와이파이명</th>
				<td id="evenRow"><%=bookmarkDTO.getWifiName()%></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td id="oddRow"><%=bookmarkDTO.getRegistrationDttm()%></td>
			</tr>
			<tr class="center" id="evenRow">
				<td colspan="2"><a href="bookmark.jsp">돌아가기</a>
					<button type="submit" form="bookmarkDeleteForm">삭제</button></td>
			</tr>
		</form>
	</table>
</body>
</html>