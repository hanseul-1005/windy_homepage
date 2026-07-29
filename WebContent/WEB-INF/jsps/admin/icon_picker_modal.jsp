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
        <input type="text" id="iconSearch" class="form-control mb-3" placeholder="아이콘 이름 검색 (예: chart, person, file...)">
        <div id="iconGrid" style="display:grid; grid-template-columns: repeat(auto-fill, minmax(80px,1fr)); gap:8px;"></div>
      </div>
    </div>
  </div>
</div>

<style>
.icon-item {
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  padding: 10px 4px; border: 1px solid #dee2e6; border-radius: 6px;
  cursor: pointer; transition: background .15s;
  font-size: 11px; word-break: break-all; text-align: center; color: #444;
}
.icon-item:hover { background: #e7f1ff; border-color: #86b7fe; }
.icon-item i { font-size: 1.5rem; margin-bottom: 4px; color: #333; }
.icon-item.selected { background: #0d6efd; border-color: #0d6efd; color: #fff; }
.icon-item.selected i { color: #fff; }
</style>

<script>
var ICONS = [
  /* 비즈니스 / 업무 */
  'bi-briefcase','bi-briefcase-fill','bi-building','bi-building-fill','bi-bank','bi-bank2',
  'bi-graph-up','bi-graph-up-arrow','bi-graph-down','bi-bar-chart','bi-bar-chart-fill',
  'bi-bar-chart-line','bi-pie-chart','bi-pie-chart-fill','bi-activity','bi-lightning',
  'bi-lightning-fill','bi-award','bi-award-fill','bi-trophy','bi-trophy-fill',
  'bi-rocket','bi-rocket-fill','bi-bullseye','bi-diagram-3','bi-diagram-3-fill',
  'bi-clipboard-data','bi-clipboard-data-fill','bi-calculator','bi-calculator-fill',
  'bi-currency-dollar','bi-currency-euro','bi-currency-yen','bi-cash-coin',
  /* 기술 / IT */
  'bi-cpu','bi-cpu-fill','bi-code-slash','bi-code-square','bi-terminal','bi-terminal-fill',
  'bi-laptop','bi-laptop-fill','bi-pc-display','bi-pc-display-horizontal','bi-server',
  'bi-hdd-network','bi-hdd-network-fill','bi-cloud','bi-cloud-fill','bi-cloud-upload',
  'bi-cloud-download','bi-wifi','bi-router','bi-router-fill','bi-globe','bi-globe2',
  'bi-phone','bi-phone-fill','bi-tablet','bi-tablet-fill','bi-display','bi-display-fill',
  'bi-keyboard','bi-mouse','bi-printer','bi-printer-fill','bi-usb-drive','bi-gpu-card',
  /* AI / 데이터 */
  'bi-robot','bi-braces','bi-braces-asterisk','bi-database','bi-database-fill',
  'bi-database-add','bi-collection','bi-collection-fill','bi-filter','bi-filter-circle',
  'bi-funnel','bi-funnel-fill','bi-search','bi-search-heart','bi-binoculars',
  'bi-diagram-2','bi-diagram-2-fill','bi-share','bi-share-fill','bi-bezier2',
  /* 사람 / 팀 */
  'bi-person','bi-person-fill','bi-people','bi-people-fill','bi-person-badge',
  'bi-person-workspace','bi-person-check','bi-person-gear','bi-headset',
  'bi-person-video','bi-person-video2','bi-person-video3',
  /* 파일 / 문서 */
  'bi-file-earmark','bi-file-earmark-text','bi-file-earmark-code','bi-file-earmark-bar-graph',
  'bi-file-earmark-check','bi-folder','bi-folder-fill','bi-folder2-open',
  'bi-journal','bi-journal-text','bi-journal-code','bi-journal-check',
  'bi-card-list','bi-card-text','bi-card-checklist','bi-stickies',
  /* 미디어 / 영상 */
  'bi-camera','bi-camera-fill','bi-camera-video','bi-camera-video-fill',
  'bi-film','bi-play-circle','bi-play-circle-fill','bi-mic','bi-mic-fill',
  'bi-image','bi-images','bi-tv','bi-tv-fill','bi-youtube',
  /* 통신 / 연락 */
  'bi-chat','bi-chat-fill','bi-chat-dots','bi-chat-dots-fill','bi-chat-square-text',
  'bi-envelope','bi-envelope-fill','bi-envelope-open','bi-telephone','bi-telephone-fill',
  'bi-send','bi-send-fill','bi-bell','bi-bell-fill','bi-megaphone','bi-megaphone-fill',
  /* 보안 / 인증 */
  'bi-shield','bi-shield-fill','bi-shield-check','bi-shield-lock','bi-lock','bi-lock-fill',
  'bi-key','bi-key-fill','bi-fingerprint','bi-eye','bi-eye-slash','bi-incognito',
  /* 위치 / 지도 */
  'bi-geo-alt','bi-geo-alt-fill','bi-map','bi-map-fill','bi-compass','bi-compass-fill',
  'bi-pin-map','bi-pin-map-fill',
  /* 공장 / 제조 */
  'bi-gear','bi-gear-fill','bi-gear-wide','bi-tools','bi-wrench','bi-wrench-adjustable',
  'bi-hammer','bi-screwdriver','bi-bezier','bi-boxes','bi-box-seam','bi-box2',
  'bi-truck','bi-truck-flatbed','bi-plugin','bi-recycle','bi-recycle',
  /* 시간 / 일정 */
  'bi-clock','bi-clock-fill','bi-calendar','bi-calendar-fill','bi-calendar-check',
  'bi-calendar-event','bi-stopwatch','bi-hourglass','bi-alarm',
  /* 별 / 하트 / 기타 */
  'bi-star','bi-star-fill','bi-heart','bi-heart-fill','bi-bookmark','bi-bookmark-fill',
  'bi-check-circle','bi-check-circle-fill','bi-info-circle','bi-question-circle',
  'bi-lightbulb','bi-lightbulb-fill','bi-flag','bi-flag-fill','bi-tag','bi-tags',
  'bi-puzzle','bi-layers','bi-stack','bi-grid','bi-grid-fill','bi-easel','bi-easel-fill',
  'bi-newspaper','bi-book','bi-book-fill','bi-bookmark-star','bi-clipboard2-check',
  'bi-window-stack','bi-layout-text-window','bi-window-sidebar'
];

function renderIcons(filter) {
  var grid = document.getElementById('iconGrid');
  var list = filter ? ICONS.filter(function(ic){ return ic.indexOf(filter) >= 0; }) : ICONS;
  var html = '';
  list.forEach(function(ic) {
    html += '<div class="icon-item" onclick="selectIcon(\'' + ic + '\')" title="' + ic + '">'
          + '<i class="bi ' + ic + '"></i>'
          + '<span>' + ic.replace('bi-','') + '</span>'
          + '</div>';
  });
  grid.innerHTML = html || '<p class="text-muted">검색 결과 없음</p>';
}

function openIconPicker() {
  renderIcons('');
  document.getElementById('iconSearch').value = '';
  new bootstrap.Modal(document.getElementById('iconPickerModal')).show();
}

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
