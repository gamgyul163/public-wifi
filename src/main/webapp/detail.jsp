<%@page import="service.WifiService"%>
<%@page import="service.BookmarkService.SortingCriteria"%>
<%@page import="service.BookmarkService"%>
<%@page import="java.util.List"%>
<%@page import="dto.WifiDTO"%>
<%@page import="dto.BookmarkGroupDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<%
	String mgrNo = request.getParameter("mgrNo");
	String distance = request.getParameter("distance");
	WifiService wifiService = new WifiService();
	WifiDTO wifiDTO = wifiService.getWifi(mgrNo);
	%>
	<header>
		<h1>와이파이 상세 정보</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br/>
	<form method="post" action="bookmark/add-submit.jsp" class="setMargin">
		<select id="bookmarkGroupSelection" name="bookMarkGroupId">
			<option value="" selected>북마크 그룹 선택</option>
			<%
			BookmarkService bookmarkService = new BookmarkService();
						List<BookmarkGroupDTO> bookmarkGroupList = bookmarkService.getBookmarkGroupList(SortingCriteria.PRIORITY);

						if (bookmarkGroupList != null) {
						  for (BookmarkGroupDTO bookmarkGroupDTO : bookmarkGroupList) {
			%>
			<option value="<%=bookmarkGroupDTO.getId()%>"><%=bookmarkGroupDTO.getName()%></option>
			<%
			}
			%><!--for close-->
			<%
			}
			%><!--if close-->
		</select>
		<input type="submit" value="북마크 추가하기"> <input type="hidden" name="mgrNo" value="<%=mgrNo%>">
	</form>

	<table class="setMargin">
		<%
		int rowCnt = 0;
		%>
		<tr>
			<th>거리(km)</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=distance%></td>
		</tr>
		<tr>
			<th>관리번호</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getMgrNo()%></td>
		</tr>
		<tr>
			<th>자치구</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getWrdofc()%></td>
		</tr>
		<tr>
			<th>와이파이명</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getName()%></td>
		</tr>
		<tr>
			<th>도로명 주소</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getAddress1()%></td>
		</tr>
		<tr>
			<th>상세 주소</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getAddress2()%></td>
		</tr>
		<tr>
			<th>설치위치(층)</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getInstlFloor()%></td>
		</tr>
		<tr>
			<th>설치유형</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getInstlTy()%></td>
		</tr>
		<tr>
			<th>설치기관</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getInstlMby()%></td>
		</tr>
		<tr>
			<th>서비스구분</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getSvcSe()%></td>
		</tr>
		<tr>
			<th>망종류</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getCmcwr()%></td>
		</tr>
		<tr>
			<th>설치년도</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getCnstcYear()%></td>
		</tr>
		<tr>
			<th>실내외구분</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getInoutDoor()%></td>
		</tr>
		<tr>
			<th>WIFI접속환경</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getRemars3()%></td>
		</tr>
		<tr>
			<th>x좌표</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getLnt()%></td>
		</tr>
		<tr>
			<th>y좌표</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getLat()%></td>
		</tr>
		<tr>
		<th>작업일자</th>
			<td id=<%=(rowCnt++ % 2 != 0) ? "evenRow" : "oddRow"%>><%=wifiDTO.getWorkDttm()%></td>
		</tr>
	</table>
</body>
</html>