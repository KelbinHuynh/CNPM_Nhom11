<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Pass</title>
<link rel="stylesheet" href="./Builder/css/login.css">
</head>
<body>
	<div class="wrapper">
		<c:if test="${alert != null}">
				<h3 class="alert alertdanger">${alert}</h3>
			</c:if>
		<div class="title">Thay đổi mật khẩu</div>
			<form action="${pageContext.request.contextPath }/resetpass"
				method="post">
				<div class="field choose_email">
					<input type="password" name="newpass" required> <label>Mật khẩu mới</label>
				</div>
				<div class="field choose_email">
					<input type="password" name="confirmpass" required> <label>Xác nhận mật khẩu mới</label>
				</div>
				<div class="field">
					<input type="submit" value="Xác Nhận">
				</div>
			</form>
	</div>
</body>
</html>