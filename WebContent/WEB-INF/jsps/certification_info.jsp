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
    .cert-img-wrap { position: relative !important; height: 330px !important;
      background: #f8f9fa; border-radius: 6px 6px 0 0; overflow: hidden; }
    .cert-img-wrap img { position: absolute !important; top: 50% !important; left: 50% !important;
      transform: translate(-50%, -50%) !important; max-width: 100% !important;
      max-height: 330px !important; width: auto !important; height: auto !important; object-fit: contain; }
    .cert-pdf-canvas { position: absolute !important; top: 50% !important; left: 50% !important;
      transform: translate(-50%, -50%) !important; max-width: 100% !important;
      max-height: 330px !important; width: auto !important; height: auto !important; }
    .cert-pdf-loading { position: absolute !important; top: 50% !important; left: 50% !important;
      transform: translate(-50%, -50%) !important; font-size: 2rem; color: #aaa; }
    .member { box-shadow: 0 4px 16px rgba(0,0,0,0.1); border-radius: 6px; overflow: hidden; }
    .member .member-content { display: flex !important; align-items: center !important;
      justify-content: center !important; text-align: center !important;
      padding: 0 12px !important; height: 56px !important; }
    .member .member-content h4 { font-size: 0.95rem; margin: 0 !important; }
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
              <div class="cert-img-wrap" style="cursor:pointer;"
                <%if (isPdf) {%>
                  onclick="openPdfModal('<%=request.getContextPath()%>/<%=cert.getFilePath()%>', '<%=cert.getTitle().replace("'","\\'")%>')"
                <%} else {%>
                  onclick="openImgModal('<%=request.getContextPath()%>/<%=cert.getFilePath()%>', '<%=cert.getTitle().replace("'","\\'")%>')"
                <%}%>
              >
              <%if (isPdf) {%>
                <i class="bi bi-hourglass-split cert-pdf-loading" id="loading_<%=cert.getCertId()%>"></i>
                <canvas class="cert-pdf-canvas" id="pdfCanvas_<%=cert.getCertId()%>" style="display:none;"></canvas>
              <%} else {%>
                <img src="<%=request.getContextPath()%>/<%=cert.getFilePath()%>" class="img-fluid" alt="<%=cert.getTitle()%>">
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

  <!-- 이미지 모달 -->
  <div class="modal fade" id="certImgModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content" style="background:#fff; border-radius:10px; overflow:hidden;">
        <div class="modal-header" style="border-bottom:none; padding:10px 16px 6px;">
          <h6 class="modal-title" id="certImgModalTitle" style="font-size:0.95rem; font-weight:600;"></h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body text-center p-3">
          <img id="certImgModalSrc" src="" alt="" style="max-width:100%; max-height:80vh; object-fit:contain; border-radius:4px;">
        </div>
      </div>
    </div>
  </div>

  <!-- PDF 모달 -->
  <div class="modal fade" id="certPdfModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
      <div class="modal-content" style="border-radius:10px; overflow:hidden;">
        <div class="modal-header" style="border-bottom:none; padding:10px 16px 6px;">
          <h6 class="modal-title" id="certPdfModalTitle" style="font-size:0.95rem; font-weight:600;"></h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body p-0">
          <iframe id="certPdfModalSrc" src="" style="width:100%; height:80vh; border:none;"></iframe>
        </div>
      </div>
    </div>
  </div>

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
  <!-- PDF.js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
  <script>
  // PDF.js 워커 설정
  pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js';

  // PDF 첫 페이지를 canvas에 렌더링
  function renderPdfThumb(pdfUrl, canvasId, loadingId) {
    pdfjsLib.getDocument(pdfUrl).promise.then(function(pdf) {
      return pdf.getPage(1);
    }).then(function(page) {
      var canvas  = document.getElementById(canvasId);
      var loading = document.getElementById(loadingId);
      var wrapH   = 330;
      var viewport = page.getViewport({ scale: 1 });
      var scale    = wrapH / viewport.height;
      var scaled   = page.getViewport({ scale: scale });

      canvas.width  = scaled.width;
      canvas.height = scaled.height;

      page.render({ canvasContext: canvas.getContext('2d'), viewport: scaled }).promise.then(function() {
        if (loading) loading.style.display = 'none';
        canvas.style.display = 'block';
      });
    }).catch(function(err) {
      var loading = document.getElementById(loadingId);
      if (loading) {
        loading.className = 'cert-pdf-loading bi bi-file-earmark-pdf';
        loading.style.color = '#dc3545';
      }
    });
  }

  // 페이지 로드 시 모든 PDF 썸네일 렌더링
  <%
  if (listCert != null) {
    for (CertificationModel cert : listCert) {
      if ("pdf".equalsIgnoreCase(cert.getFileType())) {
  %>
  renderPdfThumb(
    '<%=request.getContextPath()%>/<%=cert.getFilePath()%>',
    'pdfCanvas_<%=cert.getCertId()%>',
    'loading_<%=cert.getCertId()%>'
  );
  <%
      }
    }
  }
  %>

  function openImgModal(src, title) {
    document.getElementById('certImgModalSrc').src = src;
    document.getElementById('certImgModalTitle').textContent = title;
    new bootstrap.Modal(document.getElementById('certImgModal')).show();
  }
  function openPdfModal(src, title) {
    document.getElementById('certPdfModalSrc').src = src;
    document.getElementById('certPdfModalTitle').textContent = title;
    new bootstrap.Modal(document.getElementById('certPdfModal')).show();
  }
  document.getElementById('certImgModal').addEventListener('hidden.bs.modal', function() {
    document.getElementById('certImgModalSrc').src = '';
  });
  document.getElementById('certPdfModal').addEventListener('hidden.bs.modal', function() {
    document.getElementById('certPdfModalSrc').src = '';
  });
  </script>

</body>
</html>
