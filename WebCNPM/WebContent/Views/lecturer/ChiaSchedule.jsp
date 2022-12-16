
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng Ký Đề Tài IT</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/main.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/purchase.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/infoproject.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Builder/css/payment.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div id="main">
		<div id="search">
			<section class="purchase_page mb_20px ">
				<div id="project_major">
					<form
						action="${pageContext.request.contextPath }/lecturer/XepLich"
						class="form" method="POST">
						<c:if test="${thongbao != null }">
							<div class=form__radios>
								<h2>Thông báo</h2>
								<input type="text" name="thongbao" minlength="4"
									class="form__radio" aria-describedby="helpId"
									value="${thongbao}" disabled="disabled">
							</div>
						</c:if>

						<div class=form__radios>
							<h2>Phòng</h2>
							<input type="text" name="phong" minlength="4" class="form__radio"
								placeholder="Nhập phòng" aria-describedby="helpId">
						</div>
						<div class=form__radios>
							<h2>Ngày vấn đáp</h2>
							<input type="date" name="day" class="form__radio"
								aria-describedby="helpId">
						</div>
						<div class=form__radios>
							<h2>Thời gian vấn đáp</h2>
							<input type="time" name="timeofdate" class="form__radio"
								aria-describedby="helpId">
						</div>

						<div>
							<h2>Giảng viên vấn đáp</h2>
							<div class="form__radios">
							<c:forEach items="${lecturerList }" var="lecturer">
								<div class="form__radio">
									<label>${lecturer.fullname}</label> <label>${lecturer.major.name}</label>
									<a></a> <input onclick="return myfun()"
										type="checkbox" name="method-lecturer" value="${lecturer.id}" />
								</div></c:forEach>
							</div >
							<div style="margin-top: 10px; color: red"><span id="notvalid" style="margin-top: 10px"></span></div>
						</div>

						<div>
							<h2>Đề tài vấn đáp</h2>
							<div class="form__radios">
							<c:forEach items="${projectList }" var="project">
								<div class="form__radio">
									<label>${project.name}</label>
									<a></a> <input onclick="return myfunProject()"
										type="checkbox" name="method-project" value="${project.id}" />
								</div></c:forEach>
							</div >
							<div style="margin-top: 10px; color: red"><span id="notvalidProject" style="margin-top: 10px"></span></div>
						</div>

						<div>
							<button class="button button--full" type="submit">Tạo
								lịch vấn đáp</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/Builder/js/main.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/purchase.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/Builder/js/majorProject.js"
		type="text/javascript"></script>
</body>
</html>