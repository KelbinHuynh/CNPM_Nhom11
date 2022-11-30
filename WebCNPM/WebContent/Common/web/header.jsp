<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header">

	<!-- Thanh thông tin và đăng nhập -->
	<div class="header_topbar ">
		<div class="grid wide">
			<div class="header_topbar_container">
				<div class="row">
					<div class="l-6 m-8 c-8">
						<div class="header_topbar_container--contacts">
							<span>+84 358 913 075</span> <a href="#"><i
								class="fa-brands fa-pinterest"></i></a> <a href="#"><i
								class="fa-brands fa-twitter"></i></a> <a href="#"><i
								class="fa-brands fa-facebook-f"></i></a> <a href="#"><i
								class="fa-brands fa-instagram"></i></a>
						</div>
					</div>
					<div class="l-6 m-4 c-4">
						<ul class="header_topbar_container--register">
							<c:choose>
								<c:when test="${account.firstname == null}">
									<!-- Thêm đăng ký, đăng nhập vào đây -->
									<a href="${pageContext.request.contextPath}/login"
										class="login">
										<li>login</li>
									</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/logout" class="logout">
										<li>Đăng xuất</li>
									</a>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Thanh giới thiệu và danh mục -->
	<nav class="header_nav">
		<div class="header_nav_container">
			<div class="grid wide">
				<div class="row">
					<div class="l-4 m-6 c-8 mb-4">
						<a href="${pageContext.request.contextPath}/">
							<div class="header_nav_container--logo">
								Đăng Ký Đề Tài
							</div>
						</a>
					</div>
					<div class="l-4 hide-on-tablet-moblie">
						<ul class="header_nav_container--list">
							<li><a href="${pageContext.request.contextPath}/">Home</a></li>
							<li><a href="${pageContext.request.contextPath}/user/information">Trang cá nhân</a></li>
						</ul>
					</div>
					
					<div class="l-4 m-6 c-4 mb-8">
						
					</div>
				</div>
			</div>
		</div>
	</nav>


	<!-- Nút kéo lên màn hình ban đầu -->
	<div class="scroll-top">
		<i class="fa-solid fa-arrow-up"></i>
	</div>
	<!-- Thanh sau khi thay đổi màn hình -->
	<div class="header_menu">
		<div class="header_menu_overlay"></div>
		<div class="header_menu_body--content">
			<ul>
				<li><a href="pages/home.html" class="active">Home</a></li>
				<li><a href="pages/news.html" class="news">Tin tức</a></li>
				<li><a href="pages/switchboard.html" class="switchboard">Tổng đài</a></li>
				<li><a href="pages/cart.html" class="cart">Giỏ hàng</a></li>
				<li>------------------------------------------</li>
				<c:forEach items="${categoryList}" var="category">
					<li><a href="pages/${category.cate_name}">${category.cate_name}</a></li>
				</c:forEach>
			</ul>
			<i class="fa-solid fa-xmark" id="menu_close"></i>
		</div>
	</div>

</header>
<div class = "categories_menu categories_menu_container"></div>