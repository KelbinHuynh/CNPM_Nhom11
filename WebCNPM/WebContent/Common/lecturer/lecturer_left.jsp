<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="user_info">
	<div class="user_caption">
		<div class="user_title">DOANH MỤC</div>
	</div>
</section>

<nav class="user_sidebar">
	<ul>
		<li><a href="${pageContext.request.contextPath}/lecturer"><div class="icon">
					<i class="fa-sharp fa-solid fa-calendar-week"></i>
				</div> <span>Danh sách đề tài</span></a></li>
		<li><a href="${pageContext.request.contextPath}/lecturer/projectoflecturer"><div class="icon">
					<i class="fa-sharp fa-solid fa-calendar-week"></i>
				</div> <span>Danh sách đề tài của tôi</span></a></li>
		<li><a href="${pageContext.request.contextPath}/lecturer/DangKyDeTaiGV"><div class="icon">
					<i class="fa-solid fa-file-signature"></i>
				</div> <span>Đăng ký đề tài</span></a></li>	
		<li><a href="${pageContext.request.contextPath}/lecturer/LichVanDap"><div class="icon">
					<i class="fa-solid fa-file-signature"></i>
				</div> <span>Lịch vấn đáp</span></a></li>	
	</ul>
</nav>