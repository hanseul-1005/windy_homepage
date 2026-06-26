
<%@page import="windy.homepage.model.BoardModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String menu = (String) request.getParameter("menu");

	// 동적 게시판 메뉴 (Main.java에서 setAttribute)
	List<BoardModel> menuBoards = (List<BoardModel>) request.getAttribute("menuBoards");
	if (menuBoards == null) menuBoards = new ArrayList<BoardModel>();

	List<BoardModel> techBoards  = new ArrayList<BoardModel>();
	List<BoardModel> aboutBoards = new ArrayList<BoardModel>();
	for (BoardModel b : menuBoards) {
	    if ("technology".equals(b.getMenuGroup())) techBoards.add(b);
	    else if ("about".equals(b.getMenuGroup())) aboutBoards.add(b);
	}

	// 현재 보고있는 게시판 ID (active 표시용)
	String curBoardIdParam = request.getParameter("boardId");
	int curBoardId = -1;
	try { if (curBoardIdParam != null) curBoardId = Integer.parseInt(curBoardIdParam); } catch (Exception ignore) {}
	// board_detail 페이지는 boardId 파라미터가 없으므로 attribute에서 조회
	if (curBoardId == -1 && request.getAttribute("board") != null) {
	    curBoardId = ((BoardModel) request.getAttribute("board")).getBoardId();
	}
%>
  <style>
    @media (max-width: 1199px) {
      .mobile-nav-active .navmenu {
        overflow-y: auto !important;
      }
    }
  </style>
  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="main.windy?menu=home&#hero" class="logo d-flex align-items-center me-auto">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="css_main/assets/img/logo.webp" alt=""> -->
        <!-- <h1 class="sitename">WINDY</h1> -->
        <img alt="main.windy?menu=home&#hero" src="img/img_logo.png">
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
		        	<%for (BoardModel b : techBoards) {%>
		        	<li><a href="main.windy?menu=board&boardId=<%=b.getBoardId()%>"><span <%if(("board".equals(menu) || "board_detail".equals(menu)) && curBoardId == b.getBoardId()) { %> class="active" <%} %>><%=b.getBoardName()%></span></a></li>
		        	<%}%>
		      	</ul>
		    </li>
		    <li class="dropdown"><a href="main.windy?menu=home&#faq-2"><span>About</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
		      	<ul>
		        	<li><a href="main.windy?menu=home&#faq-2"><span <%if("notice".equals(menu)) { %> class="active" <%} %>>Notice</span></a></li>
		        	<li><a href="main.windy?menu=press_list"><span <%if("press_list".equals(menu) || "press_detail".equals(menu)) { %> class="active" <%} %>>News</span></a></li>
		        	<li><a href="main.windy?menu=video_list"><span <%if("video_list".equals(menu)) { %> class="active" <%} %>>Video</span></a></li>
		        	<li><a href="main.windy?menu=home&#contact"><span <%if("contact".equals(menu)) { %> class="active" <%} %>>Contact Us</span></a></li>
		        	<%for (BoardModel b : aboutBoards) {%>
		        	<li><a href="main.windy?menu=board&boardId=<%=b.getBoardId()%>"><span <%if(("board".equals(menu) || "board_detail".equals(menu)) && curBoardId == b.getBoardId()) { %> class="active" <%} %>><%=b.getBoardName()%></span></a></li>
		        	<%}%>
				</ul>
			</li>
		</ul>
        
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

      <a class="btn-getstarted" href="login.windy">관리자 로그인</a>

    </div>
  </header>
