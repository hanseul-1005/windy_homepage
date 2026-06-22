<%@page import="windy.homepage.model.VideoModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<VideoModel> listVideo = (List<VideoModel>) request.getAttribute("listVideo");
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
  <link href="bootstrap_windy/assets/img/favicon.png" rel="icon">
  <link href="bootstrap_windy/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/css/main.css" rel="stylesheet">
  <style>
    .video-card { border-radius: 10px; overflow: hidden; cursor: pointer; background: #fff;
      box-shadow: 0 2px 12px rgba(0,0,0,0.1); transition: transform 0.3s, box-shadow 0.3s; border: none; }
    .video-card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,0.15); }
    .video-card .video-thumb { position: relative; overflow: hidden; }
    .video-card .video-thumb img { width: 100%; aspect-ratio: 16/9; object-fit: cover; display: block; transition: transform 0.3s; }
    .video-card:hover .video-thumb img { transform: scale(1.04); }
    .video-card .video-thumb .no-thumb { width: 100%; aspect-ratio: 16/9; background: #1a1a1a;
      display: flex; align-items: center; justify-content: center; color: #555; font-size: 3rem; }
    .video-card .play-btn { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
      width: 52px; height: 52px; background: rgba(255,255,255,0.9); border-radius: 50%;
      display: flex; align-items: center; justify-content: center; font-size: 1.3rem; color: #ff0000; transition: 0.3s; }
    .video-card:hover .play-btn { background: #fff; transform: translate(-50%, -50%) scale(1.1); }
    .video-card .video-body { padding: 14px 16px 16px; }
    .video-card .video-title { font-size: 0.95rem; font-weight: 700; color: #2d2d2d; margin-bottom: 6px;
      display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; line-height: 1.4; }
    .video-card .video-badge { display: inline-block; font-size: 0.72rem; font-weight: 600;
      background: #e8f0fe; color: #1a73e8; border-radius: 4px; padding: 2px 8px; margin-bottom: 6px; }
    .video-card .video-desc { font-size: 0.8rem; color: #666; line-height: 1.5;
      display: -webkit-box; -webkit-line-clamp: 5; -webkit-box-orient: vertical; overflow: hidden; }
  </style>
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Video</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy">Home</a></li>
            <li class="current">Video</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">

      <div class="container section-title" data-aos="fade-up">
        <span>Video</span>
        <h2>Video</h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <%if (listVideo == null || listVideo.isEmpty()) {%>
          <div class="text-center py-5"><p>등록된 영상이 없습니다.</p></div>
        <%} else {%>
          <div class="row g-4">
          <%
          for (VideoModel v : listVideo) {
            String ytUrl = v.getYoutubeUrl();
            String ytId  = null;
            if (ytUrl != null && !ytUrl.isEmpty()) {
              if (ytUrl.contains("youtu.be/")) {
                int idx = ytUrl.indexOf("youtu.be/") + 9;
                String id = ytUrl.substring(idx);
                if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
                if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
                if (id.length() == 11) ytId = id;
              } else if (ytUrl.contains("/shorts/")) {
                int idx = ytUrl.indexOf("/shorts/") + 8;
                String id = ytUrl.substring(idx);
                if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
                if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
                if (id.length() == 11) ytId = id;
              } else if (ytUrl.contains("v=")) {
                int idx = ytUrl.indexOf("v=") + 2;
                String id = ytUrl.substring(idx);
                if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
                if (id.length() == 11) ytId = id;
              } else if (ytUrl.contains("embed/")) {
                int idx = ytUrl.indexOf("embed/") + 6;
                String id = ytUrl.substring(idx);
                if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
                if (id.length() == 11) ytId = id;
              }
            }
            String thumbUrl = ytId != null ? "https://img.youtube.com/vi/" + ytId + "/mqdefault.jpg" : "";
            String safeTitle = v.getTitle().replace("'", "\\'").replace("\"", "&quot;");
          %>
            <div class="col-lg-4 col-md-6" data-aos="fade-up">
              <div class="video-card" onclick="openVideoModal('<%=ytId != null ? ytId : ""%>', '<%=safeTitle%>')">
                <div class="video-thumb">
                  <%if (!thumbUrl.isEmpty()) {%>
                    <img src="<%=thumbUrl%>" alt="<%=v.getTitle()%>" loading="lazy">
                  <%} else {%>
                    <div class="no-thumb"><i class="bi bi-youtube"></i></div>
                  <%}%>
                  <div class="play-btn"><i class="bi bi-play-fill"></i></div>
                </div>
                <div class="video-body">
                  <div class="video-title"><%=v.getTitle()%></div>
                  <span class="video-badge"><i class="bi bi-youtube me-1"></i>YouTube</span>
                  <%if (v.getDescription() != null && !v.getDescription().isEmpty()) {%>
                  <div class="video-desc"><%=v.getDescription()%></div>
                  <%}%>
                </div>
              </div>
            </div>
          <%}%>
          </div>
        <%}%>
      </div>

    </section>

  </main>

  <!-- Video Modal -->
  <div class="modal fade" id="videoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content" style="background:#000; border:none; border-radius:10px; overflow:hidden;">
        <div class="modal-header" style="border:none; padding:10px 14px 6px;">
          <h6 class="modal-title text-white" id="videoModalTitle" style="font-size:0.95rem;"></h6>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body p-0">
          <div style="position:relative; padding-bottom:56.25%; height:0;">
            <iframe id="videoModalFrame" src="" allowfullscreen
              style="position:absolute; top:0; left:0; width:100%; height:100%; border:none;"></iframe>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="main_footer.jsp"/>

  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script src="bootstrap_windy/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_windy/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_windy/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_windy/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="bootstrap_windy/assets/js/main.js"></script>
  <script>
  function openVideoModal(ytId, title) {
    if (!ytId) return;
    document.getElementById('videoModalTitle').textContent = title;
    document.getElementById('videoModalFrame').src = 'https://www.youtube.com/embed/' + ytId + '?autoplay=1';
    new bootstrap.Modal(document.getElementById('videoModal')).show();
  }
  document.getElementById('videoModal').addEventListener('hidden.bs.modal', function() {
    document.getElementById('videoModalFrame').src = '';
  });
  </script>

</body>
</html>
