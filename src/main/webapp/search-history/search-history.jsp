<%@page import="java.util.List"%>
<%@page import="service.WifiService"%>
<%@page import="dto.SearchHistoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>와이파이 정보 구하기</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<table class="setMargin">
		<thead>
			<th>ID</th>
			<th>x좌표</th>
			<th>y좌표</th>
			<th>조회일자</th>
			<th>비고</th>
		</thead>
		<tbody>
			<%
			WifiService wifiService = new WifiService();
			List<SearchHistoryDTO> searchHistoryList = wifiService.getSearchHistoryList();
			if (searchHistoryList != null && searchHistoryList.size() > 0) {
			  for (int i = 0; i < searchHistoryList.size(); i++) {
			    SearchHistoryDTO searchHistoryDTO = searchHistoryList.get(i);
			    String evenCheck = (i % 2 != 0) ? "evenRow" : "oddRow";
			%>
			<form method="post" action="delete-submit.jsp", id="searchHistoryDeleteForm<%=i%>>">
				<input type="hidden" name="id" value="<%=searchHistoryDTO.getId()%>">
			</form>
			<tr id=<%=evenCheck%>>
				<td><%=searchHistoryDTO.getId()%></td>
				<td><%=searchHistoryDTO.getLnt()%></td>
				<td><%=searchHistoryDTO.getLat()%></td>
				<td><%=searchHistoryDTO.getSearchDttm()%></td>
				<td class="center">
					<button type="submit" form="searchHistoryDeleteForm<%=i%>>">삭제</button>
				</td>
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