<%@page import="service.BookmarkService.SortingCriteria"%>
<%@page import="service.BookmarkService"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookmarkGroupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>북마크 그룹</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<div class="setMargin">
		<button onclick="location.href='add.jsp'">북마크 그룹 추가</button>
	</div>
	<table class="setMargin">
		<thead>
			<th>ID</th>
			<th>북마크 이름</th>
			<th>순서</th>
			<th>등록일자</th>
			<th>수정일자</th>
			<th>비고</th>
		</thead>
		<tbody>
			<%
			BookmarkService bookmarkService = new BookmarkService();
						List<BookmarkGroupDTO> bookmarkGroupList =
						    bookmarkService.getBookmarkGroupList(SortingCriteria.ID);
						if (bookmarkGroupList != null && bookmarkGroupList.size() > 0) {
						  for (int i = 0; i < bookmarkGroupList.size(); i++) {
						    BookmarkGroupDTO bookmarkGroupDTO = bookmarkGroupList.get(i);
						    String evenCheck = (i % 2 != 0) ? "evenRow" : "oddRow";
						    String modificationDttm = (bookmarkGroupDTO.getModificationDttm() == null) ? ""
						    : bookmarkGroupDTO.getModificationDttm();
			%>
			<tr id=<%=evenCheck%>>
				<td><%=bookmarkGroupDTO.getId()%></td>
				<td><%=bookmarkGroupDTO.getName()%></td>
				<td><%=bookmarkGroupDTO.getSortingPriority()%></td>
				<td><%=bookmarkGroupDTO.getRegistrationDttm()%></td>
				<td><%=modificationDttm%></td>
				<td class="center"><a
					href="edit.jsp?id=<%=bookmarkGroupDTO.getId()%>">수정</a> <a
					href="delete.jsp?id=<%=bookmarkGroupDTO.getId()%>">삭제</a></td>
			</tr>
			<%
			}
			%><!-- for close -->
			<%
			} else {
			%>
			<td class="center" colspan="6">정보가 존재하지 않습니다.</td>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>