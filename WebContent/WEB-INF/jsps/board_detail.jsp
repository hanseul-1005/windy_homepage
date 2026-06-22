<%@page import="windy.homepage.model.BoardModel"%>
<%@page import="windy.homepage.model.BoardPostModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
BoardModel board = (BoardModel) request.getAttribute("board");
BoardPostModel post = (BoardPostModel) request.getAttribute("post");

String boardName = (board != null) ? board.getBoardName() : "게시판";
int boardId = (board != null) ? board.getBoardId() : -1;
String parentMenu = (board != null && "technology".equals(board.getMenuGroup())) ? "Technology" : "About";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 홈페이지</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <link href="bootstrap_windy/assets/img/favicon.png" rel="icon">
  <link href="bootstrap_windy/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="bootstrap_windy/assets/css/main.css" rel="stylesheet">
  <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
  <style>
    .post-header { border-bottom: 2px solid #333; padding-bottom: 16px; margin-bottom: 24px; }
    .post-header h3 { font-weight: 700; margin-bottom: 10px; }
    .post-meta { font-size: 13px; color: #999; }
    .post-meta span + span { margin-left: 16px; }
    .post-content { font-size: 15px; line-height: 1.8; min-height: 200px; }
    .post-content img { max-width: 100%; height: auto; }
    .btn-list { background: #333; color: #fff; padding: 10px 32px; border-radius: 4px; border: none; transition: 0.3s; }
    .btn-list:hover { background: #555; color: #fff; }
  </style>
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0"><%=boardName%></h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy"><%=parentMenu%></a></li>
            <li><a href="main.windy?menu=board&boardId=<%=boardId%>"><%=boardName%></a></li>
            <li class="current">상세보기</li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">
      <div class="container" data-aos="fade-up">

        <%if (post == null || post.getPostId() == -1) {%>
          <div class="text-center py-5"><p>게시글을 찾을 수 없습니다.</p></div>
        <%} else {%>

        <div class="post-header">
          <h3><%=post.getTitle()%></h3>
          <div class="post-meta">
            <span><i class="bi bi-calendar3"></i> <%=post.getCreatedAt() != null && post.getCreatedAt().length() >= 10 ? post.getCreatedAt().substring(0, 10) : ""%></span>
            <span><i class="bi bi-eye"></i> <%=post.getViewCount()%></span>
          </div>
        </div>

        <div class="post-content ql-editor" style="padding: 0;">
          <%=post.getContent()%>
        </div>

        <div class="text-center mt-5">
          <button type="button" class="btn-list" onclick="location.href='main.windy?menu=board&boardId=<%=boardId%>'">목록</button>
        </div>

        <%}%>

      </div>
    </section>

  </main>

  <jsp:include page="main_footer.jsp"/>

  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script src="bootstrap_windy/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_windy/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_windy/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_windy/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="bootstrap_windy/assets/js/main.js"></script>

</body>
</html>
