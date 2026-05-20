<%@page import="windy.homepage.model.ProductModel"%>
<%@page import="windy.homepage.model.ProductFeatureModel"%>
<%@page import="windy.homepage.model.ProductImageModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<ProductModel> listProduct = (List<ProductModel>) request.getAttribute("listProduct");
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
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Product</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li class="current">Product</li>
          </ol>
        </nav>
      </div>
    </div>

    <section id="tabs" class="tabs section">

      <div class="container section-title" data-aos="fade-up">
        <span>Product</span>
        <h2>Product</h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
      <%if (listProduct != null && !listProduct.isEmpty()) {%>
        <div class="row">

          <!-- 왼쪽 탭 목록 -->
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column" role="tablist" data-aos="fade-up" data-aos-delay="200">
            <%
            int tabIdx = 0;
            for (ProductModel p : listProduct) {
            %>
              <li class="nav-item">
                <a class="nav-link <%=tabIdx == 0 ? "active" : ""%>"
                   data-bs-toggle="tab" data-bs-target="#tab-product-<%=p.getProductId()%>" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-box-seam me-2"></i>
                    <h4><%=p.getTitle()%></h4>
                  </div>
                </a>
              </li>
            <%
              tabIdx++;
            }
            %>
            </ul>
          </div>

          <!-- 오른쪽 탭 내용 -->
          <div class="col-lg-9">
            <div class="tab-content" data-aos="fade-up" data-aos-delay="300">
            <%
            int contentIdx = 0;
            for (ProductModel p : listProduct) {
                String firstImg = null;
                if (p.getImages() != null && !p.getImages().isEmpty()) {
                    firstImg = request.getContextPath() + "/" + p.getImages().get(0).getImagePath();
                }
            %>
              <div class="tab-pane fade <%=contentIdx == 0 ? "active show" : ""%>"
                   id="tab-product-<%=p.getProductId()%>" role="tabpanel">
                <div class="row">
                  <div class="col-lg-<%=firstImg != null ? "6" : "12"%> order-2 order-lg-1">
                    <h3><%=p.getTitle()%></h3>
                    <%if (p.getSummary() != null && !p.getSummary().isEmpty()) {%>
                    <p class="fst-italic"><%=p.getSummary()%></p>
                    <%}%>
                    <%if (p.getFeatures() != null && !p.getFeatures().isEmpty()) {%>
                    <ul>
                    <%for (ProductFeatureModel f : p.getFeatures()) {%>
                      <li><i class="bi bi-check2-circle"></i> <%=f.getContent()%></li>
                    <%}%>
                    </ul>
                    <%}%>
                  </div>
                  <%if (firstImg != null) {%>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="<%=firstImg%>" alt="<%=p.getTitle()%>" class="img-fluid" loading="lazy">
                  </div>
                  <%}%>
                </div>
              </div>
            <%
              contentIdx++;
            }
            %>
            </div>
          </div>

        </div>
      <%} else {%>
        <div class="text-center py-5"><p>등록된 프로덕트가 없습니다.</p></div>
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
