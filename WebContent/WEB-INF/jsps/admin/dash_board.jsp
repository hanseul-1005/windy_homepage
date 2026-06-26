<%@page import="windy.homepage.model.PressModel"%>
<%@page import="windy.homepage.model.ProductModel"%>
<%@page import="windy.homepage.model.PortfolioModel"%>
<%@page import="windy.homepage.model.PortfolioImageModel"%>
<%@page import="windy.homepage.model.NoticeModel"%>
<%@page import="windy.homepage.model.ContactModel"%>
<%@page import="windy.homepage.model.VideoModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<NoticeModel>    listNotice    = (List<NoticeModel>)    request.getAttribute("listNotice");
List<ContactModel>   listContact   = (List<ContactModel>)   request.getAttribute("listContact");
List<PortfolioModel> listPortfolio = (List<PortfolioModel>) request.getAttribute("listPortfolio");
List<ProductModel>   listProduct   = (List<ProductModel>)   request.getAttribute("listProduct");
List<PressModel>     listPress     = (List<PressModel>)     request.getAttribute("listPress");
List<VideoModel>     listVideo     = (List<VideoModel>)     request.getAttribute("listVideo");

int cntPortfolio = (listPortfolio != null) ? listPortfolio.size() : 0;
int cntProduct   = (listProduct   != null) ? listProduct.size()   : 0;
int cntPress     = (listPress     != null) ? listPress.size()     : 0;
int cntNotice    = (listNotice    != null) ? listNotice.size()    : 0;
int cntContact   = (listContact   != null) ? listContact.size()   : 0;
int cntVideo     = (listVideo     != null) ? listVideo.size()     : 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>윈디 관리자 페이지</title>
  <link href="css_main/assets/img/favicon.png" rel="icon">
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="css_admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css_admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="css_admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="css_admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="css_admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link href="css_admin/assets/css/style.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <style>
    .dashboard-count-card { border-left: 4px solid; border-radius: 6px; }
    .dashboard-count-card .card-body { padding: 5px 10px !important; }
    .dashboard-count-card .count-num { font-size: 0.95rem; font-weight: 700; line-height: 1.2; }
    .dashboard-count-card .count-label { font-size: 0.65rem; color: #6c757d; line-height: 1.2; }
    .portfolio-thumb { width: 100%; height: 140px; object-fit: cover; border-radius: 4px 4px 0 0; }
    .portfolio-thumb-placeholder { width: 100%; height: 140px; background: #f0f0f0; display: flex;
      align-items: center; justify-content: center; border-radius: 4px 4px 0 0; color: #aaa; font-size: 2rem; }
    .portfolio-card-title { font-size: 0.9rem; font-weight: 600; white-space: nowrap;
      overflow: hidden; text-overflow: ellipsis; }
    .portfolio-card-summary { font-size: 0.78rem; color: #666; display: -webkit-box;
      -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }
    .section-link { font-size: 0.82rem; float: right; margin-top: -2px; }
    table td, table th { text-align: center; vertical-align: middle; }
    .table td.text-start { text-align: left; }
  </style>
</head>
<body>
  <jsp:include page="top_menu.jsp"/>
  <jsp:include page="side_menu.jsp"/>

  <main id="main" class="main">
    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div>

    <section class="section dashboard">

      <!-- ===== 건수 카드 ===== -->
      <div class="row g-3 mb-4">

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-primary border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-primary" style="font-size:0.95rem;"><i class="bi bi-collection"></i></div>
              <div>
                <div class="count-num text-primary"><%=cntPortfolio%></div>
                <div class="count-label">Portfolio</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-success border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-success" style="font-size:0.95rem;"><i class="bi bi-box-seam"></i></div>
              <div>
                <div class="count-num text-success"><%=cntProduct%></div>
                <div class="count-label">Product</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-warning border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-warning" style="font-size:0.95rem;"><i class="bi bi-newspaper"></i></div>
              <div>
                <div class="count-num text-warning"><%=cntPress%></div>
                <div class="count-label">News</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-info border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-info" style="font-size:0.95rem;"><i class="bi bi-megaphone"></i></div>
              <div>
                <div class="count-num text-info"><%=cntNotice%></div>
                <div class="count-label">Notice</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-danger border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-danger" style="font-size:0.95rem;"><i class="bi bi-youtube"></i></div>
              <div>
                <div class="count-num text-danger"><%=cntVideo%></div>
                <div class="count-label">Video</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl col-md-4 col-6">
          <div class="card dashboard-count-card h-100 border-start border-secondary border-4 shadow-sm">
            <div class="card-body d-flex align-items-center gap-1 py-1">
              <div class="text-secondary" style="font-size:0.95rem;"><i class="bi bi-envelope"></i></div>
              <div>
                <div class="count-num text-secondary"><%=cntContact%></div>
                <div class="count-label">Contact Us</div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- ===== End 건수 카드 ===== -->

      <!-- ===== 포트폴리오 ===== -->
      <div class="row mb-1">
        <div class="col-12">
          <div class="card shadow-sm">
            <div class="card-body">
              <h5 class="card-title">
                Portfolio
                <a href="admin.windy?menu=portfolio_list" class="section-link text-primary">전체보기 →</a>
              </h5>
              <div class="row row-cols-2 row-cols-md-4 row-cols-xl-6 g-2">
              <%
              if (listPortfolio != null && !listPortfolio.isEmpty()) {
                for (PortfolioModel p : listPortfolio) {
                  String firstImg = null;
                  if (p.getImages() != null && !p.getImages().isEmpty()) {
                    firstImg = p.getImages().get(0).getImagePath();
                  }
              %>
                <div class="col">
                  <div class="card h-100 border shadow-none" style="cursor:pointer;"
                       onclick="location.href='admin.windy?menu=portfolio_modify&portfolioId=<%=p.getPortfolioId()%>'">
                    <%if (firstImg != null && !firstImg.isEmpty()) {%>
                      <img src="<%=request.getContextPath()%>/<%=firstImg%>" class="portfolio-thumb" alt="">
                    <%} else {%>
                      <div class="portfolio-thumb-placeholder"><i class="bi bi-image"></i></div>
                    <%}%>
                    <div class="card-body p-2">
                      <div class="portfolio-card-title" title="<%=p.getTitle()%>"><%=p.getTitle()%></div>
                      <div class="mt-1"><span class="badge bg-secondary" style="font-size:0.7rem;"><%=p.getCategory()%></span></div>
                      <%if (p.getSummary() != null && !p.getSummary().isEmpty()) {%>
                      <div class="portfolio-card-summary mt-1"><%=p.getSummary()%></div>
                      <%}%>
                    </div>
                  </div>
                </div>
              <%
                }
              } else {
              %>
                <div class="col-12 text-center text-muted py-4">등록된 포트폴리오가 없습니다.</div>
              <%}%>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ===== End 포트폴리오 ===== -->

      <!-- ===== 공지사항 + Contact Us ===== -->
      <div class="row g-3">

        <!-- 공지사항 -->
        <div class="col-lg-6">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <h5 class="card-title">
                Notice
                <a href="admin.windy?menu=notice_list" class="section-link text-primary">전체보기 →</a>
              </h5>
              <table class="table table-hover table-sm mb-0">
                <colgroup>
                  <col width="8%">
                  <col>
                  <col width="22%">
                </colgroup>
                <thead class="table-light">
                  <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listNotice != null && !listNotice.isEmpty()) {
                  int max = Math.min(5, listNotice.size());
                  for (int i = 0; i < max; i++) {
                    NoticeModel n = listNotice.get(i);
                    String createdDate = (n.getCreatedAt() != null && n.getCreatedAt().length() >= 10)
                                        ? n.getCreatedAt().substring(0, 10) : n.getCreatedAt();
                %>
                  <tr style="cursor:pointer;" onclick="location.href='admin.windy?menu=notice_modify&noticeId=<%=n.getNoticeId()%>'">
                    <td><%=i + 1%></td>
                    <td class="text-start"><%=n.getTitle()%></td>
                    <td><%=createdDate%></td>
                  </tr>
                <%
                  }
                } else {
                %>
                  <tr><td colspan="3" class="text-muted">등록된 공지사항이 없습니다.</td></tr>
                <%}%>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Contact Us -->
        <div class="col-lg-6">
          <div class="card shadow-sm h-100">
            <div class="card-body">
              <h5 class="card-title">
                Contact Us
                <a href="admin.windy?menu=contact_list" class="section-link text-primary">전체보기 →</a>
              </h5>
              <table class="table table-hover table-sm mb-0">
                <colgroup>
                  <col width="8%">
                  <col>
                  <col width="20%">
                  <col width="22%">
                </colgroup>
                <thead class="table-light">
                  <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                <%
                if (listContact != null && !listContact.isEmpty()) {
                  int max = Math.min(5, listContact.size());
                  for (int i = 0; i < max; i++) {
                    ContactModel c = listContact.get(i);
                    String createdDate = (c.getCreatedAt() != null && c.getCreatedAt().length() >= 10)
                                        ? c.getCreatedAt().substring(0, 10) : c.getCreatedAt();
                %>
                  <tr style="cursor:pointer;" onclick="location.href='admin.windy?menu=contact_detail&contactId=<%=c.getContactId()%>'">
                    <td><%=i + 1%></td>
                    <td class="text-start"><%=c.getSubject()%></td>
                    <td><%=c.getName()%></td>
                    <td><%=createdDate%></td>
                  </tr>
                <%
                  }
                } else {
                %>
                  <tr><td colspan="4" class="text-muted">등록된 문의가 없습니다.</td></tr>
                <%}%>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
      <!-- ===== End 공지사항 + Contact Us ===== -->

    </section>
  </main>

  <footer id="footer" class="footer">
    <div class="copyright">&copy; Copyright <strong><span>Windy</span></strong>. All Rights Reserved</div>
  </footer>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <script src="css_admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="css_admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="css_admin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="css_admin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="css_admin/assets/vendor/quill/quill.js"></script>
  <script src="css_admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="css_admin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="css_admin/assets/vendor/php-email-form/validate.js"></script>
  <script src="css_admin/assets/js/main.js"></script>
</body>
</html>
