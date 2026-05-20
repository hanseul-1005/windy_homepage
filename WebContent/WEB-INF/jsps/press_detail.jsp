<%@page import="windy.homepage.model.PressModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PressModel press = (PressModel) request.getAttribute("press");
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
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  <style>
    .ql-editor { padding: 0; border: none; }
    .ql-container.ql-snow { border: none; font-size: 15px; }
    .press-detail-thumb { max-width: 100%; max-height: 400px; object-fit: contain; border-radius: 8px; }
    .press-meta { border-bottom: 1px solid #e9ecef; padding-bottom: 16px; margin-bottom: 24px; }
    .press-title { font-size: 24px; font-weight: 700; margin-bottom: 12px; }
    .btn-back { margin-top: 32px; }
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
            <li><a href="main.windy?menu=press_list">언론보도</a></li>
            <li class="current">상세</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">
      <div class="container" data-aos="fade-up">
        <%if (press != null) {%>

          <!-- 제목 + 메타 정보 -->
          <div class="press-meta">
            <h2 class="press-title"><%=press.getTitle()%></h2>
            <div class="d-flex align-items-center gap-3 text-muted" style="font-size:14px;">
              <span><i class="bi bi-calendar3 me-1"></i><%=press.getCreatedAt() != null ? press.getCreatedAt().substring(0, 10) : ""%></span>
              <%if (press.getSourceUrl() != null && !press.getSourceUrl().isEmpty()) {%>
              <a href="<%=press.getSourceUrl()%>" target="_blank" class="text-decoration-none" style="color:#0d6efd;">
                <i class="bi bi-box-arrow-up-right me-1"></i>원문 보기
              </a>
              <%}%>
            </div>
          </div>

          <!-- 썸네일 -->
          <%if (press.getThumbnailPath() != null && !press.getThumbnailPath().isEmpty()) {%>
          <div class="text-center mb-4">
            <img src="<%=request.getContextPath()%>/<%=press.getThumbnailPath()%>" class="press-detail-thumb" alt="<%=press.getTitle()%>">
          </div>
          <%}%>

          <!-- 본문 (Quill 에디터 렌더링) -->
          <%if (press.getContent() != null && !press.getContent().isEmpty()) {%>
          <div class="ql-container ql-snow">
            <div class="ql-editor"><%=press.getContent()%></div>
          </div>
          <%}%>

          <!-- 목록으로 버튼 -->
          <div class="btn-back">
            <a href="main.windy?menu=press_list" class="btn btn-outline-secondary">
              <i class="bi bi-list me-1"></i>목록으로
            </a>
          </div>

        <%} else {%>
          <div class="text-center py-5"><p>게시글을 찾을 수 없습니다.</p></div>
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
