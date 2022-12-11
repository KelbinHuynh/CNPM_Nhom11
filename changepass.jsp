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
<title>Thay đổi password</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="../Builder/css/main.css">
<link rel="stylesheet" href="../Builder/css/responsive.css">
<link rel="stylesheet" href="../Builder/css/grid.css">
<link rel="stylesheet" href="../Builder/css/purchase.css">
<link rel="stylesheet" href="../Builder/css/userinfo.css">
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
	<div class="c-12 l-9">
		<div class="user-page">

			<div class="user-form change_form">
				<div class="form-wrap">
				<c:choose>
					<c:when test="${account.role == 1 }">
						<c:set var="linkChangePass"
							value="${pageContext.request.contextPath }/user/changepass" />
					</c:when>
					<c:when test="${account.role == 3 }">
						<c:set var="linkChangePass"
							value="${pageContext.request.contextPath }/shipper/changepass" />
					</c:when>
					<c:when test="${account.role == 4 }">
						<c:set var="linkChangePass"
							value="${pageContext.request.contextPath }/vendor/changepass" />
					</c:when>
				</c:choose>
				<form action="${linkChangePass}" method="post">
					<div>
					
						<div class="form-group reset_pass">
							<label class="control-label">Mật khẩu cũ<small
								style="color: red;">(*)</small></label>
							<div class="col-sm-8 show_pass">
								<input class="form-control text-box single-line control"
									data-val="true" placeholder="Nhập mật khẩu cũ" type="password"
									name="oldpass" autocomplete="off" readonly onclick="this.removeAttribute('readonly');"> <span class="field_icon"> <i
									class="toggle_icon_1 fa-solid fa-eye"></i>
								</span>
							</div>
						</div>

						<div class="form-group reset_pass">
							<label class="control-label">Mật khẩu mới<small
								style="color: red;">(*)</small></label>
							<div class="col-sm-8 show_pass">
								<input class="form-control text-box single-line control"
									data-val="true" placeholder="Nhập mật khẩu mới" type="password"
									name="newpass" autocomplete="off" readonly onclick="this.removeAttribute('readonly');"> <span class="field_icon"> <i
									class="toggle_icon_2 fa-solid fa-eye"></i>
								</span>
							</div>
						</div>

						<div class="form-group reset_pass">
							<label class="control-label">Nhập lại mật khẩu<small
								style="color: red;">(*)</small></label>
							<div class="col-sm-8 show_pass">
								<input class="form-control text-box single-line control"
									data-val="true" placeholder="Nhập lại mật khẩu" type="password"
									name="confirmpass" autocomplete="off" readonly onclick="this.removeAttribute('readonly');"> <span class="field_icon"> <i
									class="toggle_icon_3 fa-solid fa-eye"></i>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group clearfix ml-5">
						<div class="l-5 ">
							<button type="submit" tabindex="5" class="btn bg-button">Cập
								nhật</button>
						</div>

					</div></form>
				</div>
			</div>
		</div>
	</div>

	<script src="../Builder/js/main.js" type="text/javascript"></script>
	<script src="../Builder/js/purchase.js" type="text/javascript"></script>
	<script src="../Builder/js/userinfo.js" type="text/javascript"></script>


</body>
</html>