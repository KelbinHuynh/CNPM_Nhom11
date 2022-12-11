<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chi tiết sản phẩm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
<link rel="stylesheet" href="./Builder/css/infopro.css">
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
		<div class="card-wrapper">
			<div class="card">
				<!-- card left -->
				<div class="product-imgs">
					<div class="img-display">
						<div class="img-showcase">
							<c:if test="${not empty productOne.pro_image}">
								<c:url value="/image?fname=${productOne.pro_image}" var="imgUrl" />
								<img src="${imgUrl}" alt="shoe image">
							</c:if>
							<c:if test="${not empty productImgOne.image_1 }">
								<c:url value="/image?fname=${productImgOne.image_1}"
									var="imgUrl" />
								<img src="${imgUrl}" alt="shoe image">
							</c:if>
							<c:if test="${not empty productImgOne.image_2}">
								<c:url value="/image?fname=${productImgOne.image_2}"
									var="imgUrl" />
								<img src="${imgUrl}" alt="shoe image">
							</c:if>
							<c:if test="${not empty productImgOne.image_3}">
								<c:url value="/image?fname=${productImgOne.image_3}"
									var="imgUrl" />
								<img src="${imgUrl}" alt="shoe image">
							</c:if>
							<c:if test="${not empty productImgOne.image_4}">
								<c:url value="/image?fname=${productImgOne.image_4}"
									var="imgUrl" />
								<img src="${imgUrl}" alt="shoe image">
							</c:if>
						</div>
					</div>
					<div class="img-select">
						<c:if test="${not empty productOne.pro_image}">
							<div class="img-item">
								<a href="#" data-id="1"> <c:url
										value="/image?fname=${productOne.pro_image}" var="imgUrl" />
									<img src="${imgUrl}" alt="shoe image">
								</a>
							</div>
						</c:if>
						<c:set var="id" value = "2" />
						<c:if test="${not empty productImgOne.image_1 }">
							<div class="img-item">
								<a href="#" data-id="${id}"><c:url
										value="/image?fname=${productImgOne.image_1}" var="imgUrl" />
									<img src="${imgUrl}" alt="shoe image"> </a>
							</div>
							<c:set var="id" value = "${id+1}"/>
						</c:if>
						<c:if test="${not empty productImgOne.image_2 }">
							<div class="img-item">
								<a href="#" data-id="${id}"><c:url
										value="/image?fname=${productImgOne.image_2}" var="imgUrl" />
									<img src="${imgUrl}" alt="shoe image"> </a>
							</div>
							<c:set var="id" value = "${id+1}"/>
						</c:if>
						<c:if test="${not empty productImgOne.image_3 }">
							<div class="img-item">
								<a href="#" data-id="${id}"><c:url
										value="/image?fname=${productImgOne.image_3}" var="imgUrl" />
									<img src="${imgUrl}" alt="shoe image"> </a>
							</div>
							<c:set var="id" value = "${id+1}"/>
						</c:if>
						<c:if test="${not empty productImgOne.image_4 }">
							<div class="img-item">
								<a href="#" data-id="${id}"><c:url
										value="/image?fname=${productImgOne.image_4}" var="imgUrl" />
									<img src="${imgUrl}" alt="shoe image"> </a>
							</div>
							<c:set var="id" value = "${id+1}"/>
						</c:if>
					</div>
				</div>

				<!-- card right -->
				<div class="product-content">
					<h4 class="product-title">${productOne.pro_name}</h4>
					<div class="product-rating">
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star-half-alt"></i> <span>4.7(21)</span>
					</div>

					<div class="product-price">
						<p class="last-price">
							Giá cũ: <span>${productOne.pro_price}</span>
						</p>
						<p class="new-price">
							Giá mới: <span>${productOne.pro_price}</span>
						</p>
					</div>

					<div class="product-detail">
						<h2>Về mặt hàng này:</h2>
						<p>${productOne.pro_description}</p>
						<ul>
							<li>Danh mục: <span>${styleproduct.style_name}</span></li>
							<li>Khu vực vận chuyển: <span>Trong khu vực quốc gia</span></li>
						</ul>
					</div>

					<div class="purchase-info">
						<form action="${pageContext.request.contextPath}/add" method="get">
							<input name="productid" type="text" value="${productOne.pro_Id}" style="display:none">
							<input name="quantity" type="number" min="0" value="1">
							<button type="submit" class="btn">
								Thêm vào giỏ hàng <i class="fas fa-shopping-cart"></i>
							</button>
						</form>
					</div>

					<div class="social-links">
						<p>Share At:</p>
						<a href="#"> <i class="fab fa-facebook-f"></i>
						</a> <a href="#"> <i class="fab fa-twitter"></i>
						</a> <a href="#"> <i class="fab fa-instagram"></i>
						</a> <a href="#"> <i class="fab fa-whatsapp"></i>
						</a> <a href="#"> <i class="fab fa-pinterest"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<c:set var="i" value="${0}" />
			<div class="container_new_product">
				<div class="grid wide">
					<div class="border_product_home">
						<div class="row">
							<div class="c-12">
								<div class="new_product--title">
									<p class="title">Xem thêm sản phẩm cùng loại</p>
								</div>
							</div>
						</div>

						<div class="row">
							<c:forEach items="${productList}" var="product">
								<c:choose>
									<c:when test="${i >= 4 }">

									</c:when>
									<c:when test="${product.pro_Id == productOne.pro_Id}">

									</c:when>
									<c:otherwise>
										<c:if test="${styleproduct.style_Id == product.pro_style}">
											<c:set var="i" value="${i+1}" />
											<div class="product${STT.index+1} c-3 m-6 l-3 mb-12">
												<div class="product_row--list">
													<div class="product_row--img">
														<c:url value="/image?fname=${product.pro_image}"
															var="imgUrl" />
														<a
															href="${pageContext.request.contextPath}/infopro?proid=${product.pro_Id}">
															<span class="product_row--discount">Deal Sốc</span> <img
															class="product_row--thumbnail" src="${imgUrl}" alt="">
														</a>

														<div class="product_row--img--hover">
															<a
																href="${pageContext.request.contextPath}/infopro?proid=${product.pro_Id}">
																<div class="product_row--img--note">Click để xem
																	chi tiết</div>
															</a> <a
																href="${pageContext.request.contextPath}/add?productid=${product.pro_Id}"
																class="product_row--img--btn">Đặt hàng</a>
														</div>
													</div>
													<h2 class="product_row--name">${product.pro_name}</h2>
													<div class="product_row--info">
														<div class="product_row--price">
															<del>${product.pro_price} </del>
															<br> <span class="product_row--sale">${product.pro_price}</span>
														</div>
													</div>
													<div class="new_product--percent">${product.pro_promotionalPrice}%</div>
												</div>
											</div>
										</c:if>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="./Builder/js/infopro.js" type="text/javascript"></script>
	<script src="./Builder/js/main.js"></script>
</body>
</html>
