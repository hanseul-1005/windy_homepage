<%-- 포트폴리오 카테고리 관리 페이지 --%>
<%-- 카테고리 목록 + 등록/수정(모달) + 삭제 --%>
<%@page import="windy.homepage.model.PortfolioCategoryModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<PortfolioCategoryModel> listCategory = (List<PortfolioCategoryModel>) request.getAttribute("listCategory");
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
      <h1>Portfolio Category</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">카테고리 목록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-primary" onclick="openAddModal()">등록</button>
              </div>

              <table class="table datatable">
                <colgroup>
                  <col width="10%"/>
                  <col width="50%"/>
                  <col width="20%"/>
                  <col width="20%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>순서</th>
                    <th>카테고리명</th>
                    <th>등록일</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listCategory != null) {
                    for (PortfolioCategoryModel c : listCategory) {
                %>
                  <tr>
                    <td style="vertical-align: middle;"><%=c.getSortOrder()%></td>
                    <td style="vertical-align: middle;"><%=c.getName()%></td>
                    <td style="vertical-align: middle;"><%=c.getCreatedAt() != null ? c.getCreatedAt().substring(0, 10) : ""%></td>
                    <td style="vertical-align: middle;">
                      <button type="button" class="btn btn-outline-secondary btn-sm me-1"
                              onclick="openEditModal(<%=c.getCategoryId()%>, '<%=c.getName().replace("'","\\\'")%>', <%=c.getSortOrder()%>)">수정</button>
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=c.getCategoryId()%>)">삭제</button>
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

  <%-- 등록/수정 공용 모달 --%>
  <div class="modal fade" id="categoryModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalTitle">카테고리 등록</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="categoryId">
          <div class="mb-3">
            <label class="form-label">카테고리명 <span class="text-danger">*</span></label>
            <input type="text" id="categoryName" class="form-control" placeholder="예) AI, Data, Vision">
          </div>
          <div class="mb-3">
            <label class="form-label">정렬 순서</label>
            <input type="number" id="categorySortOrder" class="form-control" value="0" min="0">
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="modalSaveBtn" onclick="goSave()">저장</button>
        </div>
      </div>
    </div>
  </div>

  <script src="css_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="css_admin/assets/js/main.js"></script>
  <script>
  var modalMode = 'add'; // 'add' | 'edit'
  var modal = new bootstrap.Modal(document.getElementById('categoryModal'));

  /** 등록 모달 열기 */
  function openAddModal() {
    modalMode = 'add';
    document.getElementById('modalTitle').textContent = '카테고리 등록';
    document.getElementById('categoryId').value = '';
    document.getElementById('categoryName').value = '';
    document.getElementById('categorySortOrder').value = '0';
    modal.show();
  }

  /** 수정 모달 열기 - 기존 값 세팅 */
  function openEditModal(id, name, sortOrder) {
    modalMode = 'edit';
    document.getElementById('modalTitle').textContent = '카테고리 수정';
    document.getElementById('categoryId').value = id;
    document.getElementById('categoryName').value = name;
    document.getElementById('categorySortOrder').value = sortOrder;
    modal.show();
  }

  /** 등록 또는 수정 저장 */
  function goSave() {
    var name      = $('#categoryName').val().trim();
    var sortOrder = $('#categorySortOrder').val();
    if (!name) { alert("카테고리명을 입력해주세요."); return; }

    var data = { name: name, sortOrder: sortOrder };
    var mode;
    if (modalMode === 'edit') {
      data.categoryId = $('#categoryId').val();
      mode = 'portfolio_category_update';
    } else {
      mode = 'portfolio_category_add';
    }

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=" + mode,
      data: data,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert(modalMode === 'edit' ? "수정되었습니다." : "등록되었습니다.");
          location.reload();
        } else {
          alert("저장에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }

  /** 카테고리 삭제 */
  function goDelete(categoryId) {
    if (!confirm("삭제하시겠습니까?\n해당 카테고리를 사용 중인 포트폴리오의 카테고리는 변경되지 않습니다.")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=portfolio_category_delete",
      data: { categoryId: categoryId },
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
