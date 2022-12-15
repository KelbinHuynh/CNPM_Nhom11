<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="kt_header" class="header no-print align-items-stretch">

	<div
		class="container-fluid d-flex align-items-stretch justify-content-between ">

		<div class="d-flex align-items-center d-lg-none ms-n3 me-1"
			title="Show aside menu">
			<div class="btn btn-icon btn-active-color-white"
				id="kt_aside_mobile_toggle">
				<i class="bi bi-list fs-1"></i>
			</div>
		</div>


		<div class="d-flex align-items-center flex-grow-1 flex-lg-grow-0">
			<a href="${pageContext.request.contextPath}/admin" class="d-lg-none"> 
				
			</a>
		</div>
		<div
			class="d-flex align-items-stretch justify-content-between flex-lg-grow-1 ">

			<div class="d-flex align-items-stretch" id="kt_header_nav">

				<div class="header-menu align-items-stretch" data-kt-drawer="true"
					data-kt-drawer-name="header-menu"
					data-kt-drawer-activate="{default: true, lg: false}"
					data-kt-drawer-overlay="true"
					data-kt-drawer-width="{default:'200px', '300px': '250px'}"
					data-kt-drawer-direction="end"
					data-kt-drawer-toggle="#kt_header_menu_mobile_toggle"
					data-kt-place="true" data-kt-place-mode="prepend"
					data-kt-place-parent="{default: '#kt_body', lg: '#kt_header_nav'}">

					<div
						class="menu menu-lg-rounded menu-column menu-lg-row menu-state-bg menu-title-gray-700 menu-state-title-primary menu-state-icon-primary menu-state-bullet-primary menu-arrow-gray-400 fw-bold my-5 my-lg-0 align-items-stretch"
						id="#kt_header_menu" data-kt-menu="true">
						<div class="menu-item me-lg-1">
							<a class="menu-link active py-3" href="#"> <span
								class="menu-title">Bảng điều khiển</span>
							</a>
						</div>
					</div>
				</div>

			</div>


			<div class="d-flex align-items-stretch flex-shrink-0">
				<div class="topbar d-flex align-items-stretch flex-shrink-0">
					<div class="d-flex align-items-stretch"
						id="kt_header_user_menu_toggle">
						<div
							class="topbar-item cursor-pointer symbol px-3 px-lg-5 me-n3 me-lg-n5 symbol-30px symbol-md-35px"
							data-kt-menu-trigger="click" data-kt-menu-attach="parent"
							data-kt-menu-placement="bottom-end" data-kt-menu-flip="bottom">
						</div>
						<div
							class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-bold py-4 fs-6 w-275px"
							data-kt-menu="true">
							<div class="menu-item px-3">
								<div class="menu-content d-flex align-items-center px-3">
									<div class="symbol symbol-50px me-5">
									</div>
									<div class="d-flex flex-column">
										<div
											class="fw-bolder d-flex align-items-center fs-5 limit_email_name"
											data-bs-toggle="tooltip" data-bs-placement="bottom" title=""
											data-bs-original-title="${account.admin.fullname }">
											${account.admin.fullname}</div>
										<a class="fw-bold text-muted text-hover-primary fs-7">Quản
											trị viên</a>
									</div>

								</div>
							</div>


							<div class="separator my-2"></div>


							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/admin" class="menu-link px-5">Về
									trang chủ</a>
							</div>

							<div class="menu-item px-5">
								<a href="${pageContext.request.contextPath}/logout" class="menu-link px-5">Đăng
									xuất</a>
							</div>

						</div>

					</div>
				</div>

			</div>

		</div>

	</div>

</div>



