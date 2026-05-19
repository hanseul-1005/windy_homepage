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

</head>
<body class="portfolio-details-page">

	<jsp:include page="main_top_menu.jsp"></jsp:include>
  
  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">Product</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=service_info">Technology</a></li>
            <li class="current">Product</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Tabs Section -->
    <section id="tabs" class="tabs section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>Product</span>
        <h2>Product</h2>
        <!-- <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p> -->
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column" role="tablist" data-aos="fade-up" data-aos-delay="200">
            
              <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" data-bs-target="#tabs-tab-1" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-people"></i>
                    <!-- <i class="bi bi-house-heart"></i> -->
                    <h4>지능형 독거 노인 케어 시스템</h4>
                  </div>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-3" role="tab">
                  <div class="d-flex align-items-center">
                    <h4>객체 추적 기반 교차로 사고 예방 시스템</h4>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-2" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-heart"></i>
                    <h4>멀티 바코드 인식 시스템</h4>
                  </div>
                </a>
              </li> -->
              <!-- <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-4" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person-heart"></i>
                    <h4>생산이력관리, 키오스크, 관제 시스템</h4>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-5" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person-heart"></i>
                    <h4>지하차도 침수 예측용 인공지능 모델 개발을 위한 데이터 취득 시스템 구축</h4>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-6" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person-heart"></i>
                    <h4>제품 치수 검사, 부품 조립 유무 파악</h4>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-7" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person-heart"></i>
                    <h4>지하차도 주변 위험지역 침수 상황 모니터링 시스템</h4>
                  </div>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tabs-tab-8" role="tab">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person-heart"></i>
                    <h4>LTE 기반 데이터 획득 시스템</h4>
                  </div>
                </a>
              </li> -->
            </ul>
          </div>
          <div class="col-lg-9">
            <div class="tab-content" data-aos="fade-up" data-aos-delay="300">
				<!-- Tab1 -->
              <div class="tab-pane fade active show" id="tabs-tab-1" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>지능형 독거 노인 케어 시스템</h3>
                    <!-- <p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec velit
                      neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.</p> -->
                    <p class="fst-italic">초고령화 사회로 접어든 대한민국에서 심화되고 있는 독거노인의 건강 및 안전 문제를 해결하기 위해 개발된 AIoT 기반 통합 케어 솔루션으로써, 
                    	인공지능(AI)과 사물인터넷(IoT) 기술을 접목하여, 낙상 감지, 복약 관리, 정서적 지원, 건강 상태 모니터링 등 다양한 기능을 하나로 통합한 지능형 독거 노인 케어 시스템</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> 인공지능 기반 낙상 감지 및 고독사 방지 시스템</li>
                      <li><i class="bi bi-check2-circle"></i> 정서 지원을 위한 디지털 액자 기능 부여</li>
                      <li><i class="bi bi-check2-circle"></i> 약 복용 관리 관제 시스템</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/product/product1.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>
				<!-- Tab2 -->
              <!-- <div class="tab-pane fade" id="tabs-tab-2" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>멀티 바코드 인식 시스템</h3>
                    <p>Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                      Vestibulum ante ipsum primis in faucibus.</p>
                    <p class="fst-italic">Nulla quis lorem ut libero malesuada feugiat. Nulla quis lorem ut libero malesuada
                      feugiat.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Vivamus suscipit tortor eget felis porttitor</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui posuere</li>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet quam</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/ai/ai2.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab3
              <div class="tab-pane fade" id="tabs-tab-3" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>지능형 독거 노인 케어 시스템</h3>
                    <p>Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vestibulum ante ipsum primis in
                      faucibus orci luctus et ultrices posuere cubilia Curae.</p>
                    <p class="fst-italic">Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula
                      elementum sed sit amet dui.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Curabitur non nulla sit amet nisl</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet quam</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo eget</li>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/ai/ai3.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab4
              <div class="tab-pane fade" id="tabs-tab-4" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>생산이력관리, 키오스크, 관제 시스템</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/data/data1.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab5
              <div class="tab-pane fade" id="tabs-tab-5" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>지하차도 침수 예측용 인공지능 모델 개발을 위한 데이터 취득 시스템 구축</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/data/data2.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab6
              <div class="tab-pane fade" id="tabs-tab-6" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>제품 치수 검사, 부품 조립 유무 파악</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/data/data3.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab7
              <div class="tab-pane fade" id="tabs-tab-7" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>Curabitur Aliquet Quam</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/vision/vision1.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab8
              <div class="tab-pane fade" id="tabs-tab-8" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>지하차도 주변 위험지역 침수 상황 모니터링 시스템</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/monitoring/monitoring1.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div>

				Tab9
              <div class="tab-pane fade" id="tabs-tab-9" role="tabpanel">
                <div class="row">
                  <div class="col-lg-6 order-2 order-lg-1">
                    <h3>LTE 기반 데이터 획득 시스템</h3>
                    <p>Donec sollicitudin molestie malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit
                      amet dui. Curabitur aliquet quam id dui posuere blandit.</p>
                    <p class="fst-italic">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur
                      non nulla sit amet nisl tempus.</p>
                    <ul>
                      <li><i class="bi bi-check2-circle"></i> Nulla quis lorem ut libero malesuada</li>
                      <li><i class="bi bi-check2-circle"></i> Curabitur aliquet quam id dui</li>
                      <li><i class="bi bi-check2-circle"></i> Vestibulum ac diam sit amet</li>
                      <li><i class="bi bi-check2-circle"></i> Donec rutrum congue leo</li>
                    </ul>
                  </div>
                  <div class="col-lg-6 order-1 order-lg-2 text-center">
                    <img src="img/monitoring/monitoring2.png" alt="" class="img-fluid" loading="lazy">
                  </div>
                </div>
              </div> -->

            </div>
          </div>
        </div>

      </div>

    </section><!-- /Tabs Section -->


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