<%@page import="windy.homepage.model.CertificationModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<CertificationModel> listCert = (List<CertificationModel>) request.getAttribute("listCert");
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
    .cert-img-wrap { height: 220px; display: flex; align-items: center; justify-content: center;
      background: #f8f9fa; border-radius: 6px; overflow: hidden; }
    .cert-img-wrap img { max-height: 220px; object-fit: contain; }
    .cert-pdf-icon { font-size: 60px; color: #dc3545; }
  </style>
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Certifications</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=history_list">Company</a></li>
            <li class="current">Certifications</li>
          </ol>
        </nav>
      </div>
    </div>

    <section id="team" class="team section">

      <div class="container section-title" data-aos="fade-up">
        <span>Certifications</span>
        <h2>Certifications</h2>
      </div>

      <div class="container">
        <div class="row">
        <%
        int delay = 100;
        if (listCert != null) {
            for (CertificationModel cert : listCert) {
                boolean isPdf = "pdf".equalsIgnoreCase(cert.getFileType());
        %>
          <div class="col-lg-4 col-md-6 d-flex" data-aos="fade-up" data-aos-delay="<%=delay%>">
            <div class="member w-100">
              <div class="cert-img-wrap">
              <%if (isPdf) {%>
                <a href="<%=request.getContextPath()%>/<%=cert.getFilePath()%>" target="_blank" title="<%=cert.getTitle()%>">
                  <i class="bi bi-file-earmark-pdf cert-pdf-icon"></i>
                </a>
              <%} else {%>
                <a href="<%=request.getContextPath()%>/<%=cert.getFilePath()%>" target="_blank">
                  <img src="<%=request.getContextPath()%>/<%=cert.getFilePath()%>" class="img-fluid" alt="<%=cert.getTitle()%>">
                </a>
              <%}%>
              </div>
              <div class="member-content">
                <h4><%=cert.getTitle()%></h4>
              </div>
            </div>
          </div>
        <%
              delay = delay >= 300 ? 100 : delay + 100;
            }
        }
        if (listCert == null || listCert.isEmpty()) {
        %>
          <div class="col-12 text-center py-5"><p>등록된 인증서/문서가 없습니다.</p></div>
        <%}%>
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
