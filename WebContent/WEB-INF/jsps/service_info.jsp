<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

<%
String title = (String) request.getAttribute("title");
String sub = (String) request.getAttribute("sub");
String contents = (String) request.getAttribute("contents");
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