<%@page import="service.BookmarkService"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookmarkDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>북마크 목록</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<table class="setMargin">
		<thead>
			<th>ID</th>
			<th>북마크 그룹</th>
			<th>와이파이명</th>
			<th>등록일자</th>
			<th>비고</th>
		</thead>
		<tbody>
			<%
			BookmarkService bookmarkService = new BookmarkService();
			List<BookmarkDTO> bookmarkList = bookmarkService.getBookmarkList();
			if (bookmarkList != null && bookmarkList.size() > 0) {
			  for (int i = 0; i < bookmarkList.size(); i++) {
			    BookmarkDTO bookmarkDTO = bookmarkList.get(i);
			    String evenCheck = (i % 2 != 0) ? "evenRow" : "oddRow";
			%>
			<tr id=<%=evenCheck%>>
				<td><%=bookmarkDTO.getId()%></td>
				<td><%=bookmarkDTO.getBookmarkGroupName()%></td>
				<td><%=bookmarkDTO.getWifiName()%></td>
				<td><%=bookmarkDTO.getRegistrationDttm()%></td>
				<td class="center"><a
					href="delete.jsp?id=<%=bookmarkDTO.getId()%>">삭제</a></td>
			</tr>
			<%
			}
			%><!-- for close -->
			<%
			} else {
			%>
			<td class="center" colspan="5">정보가 존재하지 않습니다.</td>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>