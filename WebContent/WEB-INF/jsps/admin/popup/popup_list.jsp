<%@page import="windy.homepage.model.PopupModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<PopupModel> listPopup = (List<PopupModel>) request.getAttribute("listPopup");
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
  <script src="bootstrap_windy_admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    table td, table th { text-align: center; vertical-align: middle; }
    .popup-thumb { width: 80px; height: 50px; object-fit: cover; border-radius: 4px; cursor: pointer; }
  </style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>팝업 관리</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">팝업 목록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-primary" onclick="openAddModal()">팝업 추가</button>
              </div>
              <table class="table">
                <colgroup>
                  <col width="5%"/>
                  <col width="10%"/>
                  <col width="20%"/>
                  <col width="10%"/>
                  <col width="12%"/>
                  <col width="12%"/>
                  <col width="6%"/>
                  <col width="8%"/>
                  <col width="17%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>미리보기</th>
                    <th>제목</th>
                    <th>링크</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th>순서</th>
                    <th>노출</th>
                    <th>관리</th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listPopup != null) {
                    for (int i = 0; i < listPopup.size(); i++) {
                        PopupModel p = listPopup.get(i);
                %>
                  <tr>
                    <td><%=i + 1%></td>
                    <td>
                      <img src="<%=p.getImagePath()%>" class="popup-thumb"
                           onclick="window.open('<%=p.getImagePath()%>')" alt="팝업 이미지">
                    </td>
                    <td style="text-align: left;"><%=p.getTitle()%></td>
                    <td><%=p.getLinkUrl().isEmpty() ? "-" : "<a href='" + p.getLinkUrl() + "' target='_blank'>링크</a>"%></td>
                    <td><%=p.getStartDate()%></td>
                    <td><%=p.getEndDate()%></td>
                    <td><%=p.getDisplayOrder()%></td>
                    <td>
                      <%if ("Y".equals(p.getUseYn())) {%>
                        <span class="badge bg-success">노출</span>
                      <%} else {%>
                        <span class="badge bg-secondary">숨김</span>
                      <%}%>
                    </td>
                    <td>
                      <button type="button" class="btn btn-outline-secondary btn-sm"
                              onclick="openEditModal(<%=p.getPopupId()%>, '<%=p.getTitle().replace("'", "\\'").replace("\"", "&quot;")%>', '<%=p.getImagePath()%>', '<%=p.getDescription().replace("'", "\\'").replace("\"", "&quot;")%>', '<%=p.getLinkUrl().replace("'", "\\'")%>', '<%=p.getStartDate()%>', '<%=p.getEndDate()%>', <%=p.getDisplayOrder()%>, '<%=p.getUseYn()%>', '<%=p.getHideOptions()%>')">수정</button>
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=p.getPopupId()%>)">삭제</button>
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

  <!-- 팝업 추가/수정 모달 -->
  <div class="modal fade" id="popupModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="popupModalTitle">팝업 추가</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="popupId" value="">
          <input type="hidden" id="existingImagePath" value="">
          <div class="mb-3">
            <label class="form-label">제목 <span class="text-danger">*</span></label>
            <input type="text" id="popupTitle" class="form-control" placeholder="관리용 제목">
          </div>
          <div class="mb-3">
            <label class="form-label">팝업 이미지 <span class="text-danger" id="imageRequired">*</span></label>
            <input type="file" id="imageFile" class="form-control" accept="image/*">
            <div id="imagePreviewWrap" style="display:none; margin-top:8px;">
              <img id="imagePreview" src="" style="max-width:100%; max-height:200px; border-radius:4px;">
              <div class="form-text">현재 이미지 (수정 시 새 파일 선택하면 교체됩니다)</div>
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label">팝업 하단 텍스트 (선택)</label>
            <textarea id="popupDescription" class="form-control" rows="3" placeholder="이미지 아래에 표시할 텍스트를 입력하세요."></textarea>
          </div>
          <div class="mb-3">
            <label class="form-label">클릭 링크 URL (선택)</label>
            <input type="text" id="linkUrl" class="form-control" placeholder="https://...">
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label class="form-label">노출 시작일 <span class="text-danger">*</span></label>
              <input type="date" id="startDate" class="form-control">
            </div>
            <div class="col-md-6">
              <label class="form-label">노출 종료일 <span class="text-danger">*</span></label>
              <input type="date" id="endDate" class="form-control">
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label">안보기 옵션</label>
            <div class="d-flex gap-3">
              <div class="form-check">
                <input class="form-check-input" type="radio" id="hide_1" name="hideOption" value="1">
                <label class="form-check-label" for="hide_1">24시간 안보기</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" id="hide_7" name="hideOption" value="7">
                <label class="form-check-label" for="hide_7">일주일 안보기</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" id="hide_30" name="hideOption" value="30">
                <label class="form-check-label" for="hide_30">한달 안보기</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" id="hide_none" name="hideOption" value="none">
                <label class="form-check-label" for="hide_none">미사용</label>
              </div>
            </div>
            <div class="form-text">미사용 선택 시 안보기 버튼이 팝업에 표시되지 않습니다.</div>
          </div>
          <div class="row mb-3">
            <div class="col-md-6">
              <label class="form-label">정렬 순서</label>
              <input type="number" id="displayOrder" class="form-control" value="0">
              <div class="form-text">숫자가 작을수록 먼저 표시됩니다.</div>
            </div>
            <div class="col-md-6">
              <label class="form-label">노출 여부</label>
              <select id="useYn" class="form-select">
                <option value="Y">노출</option>
                <option value="N">숨김</option>
              </select>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onclick="goSave()">저장</button>
        </div>
      </div>
    </div>
  </div>

  <footer id="footer" class="footer">
    <div class="copyright">&copy; Copyright <strong><span>Windy</span></strong>. All Rights Reserved</div>
  </footer>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <script src="bootstrap_windy_admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="bootstrap_windy_admin/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_windy_admin/assets/js/main.js"></script>
  <script>
  var popupModal = new bootstrap.Modal(document.getElementById('popupModal'));

  $('#imageFile').on('change', function() {
    var file = this.files[0];
    if (file) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#imagePreview').attr('src', e.target.result);
        $('#imagePreviewWrap').show();
      };
      reader.readAsDataURL(file);
    }
  });

  function setHideOptions(opts) {
    // opts: 단일 값 문자열 (예: "1", "7", "30")
    $('input[name="hideOption"]').val([opts]);
  }

  function openAddModal() {
    $('#popupModalTitle').text('팝업 추가');
    $('#popupId').val('');
    $('#existingImagePath').val('');
    $('#popupTitle').val('');
    $('#imageFile').val('');
    $('#imageRequired').show();
    $('#imagePreviewWrap').hide();
    $('#popupDescription').val('');
    $('#linkUrl').val('');
    var today = new Date().toISOString().slice(0,10);
    $('#startDate').val(today);
    $('#endDate').val(today);
    setHideOptions('1');
    $('#displayOrder').val(0);
    $('#useYn').val('Y');
    popupModal.show();
  }

  function openEditModal(popupId, title, imagePath, description, linkUrl, startDate, endDate, displayOrder, useYn, hideOptions) {
    $('#popupModalTitle').text('팝업 수정');
    $('#popupId').val(popupId);
    $('#existingImagePath').val(imagePath);
    $('#popupTitle').val(title);
    $('#imageFile').val('');
    $('#imageRequired').hide();
    if (imagePath) {
      $('#imagePreview').attr('src', imagePath);
      $('#imagePreviewWrap').show();
    } else {
      $('#imagePreviewWrap').hide();
    }
    $('#popupDescription').val(description);
    $('#linkUrl').val(linkUrl);
    $('#startDate').val(startDate);
    $('#endDate').val(endDate);
    setHideOptions(hideOptions);
    $('#displayOrder').val(displayOrder);
    $('#useYn').val(useYn);
    popupModal.show();
  }

  function goSave() {
    var popupId   = $('#popupId').val();
    var title     = $('#popupTitle').val().trim();
    var startDate = $('#startDate').val();
    var endDate   = $('#endDate').val();
    var isUpdate  = popupId !== '';

    if (!title)     { alert("제목을 입력해주세요."); return; }
    if (!isUpdate && !$('#imageFile')[0].files[0]) { alert("이미지를 선택해주세요."); return; }
    if (!startDate) { alert("시작일을 선택해주세요."); return; }
    if (!endDate)   { alert("종료일을 선택해주세요."); return; }
    if (endDate < startDate) { alert("종료일이 시작일보다 빠릅니다."); return; }
    var formData = new FormData();
    if (isUpdate) formData.append('popupId', popupId);
    formData.append('title',        title);
    formData.append('description',  $('#popupDescription').val().trim());
    formData.append('linkUrl',      $('#linkUrl').val().trim());
    formData.append('startDate',    startDate);
    formData.append('endDate',      endDate);
    formData.append('hideOption',   $('input[name="hideOption"]:checked').val() || '1');
    formData.append('displayOrder', $('#displayOrder').val());
    formData.append('useYn',        $('#useYn').val());
    var imageFile = $('#imageFile')[0].files[0];
    if (imageFile) formData.append('imageFile', imageFile);

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=" + (isUpdate ? "popup_update" : "popup_add"),
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert(isUpdate ? "수정되었습니다." : "추가되었습니다.");
          location.reload();
        } else {
          alert(ret.msg || "저장에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }

  function goDelete(popupId) {
    if (!confirm("팝업을 삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=popup_delete",
      data: { popupId: popupId },
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
