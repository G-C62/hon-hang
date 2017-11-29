<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.honhang.model.schedule.ScheduleVO"%>
<%@page import="com.honhang.model.category.CategoryVO"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	ScheduleVO schedule = (ScheduleVO) request.getAttribute("schedule");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd. HH:mm");
	
	String id = (String) request.getAttribute("id");
	String category_id = (String)request.getAttribute("category_id");
	String date = dateFormat.format(schedule.getRegistDate());
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
<title>페이지 상세</title>
<script type="text/javascript">
	function deletePost(){
		var msg="삭제하시겠습니까?";
		if(confirm(msg)){
			location.href='/posting/postingDelete.do?id=<%=schedule.getId() %>';	
		}
	}
	
	function updateForm(){
		location.href='/posting/postingEdit.do?id=${id}&category_id=<%=category_id %>&post_id=<%=schedule.getId()%>';
	}
</script>
<style>


</style>
</head>
<body>
	<jsp:include page="modules/header.jsp" flush="false"/>
	<div class="content">
		<jsp:include page="modules/category_list.jsp" flush="false"/>
		<div class="content_background">
			<div class="content_view">	
				<div class="content_title">
					<h1><%=schedule.getTitle() %></h1>
				</div>
				<div class="content_date">
					작성일 : <%=date %>
				</div>
				<div class="content_post">
					<%=schedule.getContent() %>
				</div>
				<div class="content_admin">
					<input type="button" value="수정" onclick="updateForm()">
					<input type="button" value="삭제" onclick="deletePost()">
				</div>
			</div>	
		</div>
	</div>
</body>
</html>
