<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>윈디 관리자 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="bootstrap_nice/assets/img/favicon.png" rel="icon">
  <link href="bootstrap_nice/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="bootstrap_nice/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  
  
<style type="text/css">

.datatable td, th {
	text-align: center;
}

</style>
</head>
<body>

			<jsp:include page="../top_menu.jsp"></jsp:include>
			<jsp:include page="../side_menu.jsp"></jsp:include>
			
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Contact Us 조회</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Contact 목록</a></li>
          <li class="breadcrumb-item active">Contact Us 조회</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Contact Us 조회</h5>
				<!-- <div class="col-sm-12" style="text-align: right; margin-bottom: 10px">
                    <button type="submit" class="btn btn-primary">글작성</button>
                  </div> -->
              <!-- General Form Elements -->
              <form>
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <!-- <input type="text" class="form-control"> -->
                    <p>홈페이지 제작 관련 문의 드립니다.</p>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputEmail" class="col-sm-2 col-form-label">작성자</label>
                  <div class="col-sm-10">
                    <p>김영희</p>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputEmail" class="col-sm-2 col-form-label">작성자 이메일</label>
                  <div class="col-sm-10">
                    <p>abc@gmail.com</p>
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputEmail" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <p>회사 홈페이지 개발 의뢰를 하려고 합니다.<br/>혹시 회사 홈페이지 개발 시 필요 사항이나 준비해야 할 문서가 있을까요?<br/>개발하게 된다면 비용 부분은 어떻게 처리하는지 알려주세요<br/>해당 내용에 관한 답변은 메일로 보내주시면 됩니다.</p>
                  </div>
                </div>
                
              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>

        
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>

  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="bootstrap_nice/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="bootstrap_nice/assets/vendor/echarts/echarts.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/quill/quill.js"></script>
  <script src="bootstrap_nice/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="bootstrap_nice/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="bootstrap_nice/assets/js/main.js"></script>

</body>

</html>