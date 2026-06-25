<%@page import="windy.homepage.model.VideoModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<VideoModel> listVideo = (List<VideoModel>) request.getAttribute("listVideo");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="windy_css/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="windy_admin_css/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="windy_admin_css/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="windy_admin_css/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="windy_admin_css/assets/css/style.css" rel="stylesheet">
  <script src="windy_admin_css/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .datatable td, .datatable th { text-align: center; }
    .thumb-cell img { width: 120px; height: 68px; object-fit: cover; border-radius: 4px; }
    .thumb-cell .no-thumb { width: 120px; height: 68px; background: #f0f0f0; display: flex;
      align-items: center; justify-content: center; border-radius: 4px; color: #aaa; font-size: 1.4rem; margin: auto; }
  </style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Video</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Video 목록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='admin.windy?menu=video_add'">등록</button>
              </div>
              <table class="table datatable">
                <colgroup>
                  <col width="6%"/>
                  <col width="20%"/>
                  <col width="38%"/>
                  <col width="16%"/>
                  <col width="16%"/>
                  <col width="4%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>미리보기</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>수정일</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listVideo != null) {
                  for (int i = 0; i < listVideo.size(); i++) {
                    VideoModel video = listVideo.get(i);
                    String thumbUrl = "";
                    String ytUrl = video.getYoutubeUrl();
                    // extract video ID for thumbnail
                    String ytId = extractYoutubeId(ytUrl);
                    if (ytId != null) thumbUrl = "https://img.youtube.com/vi/" + ytId + "/mqdefault.jpg";
                %>
                  <tr>
                    <td style="vertical-align: middle;"><%=listVideo.size() - i%></td>
                    <td class="thumb-cell" style="vertical-align: middle;">
                      <%if (!thumbUrl.isEmpty()) {%>
                        <img src="<%=thumbUrl%>" alt="썸네일">
                      <%} else {%>
                        <div class="no-thumb"><i class="bi bi-youtube"></i></div>
                      <%}%>
                    </td>
                    <td style="vertical-align: middle; text-align: left; cursor: pointer;"
                        onclick="location.href='admin.windy?menu=video_modify&videoId=<%=video.getVideoId()%>'">
                      <%=video.getTitle()%>
                    </td>
                    <td style="vertical-align: middle;"><%=video.getCreatedAt() != null && video.getCreatedAt().length() >= 10 ? video.getCreatedAt().substring(0,10) : video.getCreatedAt()%></td>
                    <td style="vertical-align: middle;"><%=video.getUpdatedAt() != null && video.getUpdatedAt().length() >= 10 ? video.getUpdatedAt().substring(0,10) : video.getUpdatedAt()%></td>
                    <td style="vertical-align: middle;">
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=video.getVideoId()%>)">삭제</button>
                    </td>
                  </tr>
                <%
                  }
                }
                %>
                </tbody>
              </table>
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

  <script src="windy_admin_css/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="windy_admin_css/assets/js/main.js"></script>
  <script>
  function goDelete(videoId) {
    if (!confirm("삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=video_delete",
      data: { videoId: videoId },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("삭제되었습니다.");
          location.reload();
        } else {
          alert("삭제에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }
  </script>
</body>
</html>
<%!
private String extractYoutubeId(String url) {
    if (url == null || url.isEmpty()) return null;
    // youtu.be/ID
    if (url.contains("youtu.be/")) {
        int idx = url.indexOf("youtu.be/") + 9;
        String id = url.substring(idx);
        if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
        if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
        return id.length() == 11 ? id : null;
    }
    // shorts/ID
    if (url.contains("/shorts/")) {
        int idx = url.indexOf("/shorts/") + 8;
        String id = url.substring(idx);
        if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
        if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
        return id.length() == 11 ? id : null;
    }
    // watch?v=ID
    if (url.contains("v=")) {
        int idx = url.indexOf("v=") + 2;
        String id = url.substring(idx);
        if (id.contains("&")) id = id.substring(0, id.indexOf("&"));
        return id.length() == 11 ? id : null;
    }
    // embed/ID
    if (url.contains("embed/")) {
        int idx = url.indexOf("embed/") + 6;
        String id = url.substring(idx);
        if (id.contains("?")) id = id.substring(0, id.indexOf("?"));
        return id.length() == 11 ? id : null;
    }
    return null;
}
%>
