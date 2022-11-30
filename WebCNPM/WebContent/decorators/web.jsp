
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<head>
	<title><dec:title default="Web Page" /></title>
	<dec:head />
</head>

<body>
	
	<%@ include file="../Common/web/header.jsp"%>
	<!-- body -->
	<dec:body />
	<!-- body -->

	<%@ include file="../Common/web/footer.jsp"%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>


