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
<title>Thông tin sinh viên</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/purchase.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Builder/css/userinfo.css">
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
	<div class="user-page">
		<div class="wrap_edit_profile">

			<div class="areas_upload_image_profile" style="float: right;">
		
			</div>
		</div>

		<div class="user-form">
			<div class="form-wrap">
				<form action="${pageContext.request.contextPath }/information" method="post">
					<div>

						<div class=" form-group">

							<label class="control-label">Mã số sinh viên</label>

							<div class="col-sm-8">
								<input class="text-box single-line" disabled="disabled"
									name="email" placeholder="Mã số sinh viên" type="text"
									value="${account.student.mssv}">

							</div>
						</div>


						<div class="form-group ">

							<label class="control-label">Họ và tên</label>

							<div class="col-sm-8">

								<input class="text-box single-line" data-val="true"
									placeholder="Nhập Họ và tên " type="text"
									disabled="disabled" name="lastname" value="${account.student.fullname}">
							</div>
						</div>

						<div class="form-group">

							<label class="control-label ">Giới tính</label>

							<div class="col-sm-8">
								<c:if test="${account.student.male eq true }">
									<input class="text-box single-line"
									placeholder="Nhập Tên" type="text" name="firstname"
									disabled="disabled" value="Nam">
								</c:if>
								<c:if test="${account.student.male eq false }">
									<input class="text-box single-line"
									placeholder="Nhập Tên" type="text" name="firstname"
									disabled="disabled" value="Nữ">
								</c:if>
								 
							</div>
						</div>

						<div class="form-group">

							<label class="control-label">Ngày sinh</label>

							<div class="col-sm-8">

								<input class="text-box single-line control" disabled="disabled" id="id_card" name="date"
									placeholder="Nhập Ngày sinh" type="text"
									value="${account.student.dateofbirth}">
								<span class="btn_update btn_update_3" onclick="update(1)">
									<i class="fa-sharp fa-solid fa-pen-to-square"></i>
								</span>
							</div>
						</div>

						<div class="form-group ">

							<label class="control-label">Số điện thoại</label>

							<div class="col-sm-8">

								<input class="text-box single-line control"
									placeholder="Nhập số điện thoại" type="text"
									disabled="disabled" name="phone" value="${account.student.phonenumber}">
								<span class="btn_update btn_update_3" onclick="update(2)">
									<i class="fa-sharp fa-solid fa-pen-to-square"></i>
								</span>
							</div>
						</div>
						
						<div class="form-group ">

							<label class="control-label">Chuyên ngành</label>

							<div class="col-sm-8">

								<input class="text-box single-line"
									placeholder="Chuyên ngành" type="text"
									disabled="disabled" name="phone" value="${account.student.major.name}">
							</div>
						</div>
					</div>
					<div class="form-group clearfix ml-5">
						<button type="submit" tabindex="5" class="btn bg-button">Cập
							nhật</button>

					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/Builder/js/main.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/purchase.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/Builder/js/userinfo.js" type="text/javascript"></script>

</body>
</html>