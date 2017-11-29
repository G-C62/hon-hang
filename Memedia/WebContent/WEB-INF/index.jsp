<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	String category = (String) session.getAttribute("category");
	String image = (String) session.getAttribute("image");
%>
<!DOCTYPE html>
<html>
<head>
<spring:url value="/resources/common/js/sns_login.js" var="sns" />
<spring:url value="/resources/common/js/jquery-1.10.2.min.js" var="jquery" />
<spring:url value="/resources/common/js/modal.js" var="modal" />
<spring:url value="/resources/common/css/layout.css" var="layout" />
<spring:url value="/resources/common/css/modal.css" var="modal_c" />
<spring:url value="/resources/common/css/style_main.css" var="main" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>혼행</title>
<link type="text/css" rel="stylesheet" href="${layout }">
<link type="text/css" rel="stylesheet" href="${modal_c }">
<link type="text/css" rel="stylesheet" href="${main }">
<script type="text/javascript" src="${sns }"></script>
<script type="text/javascript" src="${jquery }"></script>
<script type="text/javascript" src="${modal }"></script>
</head>
<body>
	<div class="wrap">
			<div class="info-bar">
			<% if (id != null){ %>
				<div class="user-img">
					<img src="<%=image %>" style="width:25px; height:25px;">
				</div>
				<div class="user-name">
					<a href="/page/user_page_s.do?id=${id }"><%=name %></a>
				</div>
				<div class="user-info">
					<a href='#' onclick="logout();">Logout</a>
				</div>
			<%} else { %>
				<div class="user-info login layer_pop_center_show">
					<a href="#">Login</a>
				</div>
			<%} %>
			</div>
			<div class="nav-bar">
				<div class="logo">
					<a href="index.do"><img src="/resources/common/images/logo.svg"></a>
				</div>
				<div class="left-menu">
					<ul>
						<li><a href="#">여행후기</a></li>
						<li><a href="#">여행일정</a></li>
						<% if(id != null){%><li><a href="/page/user_page_s.do?id=${id }">My Page</a></li><%} %>
					</ul>
				</div>
				<div class="search-bar">
					<input type="text" name="search">
					<button class="search-btn"></button>
				</div>
			</div>
			<hr>
			<div class="content">
				<div class="first-area">
					<div class="grid-1">
						<img src="/resources/common/images/content_1.png">
						<div class="post-info">
							<div class="post-title">
								<a href="">여행후기 제목</a>
							</div>
							<div class="post-desc">
								5살때부터 난 여행을 했어. 재밌었지
							</div>
							<div class="post-user">
								<div class="user-img">
									<img src="/resources/common/images/if_profile.png">
								</div>
								<div class="user-name">
									홍길동
								</div>
								<img class="heart" src="/resources/common/images/heart.png">
								<div class="count">
									0
								</div>
							</div>
						</div>
					</div>
					<div class="grid-1">
						<img src="/resources/common/images/content_2.png">
						<div class="post-info">
							<div class="post-title">
								<a href="">여행후기 제목</a>
							</div>
							<div class="post-desc">
								5살때부터 난 여행을 했어. 재밌었지
							</div>
							<div class="post-user">
								<div class="user-img">
									<img src="/resources/common/images/if_profile.png">
								</div>
								<div class="user-name">
									홍길동
								</div>
								<img class="heart" src="/resources/common/images/heart.png">
								<div class="count">
									0
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="second-area">
					<div class="grid-2">
						<img src="/resources/common/images/content_3.jpg">
						<div class="post-info">
							<div class="post-title">
								<a href="">여행후기 제목</a>
							</div>
							<div class="post-user">
								<div class="user-img">
									<img src="/resources/common/images/if_profile.png">
								</div>
								<div class="user-name">
									홍길동
								</div>
								<img class="heart" src="/resources/common/images/heart.png">
								<div class="count">
									0
								</div>
							</div>
						</div>
					</div>
					<div class="grid-3">
						<img src="/resources/common/images/content_4.jpg">
						<div class="post-info">
							<div class="post-title">
								<a href="">여행후기 제목</a>
							</div>
							<div class="post-user">
								<div class="user-img">
									<img src="/resources/common/images/if_profile.png">
								</div>
								<div class="user-name">
									홍길동
								</div>
								<img class="heart" src="/resources/common/images/heart.png">
								<div class="count">
									0
								</div>
							</div>
						</div>						
					</div>
					<div class="grid-3">
						<img src="/resources/common/images/content_5.jpg">
						<div class="post-info">
							<div class="post-title">
								<a href="">여행후기 제목</a>
							</div>
							<div class="post-user">
								<div class="user-img">
									<img src="/resources/common/images/if_profile.png">
								</div>
								<div class="user-name">
									홍길동
								</div>
								<img class="heart" src="/resources/common/images/heart.png">
								<div class="count">
									0
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="footer">
				<div class="logo">
					<a href="index.do"><img src="/resources/common/images/logo.svg"></a>
				</div>
				<div class="footer-info">
					<ul>
						<li><a href="intro.do">서비스 소개</a></li>
						<li><a href="privacy.do">개인정보취급방침</a></li>
						<li><a href="terms.do">이용약관</a></li>
					</ul>
				</div>
			</div>
		</div>
	</body>
</html>
</html>