<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<%
String title = (String) request.getAttribute("title");
String sub = (String) request.getAttribute("sub");
String contents = (String) request.getAttribute("contents");
String img1 = (String) request.getAttribute("img1");
String img2 = (String) request.getAttribute("img2");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>
<body class="portfolio-details-page">

	<jsp:include page="main_top_menu.jsp"></jsp:include>
  
  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Portfolio Detail</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li><a href="main.windy?menu=portfolio_list">Portfolio</a></li>
            <li class="current">Portfolio Detail</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

<section id="portfolio-details" class="portfolio-details section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Portfolio Detail</span>
        <h2>Portfolio Detail</h2>
        <!-- <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p> -->
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-7">
            <div class="portfolio-details-slider swiper init-swiper">

              <script type="application/json" class="swiper-config">
                {
                  "loop": true,
                  "speed": 600,
                  "autoplay": {
                    "delay": 4000
                  },
                  "slidesPerView": "auto",
                  "pagination": {
                    "el": ".swiper-pagination",
                    "type": "bullets",
                    "clickable": true
                  }
                }
              </script>

              <div class="swiper-wrapper align-items-center">

                <div class="swiper-slide">
                  <img src="img/<%=img1 %>/<%=img2 %>" alt="Portfolio Image" class="img-fluid" loading="lazy">
                </div>
                <!-- <div class="swiper-slide">
                  <img src="img/ai/ai2.png" alt="Portfolio Image" class="img-fluid" loading="lazy">
                </div> -->
                <!-- 
                <div class="swiper-slide">
                  <img src="img/ai/ai1-2.png" alt="Portfolio Image" class="img-fluid" loading="lazy">
                </div>

                <div class="swiper-slide">
                  <img src="img/ai/ai1-3.png" alt="Portfolio Image" class="img-fluid" loading="lazy">
                </div>
 -->
              </div>
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-5">
            <div class="portfolio-info" data-aos="fade-left" data-aos-delay="200">
              <h3><%=title %></h3>
              <ul><%=sub %>
                <!-- <li><strong>GUI</strong>: tkinter 활용, 사용자 친화적 인터페이스</li>
                <li><strong>설정옵션</strong>: ROI 설정, 방향 감지 기능 제공</li>
                <li><strong>특화기능</strong>: 교차로 상황에 맞춘 정확한 위험 상황 감지</li>
                <li><strong>객체 인식 정확도</strong>: mAP@0.5 기준 0.994</li>
                <li><strong>실시간 처리 속도</strong>: 초당 30.01 프레임(FPS)</li>
                <li><strong>모델 크기</strong>: 5.78MB, 경량화된 모델</li> -->
              </ul>
            </div>
          </div>

          <div class="col-lg-12">
            <div class="portfolio-description" data-aos="fade-up" data-aos-delay="300">
              <h2>제품 Detail 설명</h2>
              <p><%=contents %></p>
              <!-- <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
              <p>
                Amet consequatur qui dolore veniam voluptatem voluptatem sit. Non aspernatur atque natus ut cum nam et. Praesentium error dolores rerum minus sequi quia veritatis eum. Eos et doloribus doloremque nesciunt molestiae laboriosam.
              </p> -->

              
            </div>
          </div>

        </div>

      </div>

    </section><!-- /Portfolio Details Section -->
    <!-- Portfolio Details Section -->
    

  </main>

  <jsp:include page="main_footer.jsp"></jsp:include>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="bootstrap_enno/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_enno/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_enno/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="bootstrap_enno/assets/js/main.js"></script>

</body>

</html>