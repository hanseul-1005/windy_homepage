<%@page import="windy.homepage.model.BoardModel"%>
<%@page import="windy.homepage.model.BoardPostModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// 본문 HTML에서 첫번째 이미지 src 추출 (갤러리형 썸네일용)
private String extractFirstImage(String html) {
    if (html == null) return null;
    Matcher m = Pattern.compile("<img[^>]+src=[\"']([^\"']+)[\"']").matcher(html);
    return m.find() ? m.group(1) : null;
}
// 본문 HTML에서 태그 제거한 텍스트 미리보기
private String extractText(String html, int maxLen) {
    if (html == null) return "";
    String text = html.replaceAll("<[^>]*>", " ").replaceAll("&nbsp;", " ").replaceAll("\\s+", " ").trim();
    return text.length() > maxLen ? text.substring(0, maxLen) + "..." : text;
}
%>
<%
BoardModel board = (BoardModel) request.getAttribute("board");
List<BoardPostModel> listPost = (List<BoardPostModel>) request.getAttribute("listPost");

String boardName = (board != null) ? board.getBoardName() : "게시판";
boolean isGallery = (board != null) && "gallery".equals(board.getBoardType());
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
  <style>
    /* 갤러리형 */
    .post-card { cursor: pointer; transition: transform 0.2s, box-shadow 0.2s; border: none; border-radius: 10px; overflow: hidden; box-shadow: 0 2px 12px rgba(0,0,0,0.08); }
    .post-card:hover { transform: translateY(-4px); box-shadow: 0 8px 24px rgba(0,0,0,0.14); }
    .post-thumb { width: 100%; height: 200px; object-fit: cover; background: #f0f0f0; }
    .post-thumb-placeholder { width: 100%; height: 200px; background: #f0f0f0; display: flex; align-items: center; justify-content: center; }
    .post-thumb-placeholder i { font-size: 48px; color: #ccc; }
    .post-card .card-body { padding: 16px; }
    .post-card .card-title { font-size: 15px; font-weight: 600; margin-bottom: 8px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    .post-card .card-date { font-size: 13px; color: #999; }
    /* 목록형 */
    .post-table { width: 100%; }
    .post-table th { background: #f8f9fa; font-size: 14px; font-weight: 600; padding: 12px 16px; border-bottom: 2px solid #dee2e6; }
    .post-table td { padding: 14px 16px; font-size: 14px; border-bottom: 1px solid #eee; vertical-align: middle; }
    .post-table tbody tr { cursor: pointer; transition: background 0.15s; }
    .post-table tbody tr:hover { background: #f8f9fa; }
    .post-table .post-title { text-align: left; font-weight: 500; }
    .post-table .text-muted-sm { color: #999; font-size: 13px; }
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
            <li class="current"><%=boardName%></li>
          </ol>
        </nav>
      </div>
    </div>

    <section class="section">

      <div class="container section-title" data-aos="fade-up">
        <span><%=boardName%></span>
        <h2><%=boardName%></h2>
      </div>

      <div class="container" data-aos="fade-up" data-aos-delay="100">
        <%if (listPost == null || listPost.isEmpty()) {%>
          <div class="text-center py-5"><p>등록된 게시글이 없습니다.</p></div>
        <%} else if (isGallery) {%>
          <!-- 갤러리형 -->
          <div class="row g-4">
          <%for (BoardPostModel post : listPost) {
              String thumb = extractFirstImage(post.getContent());
          %>
            <div class="col-lg-4 col-md-6">
              <div class="card post-card" onclick="location.href='main.windy?menu=board_detail&postId=<%=post.getPostId()%>'">
                <%if (thumb != null) {%>
                  <img src="<%=thumb%>" class="post-thumb" alt="<%=post.getTitle()%>" loading="lazy">
                <%} else {%>
                  <div class="post-thumb-placeholder">
                    <i class="bi bi-file-text"></i>
                  </div>
                <%}%>
                <div class="card-body">
                  <div class="card-title"><%=post.getTitle()%></div>
                  <div class="d-flex justify-content-between align-items-center mt-2">
                    <span class="card-date"><%=post.getCreatedAt() != null && post.getCreatedAt().length() >= 10 ? post.getCreatedAt().substring(0, 10) : ""%></span>
                    <span class="card-date"><i class="bi bi-eye"></i> <%=post.getViewCount()%></span>
                  </div>
                </div>
              </div>
            </div>
          <%}%>
          </div>
        <%} else {%>
          <!-- 목록형 -->
          <table class="post-table">
            <colgroup>
              <col width="8%"/>
              <col width="*"/>
              <col width="15%"/>
              <col width="10%"/>
            </colgroup>
            <thead>
              <tr>
                <th>No</th>
                <th>제목</th>
                <th>작성일</th>
                <th>조회</th>
              </tr>
            </thead>
            <tbody>
            <%for (int i = 0; i < listPost.size(); i++) {
                BoardPostModel post = listPost.get(i);
            %>
              <tr onclick="location.href='main.windy?menu=board_detail&postId=<%=post.getPostId()%>'">
                <td class="text-center"><%=listPost.size() - i%></td>
                <td class="post-title"><%=post.getTitle()%></td>
                <td class="text-center text-muted-sm"><%=post.getCreatedAt() != null && post.getCreatedAt().length() >= 10 ? post.getCreatedAt().substring(0, 10) : ""%></td>
                <td class="text-center text-muted-sm"><%=post.getViewCount()%></td>
              </tr>
            <%}%>
            </tbody>
          </table>
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
