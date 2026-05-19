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
      <h1>Contact Us 관리</h1>
      <!-- <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Tables</li>
          <li class="breadcrumb-item active">Data</li>
        </ol>
      </nav> -->
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Contact Us</h5>
              <!-- <p>Add lightweight datatables to your project with using the <a href="https://github.com/fiduswriter/Simple-DataTables" target="_blank">Simple DataTables</a> library. Just add <code>.datatable</code> class name to any table you wish to conver to a datatable. Check for <a href="https://fiduswriter.github.io/simple-datatables/demos/" target="_blank">more examples</a>.</p> -->
              <div style="text-align: right;">	
              	<!-- <button type="button" class="btn btn-outline-primary" onclick="location.href='admin.windy?menu=notice_add'">등록</button> -->
              </div>
			
              <!-- Table with stripped rows -->
              <table class="table datatable">
              	<colgroup>
              		<col width="10%"/>
              		<col width="40%"/>
              		<col width="20%"/>
              		<col width="20%"/>
              	</colgroup>
                <thead>
                  <tr>
                    <th style="width: 10%; text-align: center;">
                      <b>N</b>o
                    </th>
                    <th style="width: 30%; text-align: center;">제목</th>
                    <th style="width: 10%; text-align: center;">작성자</th>
                    <th style="width: 20%; text-align: center;" data-type="date" data-format="YYYY/DD/MM">작성자 이메일</th>
                  </tr>
                </thead>
                <tbody>
					<tr onclick="location.href='admin.windy?menu=contact_detail'">
	                    <td style="width: 10%;">1</td>
	                    <td style="width: 30%;">홈페이지 제작 관련 문의 드립니다.</td>
	                    <td style="width: 10%;">김영희</td>
	                    <td style="width: 20%;">abc@gmail.com</td>        
					</tr>
					<tr>
	                    <td style="width: 10%;">2</td>
	                    <td style="width: 30%;">인공지능 관련 개발이 가능한지 문의 드립니다.</td>
	                    <td style="width: 10%;">홍길동</td>
	                    <td style="width: 20%;">aaa@naver.com</td>        
					</tr>
                </tbody>
              </table>
              <!-- End Table with stripped rows -->

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