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
								<c:when test="${account.student.fullname == null and account.lecturer.fullname == null and account.admin.fullname == null}">
									<!-- Thêm đăng ký, đăng nhập vào đây -->
									<a href="${pageContext.request.contextPath}/login"
										class="login">
										<li>login</li>
									</a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/information" class="user_img">
										<c:if test="${account.student.fullname != null}">
											<li>${account.student.fullname}</li>
										</c:if>
										<c:if test="${account.lecturer.fullname != null}">
											<li>${account.lecturer.fullname}</li>
										</c:if>
										<c:if test="${account.admin.fullname != null}">
											<li>${account.admin.fullname}</li>
										</c:if>
										
									</a>
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

</header>
<div class = "categories_menu categories_menu_container"></div>