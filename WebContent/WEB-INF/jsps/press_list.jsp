<%@page import="windy.homepage.model.PressModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<PressModel> listPress = (List<PressModel>) request.getAttribute("listPress");
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
    .press-card { cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.08); }
    .press-card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,0.14); }
    .press-thumb { width: 100%; height: 200px; object-fit: cover; background: #f0f0f0; }
    .press-thumb-placeholder { width: 100%; height: 200px; background: #f0f0f0; display: flex; align-items: center; justify-content: center; }
    .press-thumb-placeholder i { font-size: 48px; color: #ccc; }
    .press-card .card-body { padding: 16px; }
    .press-card .card-title { font-size: 15px; font-weight: 600; margin-bottom: 8px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    .press-card .card-date { font-size: 13px; color: #999; }
    .press-card .source-link { font-size: 12px; color: #0d6efd; }
  </style>
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">언론보도</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy">Home</a></li>
            <li class="current">언론보도</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">

      <div class="container section-title" data-aos="fade-up">
        <span>Press</span>
        <h2>언론보도</h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <%if (listPress == null || listPress.isEmpty()) {%>
          <div class="text-center py-5"><p>등록된 언론보도가 없습니다.</p></div>
        <%} else {%>
          <div class="row g-4">
          <%for (PressModel press : listPress) {%>
            <div class="col-lg-4 col-md-6">
              <div class="card press-card" onclick="location.href='main.windy?menu=press_detail&pressId=<%=press.getPressId()%>'">
                <%if (press.getThumbnailPath() != null && !press.getThumbnailPath().isEmpty()) {%>
                  <img src="<%=request.getContextPath()%>/<%=press.getThumbnailPath()%>" class="press-thumb" alt="<%=press.getTitle()%>" loading="lazy">
                <%} else {%>
                  <div class="press-thumb-placeholder">
                    <i class="bi bi-newspaper"></i>
                  </div>
                <%}%>
                <div class="card-body">
                  <div class="card-title"><%=press.getTitle()%></div>
                  <div class="d-flex justify-content-between align-items-center mt-2">
                    <span class="card-date"><%=press.getCreatedAt() != null ? press.getCreatedAt().substring(0, 10) : ""%></span>
                    <%if (press.getSourceUrl() != null && !press.getSourceUrl().isEmpty()) {%>
                    <span class="source-link"><i class="bi bi-box-arrow-up-right"></i> 원문보기</span>
                    <%}%>
                  </div>
                </div>
              </div>
            </div>
          <%}%>
          </div>
        <%}%>
      </div>

    </section>

  </main>

  <jsp:include page="main_footer.jsp"/>

  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script src="bootstrap_enno/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_enno/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="bootstrap_enno/assets/js/main.js"></script>

</body>
</html>
