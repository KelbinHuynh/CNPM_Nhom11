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
		<li><a href="${pageContext.request.contextPath}/shipper/shipdeliver"><div class="icon">
					<i class="fa-solid fa-clipboard"></i>
				</div> <span>Đơn hàng chưa giao</span></a></li>
		<li><a href="${pageContext.request.contextPath}/shipper/shipping"><div class="icon">
					<i class="fa-solid fa-clipboard"></i>
				</div> <span>Đơn hàng đang giao</span></a></li>
		<li><a href="${pageContext.request.contextPath}/shipper/shipped"><div class="icon">
					<i class="fa-solid fa-clipboard"></i>
				</div> <span>Đơn hàng đã giao</span></a></li>
		<li><a href="${pageContext.request.contextPath}/shipper/wallet"><div class="icon">
					<i class="fa-solid fa-wallet"></i>
				</div> <span>Ví tiền của tôi</span></a></li>
	</ul>
</nav>