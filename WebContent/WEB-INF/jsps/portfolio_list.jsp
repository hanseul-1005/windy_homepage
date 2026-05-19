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
        <h1 class="mb-2 mb-lg-0">Portfolio</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li class="current">Portfolio</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

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

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200" style="position: relative; height: 1612.25px;">
          
			<!-- ai -->
			
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app" style="position: absolute; left: 0px; top: 0px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(1)">
                <img src="img/ai/ai1.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(1)" title="More Details">객체 추적 기반 지능형 교통 시스템</a></h4>
                  <p>다양한 차량, 보행자, 이륜차 등의 객체를 인식하고 분석하는 인공지능 기반 지능형 교통 관리 솔루션</p>
                </div>
              </div>
            </div>
            
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app" style="position: absolute; left: 0px; top: 0px;">
              <div class="portfolio-content h-100" style="text-align: center;" onclick="javascript: goDetail(2)">
                <img src="img/ai/ai2.png" class="img-fluid" alt="">
                <div class="portfolio-info" style="text-align: left;">
                  <h4><a href="javascript: goDetail(2)" title="More Details">멀티 바코드 인식 시스템</a></h4>
                  <p>한 번의 스캔으로 인공지능 기반 객체 인식 알고리즘을 이용하여 여러 개의 바코드를 동시에 인식하고 처리할 수 있는 고성능 솔루션</p>
                </div>
              </div>
            </div>
            <!-- 
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app" style="position: absolute; left: 0px; top: 0px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(3)">
                <img src="img/ai/ai3.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(3)" title="More Details">지능형 독거 노인 케어 시스템</a></h4>
                  <p>IoT 기반 스마트 약 디스펜서와 라즈베리 파이를 일원화하여 낙상 관리 및 약 복용, 낙상에 대한 신속 응급 대응이 가능한 시스템</p>
                </div>
              </div>
            </div>
             -->
            <!-- End ai -->
            
            
			<!-- Data -->
			
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product" style="position: absolute; left: 440px; top: 0px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(4)">
                <img src="img/data/data1_1.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(4)" title="More Details">지하차도 침수 예측용 인공지능 모델 개발을 위한 데이터 취득 시스템 구축</a></h4>
                  <p>새로운 기후 변화에 대응하기 위해, 지하차도 및 주변 위험지역의 침수 위험 상황을 실시간으로 모니터링하고 데이터를 수집하는 솔루션</p>
                </div>
              </div>
            </div>
            
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product" style="position: absolute; left: 440px; top: 0px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(5)">
                <img src="img/data/data2.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(5)" title="More Details">생산이력 관리 시스템</a></h4>
                  <p>생산라인에서 생성되는 각 제품의 정보를 데이터베이스로 관리하여, 제조부터 출하까지의 모든 이력을 체계적으로 추적·관리할 수 있도록 지원하는 솔루션</p>
                </div>
              </div>
            </div>
            
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-books" style="position: absolute; left: 440px; top: 0px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(6)">
                <img src="img/monitoring/monitoring3.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(6)" title="More Details">긴급 재난 대응 ICT융합 스마트 야전병원 플랫폼 개발</a></h4>
                  <p>차량, 병원, 병리 정보 등 다양한 의료 관련 데이터를 통합하여 실시간으로 관리하고 모니터링할 수 있는 솔루션</p>
                </div>
              </div>
            </div>
            
            <!-- End Data -->
            
			<!-- Vision -->
			
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding" style="position: absolute; left: 880px; top: 0px;">
              <div class="portfolio-content h-100" style="text-align: center;" onclick="javascript: goDetail(7)">
                <img src="img/vision/vision1.png" class="img-fluid" alt="">
                <div class="portfolio-info" style="text-align: left;">
                  <h4><a href="javascript: goDetail(7)" title="More Details">머신비전 기반 치수 검사 시스템</a></h4>
                  <p>고성능 카메라와 딥러닝 기반 영상 처리 기술을 활용하여 제품의 치수를 자동으로 측정하고 검증하는 솔루션</p>
                </div>
              </div>
            </div>
            
            <!-- End Vision -->
            
			<!-- Monitoring -->
			<!-- 
			<div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-books" style="position: absolute; left: 440px; top: 806.124px;">
              <div class="portfolio-content h-100" onclick="javascript: goDetail(8)">
                <img src="img/monitoring/monitoring1.png" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4><a href="javascript: goDetail(8)" title="More Details">지하차도 주변 위험지역 침수 상황 모니터링 시스템</a></h4>
                  <p>GIS기반 지하차도 주변 위험지역도 동시 모니터링을 통한 선제적 침수 상황 모니터링 시스템 구축</p>
                </div>
              </div>
            </div>
             -->
			<div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-books" style="position: absolute; left: 440px; top: 806.124px;">
              <div class="portfolio-content h-100" style="text-align: center;" onclick="javascript: goDetail(9)">
                <img src="img/monitoring/monitoring2.png" class="img-fluid" alt="">
                <div class="portfolio-info" style="text-align: left;">
                  <h4><a href="javascript: goDetail(9)" title="More Details">LTE Cat.M1 기반 데이터 획득 시스템</a></h4>
                  <p>전국 어디서나 설치된 장비로부터 데이터를 실시간으로 수집하고, 웹페이지를 통해 모니터링할 수 있는 통합 관제 솔루션</p>
                </div>
              </div>
            </div>
            
            <!-- End Monitoring -->

          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- /Portfolio 3 Section -->
    

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