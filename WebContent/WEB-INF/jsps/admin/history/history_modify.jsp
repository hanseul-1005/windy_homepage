<%@page import="windy.homepage.model.HistoryModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
HistoryModel history = (HistoryModel) request.getAttribute("history");
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
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>연혁 수정</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=history_list">연혁 목록</a></li>
          <li class="breadcrumb-item active">연혁 수정</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">연혁 수정</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=history_list'">목록</button>
                <button type="button" class="btn btn-primary ms-2" onclick="goUpdate()">수정</button>
              </div>
              <input type="hidden" id="historyId" value="<%=history.getHistoryId()%>">
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">연도</label>
                <div class="col-sm-3">
                  <input type="number" id="historyYear" class="form-control" value="<%=history.getHistoryYear()%>">
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">월</label>
                <div class="col-sm-2">
                  <select id="historyMonth" class="form-select">
                    <%for (int m = 1; m <= 12; m++) {%>
                    <option value="<%=m%>" <%=history.getHistoryMonth() == m ? "selected" : ""%>><%=m%>월</option>
                    <%}%>
                  </select>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                  <input type="text" id="content" class="form-control" value="<%=history.getContent()%>">
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
  function goUpdate() {
    var historyId    = $('#historyId').val();
    var historyYear  = $('#historyYear').val().trim();
    var historyMonth = $('#historyMonth').val();
    var content      = $('#content').val().trim();

    if (!historyYear)  { alert("연도를 입력해주세요."); return; }
    if (!historyMonth) { alert("월을 선택해주세요."); return; }
    if (!content)      { alert("내용을 입력해주세요."); return; }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=history_update",
      data: { historyId: historyId, historyYear: historyYear, historyMonth: historyMonth, content: content },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("수정되었습니다.");
          location.href = "admin.windy?menu=history_list";
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
