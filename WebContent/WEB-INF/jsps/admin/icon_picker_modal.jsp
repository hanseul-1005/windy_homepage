<%-- Bootstrap 아이콘 피커 모달 --%>
<%-- business_field_add.jsp / business_field_modify.jsp에서 <jsp:include>로 삽입 --%>
<%-- openIconPicker(): 모달 열기, selectIcon(ic): 선택 → 부모 페이지의 #icon 입력란에 반영 --%>
<%-- ICONS 배열 구조: ['bi-클래스명', '한글명', 'english'] — 세 필드 모두 검색 대상 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Icon Picker Modal -->
<div class="modal fade" id="iconPickerModal" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이콘 선택</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <input type="text" id="iconSearch" class="form-control mb-3" placeholder="검색 (예: 로봇, chart, 사람...)">
        <div id="iconGrid" style="display:grid; grid-template-columns: repeat(auto-fill, minmax(90px,1fr)); gap:8px;"></div>
      </div>
    </div>
  </div>
</div>

<style>
.icon-item {
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  padding: 10px 4px; border: 1px solid #dee2e6; border-radius: 6px;
  cursor: pointer; transition: background .15s;
  font-size: 10px; word-break: break-all; text-align: center; color: #444; line-height: 1.3;
}
.icon-item:hover { background: #e7f1ff; border-color: #86b7fe; }
.icon-item i { font-size: 1.5rem; margin-bottom: 4px; color: #333; }
.icon-item .ko { font-size: 11px; font-weight: 600; color: #222; }
.icon-item .en { font-size: 9px; color: #888; }
.icon-item.selected { background: #0d6efd; border-color: #0d6efd; }
.icon-item.selected i, .icon-item.selected .ko, .icon-item.selected .en { color: #fff; }
</style>

<script>
var ICONS = [
  /* 비즈니스 / 업무 */
  ['bi-briefcase',            '가방',       'briefcase'],
  ['bi-briefcase-fill',       '가방(채움)',  'briefcase'],
  ['bi-building',             '건물',       'building'],
  ['bi-building-fill',        '건물(채움)',  'building'],
  ['bi-bank',                 '은행',       'bank'],
  ['bi-bank2',                '은행2',      'bank'],
  ['bi-graph-up',             '상승 그래프', 'graph'],
  ['bi-graph-up-arrow',       '상승 화살표', 'graph'],
  ['bi-graph-down',           '하락 그래프', 'graph'],
  ['bi-bar-chart',            '막대 차트',  'chart'],
  ['bi-bar-chart-fill',       '막대 차트(채움)', 'chart'],
  ['bi-bar-chart-line',       '꺾은선 차트', 'chart'],
  ['bi-pie-chart',            '원형 차트',  'chart'],
  ['bi-pie-chart-fill',       '원형 차트(채움)', 'chart'],
  ['bi-activity',             '활동',       'activity'],
  ['bi-lightning',            '번개',       'lightning'],
  ['bi-lightning-fill',       '번개(채움)', 'lightning'],
  ['bi-award',                '수상',       'award'],
  ['bi-award-fill',           '수상(채움)', 'award'],
  ['bi-trophy',               '트로피',     'trophy'],
  ['bi-trophy-fill',          '트로피(채움)', 'trophy'],
  ['bi-rocket',               '로켓',       'rocket'],
  ['bi-rocket-fill',          '로켓(채움)', 'rocket'],
  ['bi-bullseye',             '과녁',       'target'],
  ['bi-diagram-3',            '조직도',     'diagram'],
  ['bi-diagram-3-fill',       '조직도(채움)', 'diagram'],
  ['bi-clipboard-data',       '데이터 클립보드', 'clipboard'],
  ['bi-clipboard-data-fill',  '데이터 클립보드(채움)', 'clipboard'],
  ['bi-calculator',           '계산기',     'calculator'],
  ['bi-calculator-fill',      '계산기(채움)', 'calculator'],
  ['bi-currency-dollar',      '달러',       'dollar'],
  ['bi-currency-euro',        '유로',       'euro'],
  ['bi-currency-yen',         '엔',         'yen'],
  ['bi-cash-coin',            '현금',       'cash'],
  /* 기술 / IT */
  ['bi-cpu',                  'CPU',        'cpu'],
  ['bi-cpu-fill',             'CPU(채움)',  'cpu'],
  ['bi-code-slash',           '코드',       'code'],
  ['bi-code-square',          '코드 박스',  'code'],
  ['bi-terminal',             '터미널',     'terminal'],
  ['bi-terminal-fill',        '터미널(채움)', 'terminal'],
  ['bi-laptop',               '노트북',     'laptop'],
  ['bi-laptop-fill',          '노트북(채움)', 'laptop'],
  ['bi-pc-display',           '모니터',     'monitor'],
  ['bi-pc-display-horizontal','모니터 가로', 'monitor'],
  ['bi-server',               '서버',       'server'],
  ['bi-hdd-network',          '네트워크 HDD', 'network'],
  ['bi-hdd-network-fill',     '네트워크 HDD(채움)', 'network'],
  ['bi-cloud',                '클라우드',   'cloud'],
  ['bi-cloud-fill',           '클라우드(채움)', 'cloud'],
  ['bi-cloud-upload',         '클라우드 업로드', 'cloud'],
  ['bi-cloud-download',       '클라우드 다운로드', 'cloud'],
  ['bi-wifi',                 '와이파이',   'wifi'],
  ['bi-router',               '라우터',     'router'],
  ['bi-router-fill',          '라우터(채움)', 'router'],
  ['bi-globe',                '지구본',     'globe'],
  ['bi-globe2',               '지구본2',    'globe'],
  ['bi-phone',                '스마트폰',   'phone'],
  ['bi-phone-fill',           '스마트폰(채움)', 'phone'],
  ['bi-tablet',               '태블릿',     'tablet'],
  ['bi-tablet-fill',          '태블릿(채움)', 'tablet'],
  ['bi-display',              '디스플레이', 'display'],
  ['bi-display-fill',         '디스플레이(채움)', 'display'],
  ['bi-keyboard',             '키보드',     'keyboard'],
  ['bi-mouse',                '마우스',     'mouse'],
  ['bi-printer',              '프린터',     'printer'],
  ['bi-printer-fill',         '프린터(채움)', 'printer'],
  ['bi-gpu-card',             'GPU',        'gpu'],
  /* AI / 데이터 */
  ['bi-robot',                '로봇',       'robot'],
  ['bi-braces',               '중괄호',     'code'],
  ['bi-database',             '데이터베이스', 'database'],
  ['bi-database-fill',        '데이터베이스(채움)', 'database'],
  ['bi-database-add',         'DB 추가',    'database'],
  ['bi-collection',           '컬렉션',     'collection'],
  ['bi-collection-fill',      '컬렉션(채움)', 'collection'],
  ['bi-filter',               '필터',       'filter'],
  ['bi-filter-circle',        '필터 원형',  'filter'],
  ['bi-funnel',               '깔때기',     'funnel'],
  ['bi-funnel-fill',          '깔때기(채움)', 'funnel'],
  ['bi-search',               '검색',       'search'],
  ['bi-binoculars',           '쌍안경',     'binoculars'],
  ['bi-diagram-2',            '다이어그램', 'diagram'],
  ['bi-bezier2',              '베지어 곡선', 'bezier'],
  /* 사람 / 팀 */
  ['bi-person',               '사람',       'person'],
  ['bi-person-fill',          '사람(채움)', 'person'],
  ['bi-people',               '사람들',     'people'],
  ['bi-people-fill',          '사람들(채움)', 'people'],
  ['bi-person-badge',         '사원증',     'badge'],
  ['bi-person-workspace',     '업무 공간',  'workspace'],
  ['bi-person-check',         '확인된 사람', 'person'],
  ['bi-person-gear',          '사용자 설정', 'person'],
  ['bi-headset',              '헤드셋',     'headset'],
  ['bi-person-video',         '화상회의',   'video'],
  ['bi-person-video2',        '화상회의2',  'video'],
  ['bi-person-video3',        '화상회의3',  'video'],
  /* 파일 / 문서 */
  ['bi-file-earmark',         '파일',       'file'],
  ['bi-file-earmark-text',    '텍스트 파일', 'file'],
  ['bi-file-earmark-code',    '코드 파일',  'file'],
  ['bi-file-earmark-bar-graph','차트 파일', 'file'],
  ['bi-file-earmark-check',   '완료 파일',  'file'],
  ['bi-folder',               '폴더',       'folder'],
  ['bi-folder-fill',          '폴더(채움)', 'folder'],
  ['bi-folder2-open',         '열린 폴더',  'folder'],
  ['bi-journal',              '저널',       'journal'],
  ['bi-journal-text',         '문서 저널',  'journal'],
  ['bi-journal-code',         '코드 저널',  'journal'],
  ['bi-journal-check',        '완료 저널',  'journal'],
  ['bi-card-list',            '목록 카드',  'card'],
  ['bi-card-text',            '텍스트 카드', 'card'],
  ['bi-card-checklist',       '체크리스트', 'card'],
  ['bi-stickies',             '메모지',     'sticky'],
  /* 미디어 / 영상 */
  ['bi-camera',               '카메라',     'camera'],
  ['bi-camera-fill',          '카메라(채움)', 'camera'],
  ['bi-camera-video',         '동영상 카메라', 'camera'],
  ['bi-camera-video-fill',    '동영상 카메라(채움)', 'camera'],
  ['bi-film',                 '필름',       'film'],
  ['bi-play-circle',          '재생',       'play'],
  ['bi-play-circle-fill',     '재생(채움)', 'play'],
  ['bi-mic',                  '마이크',     'mic'],
  ['bi-mic-fill',             '마이크(채움)', 'mic'],
  ['bi-image',                '이미지',     'image'],
  ['bi-images',               '이미지 모음', 'images'],
  ['bi-tv',                   'TV',         'tv'],
  ['bi-tv-fill',              'TV(채움)',   'tv'],
  ['bi-youtube',              '유튜브',     'youtube'],
  /* 통신 / 연락 */
  ['bi-chat',                 '채팅',       'chat'],
  ['bi-chat-fill',            '채팅(채움)', 'chat'],
  ['bi-chat-dots',            '말풍선 점',  'chat'],
  ['bi-chat-dots-fill',       '말풍선 점(채움)', 'chat'],
  ['bi-chat-square-text',     '텍스트 말풍선', 'chat'],
  ['bi-envelope',             '이메일',     'email'],
  ['bi-envelope-fill',        '이메일(채움)', 'email'],
  ['bi-telephone',            '전화',       'phone'],
  ['bi-telephone-fill',       '전화(채움)', 'phone'],
  ['bi-send',                 '전송',       'send'],
  ['bi-send-fill',            '전송(채움)', 'send'],
  ['bi-bell',                 '알림',       'bell'],
  ['bi-bell-fill',            '알림(채움)', 'bell'],
  ['bi-megaphone',            '메가폰',     'megaphone'],
  ['bi-megaphone-fill',       '메가폰(채움)', 'megaphone'],
  /* 보안 / 인증 */
  ['bi-shield',               '방패',       'shield'],
  ['bi-shield-fill',          '방패(채움)', 'shield'],
  ['bi-shield-check',         '보안 확인',  'shield'],
  ['bi-shield-lock',          '보안 잠금',  'shield'],
  ['bi-lock',                 '잠금',       'lock'],
  ['bi-lock-fill',            '잠금(채움)', 'lock'],
  ['bi-key',                  '열쇠',       'key'],
  ['bi-key-fill',             '열쇠(채움)', 'key'],
  ['bi-fingerprint',          '지문',       'fingerprint'],
  ['bi-eye',                  '눈',         'eye'],
  ['bi-eye-slash',            '눈 감음',    'eye'],
  /* 위치 / 지도 */
  ['bi-geo-alt',              '위치',       'location'],
  ['bi-geo-alt-fill',         '위치(채움)', 'location'],
  ['bi-map',                  '지도',       'map'],
  ['bi-map-fill',             '지도(채움)', 'map'],
  ['bi-compass',              '나침반',     'compass'],
  ['bi-compass-fill',         '나침반(채움)', 'compass'],
  ['bi-pin-map',              '핀 지도',    'pin'],
  ['bi-pin-map-fill',         '핀 지도(채움)', 'pin'],
  /* 공장 / 제조 */
  ['bi-gear',                 '설정',       'gear'],
  ['bi-gear-fill',            '설정(채움)', 'gear'],
  ['bi-gear-wide',            '설정 넓음',  'gear'],
  ['bi-tools',                '도구',       'tools'],
  ['bi-wrench',               '렌치',       'wrench'],
  ['bi-wrench-adjustable',    '조절 렌치',  'wrench'],
  ['bi-hammer',               '망치',       'hammer'],
  ['bi-screwdriver',          '드라이버',   'screwdriver'],
  ['bi-boxes',                '박스들',     'boxes'],
  ['bi-box-seam',             '박스',       'box'],
  ['bi-truck',                '트럭',       'truck'],
  ['bi-truck-flatbed',        '화물 트럭',  'truck'],
  ['bi-recycle',              '재활용',     'recycle'],
  /* 시간 / 일정 */
  ['bi-clock',                '시계',       'clock'],
  ['bi-clock-fill',           '시계(채움)', 'clock'],
  ['bi-calendar',             '캘린더',     'calendar'],
  ['bi-calendar-fill',        '캘린더(채움)', 'calendar'],
  ['bi-calendar-check',       '일정 확인',  'calendar'],
  ['bi-calendar-event',       '이벤트',     'calendar'],
  ['bi-stopwatch',            '스톱워치',   'stopwatch'],
  ['bi-hourglass',            '모래시계',   'hourglass'],
  ['bi-alarm',                '알람',       'alarm'],
  /* 기타 */
  ['bi-star',                 '별',         'star'],
  ['bi-star-fill',            '별(채움)',   'star'],
  ['bi-heart',                '하트',       'heart'],
  ['bi-heart-fill',           '하트(채움)', 'heart'],
  ['bi-bookmark',             '북마크',     'bookmark'],
  ['bi-bookmark-fill',        '북마크(채움)', 'bookmark'],
  ['bi-check-circle',         '확인 원형',  'check'],
  ['bi-check-circle-fill',    '확인 원형(채움)', 'check'],
  ['bi-info-circle',          '정보',       'info'],
  ['bi-question-circle',      '도움말',     'question'],
  ['bi-lightbulb',            '전구',       'lightbulb'],
  ['bi-lightbulb-fill',       '전구(채움)', 'lightbulb'],
  ['bi-flag',                 '깃발',       'flag'],
  ['bi-flag-fill',            '깃발(채움)', 'flag'],
  ['bi-tag',                  '태그',       'tag'],
  ['bi-tags',                 '태그 모음',  'tags'],
  ['bi-puzzle',               '퍼즐',       'puzzle'],
  ['bi-layers',               '레이어',     'layers'],
  ['bi-stack',                '스택',       'stack'],
  ['bi-grid',                 '그리드',     'grid'],
  ['bi-grid-fill',            '그리드(채움)', 'grid'],
  ['bi-easel',                '이젤',       'easel'],
  ['bi-easel-fill',           '이젤(채움)', 'easel'],
  ['bi-newspaper',            '신문',       'newspaper'],
  ['bi-book',                 '책',         'book'],
  ['bi-book-fill',            '책(채움)',   'book'],
  ['bi-clipboard2-check',     '클립보드 확인', 'clipboard'],
  ['bi-window-stack',         '창 스택',    'window'],
  ['bi-layout-text-window',   '레이아웃',   'layout']
];

/** 아이콘 그리드 렌더링 - filter가 비어있으면 전체 목록, 아니면 클래스/한글/영어 일치 항목만 표시 */
function renderIcons(filter) {
  var grid = document.getElementById('iconGrid');
  var list = filter
    ? ICONS.filter(function(ic) {
        return ic[0].indexOf(filter) >= 0
            || ic[1].indexOf(filter) >= 0
            || ic[2].indexOf(filter) >= 0;
      })
    : ICONS;
  var html = '';
  list.forEach(function(ic) {
    html += '<div class="icon-item" onclick="selectIcon(\'' + ic[0] + '\')" title="' + ic[0] + '">'
          + '<i class="bi ' + ic[0] + '"></i>'
          + '<span class="ko">' + ic[1] + '</span>'
          + '<span class="en">(' + ic[2] + ')</span>'
          + '</div>';
  });
  grid.innerHTML = html || '<p class="text-muted">검색 결과 없음</p>';
}

/** 아이콘 피커 모달 열기 - 검색어 초기화 후 전체 아이콘 표시 */
function openIconPicker() {
  renderIcons('');
  document.getElementById('iconSearch').value = '';
  new bootstrap.Modal(document.getElementById('iconPickerModal')).show();
}

/** 아이콘 선택 - 부모 페이지의 #icon 입력란과 #iconPreview 미리보기 갱신 후 모달 닫기 */
function selectIcon(ic) {
  document.getElementById('icon').value = ic;
  document.getElementById('iconPreview').className = 'bi ' + ic;
  bootstrap.Modal.getInstance(document.getElementById('iconPickerModal')).hide();
}

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('iconSearch').addEventListener('input', function() {
    renderIcons(this.value.trim().toLowerCase());
  });
});
</script>
