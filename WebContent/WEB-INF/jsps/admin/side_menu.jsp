<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String menu = (String) request.getParameter("menu");
%>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link <%if(!"main".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=main">
          <i class="bi bi-grid"></i>
          <span>대시보드</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"history_list".equals(menu) && !"history_add".equals(menu) && !"history_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=history_list">
          <i class="bi bi-clock-history"></i>
          <span>연혁 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"cert_list".equals(menu) && !"cert_add".equals(menu) && !"cert_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=cert_list">
          <i class="bi bi-file-earmark-text"></i>
          <span>인증서/문서 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"product_list".equals(menu) && !"product_add".equals(menu) && !"product_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=product_list">
          <i class="bi bi-box-seam"></i>
          <span>프로덕트 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"portfolio_list".equals(menu) && !"portfolio_add".equals(menu) && !"portfolio_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=portfolio_list">
          <i class="bi bi-journal-text"></i>
          <span>포트폴리오 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"press_list".equals(menu) && !"press_add".equals(menu) && !"press_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=press_list">
          <i class="bi bi-newspaper"></i>
          <span>언론보도 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"notice_list".equals(menu) && !"notice_add".equals(menu) && !"notice_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=notice_list">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>공지사항 관리</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"contact_list".equals(menu) && !"contact_detail".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=contact_list">
          <i class="bi bi-envelope"></i>
          <span>Contact Us 관리</span>
        </a>
      </li>

    </ul>

  </aside><!-- End Sidebar-->
