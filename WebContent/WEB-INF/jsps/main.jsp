<%@page import="windy.homepage.model.PortfolioModel"%>
<%@page import="windy.homepage.model.PortfolioImageModel"%>
<%@page import="windy.homepage.model.NoticeModel"%>
<%@page import="windy.homepage.model.VideoModel"%>
<%@page import="windy.homepage.model.PopupModel"%>
<%@page import="windy.homepage.model.BusinessFieldModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<PortfolioModel>     listPortfolio    = (List<PortfolioModel>)     request.getAttribute("listPortfolio");
List<NoticeModel>        listNotice       = (List<NoticeModel>)        request.getAttribute("listNotice");
List<VideoModel>         listVideo        = (List<VideoModel>)         request.getAttribute("listVideo");
@SuppressWarnings("unchecked")
List<PopupModel>         listPopup        = (List<PopupModel>)         request.getAttribute("listPopup");
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
	 <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	 <style>
	   .notice-content { overflow: hidden; font-size: 14px; line-height: 1.7; }
	   .notice-content p { margin: 0 0 4px 0; }
	   .video-card { border-radius: 10px; overflow: hidden; cursor: pointer; background: #fff;
	     box-shadow: 0 2px 12px rgba(0,0,0,0.1); transition: transform 0.3s, box-shadow 0.3s; }
	   .video-card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,0.15); }
	   .video-card .video-thumb { position: relative; overflow: hidden; }
	   .video-card .video-thumb img { width: 100%; aspect-ratio: 16/9; object-fit: cover; display: block; transition: transform 0.3s; }
	   .video-card:hover .video-thumb img { transform: scale(1.04); }
	   .video-card .play-btn { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);
	     width: 48px; height: 48px; background: rgba(255,255,255,0.9); border-radius: 50%;
	     display: flex; align-items: center; justify-content: center; font-size: 1.3rem; color: #ff0000; transition: 0.3s; }
	   .video-card:hover .play-btn { background: #fff; transform: translate(-50%, -50%) scale(1.1); }
	   .video-card .video-body { padding: 14px 16px 16px; }
	   .video-card .video-title { font-size: 0.95rem; font-weight: 700; color: #2d2d2d; margin-bottom: 6px;
	     display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; line-height: 1.4; }
	   .video-card .video-badge { display: inline-block; font-size: 0.72rem; font-weight: 600;
	     background: #e8f0fe; color: #1a73e8; border-radius: 4px; padding: 2px 8px; margin-bottom: 6px; }
	   .video-card .video-desc { font-size: 0.8rem; color: #666; line-height: 1.5;
	     display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
	   .btn-getstarted {
	     color: var(--contrast-color);
	     background: var(--heading-color);
	     font-size: 14px;
	     padding: 8px 25px;
	     border-radius: 50px;
	     border: none;
	     cursor: pointer;
	     transition: 0.3s;
	   }
	   .btn-getstarted:hover {
	     background: color-mix(in srgb, var(--accent-color), transparent 15%);
	   }
	   /* 포트폴리오 카드 이미지 */
	   .portfolio-content .thumb-img {
	     width: 100%; height: 220px; object-fit: cover; display: block;
	   }
	   .portfolio-content .no-img-box {
	     width: 100%; height: 220px; background: #f0f2f5;
	     display: flex; flex-direction: column; align-items: center; justify-content: center; color: #bbb;
	   }
	   .portfolio-content .no-img-box i { font-size: 2.5rem; margin-bottom: 6px; }
	   .portfolio-content .no-img-box span { font-size: 0.8rem; }
	 </style>


</head>

<body class="index-page">

	<jsp:include page="main_top_menu.jsp"></jsp:include>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <img src="img/main_background2.png" alt="" data-aos="fade-in">

      <div class="container">
        <div class="row">
          <div class="col-xl-4">
            <h1 data-aos="fade-up">We will find a way</h1>
            <blockquote data-aos="fade-up" data-aos-delay="100">
              <p>“우리는 방법을 찾을 것이다”<br/></p>
              <p>뜻을 가진 저희 윈디는 인공지능 알고리즘을 자동화 공정에 접목하여 첨단 스마트 공장 구축을 도와주는 솔루션 업체입니다. 특히, 저희는 데이터관리, 비전, 인공지능 분야에 솔루션을 제공하고 있습니다.</p>
            </blockquote>
            <div class="d-flex" data-aos="fade-up" data-aos-delay="200">

            </div>
          </div>
        </div>
      </div>

    </section><!-- /Hero Section -->

    <!-- Portfolio 3 Section -->
    <section id="portfolio" class="portfolio-3 section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Portfolio</span>
        <h2>Portfolio</h2>
        <!-- <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p> -->
      </div><!-- End Section Title -->

      <div class="container">

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">All</li>
            <li data-filter=".filter-app">AI</li>
            <li data-filter=".filter-product">Data</li>
            <li data-filter=".filter-branding">Vision</li>
            <li data-filter=".filter-books">Monitoring</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
          <%
          if (listPortfolio != null) {
              for (PortfolioModel p : listPortfolio) {
                  boolean hasImage = p.getImages() != null && !p.getImages().isEmpty();
                  String thumbSrc = hasImage ? request.getContextPath() + "/" + p.getImages().get(0).getImagePath() : "";
                  String cat = p.getCategory() != null ? p.getCategory() : "AI";
                  String filterClass = "filter-app";
                  if ("Data".equals(cat))            filterClass = "filter-product";
                  else if ("Vision".equals(cat))     filterClass = "filter-branding";
                  else if ("Monitoring".equals(cat)) filterClass = "filter-books";
          %>
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item <%=filterClass%>">
              <div class="portfolio-content h-100"
                   onclick="location.href='main.windy?menu=portfolio_detail&portfolioId=<%=p.getPortfolioId()%>'">
                <%if (hasImage) {%>
                <img src="<%=thumbSrc%>" class="thumb-img" alt="<%=p.getTitle()%>"
                     onerror="this.style.display='none';this.nextElementSibling.style.display='flex';">
                <div class="no-img-box" style="display:none;">
                  <i class="bi bi-image"></i><span>이미지 없음</span>
                </div>
                <%} else {%>
                <div class="no-img-box">
                  <i class="bi bi-image"></i><span>이미지 없음</span>
                </div>
                <%}%>
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
          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- /Portfolio 3 Section -->

    <!-- Services Section -->
    <section id="services" class="services section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Business Field</span>
        <h2>Business Field</h2>
        <!-- <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p> -->
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-4">

        <%
        if (listBusinessField != null && !listBusinessField.isEmpty()) {
            int delay = 100;
            for (BusinessFieldModel bf : listBusinessField) {
        %>
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="<%=delay%>">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi <%=bf.getIcon()%>"></i>
              </div>
              <div>
                <h3><%=bf.getTitle()%></h3>
                <p><%=bf.getContent()%></p>
              </div>
            </div>
          </div>
        <%
                delay += 100;
            }
        }
        %>

        </div>

      </div>

    </section><!-- /Services Section -->

    <!-- Video Section -->
    <%if (listVideo != null && !listVideo.isEmpty()) {%>
    <section id="video" class="section light-background">

      <div class="container section-title" data-aos="fade-up">
        <span>Video</span>
        <h2>Video</h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <div class="row gy-4">
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
              if (!id.isEmpty()) ytId = id;
            } else if (ytUrl.contains("/shorts/")) {
              int idx = ytUrl.indexOf("/shorts/") + 8;
              String id = ytUrl.substring(idx);
              if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
              if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
              if (!id.isEmpty()) ytId = id;
            } else if (ytUrl.contains("v=")) {
              int idx = ytUrl.indexOf("v=") + 2;
              String id = ytUrl.substring(idx);
              if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
              if (!id.isEmpty()) ytId = id;
            } else if (ytUrl.contains("embed/")) {
              int idx = ytUrl.indexOf("embed/") + 6;
              String id = ytUrl.substring(idx);
              if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
              if (!id.isEmpty()) ytId = id;
            }
          }
          String thumbUrl = ytId != null ? "https://img.youtube.com/vi/" + ytId + "/mqdefault.jpg" : "";
          String embedUrl = ytId != null ? "https://www.youtube.com/watch?v=" + ytId : (ytUrl != null ? ytUrl : "#");
        %>
          <div class="col-lg-4 col-md-6" data-aos="fade-up">
            <div class="video-card" onclick="openVideoModal('<%=ytId != null ? ytId : ""%>', '<%=v.getTitle().replace("'", "\\'")%>')">
              <div class="video-thumb">
                <%if (!thumbUrl.isEmpty()) {%>
                  <img src="<%=thumbUrl%>" alt="<%=v.getTitle()%>">
                <%} else {%>
                  <div style="width:100%;aspect-ratio:16/9;background:#1a1a1a;"></div>
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
      </div>

    </section><!-- /Video Section -->

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
    <%}%>

    <!-- Faq 2 Section -->
    <section id="faq-2" class="faq-2 section">

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="content px-xl-5">
              <h3><!-- <span>Notice</span> --><strong>Notice</strong></h3>
              <!-- <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
              </p> -->
            </div>
          </div>

          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">

            <div class="faq-container">
            <%
            if (listNotice != null && !listNotice.isEmpty()) {
                for (int i = 0; i < listNotice.size(); i++) {
                    NoticeModel n = listNotice.get(i);
            %>
              <div class="faq-item">
                <h3><span class="num"><%=i+1%>.</span> <span><%=n.getTitle()%></span></h3>
                <div class="faq-content">
                  <div class="notice-content"><%=n.getContent() != null ? n.getContent() : ""%></div>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>
            <%
                }
            } else {
            %>
              <div class="faq-item faq-active">
                <h3><span>등록된 공지사항이 없습니다.</span></h3>
                <div class="faq-content"><p></p></div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div>
            <%
            }
            %>
            </div>

          </div>
        </div>

      </div>

    </section><!-- /Faq 2 Section -->

   <section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Contact us</span>
        <h2>Contact Us</h2>
        <!-- <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p> -->
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">
          <div class="col-lg-6 ">
            <div class="row gy-4">

              <div class="col-lg-12">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
                  <i class="bi bi-geo-alt"></i>
                  <h3>주소</h3>
                  <p>전남광주통합특별시 북구 첨단과기로208번길 17-11, 206호</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>연락처</h3>
                  <p>0507-1347-0136</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>이메일</h3>
                  <p>sybaek@windy.ai.kr</p>
                </div>
              </div><!-- End Info Item -->

            </div>
          </div>

          <div class="col-lg-6">
            <form id="contactForm" class="php-email-form" data-aos="fade-up" data-aos-delay="500">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" id="contactName" class="form-control" placeholder="Your Name" required="">
                </div>

                <div class="col-md-6">
                  <input type="email" id="contactEmail" class="form-control" placeholder="Your Email" required="">
                </div>

                <div class="col-md-12">
                  <input type="text" id="contactSubject" class="form-control" placeholder="Subject" required="">
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" id="contactContent" rows="4" placeholder="Message" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <button type="button" class="btn-getstarted" onclick="goContact()">보내기</button>
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- /Contact Section -->

  </main>

	<jsp:include page="main_footer.jsp"></jsp:include>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="css_main/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="css_main/assets/vendor/php-email-form/validate.js"></script>
  <script src="css_main/assets/vendor/aos/aos.js"></script>
  <script src="css_main/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="css_main/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="css_main/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="css_main/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="css_main/assets/js/main.js"></script>
  <script>
  function openVideoModal(ytId, title) {
    if (!ytId) return;
    var modalEl = document.getElementById('videoModal');
    if (!modalEl) return;
    $('#videoModalTitle').text(title);
    $('#videoModalFrame').attr('src', 'https://www.youtube.com/embed/' + ytId + '?autoplay=1');
    new bootstrap.Modal(modalEl).show();
  }

  var _videoModalEl = document.getElementById('videoModal');
  if (_videoModalEl) {
    _videoModalEl.addEventListener('hidden.bs.modal', function() {
      $('#videoModalFrame').attr('src', '');
    });
  }

  function goContact() {
    var name    = $('#contactName').val().trim();
    var email   = $('#contactEmail').val().trim();
    var subject = $('#contactSubject').val().trim();
    var content = $('#contactContent').val().trim();

    if (!name)    { alert("이름을 입력해주세요."); return; }
    if (!email)   { alert("이메일을 입력해주세요."); return; }
    if (!subject) { alert("제목을 입력해주세요."); return; }
    if (!content) { alert("내용을 입력해주세요."); return; }

    $.ajax({
      type: "POST",
      url: "main.windy?mode=contact_add",
      data: { name: name, email: email, subject: subject, content: content },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("문의가 접수되었습니다. 감사합니다.");
          $('#contactForm')[0].reset();
        } else {
          alert("전송에 실패했습니다. 다시 시도해주세요.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>

<%-- ===== 팝업 (position:fixed, 오버레이 없음) ===== --%>
<%if (listPopup != null && !listPopup.isEmpty()) {
    for (int pi = 0; pi < listPopup.size(); pi++) {
        PopupModel pop = listPopup.get(pi);
        String safeLink = pop.getLinkUrl().isEmpty() ? "" : pop.getLinkUrl().replace("\"", "&quot;");
%>
<div id="popup<%=pop.getPopupId()%>" class="site-popup" data-index="<%=pi%>"
     style="display:none; position:fixed; width:320px; z-index:<%=9000 + pi%>;
            border-radius:10px; overflow:hidden; box-shadow:0 8px 32px rgba(0,0,0,0.25); background:#fff;">
  <div>
    <%if (!safeLink.isEmpty()) {%>
      <a href="<%=safeLink%>">
        <img src="<%=pop.getImagePath()%>" alt="<%=pop.getTitle()%>" style="width:100%; display:block;">
      </a>
    <%} else {%>
      <img src="<%=pop.getImagePath()%>" alt="<%=pop.getTitle()%>" style="width:100%; display:block;">
    <%}%>
  </div>
  <%if (!pop.getDescription().isEmpty()) {%>
  <div style="padding:12px 14px; font-size:13px; line-height:1.6; color:#333; white-space:pre-wrap; border-top:1px solid #eee;"><%=pop.getDescription().replace("<", "&lt;").replace(">", "&gt;")%></div>
  <%}%>
  <div style="background:#f8f8f8; padding:10px 12px; display:flex; justify-content:space-between; align-items:center; flex-wrap:nowrap; gap:4px;">
    <div style="display:flex; gap:4px; flex-wrap:nowrap;">
      <%
        String hideOpt = pop.getHideOptions();
        if (!"none".equals(hideOpt)) {
            String hideBtnLabel = "7".equals(hideOpt) ? "일주일 안보기" : "30".equals(hideOpt) ? "한달 안보기" : "24시간 안보기";
            int hideDays = "7".equals(hideOpt) ? 7 : "30".equals(hideOpt) ? 30 : 1;
      %>
      <button type="button" class="btn btn-sm btn-outline-secondary" style="font-size:11px; padding:3px 7px; white-space:nowrap;"
              onclick="closePopup(<%=pop.getPopupId()%>, <%=hideDays%>)"><%=hideBtnLabel%></button>
      <% } %>
    </div>
    <button type="button" class="btn btn-sm btn-secondary" style="font-size:11px; padding:3px 8px; white-space:nowrap;"
            onclick="hidePopup(<%=pop.getPopupId()%>)">닫기</button>
  </div>
</div>
<%  }  %>
<style>
@media (max-width: 767px) {
  .site-popup { width: calc(100vw - 24px) !important; left: 12px !important; right: 12px !important; }
}
</style>
<script>
(function() {
  var POPUP_WIDTH  = 320;
  var POPUP_GAP    = 16;
  var POPUP_TOP    = 80;

  function getCookie(name) {
    var v = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    return v ? v[2] : null;
  }
  function setCookie(name, days) {
    var d = new Date();
    d.setTime(d.getTime() + days * 24 * 60 * 60 * 1000);
    document.cookie = name + '=1; expires=' + d.toUTCString() + '; path=/';
  }

  var allIds = [<%
    for (int pi = 0; pi < listPopup.size(); pi++) {
        out.print(listPopup.get(pi).getPopupId());
        if (pi < listPopup.size() - 1) out.print(",");
    }
  %>];

  // 쿠키 미설정 팝업만 필터링
  var visibleIds = allIds.filter(function(id) {
    return !getCookie('popup_hide_' + id);
  });

  var isMobile = window.innerWidth < 768;

  // 데스크탑: 전체 팝업 그룹을 화면 중앙 기준으로 배치
  var totalWidth = visibleIds.length * POPUP_WIDTH + (visibleIds.length - 1) * POPUP_GAP;
  var groupLeft  = Math.max(POPUP_GAP, Math.floor((window.innerWidth - totalWidth) / 2));

  // 높이 측정을 위해 먼저 invisible 상태로 표시 후 위치 계산
  visibleIds.forEach(function(id) {
    var el = document.getElementById('popup' + id);
    if (!el) return;
    el.style.visibility = 'hidden';
    el.style.display    = 'block';
  });

  visibleIds.forEach(function(id, idx) {
    var el = document.getElementById('popup' + id);
    if (!el) return;
    if (isMobile) {
      el.style.left  = '12px';
      el.style.right = '12px';
      el.style.width = 'calc(100vw - 24px)';
      el.style.top   = (POPUP_TOP + idx * (el.offsetHeight + POPUP_GAP)) + 'px';
    } else {
      var popupH = el.offsetHeight;
      var topPos = Math.max(POPUP_GAP, Math.floor((window.innerHeight - popupH) / 2));
      el.style.left = (groupLeft + idx * (POPUP_WIDTH + POPUP_GAP)) + 'px';
      el.style.top  = topPos + 'px';
    }
    el.style.visibility = 'visible';
  });

  // 모바일에서 위치 재계산 (이미지 로드 후 높이 확정)
  if (isMobile && visibleIds.length > 1) {
    window.addEventListener('load', function() {
      var top = POPUP_TOP;
      visibleIds.forEach(function(id) {
        var el = document.getElementById('popup' + id);
        if (!el) return;
        el.style.top = top + 'px';
        top += el.offsetHeight + POPUP_GAP;
      });
    });
  }

  window.closePopup = function(id, days) {
    setCookie('popup_hide_' + id, days);
    hidePopup(id);
  };
  window.hidePopup = function(id) {
    var el = document.getElementById('popup' + id);
    if (el) el.style.display = 'none';
  };
})();
</script>
<%}%>

</body>

</html>