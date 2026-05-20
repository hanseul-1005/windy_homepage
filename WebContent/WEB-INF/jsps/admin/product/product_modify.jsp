<%@page import="windy.homepage.model.ProductFeatureModel"%>
<%@page import="windy.homepage.model.ProductImageModel"%>
<%@page import="windy.homepage.model.ProductModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ProductModel product = (ProductModel) request.getAttribute("product");
%>
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
  <style>
    .img-preview { position: relative; display: inline-block; margin: 5px; }
    .img-preview img { width: 120px; height: 90px; object-fit: cover; border-radius: 4px; border: 1px solid #dee2e6; }
    .img-preview .btn-remove { position: absolute; top: -6px; right: -6px; width: 20px; height: 20px;
      border-radius: 50%; font-size: 11px; padding: 0; line-height: 20px; text-align: center; }
    .badge-thumb { position: absolute; bottom: 4px; left: 4px; background: #0d6efd; color: #fff;
      font-size: 10px; padding: 1px 5px; border-radius: 3px; pointer-events: none; }
    .feature-row { display: flex; align-items: center; margin-bottom: 8px; }
    .feature-row input { flex: 1; margin-right: 8px; }
  </style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>프로덕트 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=product_list">프로덕트 목록</a></li>
          <li class="breadcrumb-item active">프로덕트 수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">프로덕트 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=product_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>
              <input type="hidden" id="productId" value="<%=product.getProductId()%>">
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                  <input type="text" id="title" class="form-control" value="<%=product.getTitle()%>">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">간략 설명</label>
                <div class="col-sm-10">
                  <textarea id="summary" class="form-control" rows="4"><%=product.getSummary() != null ? product.getSummary() : ""%></textarea>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">특징</label>
                <div class="col-sm-10">
                  <div id="featureList">
                  <%
                  if (product.getFeatures() != null && !product.getFeatures().isEmpty()) {
                      for (ProductFeatureModel f : product.getFeatures()) {
                  %>
                    <div class="feature-row">
                      <input type="text" class="form-control feature-input" value="<%=f.getContent()%>">
                      <button type="button" class="btn btn-outline-danger btn-sm ms-2" onclick="removeFeature(this)">-</button>
                    </div>
                  <%
                      }
                  } else {
                  %>
                    <div class="feature-row">
                      <input type="text" class="form-control feature-input" placeholder="특징을 입력하세요">
                      <button type="button" class="btn btn-outline-danger btn-sm ms-2" onclick="removeFeature(this)">-</button>
                    </div>
                  <% } %>
                  </div>
                  <button type="button" class="btn btn-outline-secondary btn-sm mt-1" onclick="addFeature()">+ 특징 추가</button>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">등록된 이미지</label>
                <div class="col-sm-10">
                  <div id="existingImages">
                  <%
                  if (product.getImages() != null) {
                      for (ProductImageModel img : product.getImages()) {
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
  var selectedFiles = [];

  function updateThumbBadge() {
    $('.badge-thumb').remove();
    var first = $('#existingImages .img-preview:first, #previewArea .img-preview:first').first();
    if (first.length) first.append('<span class="badge-thumb">대표</span>');
  }

  $(document).ready(function() { updateThumbBadge(); });

  function addFeature() {
    var row = $('<div class="feature-row">');
    row.append('<input type="text" class="form-control feature-input" placeholder="특징을 입력하세요">');
    row.append('<button type="button" class="btn btn-outline-danger btn-sm ms-2" onclick="removeFeature(this)">-</button>');
    $('#featureList').append(row);
  }

  function removeFeature(btn) {
    if ($('.feature-row').length > 1) $(btn).closest('.feature-row').remove();
  }

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
        updateThumbBadge();
      };
      reader.readAsDataURL(file);
    });
    $(this).val('');
  });

  function removeNewImage(idx) {
    selectedFiles[idx] = null;
    $('[data-idx="' + idx + '"]').remove();
    updateThumbBadge();
  }

  function deleteImage(imageId) {
    if (!confirm("이미지를 삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=product_image_delete",
      data: { imageId: imageId },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          $('#img_' + imageId).remove();
          updateThumbBadge();
        } else {
          alert("삭제에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }

  function goUpdate() {
    var productId = $('#productId').val();
    var title     = $('#title').val().trim();
    var summary   = $('#summary').val().trim();
    if (!title) { alert("제목을 입력해주세요."); return; }

    var formData = new FormData();
    formData.append('productId', productId);
    formData.append('title', title);
    formData.append('summary', summary);

    $('.feature-input').each(function() {
      var val = $(this).val().trim();
      if (val) formData.append('features', val);
    });

    selectedFiles.forEach(function(file) {
      if (file) formData.append('images', file);
    });

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=product_update",
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=product_list";
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
