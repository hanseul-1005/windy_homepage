<%@page import="windy.homepage.model.BusinessFieldModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BusinessFieldModel businessField = (BusinessFieldModel) request.getAttribute("businessField");
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
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">아이콘 <span class="text-muted" style="font-size:12px;">(Bootstrap Icons 클래스명)</span></label>
                <div class="col-sm-4">
                  <div class="input-group">
                    <span class="input-group-text"><i id="iconPreview" class="bi <%=businessField.getIcon()%>"></i></span>
                    <input type="text" id="icon" class="form-control" value="<%=businessField.getIcon()%>" oninput="previewIcon(this.value)">
                  </div>
                  <small class="text-muted">
                    참고: <a href="https://icons.getbootstrap.com/" target="_blank">Bootstrap Icons 목록</a>
                  </small>
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
  <script>
  function previewIcon(val) {
    var el = document.getElementById('iconPreview');
    el.className = 'bi ' + val.trim();
  }

  function goUpdate() {
    var businessFieldId = $('#businessFieldId').val();
    var icon            = $('#icon').val().trim();
    var title           = $('#title').val().trim();
    var content         = $('#content').val().trim();
    var sortOrder       = $('#sortOrder').val();

    if (!icon)    { alert("아이콘을 입력해주세요."); return; }
    if (!title)   { alert("제목을 입력해주세요."); return; }
    if (!content) { alert("내용을 입력해주세요."); return; }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=business_field_update",
      data: { businessFieldId: businessFieldId, icon: icon, title: title, content: content, sortOrder: sortOrder },
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
