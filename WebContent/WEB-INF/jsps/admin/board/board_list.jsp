<%@page import="windy.homepage.model.BoardModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<BoardModel> listBoard = (List<BoardModel>) request.getAttribute("listBoard");
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
table td, table th { text-align: center; vertical-align: middle; }
</style>
</head>
<body>
  <jsp:include page="../top_menu.jsp"/>
  <jsp:include page="../side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Board</h1>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">게시판 관리</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-primary" onclick="openAddModal()">게시판 추가</button>
              </div>
              <table class="table">
                <colgroup>
                  <col width="6%"/>
                  <col width="24%"/>
                  <col width="12%"/>
                  <col width="12%"/>
                  <col width="8%"/>
                  <col width="8%"/>
                  <col width="8%"/>
                  <col width="22%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>게시판 이름</th>
                    <th>메뉴 위치</th>
                    <th>타입</th>
                    <th>순서</th>
                    <th>노출</th>
                    <th>글 수</th>
                    <th>관리</th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listBoard != null) {
                    for (int i = 0; i < listBoard.size(); i++) {
                        BoardModel board = listBoard.get(i);
                %>
                  <tr>
                    <td><%=i + 1%></td>
                    <td style="text-align: left;"><%=board.getBoardName()%></td>
                    <td><%="technology".equals(board.getMenuGroup()) ? "Technology" : "About"%></td>
                    <td><%="gallery".equals(board.getBoardType()) ? "갤러리형" : "목록형"%></td>
                    <td><%=board.getDisplayOrder()%></td>
                    <td>
                      <%if ("Y".equals(board.getUseYn())) {%>
                        <span class="badge bg-success">노출</span>
                      <%} else {%>
                        <span class="badge bg-secondary">숨김</span>
                      <%}%>
                    </td>
                    <td><%=board.getPostCount()%></td>
                    <td>
                      <button type="button" class="btn btn-outline-primary btn-sm"
                              onclick="location.href='admin.windy?menu=board_post_list&boardId=<%=board.getBoardId()%>'">글 관리</button>
                      <button type="button" class="btn btn-outline-secondary btn-sm"
                              onclick="openEditModal(<%=board.getBoardId()%>, '<%=board.getBoardName().replace("'", "\\'").replace("\"", "&quot;")%>', '<%=board.getMenuGroup()%>', '<%=board.getBoardType()%>', <%=board.getDisplayOrder()%>, '<%=board.getUseYn()%>')">수정</button>
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=board.getBoardId()%>, <%=board.getPostCount()%>)">삭제</button>
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

  <!-- 게시판 추가/수정 모달 -->
  <div class="modal fade" id="boardModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="boardModalTitle">게시판 추가</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="boardId" value="">
          <div class="mb-3">
            <label class="form-label">게시판 이름 <span class="text-danger">*</span></label>
            <input type="text" id="boardName" class="form-control" placeholder="예: 자료실, 갤러리">
          </div>
          <div class="mb-3">
            <label class="form-label">메뉴 위치 <span class="text-danger">*</span></label>
            <select id="menuGroup" class="form-select">
              <option value="technology">Technology</option>
              <option value="about">About</option>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">게시판 타입 <span class="text-danger">*</span></label>
            <select id="boardType" class="form-select">
              <option value="list">목록형 (제목/날짜 목록)</option>
              <option value="gallery">갤러리형 (썸네일 카드)</option>
            </select>
          </div>
          <div class="mb-3">
            <label class="form-label">정렬 순서</label>
            <input type="number" id="displayOrder" class="form-control" value="0">
            <div class="form-text">숫자가 작을수록 메뉴에서 위쪽에 표시됩니다.</div>
          </div>
          <div class="mb-3">
            <label class="form-label">노출 여부</label>
            <select id="useYn" class="form-select">
              <option value="Y">노출</option>
              <option value="N">숨김</option>
            </select>
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

  <script src="css_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="css_admin/assets/js/main.js"></script>
  <script>
  var boardModal = new bootstrap.Modal(document.getElementById('boardModal'));

  function openAddModal() {
    $('#boardModalTitle').text('게시판 추가');
    $('#boardId').val('');
    $('#boardName').val('');
    $('#menuGroup').val('technology');
    $('#boardType').val('list');
    $('#displayOrder').val(0);
    $('#useYn').val('Y');
    boardModal.show();
  }

  function openEditModal(boardId, boardName, menuGroup, boardType, displayOrder, useYn) {
    $('#boardModalTitle').text('게시판 수정');
    $('#boardId').val(boardId);
    $('#boardName').val(boardName);
    $('#menuGroup').val(menuGroup);
    $('#boardType').val(boardType);
    $('#displayOrder').val(displayOrder);
    $('#useYn').val(useYn);
    boardModal.show();
  }

  function goSave() {
    var boardId   = $('#boardId').val();
    var boardName = $('#boardName').val().trim();

    if (!boardName) { alert("게시판 이름을 입력해주세요."); return; }

    var isUpdate = boardId !== '';
    var data = {
      boardName:    boardName,
      menuGroup:    $('#menuGroup').val(),
      boardType:    $('#boardType').val(),
      displayOrder: $('#displayOrder').val(),
      useYn:        $('#useYn').val()
    };
    if (isUpdate) data.boardId = boardId;

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=" + (isUpdate ? "board_update" : "board_add"),
      data: data,
      dataType: "json",
      success: function(ret) {
        if (ret.result === "true") {
          alert(isUpdate ? "수정되었습니다." : "추가되었습니다.");
          location.reload();
        } else {
          alert("저장에 실패했습니다.");
        }
      },
      error: function() { alert("오류가 발생했습니다."); }
    });
  }

  function goDelete(boardId, postCount) {
    var msg = "게시판을 삭제하시겠습니까?";
    if (postCount > 0) {
      msg = "이 게시판에 글이 " + postCount + "개 있습니다.\n게시판 삭제 시 글도 모두 삭제됩니다.\n정말 삭제하시겠습니까?";
    }
    if (!confirm(msg)) return;

    $.ajax({
      type: "POST",
      url: "admin.windy?mode=board_delete",
      data: { boardId: boardId },
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
