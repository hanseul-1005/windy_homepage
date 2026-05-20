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
  <link href="bootstrap_nice/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
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
    #thumbPreview { max-width: 200px; max-height: 150px; object-fit: contain; margin-top: 8px; border-radius: 4px; border: 1px solid #dee2e6; }
    #thumbPreview.hidden { display: none; }
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
              <h5 class="card-title">언론보도 글 수정</h5>
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
                <label class="col-sm-2 col-form-label">원문 링크 <span class="text-muted" style="font-size:12px;">(선택)</span></label>
                <div class="col-sm-10">
                  <input type="url" id="sourceUrl" class="form-control" value="<%=press.getSourceUrl()%>" placeholder="https://...">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">썸네일 <span class="text-muted" style="font-size:12px;">(변경 시 선택)</span></label>
                <div class="col-sm-10">
                  <%if (press.getThumbnailPath() != null && !press.getThumbnailPath().isEmpty()) {%>
                  <img id="thumbPreview" src="<%=request.getContextPath()%>/<%=press.getThumbnailPath()%>" alt="썸네일">
                  <%} else {%>
                  <img id="thumbPreview" src="" alt="미리보기" class="hidden">
                  <%}%>
                  <div class="mt-2">
                    <input type="file" id="thumbnail" class="form-control" accept="image/*">
                  </div>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                  <div id="editor" style="min-height: 400px;"></div>
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

  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_nice/assets/vendor/quill/quill.js"></script>
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

  // 썸네일 새 이미지 선택 시 미리보기 교체
  $('#thumbnail').on('change', function() {
    var file = this.files[0];
    if (file) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#thumbPreview').attr('src', e.target.result).removeClass('hidden');
      };
      reader.readAsDataURL(file);
    }
  });

  function goUpdate() {
    var pressId   = $('#pressId').val();
    var title     = $('#title').val().trim();
    var sourceUrl = $('#sourceUrl').val().trim();
    var content   = quill.root.innerHTML.trim();
    var thumbFile = $('#thumbnail')[0].files[0];

    if (!title) { alert("제목을 입력해주세요."); return; }
    if (!content || content === '<p><br></p>') { alert("내용을 입력해주세요."); return; }

    var formData = new FormData();
    formData.append('pressId', pressId);
    formData.append('title', title);
    formData.append('sourceUrl', sourceUrl);
    formData.append('content', content);
    if (thumbFile) formData.append('thumbnail', thumbFile);

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
