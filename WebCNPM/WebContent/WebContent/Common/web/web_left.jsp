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
		<li><a href="${pageContext.request.contextPath}/"><div class="icon">
					<i class="fa-sharp fa-solid fa-calendar-week"></i>
				</div> <span>Danh sách đề tài</span></a></li>
		<li><a href="${pageContext.request.contextPath}/user/changepass"><div class="icon">
					<i class="fa-solid fa-chalkboard-user"></i>
				</div> <span>Thông tin giảng viên</span></a></li>
		<li><a href="${pageContext.request.contextPath}/user/purchase"><div class="icon">
					<i class="fa-solid fa-graduation-cap"></i>
				</div> <span>Thông tin sinh viên</span></a></li>
		<c:if test="${account.student.fullname != null and account.student.team.id == null}">
			<li><a href="${pageContext.request.contextPath}/DangKyDeTaiSV"><div class="icon">
					<i class="fa-solid fa-file-signature"></i>
				</div> <span>Đăng ký đề tài</span></a></li>	
		</c:if>
		<c:if test="${account.student.fullname != null and account.student.team.id != null}">
			<li><a href="${pageContext.request.contextPath}/ThongTinDeTaiTeam"><div class="icon">
					<i class="fa-solid fa-file-signature"></i>
				</div> <span>Quản lý team</span></a></li>	
		</c:if>
		<c:if test="${account.lecturer.fullname != null}">
			<li><a href="${pageContext.request.contextPath}/DangKyDeTai"><div class="icon">
					<i class="fa-solid fa-file-signature"></i>
				</div> <span>Đăng ký đề tài</span></a></li>	
		</c:if>
	</ul>
</nav>