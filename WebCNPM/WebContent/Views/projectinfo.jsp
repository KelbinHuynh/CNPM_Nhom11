
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
<link rel="stylesheet" href="./Builder/css/infoproject.css">

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
					<table class="table table-hover footable-loaded footable">
						<tbody>
							<tr>
								<td>Tên đề tài</td>
								<td>${project.name}</td>
							</tr>
							<tr>
								<td>Mục tiêu</td>
								<td>${project.details }</td>
							</tr>
							<tr>
								<td>Chú thích</td>
								<td></td>
							</tr>
							<tr>
								<td>Số lượng sinh viên</td>
								<c:if test="${project.team.student.size() != null}">
									<td><span class="badge green"
										title="Số lượng sinh viên đã đăng ký">${project.team.student.size()}</span>
										/ <span class="badge red"
										title="Tổng Số lượng sinh viên tối đa">2</span></td>
								</c:if>
								<c:if test="${project.team.student.size() == null}">
									<td><span class="badge green"
										title="Số lượng sinh viên đã đăng ký">0</span> / <span
										class="badge red" title="Tổng Số lượng sinh viên tối đa">2</span></td>
								</c:if>
							</tr>
							<tr>
								<td>Được phép đăng ký khác chuyên ngành</td>
								<td>Không</td>


							</tr>
							<tr>
								<td>Chuyên ngành</td>
								<td>${project.major.name }</td>
							</tr>
							<tr>
								<td>Trạng thái</td>
								<c:if test="${project.protecte eq false }">
									<td>Không được bảo vệ</td>
								</c:if>
								<c:if test="${project.protecte eq true }">
									<td>Được bảo vệ</td>
								</c:if>


							</tr>
							<tr class="success">
								<td>Trưởng nhóm</td>
								<c:if test="${project.team.student.size() != null}">
									<c:forEach items="${project.team.student}" var="stu">
										<c:if test="${stu.id == project.team.leader}">
											<td><a data-toggle="modal" href="#truong_nhom">${stu.fullname}</a></td>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${project.team.student.size() == null}">
									<td></td>
								</c:if>
							</tr>
							<tr>
								<td>Các Thành viên</td>
								<c:if test="${project.team.student.size() != null}">
									<c:forEach items="${project.team.student }" var="stu">
										<c:if test="${stu.id != project.team.leader}">
											<td><a data-toggle="modal" href="#truong_nhom">${stu.fullname}</a></td>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if
									test="${project.team.student.size() == null or project.team.student.size() == 1}">
									<td></td>
								</c:if>
							</tr>

							<tr class="danger">
								<td>GV hướng dẫn</td>
								<td><a data-toggle="modal" href="#GVHD">${project.lecturer.fullname }</a>
								</td>
							</tr>
							<tr class="warning">
								<td>GV phản biện</td>
								<td></td>
							</tr>
							<tr>
								<td>Điểm đề tài</td>
								<c:if test="${project.score == null }">
									<td>Chưa có điểm</td>
								</c:if>
								<c:if test="${project.score != null }">
									<td>${project.score }</td>
								</c:if>
							</tr>
							<tr>

								<td colspan="2"><c:if
										test="${account != null and (project.team.student.size() == null or project.team.student.size() == 1)}">
										<c:if test="${account.student.team.id == null}">
											<button id="back" type="button"
												class="btn btn-info close-dong" style="margin-left: 10%"
												onclick="location.href='${pageContext.request.contextPath}'">Đăng
												ký</button>
											<button id="back" type="button"
												class="btn btn-info close-dong" style="margin-left: 20%"
												onclick="location.href='${pageContext.request.contextPath}'">Quay
												về </button>
										</c:if>
										<c:if test="${account.student.team.id != null}">
											<button id="back" type="button"
												class="btn btn-info close-dong"
												onclick="location.href='${pageContext.request.contextPath}'">Quay
												về </button>
										</c:if>
									</c:if> <c:if
										test="${project.team.student.size() == 2 or account == null}">
										<button id="back" type="button"
											class="btn btn-info close-dong"
											onclick="location.href='${pageContext.request.contextPath}'">Quay
											về </button>
									</c:if></td>
							</tr>
						</tbody>
					</table>

				</div>
			</section>
		</div>
	</div>

	<script src="./Builder/js/main.js" type="text/javascript"></script>
	<script src="./Builder/js/purchase.js" type="text/javascript"></script>
	<script src="./Builder/js/majorProject.js" type="text/javascript"></script>
</body>
</html>