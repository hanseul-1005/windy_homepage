<%@page import="windy.homepage.model.BoardModel"%>
<%@page import="windy.homepage.model.BoardPostModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BoardModel board = (BoardModel) request.getAttribute("board");
List<BoardPostModel> listPost = (List<BoardPostModel>) request.getAttribute("listPost");

String boardName = (board != null) ? board.getBoardName() : "게시판";
int boardId = (board != null) ? board.getBoardId() : -1;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="bootstrap_enno/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|Nunito:300,400,600,700|Poppins:300,400,500,600,700" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="bootstrap_nice/assets/css/style.css" rel="stylesheet">
  <script src="bootstrap_nice/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
      <h1><%=boardName%></h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admin.windy?menu=board_list">게시판 관리</a></li>
          <li class="breadcrumb-item active"><%=boardName%> 글 목록</li>
        </ol>
      </nav>
    </div>

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title"><%=boardName%> 글 목록</h5>
              <div style="text-align: right; margin-bottom: 10px;">
                <button type="button" class="btn btn-outline-secondary" onclick="location.href='admin.windy?menu=board_list'">게시판 목록</button>
                <button type="button" class="btn btn-outline-primary ms-2" onclick="location.href='admin.windy?menu=board_post_add&boardId=<%=boardId%>'">등록</button>
              </div>
              <table class="table datatable">
                <colgroup>
                  <col width="8%"/>
                  <col width="46%"/>
                  <col width="14%"/>
                  <col width="14%"/>
                  <col width="8%"/>
                  <col width="10%"/>
                </colgroup>
                <thead>
                  <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>수정일</th>
                    <th>조회</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listPost != null) {
                    for (int i = 0; i < listPost.size(); i++) {
                        BoardPostModel post = listPost.get(i);
                %>
                  <tr>
                    <td style="vertical-align: middle;"><%=listPost.size() - i%></td>
                    <td style="vertical-align: middle; text-align: left; cursor: pointer;"
                        onclick="location.href='admin.windy?menu=board_post_modify&postId=<%=post.getPostId()%>'">
                      <%=post.getTitle()%>
                    </td>
                    <td style="vertical-align: middle;"><%=post.getCreatedAt()%></td>
                    <td style="vertical-align: middle;"><%=post.getUpdatedAt()%></td>
                    <td style="vertical-align: middle;"><%=post.getViewCount()%></td>
                    <td style="vertical-align: middle;">
                      <button type="button" class="btn btn-outline-danger btn-sm"
                              onclick="goDelete(<%=post.getPostId()%>)">삭제</button>
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

  <script src="bootstrap_nice/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="bootstrap_nice/assets/js/main.js"></script>
  <script>
  function goDelete(postId) {
    if (!confirm("삭제하시겠습니까?")) return;
    $.ajax({
      type: "POST",
      url: "admin.windy?mode=board_post_delete",
      data: { postId: postId },
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
