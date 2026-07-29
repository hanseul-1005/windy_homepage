<%@page import="windy.homepage.model.BusinessFieldModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<BusinessFieldModel> listBusinessField = (List<BusinessFieldModel>) request.getAttribute("listBusinessField");
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

  <!-- Favicons -->
  <link href="css_main/assets/img/favicon.png" rel="icon">
  <link href="css_main/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="css_main/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css_main/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css_main/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="css_main/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="css_main/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="css_main/assets/css/main.css" rel="stylesheet">
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"></jsp:include>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Business Field</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li class="current">Business Field</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Services Section -->
    <section id="services" class="services section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Business Field</span>
        <h2>Business Field</h2>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-4">

        <%-- DB에서 조회한 Business Field 목록을 카드 형태로 동적 렌더링 --%>
        <%-- icon이 "bi-"로 시작하면 Bootstrap 아이콘(<i>), 아니면 업로드 이미지(<img>) --%>
        <%
        if (listBusinessField != null && !listBusinessField.isEmpty()) {
            int delay = 100;
            for (BusinessFieldModel bf : listBusinessField) {
        %>
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="<%=delay%>">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <%if (bf.getIcon() != null && bf.getIcon().startsWith("bi-")) {%>
                  <i class="bi <%=bf.getIcon()%>"></i>
                <%} else {%>
                  <img src="<%=bf.getIcon()%>" style="width:40px; height:40px; object-fit:contain;">
                <%}%>
              </div>
              <div>
                <h3><%=bf.getTitle()%></h3>
                <p><%=bf.getContent()%></p>
              </div>
            </div>
          </div><!-- End Service Card -->
        <%
                delay += 100;
            }
        }
        %>

        </div>

      </div>

    </section><!-- /Services Section -->

  </main>

  <jsp:include page="main_footer.jsp"></jsp:include>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="css_main/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="css_main/assets/vendor/php-email-form/validate.js"></script>
  <script src="css_main/assets/vendor/aos/aos.js"></script>
  <script src="css_main/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="css_main/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="css_main/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="css_main/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="css_main/assets/js/main.js"></script>

</body>
</html>
