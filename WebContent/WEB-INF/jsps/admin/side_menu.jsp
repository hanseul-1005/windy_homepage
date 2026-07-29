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
          <span>Dashboard</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"business_field_list".equals(menu) && !"business_field_add".equals(menu) && !"business_field_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=business_field_list">
          <i class="bi bi-briefcase"></i>
          <span>Business Field</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"history_list".equals(menu) && !"history_add".equals(menu) && !"history_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=history_list">
          <i class="bi bi-clock-history"></i>
          <span>History</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"cert_list".equals(menu) && !"cert_add".equals(menu) && !"cert_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=cert_list">
          <i class="bi bi-file-earmark-text"></i>
          <span>Certifications</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"portfolio_category_list".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=portfolio_category_list">
          <i class="bi bi-tags"></i>
          <span>Portfolio Category</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"portfolio_list".equals(menu) && !"portfolio_add".equals(menu) && !"portfolio_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=portfolio_list">
          <i class="bi bi-journal-text"></i>
          <span>Portfolio</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"product_list".equals(menu) && !"product_add".equals(menu) && !"product_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=product_list">
          <i class="bi bi-box-seam"></i>
          <span>Product</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"press_list".equals(menu) && !"press_add".equals(menu) && !"press_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=press_list">
          <i class="bi bi-newspaper"></i>
          <span>News</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"video_list".equals(menu) && !"video_add".equals(menu) && !"video_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=video_list">
          <i class="bi bi-youtube"></i>
          <span>Video</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"notice_list".equals(menu) && !"notice_add".equals(menu) && !"notice_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=notice_list">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>Notice</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"board_list".equals(menu) && !"board_post_list".equals(menu) && !"board_post_add".equals(menu) && !"board_post_modify".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=board_list">
          <i class="bi bi-table"></i>
          <span>Board</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"popup_list".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=popup_list">
          <i class="bi bi-window-stack"></i>
          <span>Popup</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link <%if(!"contact_list".equals(menu) && !"contact_detail".equals(menu)) { %> collapsed <%} %>" href="admin.windy?menu=contact_list">
          <i class="bi bi-envelope"></i>
          <span>Contact Us</span>
        </a>
      </li>

    </ul>

  </aside><!-- End Sidebar-->
