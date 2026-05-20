<%@page import="windy.homepage.model.PortfolioImageModel"%>
<%@page import="windy.homepage.model.PortfolioModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PortfolioModel portfolio = (PortfolioModel) request.getAttribute("portfolio");
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
  <link href="bootstrap_nice/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .ql-editor { height: 300px; overflow-y: auto; }
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
      <h1>포트폴리오 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=portfolio_list">포트폴리오 목록</a></li>
          <li class="breadcrumb-item active">포트폴리오 수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">포트폴리오 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=portfolio_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>
              <form id="portfolioForm" enctype="multipart/form-data">
                <input type="hidden" id="portfolioId" value="<%=portfolio.getPortfolioId()%>">
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" id="title" class="form-control" value="<%=portfolio.getTitle()%>">
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">카테고리</label>
                  <div class="col-sm-10">
                    <select id="category" class="form-select">
                      <option value="AI"<%="AI".equals(portfolio.getCategory()) ? " selected" : ""%>>AI</option>
                      <option value="Data"<%="Data".equals(portfolio.getCategory()) ? " selected" : ""%>>Data</option>
                      <option value="Vision"<%="Vision".equals(portfolio.getCategory()) ? " selected" : ""%>>Vision</option>
                      <option value="Monitoring"<%="Monitoring".equals(portfolio.getCategory()) ? " selected" : ""%>>Monitoring</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">등록된 이미지</label>
                  <div class="col-sm-10">
                    <div id="existingImages">
                    <%
                    if (portfolio.getImages() != null) {
                        for (PortfolioImageModel img : portfolio.getImages()) {
                    %>
                      <div class="img-preview" id="img_<%=img.getImageId()%>">
                        <img src="<%=request.getContextPath()%>/<%=img.getImagePath()%>" alt="">
                        <button type="button" class="btn btn-danger btn-remove"
                                onclick="deleteImage(<%=img.getImageId()%>)">×</button>
                      </div>
                    <%
                        }
                    }
                    %>
                    </div>
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">이미지 추가</label>
                  <div class="col-sm-10">
                    <input type="file" id="imageInput" class="form-control" accept="image/*" multiple>
                    <div id="previewArea" class="mt-2"></div>
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">우측 내용</label>
                  <div class="col-sm-10">
                    <div>
                      <div>
                        <div id="editorRight" style="min-height: 300px;"></div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label">하단 내용</label>
                  <div class="col-sm-10">
                    <div>
                      <div>
                        <div id="editorBottom" style="min-height: 300px;"></div>
                      </div>
                    </div>
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
  var quillRight  = new Quill('#editorRight',  { theme: 'snow', modules: { toolbar: toolbarOptions } });
  var quillBottom = new Quill('#editorBottom', { theme: 'snow', modules: { toolbar: toolbarOptions } });
  document.querySelector('#editorRight .ql-editor').style.minHeight  = '300px';
  document.querySelector('#editorBottom .ql-editor').style.minHeight = '300px';

  quillRight.root.innerHTML  = `<%=portfolio.getRightContent()  != null ? portfolio.getRightContent()  : ""%>`;
  quillBottom.root.innerHTML = `<%=portfolio.getBottomContent() != null ? portfolio.getBottomContent() : ""%>`;

  var selectedFiles = [];

  $('#imageInput').on('change', function() {
    var files = Array.from(this.files);
    files.forEach(function(file) {
      selectedFiles.push(file);
      var reader = new FileReader();
      reader.onload = function(e) {
        var idx = selectedFiles.length - 1;
        var div = $('<div class="img-preview" data-idx="' + idx + '">');
        div.append('<img src="' + e.target.result + '">');
        div.append('<button type="button" class="btn btn-danger btn-remove" onclick="removeNewImage(' + idx + ')">×</button>');
        $('#previewArea').append(div);
      };
      reader.readAsDataURL(file);
    });
    $(this).val('');
  });

  function removeNewImage(idx) {
    selectedFiles[idx] = null;
    $('[data-idx="' + idx + '"]').remove();
  }

  function deleteImage(imageId) {
    if (!confirm("이미지를 삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=portfolio_image_delete",
      data: { imageId: imageId },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          $('#img_' + imageId).remove();
        } else {
          alert("삭제에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }

  function goUpdate() {
    var portfolioId   = $('#portfolioId').val();
    var title         = $('#title').val().trim();
    var category      = $('#category').val();
    var rightContent  = quillRight.root.innerHTML.trim();
    var bottomContent = quillBottom.root.innerHTML.trim();

    if (!title) { alert("제목을 입력해주세요."); return; }

    var formData = new FormData();
    formData.append('portfolioId', portfolioId);
    formData.append('title', title);
    formData.append('category', category);
    formData.append('rightContent', rightContent);
    formData.append('bottomContent', bottomContent);
    selectedFiles.forEach(function(file) {
      if (file) formData.append('images', file);
    });

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=portfolio_update",
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=portfolio_list";
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
