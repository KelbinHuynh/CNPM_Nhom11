
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
						action="${pageContext.request.contextPath }/CapNhatDeTai?idproject=${projectTeam.id}"
						class="form" method="POST">
						<div class=form__radios>
							<h2>Tên đề tài</h2>
							<input type="text" name="name" minlength="4"
								class="form__radio control" placeholder="Nhập tên đề tài"
								aria-describedby="helpId" disabled="disabled"
								value="${projectTeam.name}">
							<c:if test="${account.student.id == account.student.team.leader}">
								<span class="btn_update btn_update_1" onclick="update(1)">
									<i class="fa-sharp fa-solid fa-pen-to-square update_info"></i>Chỉnh
									Sửa
								</span>
							</c:if>
						</div>
						<div class=form__radios>
							<h2>Mô tả của đề tài</h2>
							<input type="text" name="details" minlength="4"
								class="form__radio control" placeholder="Nhập mô tả đề tài"
								aria-describedby="helpId" disabled="disabled"
								value="${projectTeam.details}">
							<c:if test="${account.student.id == account.student.team.leader}">
								<span class="btn_update btn_update_1" onclick="update(2)">
									<i class="fa-sharp fa-solid fa-pen-to-square update_info"></i>Chỉnh
									Sửa
								</span>
							</c:if>

						</div>
						<div class="form__radios">
							<h2>Chuyên ngành</h2>
							<input type="text" name="major-name"
								value="${projectTeam.major.name}" class="form__radio"
								disabled="disabled" />
						</div>

						<div class="form__radios">
							<h2>Giáo viên hướng dẫn</h2>
							<input type="text" name="lecturer"
								value="${projectTeam.lecturer.fullname}" class="form__radio"
								disabled="disabled" />
						</div>
						<div>
							<h2>Thành viên nhóm</h2>
							<div class="form__radios">
								<c:forEach items="${projectTeam.team.student }" var="student">
									<div id="info${student.id }">
										<div class="form__radio">
											<label>${student.fullname}</label> <span
												style="cursor: pointer" class=" btn_update_1"
												onclick="showinfo(${student.id})"> <i
												class="fa-solid fa-eye update_info"></i>Xem thông tin
											</span>
										</div>

									</div>
								</c:forEach>
							</div>
						</div>
						<c:if
							test="${projectTeam.team.student.size() != 2 and account.student.id == account.student.team.leader}">
							<div>
								<h2>Sinh viên quan tâm</h2>
								<div class="form__radios">
									<c:forEach items="${studentList }" var="studentCare">
										<div id="info${studentCare.id }">
											<div class="form__radio">
												<label>${studentCare.fullname}</label> <span
													style="margin-right: 30px; cursor: pointer"
													class=" btn_update_1" onclick="showinfo(${studentCare.id})">
													<i class="fa-solid fa-eye update_info"></i>Xem thông tin
												</span> <span style="cursor: pointer" class=" btn_update_1"
													onclick="location.href='${pageContext.request.contextPath }/AcceptJoinProject?sid=${studentCare.id}&idproject=${ projectTeam.id}'">
													<i class="fa-solid fa-check update_info"></i>Thêm sinh viên
												</span>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>
						<div class="form__radios">
							<h2>Trạng thái</h2>
							<c:if test="${projectTeam.protecte eq false }">
								<input type="text" name="lecturer" value="Chưa được bảo vệ"
									class="form__radio" disabled="disabled" />
							</c:if>
							<c:if test="${projectTeam.protecte eq true }">
								<input type="text" name="lecturer" value="Được bảo vệ"
									class="form__radio" disabled="disabled" />
							</c:if>
						</div>
						<div class="form__radios">
							<h2>Điểm đề tài</h2>
							<c:if test="${project.score == null }">
								<input type="text" name="lecturer" value="Chưa có điểm"
									class="form__radio" disabled="disabled" />
							</c:if>
							<c:if test="${project.score != null }">
								<input type="text" name="lecturer" value="${projectTeam.score }"
									class="form__radio" disabled="disabled" />
							</c:if>
						</div>

						<div>
							<button class="button button--full" type="submit">Cập
								nhật</button>
						</div>
					</form>
					<c:if test="${account.student.id==account.student.team.leader}">
					<form action="/" method="post" enctype="multipart/form-data">
						<div class=form__radios>
							<h2 style="margin-top: 30px">Nộp file đề tài</h2>
							<div>
								<div class="center">
								 <input type="file" id="files"
										class="btn center btn_upload_avatar" name="avatar" value=""
										data-multiple-caption="Nộp file báo cáo">
								</div>
								<div class="choose_file button button--full" style="margin-top: 10px">
									<input type="submit" 
										class="btn center btn_upload_image_profile"
										style="background-color: #fc8080;" value="Nộp đề tài">
								</div>
							</div>
						</div>

					</form>
					</c:if>
				</div>
			</section>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/Builder/js/main.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/purchase.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/userinfo.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/Builder/js/majorProject.js"
		type="text/javascript"></script>
</body>
</html>