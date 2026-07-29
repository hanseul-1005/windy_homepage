<%@page import="windy.homepage.model.BusinessFieldModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BusinessFieldModel businessField = (BusinessFieldModel) request.getAttribute("businessField");
boolean isImage = businessField.getIcon() != null && !businessField.getIcon().startsWith("bi-");
%>
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
      <h1>Business Field 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=business_field_list">비즈니스 필드 목록</a></li>
          <li class="breadcrumb-item active">수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">비즈니스 필드 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=business_field_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>
              <input type="hidden" id="businessFieldId" value="<%=businessField.getBusinessFieldId()%>">

              <!-- 아이콘 선택 영역 -->
              <div class="row mb-1">
                <label class="col-sm-2 col-form-label">아이콘</label>
                <div class="col-sm-8">
                  <ul class="nav nav-tabs mb-2" id="iconTab">
                    <li class="nav-item">
                      <a class="nav-link <%=isImage ? "" : "active"%>" id="tab-bi" href="#" onclick="switchTab('bi'); return false;">Bootstrap 아이콘</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link <%=isImage ? "active" : ""%>" id="tab-img" href="#" onclick="switchTab('img'); return false;">이미지 직접 업로드</a>
                    </li>
                  </ul>

                  <!-- Bootstrap 아이콘 탭 -->
                  <div id="panel-bi" <%=isImage ? "style='display:none;'" : ""%>>
                    <div class="input-group">
                      <span class="input-group-text"><i id="iconPreview" class="bi <%=isImage ? "bi-star" : businessField.getIcon()%>"></i></span>
                      <input type="text" id="icon" class="form-control" value="<%=isImage ? "bi-star" : businessField.getIcon()%>" oninput="previewBiIcon(this.value)">
                      <button type="button" class="btn btn-outline-secondary" onclick="openIconPicker()">아이콘 선택</button>
                    </div>
                  </div>

                  <!-- 이미지 업로드 탭 -->
                  <div id="panel-img" <%=isImage ? "" : "style='display:none;'"%>>
                    <div class="d-flex align-items-center gap-3">
                      <input type="file" id="iconFile" class="form-control" accept="image/*" style="max-width:320px;" onchange="previewImgIcon(this)">
                      <img id="imgPreview" src="<%=isImage ? businessField.getIcon() : ""%>"
                           style="<%=isImage ? "" : "display:none;"%> height:48px; width:48px; object-fit:contain; border:1px solid #dee2e6; border-radius:6px; padding:4px;">
                    </div>
                    <small class="text-muted">새 이미지를 선택하지 않으면 기존 이미지 유지</small>
                  </div>
                </div>
              </div>

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-5">
                  <input type="text" id="title" class="form-control" value="<%=businessField.getTitle()%>">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                  <textarea id="content" class="form-control" rows="3"><%=businessField.getContent()%></textarea>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">정렬 순서</label>
                <div class="col-sm-2">
                  <input type="number" id="sortOrder" class="form-control" value="<%=businessField.getSortOrder()%>" min="0">
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
  <jsp:include page="../icon_picker_modal.jsp"/>
  <script>
  var currentTab = '<%=isImage ? "img" : "bi"%>';

  function switchTab(tab) {
    currentTab = tab;
    document.getElementById('panel-bi').style.display  = tab === 'bi'  ? '' : 'none';
    document.getElementById('panel-img').style.display = tab === 'img' ? '' : 'none';
    document.getElementById('tab-bi').classList.toggle('active',  tab === 'bi');
    document.getElementById('tab-img').classList.toggle('active', tab === 'img');
    if (tab === 'bi') {
      document.getElementById('iconFile').value = '';
    }
  }

  function previewBiIcon(val) {
    document.getElementById('iconPreview').className = 'bi ' + val.trim();
  }

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

  function goUpdate() {
    var businessFieldId = $('#businessFieldId').val();
    var title           = $('#title').val().trim();
    var content         = $('#content').val().trim();
    var sortOrder       = $('#sortOrder').val();

    if (!title)   { alert("제목을 입력해주세요."); return; }
    if (!content) { alert("내용을 입력해주세요."); return; }

    var fd = new FormData();
    fd.append('businessFieldId', businessFieldId);
    fd.append('title',           title);
    fd.append('content',         content);
    fd.append('sortOrder',       sortOrder);

    if (currentTab === 'img') {
      var file = document.getElementById('iconFile').files[0];
      if (file) fd.append('iconFile', file);
      // 파일 없으면 기존 유지 (서버에서 처리)
    } else {
      var icon = $('#icon').val().trim();
      if (!icon) { alert("아이콘을 선택해주세요."); return; }
      fd.append('icon', icon);
    }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=business_field_update",
      data: fd,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=business_field_list";
        } else {
          alert("수정에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>
</body>
</html>
