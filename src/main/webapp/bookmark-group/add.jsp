<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>

<%@include file="/head.jsp"%>

<body>
	<header>
		<h1>북마크 그룹 추가</h1>
		<nav>
			<%@include file="/navigation.jsp"%>
		</nav>
	</header>
	<br />
	<table class="setMargin">
		<form method="post" action="add-submit.jsp"
			id="bookmarkGroupInsertForm">
			<tr>
				<th>북마크 이름</th>
				<td id="oddRow"><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>순서</th>
				<td id="evenRow"><input type="text" name="sortingPriority"></td>
			</tr>
			<tr>
				<td id="oddRow" colspan="2" class="center"><button
						type="submit" form="bookmarkGroupInsertForm">추가</button></td>
			</tr>
		</form>
	</table>
</body>
</html>