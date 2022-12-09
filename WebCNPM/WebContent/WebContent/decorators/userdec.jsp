
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<head>
	<title><dec:title default="Web Page" /></title>
	<dec:head />
</head>

<body>
	
	<%@ include file="../Common/user/header.jsp"%>
	<div class="container mt_20px">
		<div class="grid wide">
			<div class="center_container">
				<div class="row">
					<div class="c-12 l-3">
						<%@ include file="../Common/user/user_left.jsp"%>
					</div>
					<div class="c-12 l-9">
						<dec:body />
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../Common/user/footer.jsp"%>
</body>