<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
  <meta charset="UTF-8" />
  <title>전시 게시물 관리</title>
=======
    <meta charset="UTF-8" />
    <title>전시 게시물 관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<style>
/* 기본 초기화 */
	* { margin: 0; padding: 0; box-sizing: border-box; }
	body { font-family: 'Pretendard', sans-serif; background-color: #f3f5f9; color: #333; }


/* 레이아웃 구성 */
.admin-layout {
    display: flex;
    min-height: 100vh;
}

/* 사이드바 전체 컨테이너 */
.sidebar {
    width: 260px;
    background-color: #1a1f33; /* 다크 네이비 */
    color: #ffffff;
    display: flex;
    flex-direction: column;
    height: 100vh;
    position: sticky;
    top: 0;
}

/* 로고 영역 */
.sidebar-top {
     padding: 40px 25px; 
}

.logo {
     font-size: 20px; font-weight: 800; color: #5d5dff; 
}

.subtitle {
    font-size: 10px; opacity: 0.6; letter-spacing: 1px; margin-top: 5px;
}

/* 메뉴 영역 */
.sidebar-menu {
     flex: 1; padding: 0 15px; 
}

.sidebar-menu ul {
    list-style: none;
}

.sidebar-menu li {
     margin-bottom: 5px; 
}

.sidebar-menu li a {
    display: flex;
	    align-items: center;
	    padding: 12px 15px;
	    color: #8a94ad;
	    text-decoration: none;
	    border-radius: 8px;
	    transition: 0.3s;
	    font-size: 15px;
}

/* 마우스 올렸을 때 */
.sidebar-menu li a:hover {
    background-color: rgba(255, 255, 255, 0.1);
}
.title-link {
    color: inherit;
    text-decoration: none;
}

.title-link:hover .title {
    text-decoration: underline;
}

/* 활성화된 메뉴 (콘텐츠 관리) */
.sidebar-menu li.active a {
     background-color: #4d4dff; color: white; 
}

.sidebar-menu .icon {
    margin-right: 12px;
    font-size: 18px;
}
.material-symbols-outlined { margin-right: 12px; font-size: 20px; }

/* 하단 관리자 정보 */
.sidebar-bottom {
    padding: 20px;
}

.admin-info {
    background: rgba(255,255,255,0.05); padding: 15px; border-radius: 12px; 
}

.admin-info .role {
    font-size: 11px;
    color: #8a94ad;
    margin-bottom: 4px;
}

.admin-info .name {
     display: block; font-size: 13px; color: #fff; margin-bottom: 3px; 
}

/* 메인 콘텐츠 영역 */
.main-content {
    flex: 1;
    padding: 40px;
    background-color: #f8f9fa;
}

/* 헤더 영역 */
.page-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 30px;
}

.page-title h2 {
    font-size: 24px;
    font-weight: 700;
    margin-bottom: 8px;
}

.page-title p {
    color: #888;
    font-size: 14px;
}

.btn-primary {
    background-color: #4d4dff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s;
}

.btn-primary:hover {
    background-color: #3b3bff;
}

/* 필터 & 검색바 */
.filter-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #fff;
    padding: 15px 25px;
    border-radius: 12px 12px 0 0;
    border: 1px solid #eee;
    border-bottom: none;
}
.search-box {
	    display: flex; align-items: center; background: #f5f6f8;
	    padding: 10px 15px; border-radius: 10px; width: 320px;
	}

.search-box input {
    border: none; background: transparent; outline: none;
	    margin-left: 10px; width: 100%; font-size: 14px;
}

.filter-btn {
    background: none;
    border: none;
    padding: 8px 16px;
    margin-left: 5px;
    color: #888;
    cursor: pointer;
    border-radius: 6px;
    font-size: 14px;
}

.filter-btn.active {
    background-color: #1a1f33;
    color: #fff;
}

/* 리스트 섹션 */
.content-list {
    background: #fff;
    border: 1px solid #eee;
    border-radius: 0 0 12px 12px;
    overflow: hidden;
}

