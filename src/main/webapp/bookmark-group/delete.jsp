<%@page import="service.BookmarkService"%>
<%@page import="dto.BookmarkGroupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>북마크 그룹 수정</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<%
	String id = request.getParameter("id");
	BookmarkService bookmarkService = new BookmarkService();
	BookmarkGroupDTO bookmarkGroupDTO = bookmarkService.getBookmarkGroup(id);
	%>
	<table class="setMargin">
		<form method="post" action="delete-submit.jsp"
			id="bookmarkGroupDeleteForm">
			<input type="hidden" name="id" value="<%=id%>">
			<tr>
				<th>북마크 이름</th>
				<td id="oddRow"><%=bookmarkGroupDTO.getName()%></td>
			</tr>
			<tr>
				<th>순서</th>
				<td id="evenRow"><%=bookmarkGroupDTO.getSortingPriority()%></td>
			</tr>
			<tr id="oddRow" class="center">
				<td colspan="2"><a href="bookmark-group.jsp">돌아가기</a>
					<button type="submit" form="bookmarkGroupDeleteForm">삭제</button></td>
			</tr>
		</form>
	</table>
</body>
</html>