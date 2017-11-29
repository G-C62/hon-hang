<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.honhang.model.schedule.ScheduleVO"%>
<%@page import="com.honhang.model.category.CategoryVO"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
	ScheduleVO schedule = (ScheduleVO) request.getAttribute("schedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<spring:url value="/resources/common/js/facebook.js" var="fb" />
<spring:url value="/resources/editor/js/HuskyEZCreator.js" var="js"/>
<spring:url value="/resources/editor/SmartEditor2Skin.html" var="skin"></spring:url>
<spring:url value="/resources/common/css/style.css" var="style" />
<spring:url value="/resources/common/js/jquery-1.10.2.min.js" var="jquery" />
<link type="text/css" rel="stylesheet" href="${style }">
<script type="text/javascript" src="${fb }"></script>
<script type="text/javascript" src="${jquery }"></script>
<script type="text/javascript" src="${js}" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function(){ 
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors, 
			elPlaceHolder: "edit", 
			//SmartEditor2Skin.html 파일이 존재하는 경로 
			sSkinURI: "${skin}",	
			htParams : { 
				// 툴바 사용
				bUseToolbar : true,	
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : true,	
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : true,	fOnBeforeUnload : function(){ } }, 
				fOnAppLoad : function(){ 
				}, 
				fCreator: "createSEditor2" 
			});
			
			$("#transfer").click(function(){
				oEditors.getById["edit"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#form1").submit();
			});
		});
</script>
</head>
<body>
	<jsp:include page="modules/header.jsp" flush="false"/>
	<div class="content">
		<jsp:include page="modules/category_list.jsp" flush="false"/>
		<div class="content_background">
			<div class="content_view">
			<h3>수정하기</h3>
			<form id="form1" action="/posting/postingUpdate.do?id=<%=schedule.getId() %>" method="post">
			<input type="hidden" name="user_id" value="${id }">
			<input type="hidden" name="category_id" value="${category_id }">
				<table>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" style="width: 766px" value="<%=schedule.getTitle()%>"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="30" id="edit" name="content" style="width: 766px; height: 412px;"><%=schedule.getContent() %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" id="transfer" value="저장"> <input type="button" value="취소" onclick="history.go(-1)"></td>
					</tr>
				</table>
			</form>
			</div>
		</div>
	</div>
</body>
</html>
