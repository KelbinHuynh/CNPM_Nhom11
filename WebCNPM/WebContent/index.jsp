
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
<title>Đăng Ký Đề Tài IT</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="./Builder/css/main.css">
<link rel="stylesheet" href="./Builder/css/responsive.css">
<link rel="stylesheet" href="./Builder/css/grid.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>

<body>
	<div id="main">
		<div class="container">
			<div class="container_advertise">
				<div class="grid wide">
					<div class="row">
						<div class="m-0-1 c-2 mb-0-1"></div>
						<div class="carousel m-11 c-8 mb-11">
							<!-- Các trang quảng cáo -->
							<div class="carousel_inner">
								<div class="item fade">
									<c:url value="/image?fname=slideshow_1.png" var="imgUrl" />
									<a href=""><img src="${imgUrl }"
										alt=""></a>
								</div>
								<div class="item fade">
									<c:url value="/image?fname=slideshow_2.png" var="imgUrl" />
									<a href=""><img src="${imgUrl }"
										alt=""></a>
								</div>
								<div class="item fade">
									<c:url value="/image?fname=slideshow_3.png" var="imgUrl" />
									<a href=""><img src="${imgUrl }"
										alt=""></a>
								</div>
								<div class="item fade">
									<c:url value="/image?fname=slideshow_4.png" var="imgUrl" />
									<a href=""><img src="${imgUrl }"
										alt=""></a>
								</div>

								<!-- Nút tới và lui -->
								<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
									class="next" onclick="plusSlides(1)">&#10095;</a>

								<!-- Các nút nhỏ -->
								<div class="carousel_indicators" style="text-align: center">
									<span class="dot" onclick="currentSlide(1)"></span> <span
										class="dot" onclick="currentSlide(2)"></span> <span
										class="dot" onclick="currentSlide(3)"></span> <span
										class="dot" onclick="currentSlide(4)"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container_new_product">
				<div class="grid wide">
					<div class="border_product_home">
						<div class="row">
							<div class="c-12">
								<div class="new_product--title">
									<p class="title">Sản phẩm mới</p>
								</div>
							</div>
						</div>

						<div class="row">
							<c:forEach items="${pronewList}" var="pronew" begin="0"
								end="3">
								<div class="product c-3 m-6 l-3 mb-12">
									<div class="product_row--list">
										<div class="product_row--img">
											<c:url value="/image?fname=${pronew.pro_image}" var="imgUrl" />
											<a href="${pageContext.request.contextPath}/infopro?proid=${pronew.pro_Id}"> <span class="product_row--discount">Deal
													Sốc</span> <img class="product_row--thumbnail" src="${imgUrl}"
												alt="">
											</a>

											<div class="product_row--img--hover">
												<a
													href="${pageContext.request.contextPath}/infopro?proid=${pronew.pro_Id}">
													<div class="product_row--img--note">Click để xem chi
														tiết</div>
												</a> <a
													href="${pageContext.request.contextPath}/add?productid=${pronew.pro_Id}"
													class="product_row--img--btn">Đặt hàng</a>
											</div>
										</div>
										<h2 class="product_row--name">${pronew.pro_name}</h2>
										<div class="product_row--info">
											<div class="product_row--price">
												<del>${pronew.pro_price}</del>
												<br> <span class="product_row--sale">${pronew.pro_price}</span>
											</div>
										</div>
										<div class="new_product--percent">0%</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="container_featured_product">
				<div class="grid wide">
					<div class="border_product_home">
						<div class="row">
							<div class="c-12">
								<div class="new_product--title">
									<p class="title">Sản phẩm bán chạy</p>
								</div>
							</div>
						</div>

						<div class="row">
							<c:forEach items="${prosoldList}" var="prosold" begin="0"
								end="15">
								<div class="product0 c-3 m-6 l-3 mb-12">
									<div class="product_row--list">
										<div class="product_row--img">
											<c:url value="/image?fname=${prosold.pro_image}" var="imgUrl" />
											<a href="${pageContext.request.contextPath}/infopro?proid=${prosold.pro_Id}"> <span class="product_row--discount">Deal
													Sốc</span> <img class="product_row--thumbnail" src="${imgUrl}"
												alt="">
											</a>

											<div class="product_row--img--hover">
												<a
													href="${pageContext.request.contextPath}/infopro?proid=${prosold.pro_Id}">
													<div class="product_row--img--note">Click để xem chi
														tiết</div>
												</a> <a
													href="${pageContext.request.contextPath}/add?productid=${prosold.pro_Id}"
													class="product_row--img--btn">Đặt hàng</a>
											</div>
										</div>
										<h2 class="product_row--name">${prosold.pro_name}</h2>
										<div class="product_row--info">
											<div class="product_row--price">
												<del>${prosold.pro_price} </del>
												<br> <span class="product_row--sale">${prosold.pro_price}</span>
											</div>
										</div>
										<div class="new_product--percent">0%</div>
									</div>
								</div>
							</c:forEach>



							<div class="product_indicators" style="text-align: center">
								<button class="prev" onclick="plusPages(-1, 0)">&#10094;</button>
								<button class="slick-dot-0" onclick="currentPages(1, 0)">1</button>
								<button class="slick-dot-0" onclick="currentPages(2, 0)">2</button>
								<button class="slick-dot-0" onclick="currentPages(3, 0)">3</button>
								<button class="slick-dot-0" onclick="currentPages(4, 0)">4</button>
								<button class="next" onclick="plusPages(1, 0)">&#10095;</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:forEach items="${categoryList}" var="category" varStatus="STT">
				<c:set var="i" value="${0}" />
				<div class="container_some_product">
					<div class="grid wide">
						<div class="border_product_home">
							<div class="row">
								<div class="c-12">
									<div class="new_product--title">
										<p class="title">${category.cate_name}</p>
									</div>
								</div>
							</div>

							<div class="row">
								<c:forEach items="${styleList}" var="style">
									<c:if test="${style.cate_id == category.cate_Id}">
										<c:forEach items="${productList}" var="product">
											<c:choose>
												<c:when test="${i > 15 }">

												</c:when>
												<c:otherwise>

													<c:if test="${style.style_Id == product.pro_style}">
														<c:set var="i" value="${i+1}" />
														<div class="product${STT.index+1} c-3 m-6 l-3 mb-12">
															<div class="product_row--list">
																<div class="product_row--img">
																	<c:url value="/image?fname=${product.pro_image}" var="imgUrl" />
																	<a href="${pageContext.request.contextPath}/infopro?proid=${product.pro_Id}"> <span class="product_row--discount">Deal
																			Sốc</span> <img class="product_row--thumbnail"
																		src="${imgUrl}"
																		alt="">
																	</a>

																	<div class="product_row--img--hover">
																		<a href="${pageContext.request.contextPath}/infopro?proid=${product.pro_Id}">
																			<div class="product_row--img--note">Click để
																				xem chi tiết</div>
																		</a> <a href="${pageContext.request.contextPath}/add?productid=${product.pro_Id}" class="product_row--img--btn">Đặt hàng</a>
																	</div>
																</div>
																<h2 class="product_row--name">${product.pro_name}</h2>
																<div class="product_row--info">
																	<div class="product_row--price">
																		<del>${product.pro_price} </del>
																		<br> <span class="product_row--sale">${product.pro_price}</span>
																	</div>
																</div>
																<div class="new_product--percent">0%</div>
															</div>
														</div>
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:if>
								</c:forEach>
								<div class="product_indicators" style="text-align: center">

									<button class="prev" onclick="plusPages(-1, ${STT.index+1})">&#10094;</button>
									<button class="slick-dot-${STT.index+1}"
										onclick="currentPages(1, ${STT.index+1})">1</button>
									<button class="slick-dot-${STT.index+1}"
										onclick="currentPages(2, ${STT.index+1})">2</button>
									<button class="slick-dot-${STT.index+1}"
										onclick="currentPages(3, ${STT.index+1})">3</button>
									<button class="slick-dot-${STT.index+1}"
										onclick="currentPages(4, ${STT.index+1})">4</button>
									<button class="next" onclick="plusPages(1, ${STT.index+1})">&#10095;</button>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>

	<script src="./Builder/js/main.js" type="text/javascript"></script>
</body>
</html>