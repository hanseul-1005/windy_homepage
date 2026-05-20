<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 로그인</title>
  <link href="bootstrap_nice/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <main>
    <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="#" class="logo d-flex align-items-center w-auto">
                  <span class="fs-4 fw-bold">Windy 관리자</span>
                </a>
              </div>

              <div class="card mb-3 w-100">
                <div class="card-body">
                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">관리자 로그인</h5>
                  </div>
                  <div class="col-12 mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text" id="id" class="form-control">
                  </div>
                  <div class="col-12 mb-3">
                    <label class="form-label">비밀번호</label>
                    <input type="password" id="pw" class="form-control"
                           onkeydown="if(event.key==='Enter') goLogin()">
                  </div>
                  <div class="col-12">
                    <button class="btn btn-primary w-100" type="button" onclick="goLogin()">로그인</button>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </section>
    </div>
  </main>

  <script src="bootstrap_nice/assets/js/main.js"></script>
  <script>
  function goLogin() {
    var id = $('#id').val().trim();
    var pw = $('#pw').val().trim();

    if (!id) { alert("아이디를 입력해주세요."); return; }
    if (!pw) { alert("비밀번호를 입력해주세요."); return; }

    $.ajax({
      type: "POST",
      url: "login.windy?mode=login",
      data: { id: id, passwd: pw },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          location.href = "admin.windy?menu=main";
        } else {
          alert("아이디 혹은 비밀번호가 일치하지 않습니다.\n다시 시도해주세요.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>
</body>
</html>
