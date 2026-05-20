<%@page import="windy.homepage.model.PortfolioModel"%>
<%@page import="windy.homepage.model.PortfolioImageModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<PortfolioModel> listPortfolio = (List<PortfolioModel>) request.getAttribute("listPortfolio");
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
        <h1 class="mb-2 mb-lg-0">Portfolio</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li class="current">Portfolio</li>
          </ol>
        </nav>
      </div>
    </div>

    <section id="portfolio" class="portfolio-3 section">

      <div class="container section-title" data-aos="fade-up">
        <span>Portfolio</span>
        <h2>Portfolio</h2>
      </div>

      <div class="container">
        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">AI</li>
            <li data-filter=".filter-product">Data</li>
            <li data-filter=".filter-branding">Vision</li>
            <li data-filter=".filter-books">Monitoring</li>
          </ul>

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
          <%
          if (listPortfolio != null) {
              for (PortfolioModel p : listPortfolio) {
                  String thumbSrc = request.getContextPath() + "/img/no_image.png";
                  if (p.getImages() != null && !p.getImages().isEmpty()) {
                      thumbSrc = request.getContextPath() + "/" + p.getImages().get(0).getImagePath();
                  }
                  String cat = p.getCategory() != null ? p.getCategory() : "AI";
                  String filterClass = "filter-app";
                  if ("Data".equals(cat))            filterClass = "filter-product";
                  else if ("Vision".equals(cat))     filterClass = "filter-branding";
                  else if ("Monitoring".equals(cat)) filterClass = "filter-books";
          %>
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item <%=filterClass%>">
              <div class="portfolio-content h-100"
                   onclick="location.href='main.windy?menu=portfolio_detail&portfolioId=<%=p.getPortfolioId()%>'">
                <img src="<%=thumbSrc%>" class="img-fluid" alt="<%=p.getTitle()%>">
                <div class="portfolio-info">
                  <h4><a href="main.windy?menu=portfolio_detail&portfolioId=<%=p.getPortfolioId()%>" title="More Details"><%=p.getTitle()%></a></h4>
                  <%if (p.getSummary() != null && !p.getSummary().isEmpty()) {%>
                  <p><%=p.getSummary()%></p>
                  <%}%>
                </div>
              </div>
            </div>
          <%
              }
          }
          %>
          </div>

        </div>
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
