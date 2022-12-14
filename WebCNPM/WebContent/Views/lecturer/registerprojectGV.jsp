
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/purchase.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/infoproject.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/payment.css">
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
					<form action="${pageContext.request.contextPath }/DangKyDeTaiGV"
						class="form" method="POST">
						<div class=form__radios>
							<h2>Tên đề tài</h2>
							<input type="text" name="name" minlength="4" class="form__radio"
								placeholder="Nhập tên đề tài" aria-describedby="helpId">
						</div>
						<div class=form__radios>
							<h2>Mô tả của đề tài</h2>
							<input type="text" name="details" minlength="4"
								class="form__radio" placeholder="Nhập mô tả đề tài"
								aria-describedby="helpId">
						</div>
						<div>
							<h2>Chuyên ngành</h2>
							<div class="form__radios">
								<c:forEach items="${majorList }" var="major">
									<div class="form__radio">
										<label>${major.name}</label> <input type="radio"
											name="major-name" value="${major.id}" />
									</div>
								</c:forEach>
							</div>
						</div>

						<div>
							<h2>Giáo viên hướng dẫn</h2>
							<div class="form__radios">
								<input type="text" name="lecturer"
									value="${account.lecturer.fullname}" class="form__radio"
									disabled="disabled" />
							</div>
						</div>

						<div>
							<h2>Sinh viên trưởng nhóm</h2>
							<div class="form__radios">
								<input type="text" name="studentleader" id ="studentLeader"
									class="form__radio"
									placeholder="Nhập mã số sinh viên trưởng nhóm" oninput="infoStudentToSearch(this)"/>
							</div>
							<div class="form__radios" id="infoStudent">
							</div>
						</div>

						<div>
							<button class="button button--full" type="submit">Đăng
								ký</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/Builder/js/main.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/purchase.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/majorProject.js" type="text/javascript"></script>
</body>
</html>