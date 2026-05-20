<%@page import="windy.homepage.model.PressModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PressModel press = (PressModel) request.getAttribute("press");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="bootstrap_nice/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .ql-editor { height: 400px; overflow-y: auto; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="10px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="10px"]::before  { content: '10'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="11px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="11px"]::before  { content: '11'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="12px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="12px"]::before  { content: '12'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="13px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="13px"]::before  { content: '13'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="14px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="14px"]::before  { content: '14'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="16px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="16px"]::before  { content: '16'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="18px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="18px"]::before  { content: '18'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="20px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="20px"]::before  { content: '20'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="24px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="24px"]::before  { content: '24'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="28px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="28px"]::before  { content: '28'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="32px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="32px"]::before  { content: '32'; }
    .ql-snow .ql-picker.ql-size .ql-picker-label[data-value="36px"]::before,
    .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="36px"]::before  { content: '36'; }
    .img-preview { position: relative; display: inline-block; margin: 5px; }
    .img-preview img { width: 120px; height: 90px; object-fit: cover; border-radius: 4px; border: 1px solid #dee2e6; }
    .img-preview .btn-remove { position: absolute; top: -6px; right: -6px; width: 20px; height: 20px;
      border-radius: 50%; font-size: 11px; padding: 0; line-height: 20px; text-align: center; }
  </style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>언론보도 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=press_list">언론보도 목록</a></li>
          <li class="breadcrumb-item active">언론보도 수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">언론보도 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=press_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>
              <input type="hidden" id="pressId" value="<%=press.getPressId()%>">
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                  <input type="text" id="title" class="form-control" value="<%=press.getTitle()%>">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">원문 링크 <small class="text-muted">(선택)</small></label>
                <div class="col-sm-10">
                  <input type="url" id="sourceUrl" class="form-control" value="<%=press.getSourceUrl()%>" placeholder="https://...">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">썸네일</label>
                <div class="col-sm-10">
                  <div id="existingThumb">
                  <%if (press.getThumbnailPath() != null && !press.getThumbnailPath().isEmpty()) {%>
                    <div class="img-preview">
                      <img src="<%=request.getContextPath()%>/<%=press.getThumbnailPath()%>" alt="썸네일">
                      <button type="button" class="btn btn-danger btn-remove" onclick="removeExistingThumb()">×</button>
                    </div>
                  <%}%>
                  </div>
                  <div class="mt-2">
                    <input type="file" id="imageInput" class="form-control" accept="image/*">
                    <div id="previewArea" class="mt-2"></div>
                  </div>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                  <div>
                    <div>
                      <div id="editor" style="min-height: 400px;"></div>
                    </div>
                  </div>
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

  <script src="bootstrap_nice/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="bootstrap_nice/assets/vendor/echarts/echarts.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/quill/quill.js"></script>
  <script src="bootstrap_nice/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="bootstrap_nice/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_nice/assets/js/main.js"></script>
  <script>
  var Size = Quill.import('attributors/style/size');
  Size.whitelist = ['10px','11px','12px','13px','14px','16px','18px','20px','24px','28px','32px','36px'];
  Quill.register(Size, true);

  var toolbarOptions = [
    [{ 'size': Size.whitelist }],
    ['bold', 'italic', 'underline', 'strike'],
    [{ 'color': [] }, { 'background': [] }],
    [{ 'list': 'ordered' }, { 'list': 'bullet' }],
    ['clean']
  ];
  var quill = new Quill('#editor', { theme: 'snow', modules: { toolbar: toolbarOptions } });
  quill.root.innerHTML = `<%=press.getContent() != null ? press.getContent() : ""%>`;

  var selectedFile = null;

  // 기존 썸네일 제거 (화면에서만 숨김, 새 이미지 업로드 시 서버에서 교체)
  function removeExistingThumb() {
    $('#existingThumb').empty();
  }

  // 새 이미지 선택
  $('#imageInput').on('change', function() {
    var file = this.files[0];
    if (!file) return;
    selectedFile = file;
    $('#existingThumb').empty(); // 기존 썸네일 제거
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#previewArea').html(
        '<div class="img-preview">' +
          '<img src="' + e.target.result + '">' +
          '<button type="button" class="btn btn-danger btn-remove" onclick="removeNewThumb()">×</button>' +
        '</div>'
      );
    };
    reader.readAsDataURL(file);
    $(this).val('');
  });

  function removeNewThumb() {
    selectedFile = null;
    $('#previewArea').empty();
  }

  function goUpdate() {
    var pressId   = $('#pressId').val();
    var title     = $('#title').val().trim();
    var sourceUrl = $('#sourceUrl').val().trim();
    var content   = quill.root.innerHTML.trim();

    if (!title) { alert("제목을 입력해주세요."); return; }
    if (!content || content === '<p><br></p>') { alert("내용을 입력해주세요."); return; }

    var formData = new FormData();
    formData.append('pressId', pressId);
    formData.append('title', title);
    formData.append('sourceUrl', sourceUrl);
    formData.append('content', content);
    if (selectedFile) formData.append('thumbnail', selectedFile);

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=press_update",
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=press_list";
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
