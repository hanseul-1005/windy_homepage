<%@page import="windy.homepage.model.ProductImageModel"%>
<%@page import="windy.homepage.model.ProductFeatureModel"%>
<%@page import="windy.homepage.model.ProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ProductModel product = (ProductModel) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 홈페이지</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <link href="bootstrap_enno/assets/img/favicon.png" rel="icon">
  <link href="bootstrap_enno/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/css/main.css" rel="stylesheet">
  <style>
    .product-info-box { background: #f8f9fa; border-radius: 8px; padding: 24px; }
    .product-info-box h3 { margin-bottom: 12px; }
    .product-info-box ul { padding-left: 0; list-style: none; }
    .product-info-box ul li { padding: 6px 0; border-bottom: 1px solid #e9ecef; }
    .product-info-box ul li i { color: #0d6efd; margin-right: 8px; }
  </style>
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Product Detail</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li><a href="main.windy?menu=product_list">Product</a></li>
            <li class="current"><%=product != null ? product.getTitle() : "Detail"%></li>
          </ol>
        </nav>
      </div>
    </div>

    <section id="portfolio-details" class="portfolio-details section">

      <div class="container section-title" data-aos="fade-up">
        <span>Product Detail</span>
        <h2>Product Detail</h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
      <%if (product != null) {%>

        <div class="row gy-4">

          <!-- 이미지 슬라이더 -->
          <div class="col-lg-7">
            <div class="portfolio-details-slider swiper init-swiper">
              <script type="application/json" class="swiper-config">
                {
                  "loop": true,
                  "speed": 600,
                  "autoplay": { "delay": 4000 },
                  "slidesPerView": "auto",
                  "pagination": {
                    "el": ".swiper-pagination",
                    "type": "bullets",
                    "clickable": true
                  }
                }
              </script>
              <div class="swiper-wrapper align-items-center">
              <%
              List<ProductImageModel> images = product.getImages();
              if (images != null && !images.isEmpty()) {
                  for (ProductImageModel img : images) {
              %>
                <div class="swiper-slide">
                  <img src="<%=request.getContextPath()%>/<%=img.getImagePath()%>" alt="<%=product.getTitle()%>" class="img-fluid" loading="lazy">
                </div>
              <%
                  }
              } else {
              %>
                <div class="swiper-slide">
                  <img src="<%=request.getContextPath()%>/img/no_image.png" alt="" class="img-fluid">
                </div>
              <%}%>
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <!-- 우측: 제목 + 설명 + 특징 -->
          <div class="col-lg-5">
            <div class="product-info-box" data-aos="fade-left" data-aos-delay="200">
              <h3><%=product.getTitle()%></h3>
              <%if (product.getSummary() != null && !product.getSummary().isEmpty()) {%>
              <p class="fst-italic"><%=product.getSummary()%></p>
              <%}%>
              <%
              List<ProductFeatureModel> features = product.getFeatures();
              if (features != null && !features.isEmpty()) {
              %>
              <ul>
              <%for (ProductFeatureModel f : features) {%>
                <li><i class="bi bi-check2-circle"></i><%=f.getContent()%></li>
              <%}%>
              </ul>
              <%}%>
              <div class="mt-3">
                <a href="main.windy?menu=product_list" class="btn btn-outline-secondary btn-sm">목록으로</a>
              </div>
            </div>
          </div>

        </div>

      <%} else {%>
        <div class="text-center py-5"><p>프로덕트 정보를 찾을 수 없습니다.</p></div>
      <%}%>

      </div>

    </section>

  </main>

  <jsp:include page="main_footer.jsp"/>

  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script src="bootstrap_enno/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_enno/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_enno/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="bootstrap_enno/assets/js/main.js"></script>

</body>
</html>
