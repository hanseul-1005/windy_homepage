

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Main
 */
@WebServlet(name = "Main", urlPatterns = { "/main.windy" })
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		String menu = request.getParameter("menu");
		
		System.out.println("menu : "+menu);
		if(menu==null) menu = "home";
		
		if("home".equals(menu)) {

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/main.jsp");
			dispatcher.forward(request, response);
		}
		else if("history_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/history_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("service_info".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/service_info.jsp");
			dispatcher.forward(request, response);
		}
		else if("certification".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/certification_info.jsp");
			dispatcher.forward(request, response);
		}
		else if("product_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/product_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("portfolio_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("portfolio_detail".equals(menu)) {
			
			String strNum = request.getParameter("num");
			
			if(strNum == null) strNum = "1";
			
			int num = Integer.parseInt(strNum);
			
			String title = "", sub = "", contents = "", img1 = "", img2 = "";
			
			if(num==1) {
				title = "객체 추적 기반 지능형 교통 시스템";
				sub = "<li><strong>GUI</strong>: tkinter 활용, 사용자 친화적 인터페이스</li>\r\n"
						+ "<li><strong>설정옵션</strong>: ROI 설정, 방향 감지 기능 제공</li>\r\n<li><strong>특화기능</strong>: 교차로 상황에 맞춘 정확한 위험 상황 감지</li>\r\n"
						+ "<li><strong>객체 인식 정확도</strong>: mAP@0.5 기준 0.994</li>\r\n"
						+ "<li><strong>실시간 처리 속도</strong>: 초당 30.01 프레임(FPS)</li>\r\n"
						+ "<li><strong>모델 크기</strong>: 5.78MB, 경량화된 모델</li>";
				contents = "다양한 차량, 보행자, 이륜차 등의 객체를 인식하고 분석하는 인공지능 기반 지능형 교통 관리 솔루션입니다. 인공지능 기반 객체 인식 기술을 적용하여 실시간 교통 상황을 정확하고 빠르게 분석할 수 있으며, "
						+ "관심영역 내 객체 크기 비교를 통해 무단 침입, 역주행, 정지 차량 사고 여부 등을 자동 감지할 수 있습니다. 뛰어난 객체 인식 성능과 빠른 처리 속도를 갖춘 "
						+ "이 시스템은 스마트시티, 교통 안전, 산업 현장 등 다양한 분야에서 효율적이고 혁신적인 관제 및 사고 예방 솔루션을 제공합니다​.";
				img1 = "ai";
				img2 = "ai1.png";
			}
			else if(num==2) {
				title = "멀티 바코드 인식 시스템";
				sub = "<li><strong>다중 바코드 동시 인식</strong>: 하나의 화면 이미지에서 여러 바코드를 자동 감지 및 판독</li>\r\n"
						+"<li><strong>다양한 바코드 포맷 지원</strong>: QR코드, 1D 2D 바코드, PDF417, DataMatrix 등 지원</li>\r\n"
						+"<li><strong>빠른 처리 속도</strong>: 실시간 인식 및 데이터 전송으로 생산성과 작업 속도 향상</li>\r\n"
						+"<li><strong>사용자 친화적 인터페이스</strong>: 별도의 복잡한 조작 없이 자동 인식 및 결과 확인 가능</li>\r\n";
				contents = "멀티 바코드 인식 시스템은 한 번의 스캔으로 인공지능 기반 객체 인식 알고리즘을 이용하여 여러 개의 바코드를 동시에 인식하고 처리할 수 있는 "
						+ "고성능 솔루션입니다. 다양한 크기와 종류의 바코드를 빠르고 정확하게 인식하여, 물류, 제조, 유통 등 다양한 산업 현장의 작업 효율을 극대화합니다.";
				img1 = "ai";
				img2 = "ai2.png";
			}
			else if(num==3) {
				title = "지능형 독거 노인 케어 시스템";
				sub = "<li>IoT 기반 스마트 약 디스펜서와 라즈베리 파이를 일원화하여 낙상 관리 및 약 복용, 낙상에 대한 신속 응급 대응이 가능한 시스템</li>";
			}
			else if(num==4) {
				title = "지하차도 침수 예측용 인공지능 모델 개발을 위한 데이터 취득 시스템 구축";
				sub = "<li>실시간 침수 상황 모니터링: 지하차도 및 주변 지역의 침수 여부를 실시간으로 감시</li>\r\n"
						+ "<li><strong>다양한 센서 데이터 통합</strong>: 비접촉식 영상 데이터와 수위 센서 데이터의 복합 수집 및 연계 분석</li>\r\n"
						+ "<li><strong>GIS 기반 위험 지역 모니터링</strong>: 지하차도와 인근 위험지역을 지도 기반으로 동시 모니터링</li>\r\n"
						+ "<li><strong>AI 학습용 데이터 구축</strong>: 인공지능 모델 학습을 위한 고품질 데이터 수집 및 가공</li>\r\n"
						+ "<li><strong>선제적 대응 지원</strong>: 수집된 데이터를 기반으로 침수 위험 상황에 대한 조기 경보 및 대응 지원</li>";
				contents = "지하차도 침수 예측용 데이터 취득 시스템은 새로운 기후 변화에 대응하기 위해, 지하차도 및 주변 위험지역의 침수 위험 상황을 실시간으로 "
						+ "모니터링하고 데이터를 수집하는 솔루션입니다. 비접촉식 영상 데이터와 수위 센서 데이터를 결합하여 안정적이고 정확한 로컬 센서 네트워크를 구성하고, "
						+ "GIS 기반 공간 정보를 통해 선제적 침수 예측 모델 개발을 지원합니다. 또한, 이런 데이터를 데이터베이스에 전송함으로써, 관제 모니터링 시스템을 운영합니다.";
				img1 = "data";
				img2 = "data1_1.png";
			}
			else if(num==5) {
				title = "생산이력 관리 시스템";
				sub = "<li><strong>QR코드 생성 및 출력</strong>: 제품별 고유 QR코드를 자동 생성하여 실시간 출력</li>\r\n"
						+ "<li><strong>실시간 바코드 스캔 및 등록</strong>: 생산 공정 중 바코드를 즉시 스캔하여 데이터 기록</li>\r\n"
						+ "<li><strong>생산이력 데이터 관리</strong>: SQL 서버에 생산, 검사, 출하 이력을 체계적으로 저장</li>\r\n"
						+ "<li><strong>MES 시스템 연동</strong>: 생산 현장의 작업 지시, 공정 관리, 품질 관리 데이터를 MES와 실시간으로 연계하여 생산 흐름을 통합 관리</li>\r\n"
						+ "<li><strong>검색 및 이력 조회 기능</strong>: 제품별 생산·검사·출하 이력 빠른 조회 가능</li>\r\n"
						+ "<li><strong>다양한 분석 리포트 제공</strong>: 생산성, 품질 관리 지표를 시각화된 리포트로 제공</li>";
				contents = "본 시스템은 생산라인에서 생성되는 각 제품의 정보를 데이터베이스로 관리하여, 제조부터 출하까지의 모든 이력을 체계적으로 추적·관리할 수 있도록 지원하는 솔루션입니다. "
						+ "바코드 프린터, 리더기, 전용 프로그램, SQL 서버를 연동하여 현장 실시간 데이터 수집과 중앙 데이터베이스 기록을 자동화하며 이에 대한 정보를 QR 코드로 출력함으로써 관련 데이터를 표출합니다.";
				img1 = "data";
				img2 = "data2_2.png";
				
			}
			else if(num==6) {
				title = "긴급 재난 대응 ICT융합 스마트 야전병원 플랫폼 개발";
				sub = "<li><strong>차량 운영 상태 모니터링</strong>: 연료, 전력, 수질, 폐수, 압력 상태 등 실시간 점검</li>\r\n"
						+"<li><strong>의료 구역 환경 데이터 관리</strong>: X-ray실, PCR실, ENT실 등 각 구역별 온도, 습도, 상태 정보 모니터링</li>\r\n"
						+"<li><strong>병원 및 병리 데이터 통합 관리</strong>: 환자 정보, 병원 운영 데이터, 검사 결과 등을 통합 관리</li>\r\n"
						+"<li><strong>웹 기반 실시간 관제 시스템</strong>: 별도 설치 없이 웹페이지를 통해 어디서든 실시간 모니터링 가능</li>\r\n"
						+"<li><strong>이상 감지 및 알림 기능</strong>: 주요 수치 이상 발생 시 자동 경고 및 알림 제공</li>";
				contents = "의료 차량 정보 관리 시스템은 차량, 병원, 병리 정보 등 다양한 의료 관련 데이터를 통합하여 실시간으로 관리하고 "
						+ "모니터링할 수 있는 솔루션입니다. 특히 확장형 병원 차량과 같은 특수 목적 차량의 주요 상태, 탑재 장비, 환자 환경 데이터를 웹 기반으로 연동하여 운영 효율성과 안전성을 극대화합니다.";
				img1 = "monitoring";
				img2 = "monitoring3.png";
			}
			else if(num==7) {
				title = "머신비전 기반 치수 검사 시스템";
				sub = "<li><strong>정밀 치수 측정</strong>: 외경, 내경, 길이, 간격 등 다양한 치수 항목에 대해 마이크로미터 단위 측정 가능</li>\r\n"
						+"<li><strong>WPF 기반 직관적 UI 제공</strong>: 비전 검사 결과를 실시간으로 표시하고, 사용자 친화적인 조작 환경 제공</li>\r\n"
						+"<li>멀티 라이브러리 지원: OpenCV 및 Cognex VisionPro 연동으로 다양한 검사 알고리즘 적용 가능</li>\r\n"
						+"<li>자동화 검사 및 결과 저장: 검사 결과를 자동 저장하고, 불량 제품 식별 및 리포트 생성 기능 지원</li>\r\n"
						+"<li>고속 처리 및 다중 검사 가능: 생산라인 속도에 맞춘 빠른 검사 처리와 동시에 여러 부위 검사 지원</li>\r\n"
						+"<li>사용자 설정 검사 영역: 다양한 제품에 맞게 치수 측정 영역 및 기준을 자유롭게 설정 가능</li>\r\n";
				contents = "머신비전 기반 치수 검사 시스템은 고성능 카메라와 딥러닝 기반 영상 처리 기술을 활용하여 제품의 치수를 자동으로 측정하고 검증하는 솔루션입니다. "
						+ "WPF 기반으로 개발되어 직관적인 사용자 인터페이스를 제공하며, 필요에 따라 OpenCV 또는 Cognex사의 VisionPro 라이브러리를 적용하여 다양한 제품 형상과 치수에 대해 고정밀 검사를 지원합니다.";
				img1 = "vision";
				img2 = "vision1.png";
			}
			else if(num==8) {
				title = "지하차도 주변 위험지역 침수 상황 모니터링 시스템";
				sub = "<li>GIS기반 지하차도 주변 위험지역도 동시 모니터링을 통한 선제적 침수 상황 모니터링 시스템 구축</li>";
			}
			else if(num==9) {
				title = "LTE Cat.M1 기반 데이터 획득 시스템";
				sub = "<li>센서 데이터 실시간 수집: 다양한 센서에서 획득한 정보를 지속적으로 모니터링</li>\r\n"
						+ "<li>LTE Cat.M1 기반 무선 데이터 전송: 설치 장소에 제약 없이 안정적인 데이터 통신 가능</li>\r\n"
						+ "<li>데이터베이스 기반 데이터 저장: 장기 데이터 보관 및 분석을 위한 안정적 데이터베이스 구축</li>\r\n"
						+ "<li>웹 기반 대시보드 제공: 직관적인 웹 모니터링 화면 제공</li>\r\n"
						+ "<li>상태 알림 및 경고 시스템: 획득한 데이터를 기반으로 이상상황 발생 시 실시간 알림 제공</li>\r\n"
						+ "<li>이력 관리 및 데이터 분석 지원: 일별, 주별, 월별 센서 상태 이력 조회 및 분석 기능</li>\r\n";
				contents = "LTE Cat.M1기반 데이터 획득 시스템은 전국 어디서나 설치된 장비로부터 데이터를 실시간으로 수집하고, "
						+ "웹페이지를 통해 모니터링할 수 있는 통합 관제 솔루션입니다. 산업 현장, 공공장소 등 다양한 환경에서 BMS(Battery Management System), 미세먼지 센서, 이산화탄소 센서 등의 정보를 실시간 획득 가능합니다.";
				img1 = "monitoring";
				img2 = "monitoring2.png";
			}
			request.setAttribute("title", title);
			request.setAttribute("sub", sub);
			request.setAttribute("contents", contents);
			request.setAttribute("img1", img1);
			request.setAttribute("img2", img2);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_detail.jsp");
			dispatcher.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
