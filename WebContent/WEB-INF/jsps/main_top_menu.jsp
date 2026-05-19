
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String menu = (String) request.getParameter("menu");

%>
  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="main.windy?menu=home&#hero" class="logo d-flex align-items-center me-auto">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="bootstrap_enno/assets/img/logo.webp" alt=""> -->
        <!-- <h1 class="sitename">WINDY</h1> -->
        <img alt="" src="img/img_logo.png">
      </a>

      <nav id="navmenu" class="navmenu">
      	<ul>
		    <li><a href="main.windy?menu=home&#hero" <%if("home".equals(menu)) { %> class="active" <%} %>>Home</a></li>
		    <li class="dropdown"><a href="main.windy?menu=history_list"><span <%if("history_list".equals(menu) || "certification".equals(menu)) { %> class="active" <%} %>>Company</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      	<ul>
		        	<li><a href="main.windy?menu=history_list"><span <%if("history_list".equals(menu)) { %> class="active" <%} %>>History</span></a></li>
		        	<li><a href="main.windy?menu=certification" ><span <%if("certification".equals(menu)) { %> class="active" <%} %>>Certifications</span></a></li>
		      	</ul>
		    </li>
		    <li class="dropdown"><a href="main.windy?menu=service_info"><span <%if("portfolio_list".equals(menu) || "portfolio_detail".equals(menu) || "service_info".equals(menu) || "product_list".equals(menu)) { %> class="active" <%} %>>Technology</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      <ul>
		        	<li><a href="main.windy?menu=service_info"><span  <%if("service_info".equals(menu)) { %> class="active" <%} %>>Business Field</span></a></li>
		        	<li><a href="main.windy?menu=portfolio_list"><span <%if("portfolio_list".equals(menu) || "portfolio_detail".equals(menu)) { %> class="active" <%} %>>Portfolio</span></a></li>
		        	<li><a href="main.windy?menu=product_list"><span <%if("product_list".equals(menu)) { %> class="active" <%} %>>Product</span></a></li>
		      	</ul>
		    </li>
		    <li class="dropdown"><a href="main.windy?menu=home&#faq-2"><span>About</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      	<ul>
		        	<li><a href="main.windy?menu=home&#faq-2"><span  <%if("notice".equals(menu)) { %> class="active" <%} %>>Notice</span></a></li>
		        	<li><a href="main.windy?menu=home&#contact"><span  <%if("notice".equals(menu)) { %> class="active" <%} %>>Contact Us</span></a></li>
				</ul>
			</li>
		</ul>
        
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

      <a class="btn-getstarted" href="index.html#about">관리자 로그인</a>

    </div>
  </header>
