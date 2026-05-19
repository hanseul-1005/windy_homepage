<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
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
            
            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product" style="position: absolute; left: 440px; top: 0px;">
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
              <div class="faq-item faq-active">
                <h3><span class="num">1.</span> <span>4월 1일자 홈페이지 개편</span></h3>
                <div class="faq-content">
                  <p>윈디의 홈페이지가 4월 1일자로 디자인 및 기능 관련 개편되었습니다.<br/>윅스로 되어있던 홈페이지를 CMS 기능을 차용하여 신규 홈페이지로 개발 진행 완료하였습니다.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">2.</span> <span>홈페이지 개발 관련 개발 문의 시 지침 사항</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">3.</span> <span>AI와 Data 관련 개발 문의 시 지침 사항</span></h3>
                <div class="faq-content">
                  <p>Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">4.</span> <span>키오스크 관련 개발 문의 시 지침 사항</span></h3>
                <div class="faq-content">
                  <p>Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

              <div class="faq-item">
                <h3><span class="num">5.</span> <span>인공지능 관련 개발 문의 시 지침 사항</span></h3>
                <div class="faq-content">
                  <p>Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in</p>
                </div>
                <i class="faq-toggle bi bi-chevron-right"></i>
              </div><!-- End Faq item-->

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
                  <p>광주광역시 광산구 하남산단 3번로 138, B동 신관 207호</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                  <i class="bi bi-telephone"></i>
                  <h3>연락처</h3>
                  <p>062-956-0136</p>
                </div>
              </div><!-- End Info Item -->

              <div class="col-md-6">
                <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                  <i class="bi bi-envelope"></i>
                  <h3>이메일</h3>
                  <p>windy.bsy@gmail.com</p>
                </div>
              </div><!-- End Info Item -->

            </div>
          </div>

          <div class="col-lg-6">
            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="500">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="4" placeholder="Message" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>

                  <button type="submit">보내기</button>
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