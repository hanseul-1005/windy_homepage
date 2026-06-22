<%@page import="windy.homepage.model.VideoModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
VideoModel video = (VideoModel) request.getAttribute("video");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="bootstrap_windy/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="bootstrap_windy_admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_windy_admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_windy_admin/assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    #previewWrap { margin-top: 10px; }
    #previewWrap iframe { width: 100%; height: 300px; border: none; border-radius: 6px; }
  </style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Video 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=video_list">Video 목록</a></li>
          <li class="breadcrumb-item active">Video 수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Video 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=video_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>

              <input type="hidden" id="videoId" value="<%=video.getVideoId()%>">

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                  <input type="text" id="title" class="form-control" value="<%=video.getTitle()%>">
                </div>
              </div>

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">YouTube URL</label>
                <div class="col-sm-10">
                  <input type="url" id="youtubeUrl" class="form-control" value="<%=video.getYoutubeUrl()%>">
                  <div id="previewWrap">
                    <iframe id="previewFrame" src="" allowfullscreen></iframe>
                  </div>
                </div>
              </div>

              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">설명 <small class="text-muted">(선택)</small></label>
                <div class="col-sm-10">
                  <textarea id="description" class="form-control" rows="3"><%=video.getDescription() != null ? video.getDescription() : ""%></textarea>
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

  <script src="bootstrap_windy_admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/quill/quill.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_windy_admin/assets/js/main.js"></script>
  <script>
  function extractYoutubeId(url) {
    if (!url) return null;
    var regExp = /(?:youtu\.be\/|youtube\.com\/(?:watch\?(?:.*&)?v=|embed\/|v\/|shorts\/))([^?&#]{11})/;
    var match = url.match(regExp);
    return match ? match[1] : null;
  }

  // 페이지 로드 시 기존 URL로 미리보기
  $(document).ready(function() {
    var url = $('#youtubeUrl').val().trim();
    var id  = extractYoutubeId(url);
    if (id) {
      $('#previewFrame').attr('src', 'https://www.youtube.com/embed/' + id);
    }
  });

  $('#youtubeUrl').on('input', function() {
    var url = $(this).val().trim();
    var id  = extractYoutubeId(url);
    if (id) {
      $('#previewFrame').attr('src', 'https://www.youtube.com/embed/' + id);
    } else {
      $('#previewFrame').attr('src', '');
    }
  });

  function goUpdate() {
    var videoId     = $('#videoId').val();
    var title       = $('#title').val().trim();
    var youtubeUrl  = $('#youtubeUrl').val().trim();
    var description = $('#description').val().trim();

    if (!title)      { alert("제목을 입력해주세요."); return; }
    if (!youtubeUrl) { alert("YouTube URL을 입력해주세요."); return; }
    if (!extractYoutubeId(youtubeUrl)) { alert("유효한 YouTube URL을 입력해주세요."); return; }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=video_update",
      data: { videoId: videoId, title: title, youtubeUrl: youtubeUrl, description: description },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=video_list";
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
