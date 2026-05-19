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

.table td, th {
	text-align: center;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

function goLogin() {
	var id = document.getElementById('id').value;
	var pw = document.getElementById('pw').value;
	
	console.log('id : '+id);
	console.log('pw : '+pw);
	
	var param = "&id="+id+"&passwd="+pw;
	
	$.ajax({
		type: "POST",
		url: "login.windy?mode=login", 
		data: param,
		error: ajaxFailed,
		success: function(ret) {
			console.log('ret : '+ret);
			console.log('result : '+ret.result);
			if(ret.result=='true') {
				location.href='main.windy?menu=main';
			} else {
				alert('아이디 혹은 비밀번호가 일치하지않습니다.\n다시 시도해주세요.');
			}
		}
	});
}
function ajaxFailed(xmlRequest)	{
	alert(xmlRequest.status+"\n\r"+xmlRequest.statusText+"\n\r"+xmlRequest.responseText);
}

</script>
</head>

<body>
			<jsp:include page="top_menu.jsp"></jsp:include>
			<jsp:include page="side_menu.jsp"></jsp:include>
<!-- 
  ======= Sidebar =======
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>대시보드</span>
        </a>
      </li>End Dashboard Nav

      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-journal-text"></i>
          <span>포트폴리오 관리</span>
        </a>
      </li>End Profile Page Nav

      <li class="nav-item">
        <a class="nav-link collapsed" href="admin.windy?menu=notice_list">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>공지사항 관리</span>
        </a>
      </li>End F.A.Q Page Nav

      <li class="nav-item">
        <a class="nav-link collapsed" href="pages-contact.html">
          <i class="bi bi-envelope"></i>
          <span>Contact Us 관리</span>
        </a>
      </li>End Contact Page Nav

    </ul>

  </aside>End Sidebar
 -->
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>대시보드</h1>
      <nav>
        <ol class="breadcrumb">
          <!-- <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li> -->
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            
            
            <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="filter">
                  <!-- <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul> -->
                </div>

                <div class="card-body pb-0">
                  <h5 class="card-title">포트폴리오 <span>| All</span></h5>
					<div style="display: flex;">
						<!-- AI -->
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/ai/ai1.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">객체 추적 기반 교차로 사고 예방 시스템</h5>
					              <p class="card-text">동일 객체 인식, 이동 방향 지정 등을 통해 교차로 상황에 맞춘 정확한 위험 상황 감지 후 알림.</p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/ai/ai2.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">멀티 바코드 인식 시스템</h5>
					              <p class="card-text">인공지능 기반 객체 인식 알고리즘을 이용하여 웹캠에서 획득한 다수의 바코드를 인식하여 생산 및 물류 이력 관리.</p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/ai/ai3.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">지능형 독거 노인 케어 시스템</h5>
					              <p class="card-text">IoT 기반 스마트 약 디스펜서와 라즈베리 파이를 일원화하여 낙상 관리 및 약 복용, 낙상에 대한 신속 응급 대응이 가능한 시스템.</p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
						<!-- End AI -->
						
						
				        <!-- Data -->
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/data/data1.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">지하차도 침수 예측용 인공지능 모델 개발을 위한 데이터 취득 시스템 구축</h5>
					              <p class="card-text">새로운 기후 현상에 대응 가능한 지하차도 및 지하차도 주변 위험지역에 인공지능 기반 실시간 모니터링 시스템 구축.</p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/data/data2.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">생산이력관리, 키오스크, 관제 시스템</h5>
					              <p class="card-text">각종 센서들을 이용하여 환경 정보 획득 및 이를 서버 데이터 베이스에서 관리<br/>
										획득한 데이터를 기반으로 관제 시스템 개발.
									</p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
						
						<div class="col-lg-2" style="margin: 5px;">
							<!-- Card with an image on top -->
					        <div class="card">
					            <img src="img/data/data3.png" class="card-img-top" alt="..." style="max-height: 220px;">
					            <div class="card-body">
					              <h5 class="card-title">의료 차량 정보 관리 시스템, LTE기반 데이터 획득 시스템</h5>
					              <p class="card-text">
					              	차량, 병원, 병리 정보 등 다양한 종류의 데이터 관리<br/>
									LTE 기반 데이터 획득 시스템을 기반으로 전국 어디에서나 데이터 획득 가능<br/>
									웹페이지를 이용한 실시간 관제 시스템
					              </p>
					            </div>
					          </div><!-- End Card with an image on top -->
				        </div>
						
				        <!-- End Data -->
					</div>
					          
             	

                </div>

              </div>
            </div><!-- End Top Selling -->

          </div>
        </div><!-- End Left side columns -->

        <!-- Left side columns -->
        <div class="col-lg-6" style="min-height: 500px;">

          <div class="card" style="height: 100%">
            <div class="card-body">
              <h5 class="card-title">공지사항</h5>

              <!-- Default Table -->
              <table class="table">
              	<colgroup>
              		<col width="10%"/>
              		<col width="40%"/>
              		<col width="10%"/>
              		<col width="20%"/>
              		<col width="20%"/>
              	</colgroup>
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">조회수</th>
                    <th scope="col">작성일</th>
                    <th scope="col">수정일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>4월 1일자 홈페이지 개편</td>
                    <td>28</td>
                    <td>2025-03-21</td>
                    <td>2025-03-31</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>홈페이지 개발 관련 개발 문의 시 지침 사항</td>
                    <td>45</td>
                    <td>2025-03-25</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>AI와 Data 관련 개발 문의 시 지침 사항</td>
                    <td>45</td>
                    <td>2025-03-26</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <th scope="row">4</th>
                    <td>키오스크 관련 개발 문의 시 지침 사항</td>
                    <td>34</td>
                    <td>2025-03-27</td>
                    <td>-</td>
                  </tr>
                  <tr>
                    <th scope="row">5</th>
                    <td>인공지능 관련 개발 문의 시 지침 사항</td>
                    <td>34</td>
                    <td>2025-03-28</td>
                    <td>-</td>
                  </tr>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>

        </div><!-- End Right side columns -->
<!-- Right side columns -->
        <div class="col-lg-6" style="min-height: 500px;">

          <div class="card" style="height: 100%">
            <div class="card-body">
              <h5 class="card-title">Contact Us</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성자 이메일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>홈페이지 제작 관련 문의 드립니다.</td>
                    <td>김영희</td>
                    <td>abc@gmail.com</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>인공지능 관련 개발이 가능한지 문의 드립니다.</td>
                    <td>홍길동</td>
                    <td>aaa@naver.com</td>
                  </tr>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>

        </div><!-- End Right side columns -->

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