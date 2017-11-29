<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.honhang.model.category.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<CategoryVO> categoryList = (List) request.getAttribute("categoryList");
	String category_id = (String) request.getAttribute("category_id");
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
<script type="text/javascript">
	function add() {
		var category = document.getElementById('add_category');
		category.submit();
	}
</script>
</head>
<body>
	<jsp:include page="modules/header.jsp" flush="false"/>
	<div class="content">
		<jsp:include page="modules/category_list.jsp" flush="false" />
		<div class="content_background">
			<div class="content_view">
				<h3>카테고리 추가</h3>
				<form id="add_category" action="/posting/categoryInsert.do" method="post">
					<input type="hidden" name="user_id" value="${id }" />
					카테고리 이름 <input type="text" name="category_title"></td>								
						<input type="button" id="btn_add" onclick="add();" value="추가">
						<input type="button" id="cancel" onclick="history.go(-1);" value="이전">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
