<%
	String id = (String) request.getAttribute("id");
	String category_id = (String)request.getAttribute("category_id");
%>
<div class="header">
	<a href='/index.do'> <img class='logo' src="/resources/common/images/logo.png"></img>
	</a>
	<%
		if (id != null) {
	%>
	<div class='login'>
		<div class="info">
			<img src="http://graph.facebook.com/${id }/picture?type=small">
			<span><a
				href="/posting/postingList.do?id=${id }&category_id=0">${name }</a></span>
		</div>
		<a href='#' onclick="logout();"><img class="login" src="/resources/common/images/logout.png"></img></a>
	</div>
	<%
		} else {
	%>
	<div class="login layer_pop_center_show">
		<a href='#'><img class="login"
			src="/resources/common/images/login.png"></img></a>
	</div>
	<%
		}
	%>
</div>