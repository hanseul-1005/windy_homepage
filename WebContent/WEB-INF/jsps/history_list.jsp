<%@page import="windy.homepage.model.HistoryModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<HistoryModel> listHistory = (List<HistoryModel>) request.getAttribute("listHistory");
if (listHistory == null) listHistory = new ArrayList<HistoryModel>();

// 연도별로 그룹핑
Map<Integer, List<HistoryModel>> yearMap = new LinkedHashMap<Integer, List<HistoryModel>>();
for (HistoryModel h : listHistory) {
    int year = h.getHistoryYear();
    if (!yearMap.containsKey(year)) {
        yearMap.put(year, new ArrayList<HistoryModel>());
    }
    yearMap.get(year).add(h);
}
Integer[] years = yearMap.keySet().toArray(new Integer[0]);
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
  <link href="bootstrap_enno/assets/img/favicon.png" rel="icon">
  <link href="bootstrap_enno/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="bootstrap_enno/assets/css/main.css" rel="stylesheet">
</head>
<body class="portfolio-details-page">

  <jsp:include page="main_top_menu.jsp"/>

  <main class="main">

    <div class="page-title">
      <div class="container d-lg-flex justify-content-between align-items-center">
        <h1 class="mb-2 mb-lg-0">History</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="main.windy?menu=history_list">Company</a></li>
            <li class="current">History</li>
          </ol>
        </nav>
      </div>
    </div>

    <section id="events" class="events section">

      <div class="container section-title" data-aos="fade-up">
        <span>History</span>
        <h2>History</h2>
      </div>

      <div class="container">

      <%if (listHistory.isEmpty()) {%>
        <div class="text-center py-5"><p>등록된 연혁이 없습니다.</p></div>
      <%} else {%>

        <!-- 연도 탭 -->
        <ul class="nav nav-tabs" role="tablist" data-aos="fade-up" data-aos-delay="100">
        <%for (int i = 0; i < years.length; i++) {%>
          <li class="nav-item" role="presentation">
            <a class="nav-link <%=i == 0 ? "active" : ""%>"
               href="#year-<%=years[i]%>" role="tab" data-bs-toggle="tab"
               aria-selected="<%=i == 0 ? "true" : "false"%>"
               <%=i > 0 ? "tabindex=\"-1\"" : ""%>><%=years[i]%></a>
          </li>
        <%}%>
        </ul>

        <div class="tab-content row justify-content-center" data-aos="fade-up" data-aos-delay="200">
        <%for (int i = 0; i < years.length; i++) {
            int year = years[i];
            List<HistoryModel> items = yearMap.get(year);
        %>
          <div role="tabpanel" class="col-lg-9 tab-pane fade <%=i == 0 ? "active show" : ""%>" id="year-<%=year%>">
          <%for (HistoryModel h : items) {
              String dateLabel = h.getHistoryYear() + "년 " + h.getHistoryMonth() + "월";
              if (h.getHistoryDay() > 0) {
                  dateLabel += " " + h.getHistoryDay() + "일";
              }
          %>
            <div class="row schedule-item">
              <div class="col-md-2"><%=dateLabel%></div>
              <div class="col-md-10">
                <h4><%=h.getContent()%></h4>
              </div>
            </div>
          <%}%>
          </div>
        <%}%>
        </div>

      <%}%>
      </div>

    </section>

  </main>

  <jsp:include page="main_footer.jsp"/>

  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  <div id="preloader"></div>

  <script src="bootstrap_enno/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/php-email-form/validate.js"></script>
  <script src="bootstrap_enno/assets/vendor/aos/aos.js"></script>
  <script src="bootstrap_enno/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="bootstrap_enno/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="bootstrap_enno/assets/js/main.js"></script>

</body>
</html>
