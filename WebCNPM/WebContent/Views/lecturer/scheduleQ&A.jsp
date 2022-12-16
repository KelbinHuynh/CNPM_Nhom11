
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
	href="${pageContext.request.contextPath}/Builder/css/search.css">
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
					<div class="navbar_purchase d-flex">
						<div class="navbar_purchase--title "></div>
						<div class="navbar_purchase--filter d-flex"></div>
					</div>

					<div class="order_purchase">
						<div class="purchase_tabcontent" id="purchase_tabcontent--my">
							<c:forEach items="${tkbList }" var="tkbItem">
								<div class="purchase_item" style="margin-bottom: 20px;">
									<div class="purchase_item--order">
										<div>
											<a href="" class="purchase_item--order--title">
												<div class="purchase_item--order--id">
													Ngày vấn đáp: <strong>${tkbItem.date}</strong>
												</div>
												<div class="purchase_item--order--date">Thời gian báo
													cáo: ${tkbItem.timeofday}</div>

											</a>
											<div class="purchase_item--order--product"
												style="max-height: none">
												<a href="" class="purchase_item--product">
													<div class="purchase_item--caption">
														<div class="purchase_item--name">Các giảng viên vấn
															đáp</div>
														<c:forEach items="${tkbItem.lecturer}" var="lecturerList">
															<div class="purchase_item--name">
																<div class="purchase_item--amount">Họ và tên:
																	${lecturerList.fullname}</div>
																<div class="purchase_item--amount"
																	style="margin-left: 20px">Chuyên ngành:
																	${lecturerList.major.name}</div>
															</div>
														</c:forEach>
													</div>
												</a> <div href="" class="purchase_item--product">
													<div class="purchase_item--caption">
														<div class="purchase_item--name">Các đề tài vấn đáp</div>
														<c:forEach items="${tkbItem.team}" var="teamList">
															<c:forEach items="${projectList }" var="project">
																<c:if test="${project.team.id == teamList.id}">
																	<div class="purchase_item--amount" >${project.name}
																	<button
																		onclick="location.href='${pageContext.request.contextPath}/lecturer/ChiTietDeTai?id=${project.id}'"
																		class="btn btn_confirm" style="padding: 0; margin-left:150px">Thông tin đề tài</button></div>
																	
																</c:if>
															</c:forEach>
														</c:forEach>
													</div>
												</div>
											</div>
											
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

	<script src="${pageContext.request.contextPath}/Builder/js/main.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/purchase.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/Builder/js/majorProject.js"
		type="text/javascript"></script>
</body>
</html>