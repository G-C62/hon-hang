<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String image = (String) session.getAttribute("image");
	String intro = (String) session.getAttribute("intro");
	String a_id = (String) session.getAttribute("a_id");
	String a_name = (String) session.getAttribute("a_name");
	String a_image = (String) session.getAttribute("a_image");
	String a_intro = (String) session.getAttribute("a_intro");
	String fw = (String) session.getAttribute("fw");
%>
<!doctype html>
<html>
	<head>
		<spring:url value="/resources/common/js/sns_login.js" var="sns" />
		<spring:url value="/resources/common/js/jquery-1.10.2.min.js" var="jquery" />
		<spring:url value="/resources/common/css/layout.css" var="layout" />
		<spring:url value="/resources/common/css/style_user.css" var="user" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>혼행</title>
		<link type="text/css" rel="stylesheet" href="${layout }"/>
		<link type="text/css" rel="stylesheet" href="${user }"/>
		<script type="text/javascript" src="${jquery }"></script>
		<script type="text/javascript" src="${sns }"></script>
	</head>
	<body>
		<div class="wrap">
			<div class="info-bar">
				<div class="user-info">
					<a href='#' onclick="logout();">Logout</a>
				</div>
			</div>
			<div class="nav-bar">
				<div class="logo">
					<a href="/index.do"><img src="/resources/common/images/logo.svg"></a>
				</div>
				<div class="left-menu">
					<ul>
						<li><a href="">여행후기</a></li>
						<li><a href="">여행일정</a></li>
						<li class="active" style="border-bottom-color:#f8cccb"><a href="/page/user_page_s.do?id=${id }">My Page</a></li>
					</ul>
				</div>
				<div class="search-bar">
					<input type="text" name="search">
					<button class="search-btn"></button>
				</div>
			</div>
			<div class="content">
				<div class="info-area">
					<div class="user-intro">
						<div class="user-img-l">
							<img src="${a_image }" style="width:175px;height:175px;">
						</div>
						<div class="intro-txt">
							<div class="name">
								${a_name }
								<div class="btn-area">
									<% if(fw.equals("ok")){ %>
									<button class="follow-btn" onclick="location.href='/follow/deleteFollow_s.do?id=${id}&a_id=${a_id }'">팔로우 취소</button>
									<% } else { %>
									<button class="follow-btn" onclick="location.href='/follow/insertFollow_s.do?id=${id}&a_id=${a_id }'">팔로우</button>
									<% } %>
								</div>
							</div>
							<div class="desc">
								${a_intro }
							</div>
							<div class="etc-info">
								여행일정 (0000) &nbsp;|&nbsp; 포스트 (0000)<br>
								팔로워 (${fwrc }) &nbsp;|&nbsp; 팔로잉 (${fwgc })
							</div>
						</div>
					</div>
				</div>
				<div class="user-nav">
					<ul>
						<li class="nav-active"><a href="/a_page/user_page_s.do?id=${id }&a_id=${a_id}">여행일정</a></li>
						<li><a href="/a_page/user_page_r.do?id=${id }&a_id=${a_id}">여행후기</a></li>
						<li><a href="/a_page/user_page_fwr.do?id=${id }&a_id=${a_id}">팔로워</a></li>
						<li><a href="/a_page/user_page_fwg.do?id=${id }&a_id=${a_id}">팔로잉</a></li>
					</ul>
				</div>
				<div class="list">
					<div class="list-info">
						총 17 건
					</div>
					<div class="post-list">
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
						<div class="posting">
							<img src="images/content_5.jpg">
							<div class="posting-info">
								<div class="posting-title">
									여행일정제목
								</div>
								<div class="posting-etc">
									<div class="user-name">
										홍길동
									</div>
									<img src="images/heart.png"> 
									<div class="count">
										0
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="paging">
					페이징 버튼 삽입부분
				</div>
			</div>
			<hr>
			<div class="footer">
				<div class="logo">
					<a href="/index.do"><img src="/resources/common/images/logo.svg"></a>
				</div>
				<div class="footer-info">
					<ul>
						<li><a href="">혼행소개</a></li>
						<li><a href="">개인정보처리방침</a></li>
						<li><a href="">이용약관</a></li>
						<li><a href="">사이트맵</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="bg-img"></div>
		<div class="bg-nav"></div>
	</body>
</html>