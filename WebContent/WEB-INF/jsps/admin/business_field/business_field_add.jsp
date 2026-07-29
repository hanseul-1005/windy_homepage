<%-- 비즈니스 필드 등록 페이지 --%>
<%-- 아이콘은 Bootstrap 아이콘 선택 또는 이미지 직접 업로드 중 하나를 선택 --%>
<%-- 이미지 업로드 시 FormData로 multipart 전송, 파일은 uploads/business_field/ 에 저장됨 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="css_main/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="css_admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css_admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css_admin/assets/css/style.css" rel="stylesheet">
  <script src="css_admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Business Field 등록</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=business_field_list">비즈니스 필드 목록</a></li>
          <li class="breadcrumb-item active">등록</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">비즈니스 필드 등록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=business_field_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goAdd()">등록</button>
              </div>

              <%-- 아이콘 선택 영역: Bootstrap 아이콘 탭 / 이미지 업로드 탭 전환 --%>
              <div class="row mb-1">
                <label class="col-sm-2 col-form-label">아이콘</label>
                <div class="col-sm-8">
                  <ul class="nav nav-tabs mb-2" id="iconTab">
                    <li class="nav-item">
                      <a class="nav-link active" id="tab-bi" href="#" onclick="switchTab('bi'); return false;">Bootstrap 아이콘</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="tab-img" href="#" onclick="switchTab('img'); return false;">이미지 직접 업로드</a>
                    </li>
                  </ul>

                  <%-- Bootstrap 아이콘 탭: 클래스명 직접 입력 또는 피커에서 선택 --%>
                  <div id="panel-bi">
                    <div class="input-group">
                      <span class="input-group-text"><i id="iconPreview" class="bi bi-star"></i></span>
                      <input type="text" id="icon" class="form-control" value="bi-star" oninput="previewBiIcon(this.value)">
                      <button type="button" class="btn btn-outline-secondary" onclick="openIconPicker()">아이콘 선택</button>
                    </div>
                  </div>

                  <%-- 이미지 업로드 탭: 파일 선택 후 미리보기 표시 --%>
                  <div id="panel-img" style="display:none;">
                    <div class="d-flex align-items-center gap-3">
                      <input type="file" id="iconFile" class="form-control" accept="image/*" style="max-width:320px;" onchange="previewImgIcon(this)">
                      <img id="imgPreview" src="" alt="" style="display:none; height:48px; width:48px; object-fit:contain; border:1px solid #dee2e6; border-radius:6px; padding:4px;">
                    </div>
                    <small class="text-muted">PNG, JPG, SVG 권장 (정사각형 이미지)</small>
                  </div>
                </div>
              </div>

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-5">
                  <input type="text" id="title" class="form-control" placeholder="예) AI">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                  <textarea id="content" class="form-control" rows="3" placeholder="비즈니스 필드 설명을 입력하세요"></textarea>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">정렬 순서</label>
                <div class="col-sm-2">
                  <input type="number" id="sortOrder" class="form-control" value="0" min="0">
                </div>
              </div>
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
  <script src="css_admin/assets/js/main.js"></script>
  <%-- 아이콘 피커 모달 (Bootstrap 아이콘 목록 + 검색) --%>
  <jsp:include page="../icon_picker_modal.jsp"/>
  <script>
  var currentTab = 'bi'; // 현재 활성 탭 ('bi' | 'img')

  /** 탭 전환: Bootstrap 아이콘 ↔ 이미지 업로드 */
  function switchTab(tab) {
    currentTab = tab;
    document.getElementById('panel-bi').style.display  = tab === 'bi'  ? '' : 'none';
    document.getElementById('panel-img').style.display = tab === 'img' ? '' : 'none';
    document.getElementById('tab-bi').classList.toggle('active',  tab === 'bi');
    document.getElementById('tab-img').classList.toggle('active', tab === 'img');
    // Bootstrap 탭으로 돌아올 때 파일 선택 초기화
    if (tab === 'bi') {
      document.getElementById('iconFile').value = '';
      document.getElementById('imgPreview').style.display = 'none';
    }
  }

  /** Bootstrap 아이콘 클래스 입력 시 왼쪽 미리보기 갱신 */
  function previewBiIcon(val) {
    document.getElementById('iconPreview').className = 'bi ' + val.trim();
  }

  /** 이미지 파일 선택 시 미리보기 표시 */
  function previewImgIcon(input) {
    var file = input.files[0];
    if (!file) return;
    var reader = new FileReader();
    reader.onload = function(e) {
      var img = document.getElementById('imgPreview');
      img.src = e.target.result;
      img.style.display = 'inline-block';
    };
    reader.readAsDataURL(file);
  }

  /**
   * 비즈니스 필드 등록
   * - 파일 업로드가 포함될 수 있으므로 FormData + multipart 방식으로 전송
   * - 현재 탭에 따라 icon(Bootstrap 클래스) 또는 iconFile(이미지) 전송
   */
  function goAdd() {
    var title     = $('#title').val().trim();
    var content   = $('#content').val().trim();
    var sortOrder = $('#sortOrder').val();

    if (!title)   { alert("제목을 입력해주세요."); return; }
    if (!content) { alert("내용을 입력해주세요."); return; }

    var fd = new FormData();
    fd.append('title',     title);
    fd.append('content',   content);
    fd.append('sortOrder', sortOrder);

    if (currentTab === 'img') {
      var file = document.getElementById('iconFile').files[0];
      if (!file) { alert("이미지를 선택해주세요."); return; }
      fd.append('iconFile', file);
    } else {
      var icon = $('#icon').val().trim();
      if (!icon) { alert("아이콘을 선택해주세요."); return; }
      fd.append('icon', icon);
    }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=business_field_add",
      data: fd,
      processData: false, // FormData는 jQuery가 직렬화하지 않도록 설정
      contentType: false, // multipart/form-data 자동 설정
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("등록되었습니다.");
          location.href = "admin.windy?menu=business_field_list";
        } else {
          alert("등록에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>
</body>
</html>
