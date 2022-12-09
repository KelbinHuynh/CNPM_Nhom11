<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="user_info">
	<div class="avatar_info">
		<c:url value="/image?fname=${account.avatar}" var="imgUrl" />
		<img src="${imgUrl}">
	</div>
	<div class="user_caption">
		<div class="user_title">Tài khoản:</div>
		<div class="user_name">${account.firstname}</div>
	</div>
</section>

<nav class="user_sidebar">
	<ul>
		<li><a href="${pageContext.request.contextPath}/user/information"><div class="icon">
					<i class="fa-solid fa-user"></i>
				</div> <span>Tài khoản của tôi</span></a></li>
		<li><a href="${pageContext.request.contextPath}/user/changepass"><div class="icon">
					<i class="fa-solid fa-lock"></i>
				</div> <span>Đổi mật khẩu</span></a></li>
		<li><a href="${pageContext.request.contextPath}/user/purchase"><div class="icon">
					<i class="fa-solid fa-clipboard"></i>
				</div> <span>Quản lý đơn hàng</span></a></li>
		<!-- <li><a href="home.html"><div class="icon">
					<i class="fa-solid fa-star"></i>
				</div> <span>Đánh giá của tôi</span></a></li>
		<li><a href="${pageContext.request.contextPath}/user/judge"><div class="icon">
					<i class="fa-solid fa-comment"></i>
				</div> <span>Bình luận và phản hồi</span></a></li> -->
	</ul>
</nav>