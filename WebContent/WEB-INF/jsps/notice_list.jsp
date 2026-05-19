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
        <h1 class="mb-2 mb-lg-0">연혁</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=home&#hero">Home</a></li>
            <li class="current">연혁</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

	<!-- Events Section -->
    <section id="events" class="events section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <span>연혁</span>
        <h2>연혁</h2>

      </div><!-- End Section Title -->

      <div class="container">

        <ul class="nav nav-tabs" role="tablist" data-aos="fade-up" data-aos-delay="100">
          <li class="nav-item" role="presentation">
            <a class="nav-link active" href="#day-3" role="tab" data-bs-toggle="tab" aria-selected="true">2025, 2024</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link" href="#day-2" role="tab" data-bs-toggle="tab" aria-selected="false" tabindex="-1">2023, 2022</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link" href="#day-1" role="tab" data-bs-toggle="tab" aria-selected="false" tabindex="-1">2021~</a>
          </li>
        </ul>

        <div class="tab-content row justify-content-center" data-aos="fade-up" data-aos-delay="200">

          <!-- Schdule Day 3 -->
          <div role="tabpanel" class="col-lg-9 tab-pane fade active show" id="day-3">

            <div class="row schedule-item">
              <div class="col-md-2">2024년 11월</div>
              <div class="col-md-10">
                <h4>연구개발특구진흥재단 인공지능(AI) 기업 특화 아이템 기획 및 성장 지원 선정</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2024년 09월</div>
              <div class="col-md-10">
                <h4>2024년 AI가전산업 육성을 위한 상용화 지원플랫폼 구축사업 선정 </h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2024년 01월</div>
              <div class="col-md-10">
                <h4>광주광역시 광산구 하남산업단지 이전 </h4>
              </div>
            </div>
          </div><!-- End Schdule Day 3 -->
          
          <!-- Schdule Day 2 -->
          <div role="tabpanel" class="col-lg-9 tab-pane fade" id="day-2">

            <div class="row schedule-item">
              <div class="col-md-2">2023년 09월</div>
              <div class="col-md-10">
                <h4>『도시문제 해결형 솔루션 개발‧지원』 도시문제 해결형 AI 솔루션 개발‧지원사업</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2022년 09월</div>
              <div class="col-md-10">
                <h4>창업성장기술개발사업 전략형 선정 - 2년차 과제</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2022년 08월</div>
              <div class="col-md-10">
                <h4>2022년 지역혁신프로젝트 인공지능기술상용화프로젝트 선정</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2022년 05월</div>
              <div class="col-md-10">
                <h4>광주 청년창업 지원프로그램 선정</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2022년 03월</div>
              <div class="col-md-10">
                <h4>벤처 기업 인증</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2022년 01월</div>
              <div class="col-md-10">
                <h4>연구개발전담부서 설립</h4>
              </div>
            </div>
            
          </div><!-- End Schdule Day 2 -->

          <!-- Schdule Day 1 -->
          <div role="tabpanel" class="col-lg-9 tab-pane fade" id="day-1">

            <div class="row schedule-item">
              <div class="col-md-2">2021년 11월</div>
              <div class="col-md-10">
                <h4>지역혁신플랫폼 에너지신산업육성사업단 2차년도 기업지원과제 선정</h4>
              </div>
            </div>

            <div class="row schedule-item">
              <div class="col-md-2">2021년 09월</div>
              <div class="col-md-10">
                <h4>광주 AI스타트업 캠프 입주</h4>
              </div>
            </div>


            <div class="row schedule-item">
              <div class="col-md-2">2021년 08월</div>
              <div class="col-md-10">
                <h4>광주창조경제혁신센터 인공지능기술상용화프로젝트 선정</h4>
              </div>
            </div>


            <div class="row schedule-item">
              <div class="col-md-2">2021년 07월</div>
              <div class="col-md-10">
                <h4>광주광역시 G-IN 스타트업 JUMP 선정</h4>
              </div>
            </div>


            <div class="row schedule-item">
              <div class="col-md-2">2021년 04월</div>
              <div class="col-md-10">
                <h4>산업통상자원부 디자인혁신역량강화사업 선정 - 5년차 과제</h4>
              </div>
            </div>


            <div class="row schedule-item">
              <div class="col-md-2">2020년 03월</div>
              <div class="col-md-10">
                <h4>중소벤처기업부 창업성공패키지 지원사업 선정</h4>
              </div>
            </div>


            <div class="row schedule-item">
              <div class="col-md-2">2020년 03월 06일</div>
              <div class="col-md-10">
                <h4>윈디 설립</h4>
              </div>
            </div>

          </div><!-- End Schdule Day 1 -->


        </div>

      </div>
    </section><!-- /Events Section -->
    

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