/* 리스트 헤더 */
.list-header {
    display: flex;
    padding: 15px 25px;
    background-color: #fafafa;
    border-bottom: 1px solid #eee;
    color: #888;
    font-size: 13px;
    font-weight: 600;
}

/* 리스트 로우(Row) */
.content-row {
    display: flex;
    align-items: center;
    padding: 20px 25px;
    border-bottom: 1px solid #f1f1f1;
    transition: background 0.2s;
}

.content-row:hover {
    background-color: #fcfcfc;
}

/* 컬럼 너비 설정 (flex 비율) */
.col-info { flex: 4; display: flex; align-items: center; }
.col-period { flex: 3; color: #666; font-size: 14px; }
.col-status { flex: 2; text-align: center; }
.col-manage { flex: 1; text-align: right; }

/* 전시 정보 셀 내부 */
.thumb {
    width: 60px;
    height: 60px;
    border-radius: 8px;
    object-fit: cover;
    margin-right: 15px;
    background-color: #eee;
}

.text .title {
    font-weight: 700;
    font-size: 16px;
    margin-bottom: 4px;
}

.text .location {
    color: #888;
    font-size: 13px;
}

/* 상태 뱃지 스타일 */
.col-status span, /* 직접 텍스트인 경우 */
.status-badge {
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    display: inline-block;
}

.STATUS_OPEN { 
    background: #eef2ff; 
    color: #4d4dff; 
    border: 1px solid #dadaff;
}

.STATUS_REQUESTED { 
    background: #fff8e6; 
    color: #ffa000; 
    border: 1px solid #ffeeba;
}

.STATUS_REJECTED { 
    background: #fff1f0; 
    color: #ff4d4f; 
    border: 1px solid #ffccc7;
}

.STATUS_SCHEDULED { 
    background: #e6fffa; 
    color: #00b5ad; 
    border: 1px solid #b2f5ea;
}

.STATUS_CLOSED { 
    background: #f5f5f5; 
    color: #8c8c8c; 
    border: 1px solid #d9d9d9;
}

/* 관리하기 링크 버튼 */
.col-manage a {
    color: #888;
    text-decoration: none;
    font-size: 14px;
    border: 1px solid #eee;
    padding: 6px 12px;
    border-radius: 6px;
    transition: all 0.2s;
}

.col-manage a:hover {
    background-color: #f0f0f0;
    color: #333;
}

/* 데이터 없음/로딩중 */
.empty, .loading {
    padding: 50px;
    text-align: center;
    color: #bbb;
}
</style>    
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
</head>
<body>

<div class="admin-layout">

  <!-- ================= 사이드바 ================= -->
  <aside class="sidebar">
    <div class="sidebar-top">
      <h1 class="logo">ExhibiReserve</h1>
      <p class="subtitle">VENDOR MANAGEMENT</p>
    </div>

    <nav class="sidebar-menu">
<<<<<<< HEAD
      <ul>
        <li>
          <a href="#">대시보드</a>
        </li>
        <li class="active">
          <a href="#">콘텐츠 관리</a>
        </li>
        <li>
          <a href="#">정산 내역</a>
        </li>
      </ul>
=======
        <ul>
            <li class="active"><a href="#"><span class="material-symbols-outlined">description</span> 콘텐츠 관리</a></li>
            <li><a href="${ctx}/vendor/reserve_pay_manage"><span class="material-symbols-outlined">person</span> 예약 관리</a></li>
            <li><a href="${ctx}/reply/index"><span class="material-symbols-outlined">support_agent</span> 관리자 문의하기</a></li>
        </ul>
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
    </nav>

    <div class="sidebar-bottom">
      <div class="admin-info">
        <span class="role">Signed in as</span>
        <strong class="name">상수전시관 관리자</strong>
      </div>
    </div>
  </aside>


  <!-- ================= 메인 콘텐츠 ================= -->
  <main class="main-content">

    <!-- 상단 헤더 -->
    <div class="page-header">
      <div class="page-title">
        <h2>전시 게시물 관리</h2>
        <p>등록하신 전시의 상태를 확인하고 관리하세요.</p>
      </div>

      <div class="page-actions">
        <button class="btn-primary">+ 게시글 등록하기</button>
      </div>
    </div>

    <!-- 필터 & 검색 -->
    <div class="filter-bar">

      <div class="search-box">
        <input type="text" placeholder="전시 명으로 검색..." />
      </div>

      <div class="filter-buttons">
        <button class="active">전체</button>
        <button>승인대기</button>
        <button>승인</button>
        <button>거절</button>
        <button>오픈예정</button>
        <button>현재진행중</button>
        <button>종료</button>
        <button>활성화</button>
        <button>비활성화</button>
      </div>

    </div>

    <!-- ================= 전시 리스트 ================= -->
    <section class="exhibit-list">

      <!-- 리스트 헤더 -->
      <div class="list-header">
        <span class="col-info">전시 정보</span>
        <span class="col-period">기간</span>
        <span class="col-status">상태</span>
        <span class="col-manage">관리</span>
      </div>

      <!-- 리스트 아이템 -->
      <ul class="list-body">

        <!-- item 1: 현재진행중 -->
        <li class="list-item">
          <div class="exhibit-info">
            <img src="#" alt="전시 이미지" class="thumb" />
            <div class="text">
              <strong class="title">서울 미디어아트 판타지아</strong>
              <p class="place">서울숲 갤러리 1관</p>
            </div>
<<<<<<< HEAD
          </div>

          <div class="exhibit-period">
            2024-05-01 ~ 2024-08-31
          </div>

          <div class="exhibit-status">
            <span class="status ongoing">현재진행중</span>
          </div>

          <div class="exhibit-manage">
            <!-- 현재진행중 상태는 관리하기 버튼 없음 -->
          </div>
        </li>

        <!-- item 2: 승인대기 -->
        <li class="list-item">
          <div class="exhibit-info">
            <img src="#" alt="전시 이미지" class="thumb" />
            <div class="text">
              <strong class="title">근현대 미술의 발자취</strong>
              <p class="place">동대문 디자인 플라자(DDP)</p>
=======
            <div class="contentList" id="contentList">
                <div class="loading">데이터를 불러오는 중입니다...
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
            </div>
          </div>

          <div class="exhibit-period">
            2024-06-15 ~ 2024-07-15
          </div>

          <div class="exhibit-status">
            <span class="status pending">승인대기</span>
          </div>

          <div class="exhibit-manage">
            <!-- 승인대기 상태는 관리하기 버튼 없음 -->
          </div>
        </li>

        <!-- item 3: 거절 (관리하기 버튼 표시) -->
        <li class="list-item">
          <div class="exhibit-info">
            <img src="#" alt="전시 이미지" class="thumb" />
            <div class="text">
              <strong class="title">디지털 네이처: 숨쉬는 숲</strong>
              <p class="place">제주 누아 아트홀</p>
            </div>
          </div>

          <div class="exhibit-period">
            2024-03-01 ~ 2024-04-30
          </div>

          <div class="exhibit-status">
            <span class="status reject">거절</span>
          </div>

          <div class="exhibit-manage">
            <a href="content/edit?id=3">수정하기</a>
          </div>
        </li>

        <!-- item 4: 오픈예정 -->
        <li class="list-item">
          <div class="exhibit-info">
            <img src="#" alt="전시 이미지" class="thumb" />
            <div class="text">
              <strong class="title">빛의 예술: 이머시브 전시</strong>
              <p class="place">코엑스 전시홀</p>
            </div>
          </div>

          <div class="exhibit-period">
            2024-09-01 ~ 2024-12-31
          </div>

          <div class="exhibit-status">
            <span class="status upcoming">오픈예정</span>
          </div>

          <div class="exhibit-manage">
            <!-- 오픈예정 상태는 관리하기 버튼 없음 -->
          </div>
        </li>

        <!-- item 5: 종료 -->
        <li class="list-item">
          <div class="exhibit-info">
            <img src="#" alt="전시 이미지" class="thumb" />
            <div class="text">
              <strong class="title">봄의 정원 특별전</strong>
              <p class="place">국립현대미술관</p>
            </div>
          </div>

          <div class="exhibit-period">
            2024-01-01 ~ 2024-02-28
          </div>

          <div class="exhibit-status">
            <span class="status ended">종료</span>
          </div>

          <div class="exhibit-manage">
            <!-- 종료 상태는 관리하기 버튼 없음 -->
          </div>
        </li>

      </ul>
      
    </section>
  </main>
</div>

</body>
<<<<<<< HEAD
=======

<script>
const ctx = '${pageContext.request.contextPath}';

const STATUS_MAP = {
	    STATUS_REQUESTED: { text: '승인요청', className: 'STATUS_REQUESTED' },
	    STATUS_REJECTED:  { text: '거절',     className: 'STATUS_REJECTED' },
	    STATUS_SCHEDULED: { text: '오픈예정', className: 'STATUS_SCHEDULED' },
	    STATUS_OPEN:      { text: '진행중',   className: 'STATUS_OPEN' },
	    STATUS_CLOSED:    { text: '종료',     className: 'STATUS_CLOSED' }
	};


$(function () {
    loadContentList(); // 최초 전체 목록
});

function loadContentList() {
	const keyword = $('#searchInput').val();
	const status = $('.filter-btn.active').data('status');
	
	$.ajax({
		url: ctx +'/vendor/content_manage/list',
		type:'get',
		data: {
			keyword: keyword,
			status: status
		},
		success: function(res){
			console.log(res);
		    console.log(res.list);
			renderList(res.list);
		},
        error: function () {
            alert('목록을 불러오지 못했습니다.');
        }
	});
}
//필터 클릭 시
$('.filter-btn').on('click', function() {
	$('.filter-btn').removeClass('active');
	$(this).addClass('active');
	loadContentList();
});

//검색 서치 시
$('#searchInput').on('keyup', function(e){
	if(e.key ==='Enter'){
		loadContentList();
	}
});

function formatDate(dateStr) {
    if (!dateStr) return '';
    return dateStr.split(' ')[0]; // yyyy-MM-dd
}

function renderList(list) {
    const $list = $('#contentList');
    $list.empty();

    if (list.length === 0) {
        $list.append('<div class="empty">검색 결과가 없습니다.</div>');
        return;
    }

    list.forEach(item => {
        const statusInfo = STATUS_MAP[item.content_status] 
            || { text: item.content_status, className: '' };

        $list.append(
            '<div class="content-row">' +

                '<div class="col-info">' +
                    '<img src="' + ctx + item.main_image_path + '" class="thumb">' +
                    '<div class="text">' +
                    '<a href="' + ctx + '/detail/' + item.content_id + '" class="title-link">' +
		                '<span class="title" style="font-weight:600;">' + item.title + '</span>' +
		            '</a>' +
                        '<div class="location">' + item.location + '</div>' +
                    '</div>' +
                '</div>' +

                '<div class="col-period">' +
                    formatDate(item.start_at) + ' ~ ' + formatDate(item.end_at) +
                '</div>' +

                '<div class="col-status">' +
                    '<span class="' + statusInfo.className + '">' +
                        statusInfo.text +
                    '</span>' +
                '</div>' +

                '<div class="col-manage">' +
                    '<a href="' + ctx + '/vendor/content_create?content_id=' + item.content_id + '">' +
                        '관리하기' +
                    '</a>' +
                '</div>' +

            '</div>'
        );
    });
}


</script>
>>>>>>> 0390013b8e1b2684066cc3fcdd2ac2cf330cdd34
</html>