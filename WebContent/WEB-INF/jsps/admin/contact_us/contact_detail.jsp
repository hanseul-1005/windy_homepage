<%@page import="windy.homepage.model.ContactModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ContactModel contact = (ContactModel) request.getAttribute("contact");
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
  <link href="windy_admin_css/assets/css/style.css" rel="stylesheet">
  <script src="windy_admin_css/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Contact Us 상세</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=contact_list">Contact 목록</a></li>
          <li class="breadcrumb-item active">상세 조회</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Contact Us 상세</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary"
                        onclick="location.href='admin.windy?menu=contact_list'">목록</button>
                <button type="button" class="btn btn-outline-danger ms-2"
                        onclick="goDelete(<%=contact.getContactId()%>)">삭제</button>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label fw-bold">제목</label>
                <div class="col-sm-10 d-flex align-items-center">
                  <span><%=contact.getSubject()%></span>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label fw-bold">작성자</label>
                <div class="col-sm-10 d-flex align-items-center">
                  <span><%=contact.getName()%></span>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label fw-bold">이메일</label>
                <div class="col-sm-10 d-flex align-items-center">
                  <span><%=contact.getEmail()%></span>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label fw-bold">작성일</label>
                <div class="col-sm-10 d-flex align-items-center">
                  <span><%=contact.getCreatedAt()%></span>
                </div>
              </div>
              <div class="row mb-3">
                <label class="col-sm-2 col-form-label fw-bold">내용</label>
                <div class="col-sm-10">
                  <div style="min-height: 150px; white-space: pre-wrap;"><%=contact.getContent()%></div>
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

  <script src="windy_admin_css/assets/js/main.js"></script>
  <script>
  function goDelete(contactId) {
    if (!confirm("삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=contact_delete",
      data: { contactId: contactId },
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert("삭제되었습니다.");
          location.href = "admin.windy?menu=contact_list";
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
