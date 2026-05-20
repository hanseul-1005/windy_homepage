<%@page import="windy.homepage.model.PortfolioModel"%>
<%@page import="windy.homepage.model.PortfolioImageModel"%>
<%@page import="windy.homepage.model.NoticeModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<PortfolioModel> listPortfolio = (List<PortfolioModel>) request.getAttribute("listPortfolio");
List<NoticeModel>    listNotice    = (List<NoticeModel>)    request.getAttribute("listNotice");
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
 	 <link href="bootstrap_enno/assets/img/favicon.png" rel="icon">
	 <link href="bootstrap_enno/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	 <!-- Fonts -->
	 <link href="https://fonts.googleapis.com" rel="preconnect">
	 <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
	 <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
	
	 <!-- Vendor CSS Files -->
	 <link href="bootstrap_enno/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	 <link href="bootstrap_enno/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	 <link href="bootstrap_enno/assets/vendor/aos/aos.css" rel="stylesheet">
	 <link href="bootstrap_enno/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	 <link href="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	 <!-- Main CSS File -->
	 <link href="bootstrap_enno/assets/css/main.css" rel="stylesheet">
	 <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
	 <style>
	   .faq-content .ql-container.ql-snow { border: none; }
	   .faq-content .ql-editor { padding: 0; }
	 </style>
<script type="text/javascript">

function goDetail(num) {
	//var link = document.getElementById('link'+idx).value;
	//var subject = document.getElementById('subject'+idx).value;
	//var title = document.getElementById('title'+idx).value;
	//var contents = document.getElementById('contents'+idx).value;
	
	//location.href = "main.windy?menu=detail&link="+link+"&subject="+subject+"&title="+title+"&contents="+contents;
	location.href = "main.windy?menu=portfolio_detail&num="+num;
}
</script>


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
                  String thumbSrc = request.getContextPath() + "/img/no_image.png";
                  if (p.getImages() != null && !p.getImages().isEmpty()) {
                      thumbSrc = request.getContextPath() + "/" + p.getImages().get(0).getImagePath();
                  }
                  String cat = p.getCategory() != null ? p.getCategory() : "AI";
                  String filterClass = "filter-app";
                  if ("Data".equals(cat))       filterClass = "filter-product";
                  else if ("Vision".equals(cat)) filterClass = "filter-branding";
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

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-activity"></i>
              </div>
              <div>
                <h3>AI</h3>
                <p>최첨단 인공지능 기술을 활용하여 고객 비즈니스의 생산성과 효율성을 극대화합니다. 빅데이터 분석과 머신러닝 알고리즘을 접목해, 기업이 직면하는 복잡한 문제를 스마트하게 해결하고 미래 예측까지 가능하게 합니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-diagram-3"></i>
              </div>
              <div>
                <h3>Data</h3>
                <p>빅데이터 수집부터 정제, 분석까지 전 과정을 체계적으로 관리하여 가치 있는 인사이트를 제공합니다. 방대한 정보를 기반으로 시장 트렌드를 파악하고, 데이터 기반 의사결정을 지원해 비즈니스 경쟁력을 높입니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-easel"></i>
              </div>
              <div>
                <h3>Vision</h3>
                <p>컴퓨터 비전 및 이미지 처리 기술로 영상 인식, 객체 식별 등 다양한 분야에서 솔루션을 제공합니다. 딥러닝 모델을 활용해 정확한 분석 결과를 도출하고, 고객 맞춤형 시각화 도구로 효율적인 업무 환경을 구현합니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="400">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-clipboard-data"></i>
              </div>
              <div>
                <h3>Kiosk</h3>
                <p>사용자의 편의성을 극대화한 무인 키오스크 시스템을 개발해 고객의 업무 프로세스를 단순화하고, 고객 경험을 향상시킵니다. 직관적인 UI/UX 설계로 누구나 손쉽게 이용할 수 있으며, 운영 효율과 비용 절감 효과까지 기대할 수 있습니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="500">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-calendar4-week"></i>
              </div>
              <div>
                <h3>Web</h3>
                <p>고객의 요청사항을 철저히 분석하며, 사용자의 편의성을 고려한 고객 맞춤형 모니터링 사이트를 제공합니다. 탄탄한 웹 구조 설계와 최신 기술 스택 적용을 통해 안정성과 확장성을 동시에 보장합니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="600">
            <div class="service-card d-flex">
              <div class="icon flex-shrink-0">
                <i class="bi bi-chat-square-text"></i>
              </div>
              <div>
                <h3>App</h3>
                <p>모바일 환경에 최적화된 앱을 기획·개발해 언제 어디서나 편리하게 서비스를 이용할 수 있는 사용자 경험을 제공합니다. 빠른 반응 속도와 직관적인 인터페이스로 만족도를 높이고, 비즈니스 확장을 위한 전략적 모바일 플랫폼을 구축합니다.</p>
                <!-- <a href="service-details.html" class="read-more">Read More <i class="bi bi-arrow-right"></i></a> -->
              </div>
            </div>
          </div><!-- End Service Card -->

        </div>

      </div>

    </section><!-- /Services Section -->

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
              <div class="faq-item <%=i == 0 ? "faq-active" : ""%>">
                <h3><span class="num"><%=i+1%>.</span> <span><%=n.getTitle()%></span></h3>
                <div class="faq-content">
                  <div class="ql-container ql-snow">
                    <div class="ql-editor"><%=n.getContent() != null ? n.getContent() : ""%></div>
                  </div>
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
                  <p>광주광역시 북구 첨단과기로208번길 17-11, 206호</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>연락처</h3>
                  <p>010-9924-0136</p>
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
                  <button type="button" onclick="goContact()">보내기</button>
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
  <script src="bootstrap_enno/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_enno/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_enno/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="bootstrap_enno/assets/js/main.js"></script>
  <script>
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

</body>

</html>