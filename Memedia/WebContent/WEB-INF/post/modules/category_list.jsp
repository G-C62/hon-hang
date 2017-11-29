<%@page import="com.honhang.model.category.CategoryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="side_bar" >
	<h2>카테고리 목록</h2></br>
	<a class="category_list" style="padding-bottom:30px;" href="/posting/postingList.do?id=${id }&category_id=0">전체</a>
	<% 
		List<CategoryVO> categoryList = (List)request.getAttribute("categoryList");
		
		for(int i = 0; i < categoryList.size(); i++){
			CategoryVO category = categoryList.get(i);
	%>
		<a class="category_list" href="/posting/postingList.do?id=${id }&category_id=<%=category.getCategory_id() %>"><%=category.getCategory_title() %></a>
	<%
		}
	%>
	
	<a class="category_list" style="padding-top:30px;" href="/posting/category_setting.do?id=${id }">설정</a>
</div>	