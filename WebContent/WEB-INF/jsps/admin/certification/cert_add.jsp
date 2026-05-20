<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="bootstrap_nice/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">
  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>인증서/문서 등록</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=cert_list">인증서/문서 목록</a></li>
          <li class="breadcrumb-item active">등록</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">인증서/문서 등록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=cert_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goAdd()">등록</button>
              </div>
              <form id="certForm" enctype="multipart/form-data">
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" id="title" name="title" class="form-control" placeholder="인증서/문서 제목을 입력하세요">
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">파일</label>
                  <div class="col-sm-10">
                    <input type="file" id="file" name="file" class="form-control" accept=".pdf,.png,.jpg,.jpeg">
                    <small class="text-muted">PDF, PNG, JPG 파일만 업로드 가능합니다. (최대 20MB)</small>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer id="footer" class="footer">
    <div class="copyright">&copy; Copyright <strong><span>Windy</span></strong>. All Rights Reserved</div>
  </footer>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <script src="bootstrap_nice/assets/js/main.js"></script>
  <script>
  function goAdd() {
    var title = $('#title').val().trim();
    var file  = $('#file')[0].files[0];

    if (!title) { alert("제목을 입력해주세요."); return; }
    if (!file)  { alert("파일을 선택해주세요."); return; }

    var formData = new FormData($('#certForm')[0]);
    formData.append('mode', 'cert_add');

    $.ajax({
      type: "POST",
      url: "admin.windy",
      data: formData,
      processData: false,
      dataType: "json",
      dataType: "json",
      contentType: false,
      success: function(ret) {
        if (ret.result === "true") {
          alert("등록되었습니다.");
          location.href = "admin.windy?menu=cert_list";
        } else {
          alert(ret.msg || "등록에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>
</body>
</html>
