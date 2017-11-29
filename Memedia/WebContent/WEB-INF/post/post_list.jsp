<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.honhang.model.schedule.ScheduleVO"%>
<%@page import="com.honhang.model.category.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 
		List<CategoryVO> categoryList = (List)request.getAttribute("categoryList");
		List<ScheduleVO> scheduleList = (List)request.getAttribute("scheduleList");
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
		<%
			if(category_id.equals("0")){
		%>
			<h1>전체 글</h1><br>
		<%
			} else { 
				for(int i = 0; i < categoryList.size(); i++){
					CategoryVO category = categoryList.get(i);
					
					if(category_id.equals(String.valueOf(category.getCategory_id()))){
						out.print("<h2>" + category.getCategory_title() + "</h2>");
						break;
					}
				}
		%>
			<input type="button" value="글쓰기" onclick="location.href='/posting/postingForm.do?id=${id}&category_id=<%=category_id %>'"><br>
		<% } %>
			<table>
				<tr>
					<th width="10%">No</th>
					<th width="70%">제목</th>
					<th width="20%">작성일</th>
				</tr>
			<%
				for(int i = 0; i < scheduleList.size(); i++){
					ScheduleVO schedule = scheduleList.get(i);
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy. MM. dd.");
					
					String date = dateFormat.format(schedule.getRegistDate());
			%>
				<tr>
					<td><%=i+1 %></td>
					<td><a href="/posting/postingDetail.do?id=${id }&category_id=<%=category_id %>&post_id=<%=schedule.getId() %>"><%=schedule.getTitle() %></a></td>
					<td><%=date %></td>
				</tr>
			<% 		
				}
			%>
			</table>	
				</div>	
			</div>
		</div>
</body>
</html>
