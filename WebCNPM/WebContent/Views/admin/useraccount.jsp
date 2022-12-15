<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charshet="utf-8">
<title>Danh sách tài khoản</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="${pageContext.request.contextPath}/Builder/css/style.bundle.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/Builder/css/plugins.bundle.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Builder/css/main.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	type="text/javascript"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/synaptic/1.0.6/bundle.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>

<body>
	<div class="container-fluid">
		<fmt:setLocale value="vi_VN" />
		<!-- /.row -->
		<div class="panel panel-default">
			<button class="btn btn-primary" style="margin: 20px; float: right;" onclick="loadAdminAccountAdd()"> Thêm Tài Khoản</button>
			<table class="table table-striped table-inverse" >
			
				<thead class="thead-inverse">
					<tr
						style="background-color: rgb(104, 104, 104); font-size: 14px; height: 40px; color: white; font-weight: bolder; text-align: center;">
						<td>ID</td>
						<td>Tên người dùng</td>
						<td>Tên tài khoản</td>
						<td>Quyền</td>
						<td></td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${accountList}" var="accountUser" varStatus="STT">
						<tr class="text-center product" style="font-size: 14px;">
							<td>${accountUser.id + 1}</td>
							<c:choose>
								<c:when test = "${accountUser.admin != null }">
									<td>${ accountUser.admin.fullname}</td>
								</c:when>
								<c:when test = "${accountUser.student != null }">
									<td>${ accountUser.student.fullname}</td>
								</c:when>
								<c:otherwise>
									<td>${ accountUser.lecturer.fullname}</td>
								</c:otherwise>
							</c:choose>
							<td>${accountUser.username}</td>
							<c:choose>
								<c:when test = "${accountUser.role == 0}">
									<td>Admin</td>
								</c:when>
								<c:when test = "${accountUser.role == 1}">
									<td>Giảng viên</td>
								</c:when>
								<c:otherwise>
									<td>Sinh viên</td>
								</c:otherwise>
							</c:choose>
							<td><!--  <button class="btn btn-info" 
									onclick="loadAdminUser(${accountUser.id})">
									<i class="fa fa-eye"></i>
								</button> <button class="btn btn-warning" onclick="loadAdminUserUpdate(${accountUser.id})"><i
									class="fa fa-edit" aria-hidden="true" ></i></button>--> <button
								class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/admin/account/delete?pid=${accountUser.id}'"
								><i class="fa-solid fa-trash" aria-hidden="true"></i></button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="panel panel-footer text-center slick">
			<nav aria-label="Page navigation example ">
				<div class="product_indicators" style="text-align: center">
					<c:if test="${tag>1}">
						<button class="prev"
							onclick="location.href='${pageContext.request.contextPath }/admin/account?index=${tag-12}'">&#10094;</button>
					</c:if>
					<c:forEach begin="1" end="${endP}" var="i">
						<button id='slick-dot'
							class='${tag==(12*(i-1)+1)?"active_product":"" } '
							onclick="location.href='${pageContext.request.contextPath}/admin/account?index=${12*(i-1)+1}'">${i}</button>

					</c:forEach>
					<c:if test="${((tag-1)/12+1)<endP}">
						<button class="next"
							onclick="location.href='${pageContext.request.contextPath}/admin/account?index=${tag+12}'">&#10095;</button>
					</c:if>
				</div>
			</nav>
		</div>

	</div>

	<!--<script src="../Builder/js/sort_table.js"></script>

	<script src="../Builder/js/custom_toastr.js"></script>-->

	<script src="${pageContext.request.contextPath}/Builder/js/plugins.bundle.js"></script>

	<script src="${pageContext.request.contextPath}/Builder/js/scripts.bundle.js"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/majorProject.js" type="text/javascript"></script>

	<!--<script src="../Builder/js/custom_datatables.js"></script>

	<script src="../Builder/js/custom_highcharts.js"></script>

	<script src="../Builder/js/count_visited.js"></script>-->

</body>