<%-- 비즈니스 필드 목록 관리 페이지 --%>
<%-- sort_order 오름차순으로 표시되며, 제목/내용 클릭 시 수정 페이지로 이동 --%>
<%@page import="windy.homepage.model.BusinessFieldModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<BusinessFieldModel> listBusinessField = (List<BusinessFieldModel>) request.getAttribute("listBusinessField");
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
  <link href="css_admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="css_admin/assets/css/style.css" rel="stylesheet">
  <script src="css_admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.datatable td, .datatable th { text-align: center; }
</style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Business Field</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">비즈니스 필드 목록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='admin.windy?menu=business_field_add'">등록</button>
              </div>
              <table class="table datatable">
                <colgroup>
                  <col width="8%"/>
                  <col width="15%"/>
                  <col width="20%"/>
                  <col width="42%"/>
                  <col width="15%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>순서</th>
                    <th>아이콘</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listBusinessField != null) {
                    for (BusinessFieldModel bf : listBusinessField) {
                %>
                  <tr>
                    <td style="vertical-align: middle;"><%=bf.getSortOrder()%></td>
                    <td style="vertical-align: middle;">
                      <%-- icon 값이 "bi-"로 시작하면 Bootstrap 아이콘, 아니면 업로드 이미지 --%>
                      <%if (bf.getIcon() != null && bf.getIcon().startsWith("bi-")) {%>
                        <i class="bi <%=bf.getIcon()%>" style="font-size:1.3rem;"></i>
                        <small class="d-block text-muted"><%=bf.getIcon()%></small>
                      <%} else {%>
                        <img src="<%=bf.getIcon()%>" style="height:36px; width:36px; object-fit:contain;">
                        <small class="d-block text-muted">이미지</small>
                      <%}%>
                    </td>
                    <%-- 제목/내용 클릭 시 수정 페이지 이동 --%>
                    <td style="vertical-align: middle; cursor: pointer;"
                        onclick="location.href='admin.windy?menu=business_field_modify&businessFieldId=<%=bf.getBusinessFieldId()%>'">
                      <%=bf.getTitle()%>
                    </td>
                    <td style="vertical-align: middle; text-align: left; cursor: pointer;"
                        onclick="location.href='admin.windy?menu=business_field_modify&businessFieldId=<%=bf.getBusinessFieldId()%>'">
                      <%=bf.getContent()%>
                    </td>
                    <td style="vertical-align: middle;">
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=bf.getBusinessFieldId()%>)">삭제</button>
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

  <script src="css_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="css_admin/assets/js/main.js"></script>
  <script>
  /**
   * 비즈니스 필드 삭제
   * - 확인 후 AJAX POST 요청으로 삭제, 성공 시 목록 새로고침
   */
  function goDelete(businessFieldId) {
    if (!confirm("삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=business_field_delete",
      data: { businessFieldId: businessFieldId },
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
