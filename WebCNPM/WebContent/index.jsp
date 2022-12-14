
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
<link rel="stylesheet" href="./Builder/css/main.css">
<link rel="stylesheet" href="./Builder/css/responsive.css">
<link rel="stylesheet" href="./Builder/css/grid.css">
<link rel="stylesheet" href="./Builder/css/purchase.css">
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
			<select id="search_cn" class="form-control text-center"
				onchange="loadProjectToMajor(this);">
				<option value="-1" selected>Tất cả chuyên ngành</option>
				<c:forEach items="${majorList }" var="major">
					<option value="${major.id}">${major.name}</option>
				</c:forEach>
			</select>
			<section class="purchase_page mb_20px ">
				<div id="project_major">
					<div class="navbar_purchase d-flex">
						<div class="navbar_purchase--title ">Tổng Số Đề Tài:
							${quantityProject }</div>
						<div class="navbar_purchase--filter d-flex"></div>
					</div>

					<div class="order_purchase">
						<div class="purchase_tabcontent" id="purchase_tabcontent--my">
							<c:forEach items="${projectList }" var="project">
								<div class="purchase_item" style="margin-bottom: 20px;">
									<div class="purchase_item--order">
										<div>
											<a href="" class="purchase_item--order--title">
												<div class="purchase_item--order--id">
													STT: <strong>${project.id + 1}</strong>
												</div>
												<div class="purchase_item--order--date">Chuyên ngành:
													${project.major.name}</div> <c:if
													test="${project.team.student.size() == null }">
													<div class="purchase_item--order--status"
														style="background-color: #CD5C5C; color: white">Tình
														trạng: Chưa có người đăng ký</div>
												</c:if> <c:if test="${project.team.student.size() != null }">
													<div class="purchase_item--order--status" style="top: 5%">Tình
														trạng: Đã có người đăng ký</div>
													<div class="purchase_item--order--status" style="top: 50%">Số
														lượng: ${project.team.student.size()}/2</div>
												</c:if>

											</a>
											<div class="purchase_item--order--product">
												<a href="" class="purchase_item--product">
													<div class="purchase_item--caption">
														<div class="purchase_item--name">Tên đề tài: ${ project.name}</div>
														<div class="purchase_item--amount">Giảng viên hướng
															dẫn: ${project.lecturer.fullname}</div>
													</div>
												</a>
											</div>
											<div class="purchase_item--order--total"></div>
											<c:choose>
												<c:when test="${account != null and account.lecturer != null }">
													<button onclick="location.href='${pageContext.request.contextPath}/lecturer/ChiTietDeTai?id=${project.id}'"
												class="btn btn_confirm">Thông tin đề tài</button>
												</c:when>
												<c:otherwise>
													<button onclick="location.href='${pageContext.request.contextPath}/ChiTietDeTai?id=${project.id}'"
												class="btn btn_confirm">Thông tin đề tài</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

	<script src="./Builder/js/main.js" type="text/javascript"></script>
	<script src="./Builder/js/purchase.js" type="text/javascript"></script>
	<script src="./Builder/js/majorProject.js" type="text/javascript"></script>
</body>
</html>