<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.honhang.model.category.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
		List<CategoryVO> categoryList = (List)request.getAttribute("categoryList");
		String category_id = (String)request.getAttribute("category_id");
	%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/common/js/facebook.js" var="fb" />
<spring:url value="/resources/common/css/style.css" var="style" />
<spring:url value="/resources/common/js/jquery-1.10.2.min.js" var="jquery" />
<link type="text/css" rel="stylesheet" href="${style }">
<script type="text/javascript" src="${fb }"></script>
<script type="text/javascript" src="${jquery }"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="modules/header.jsp" flush="false"/>
	<div class="content">
		<jsp:include page="modules/category_list.jsp" flush="false"/>
		<div class="content_background">
			<div class="content_view">
				<h3>카테고리 설정</h3>
				<form name="form1" method="get">
					<table>
						<tr>
							<td>No</td>
							<td align="center">카테고리 이름</td>
							<td colspan="3"><input type="button" onclick="location.href='/posting/categoryForm.do?id=${id }'" value="카테고리 추가"></td>
						</tr>
					<%
						for(int i = 0; i < categoryList.size(); i++){
							CategoryVO category = categoryList.get(i);
					%>
					<tr>
						<td><%=i+1 %></td>
						<td><%=category.getCategory_title() %></td>
						<td>
							<input type="button" onclick="location.href='/posting/categoryEdit.do?id=${id }&category_id=<%=category.getCategory_id()%>'" value="수정">
							<input type="button" onclick="location.href='/posting/categoryDelete.do?category_id=<%=category.getCategory_id()%>'" value="삭제">
						</td>
					</tr>
					<% } %>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
