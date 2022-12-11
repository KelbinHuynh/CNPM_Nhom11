<%@page import="Connection.DBConnection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="./Builder/css/login.css">
</head>
<body>
	<div class="wrapper">
		<div class="title">ĐĂNG NHẬP</div>
		<form action="login" method="post">
			<c:if test="${alert != null}">
				<h3 class="alert alertdanger">${alert}</h3>
			</c:if>
			<div class="field">
				<input type="text" name="username" required> <label>Email</label>
			</div>
			<div class="field">
				<input type="password" name="password" required> <label>Mật
					Khẩu</label>
			</div>
			<div class="content">
				<div class="checkbox">
					<input type="checkbox" id="remember-me" name="remember"> <label
						for="remember-me">Nhớ mật khẩu</label>
				</div>
				<div class="pass-link">
					<a href="/WebProject/resetpass">Quên mật khẩu?</a>
				</div>
			</div>
			<div class="field">
				<input type="submit" value="Đăng nhập">
			</div>
			<div class="signup-link">
				Bạn chưa có tài khoản <a href="/WebProject/register">Đăng ký
					ngay</a>
			</div>
		</form>
	</div>
</body>
</html>