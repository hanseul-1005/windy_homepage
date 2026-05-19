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
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link <%if(!"portfolio_list".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=portfolio_list">
          <i class="bi bi-journal-text"></i>
          <span>포트폴리오 관리</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link <%if(!"notice_list".equals(menu) && !"notice_add".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=notice_list">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>공지사항 관리</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link <%if(!"contact_list".equals(menu) && !"contact_detail".equals(menu)) { %> collapsed <%} %>"" href="admin.windy?menu=contact_list">
          <i class="bi bi-envelope"></i>
          <span>Contact Us 관리</span>
        </a>
      </li><!-- End Contact Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->

