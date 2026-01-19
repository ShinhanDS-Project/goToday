<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>GoToday | ${content.title}</title>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
  
  <style>
    :root { --main-color: #4dc3ff; --border-color: #eee; --text-gray: #666; }
    body { font-family: 'Pretendard', sans-serif; margin: 0; padding: 0; color: #333; }

    /* --- Navigation Bar --- */
    .navbar {
      display: flex; align-items: center; justify-content: space-between;
      padding: 0 50px; height: 70px; border-bottom: 1px solid #eee; background: #fff;
    }
    .nav-left { display: flex; align-items: center; gap: 40px; }
    .nav-logo img { height: 35px; cursor: pointer; }
    .nav-menu { display: flex; gap: 30px; list-style: none; margin: 0; padding: 0; }
    .nav-menu a { text-decoration: none; color: #333; font-weight: 500; font-size: 16px; }
    .nav-menu .active a { color: var(--main-color); border-bottom: 2px solid var(--main-color); padding-bottom: 22px; }
    
    .nav-right { display: flex; align-items: center; gap: 25px; }
    .search-bar { position: relative; border-bottom: 1px solid #333; display: flex; align-items: center; }
    .search-bar input { border: none; outline: none; padding: 5px 25px 5px 5px; width: 180px; font-size: 14px; }
    .search-bar i { position: absolute; right: 5px; cursor: pointer; }
    .user-icon img { width: 24px; cursor: pointer; }

    /* --- Content Layout --- */
    .container { max-width: 1100px; margin: 40px auto; padding: 0 20px; }
    .breadcrumb { font-size: 13px; color: var(--text-gray); margin-bottom: 15px; }
    .breadcrumb span { color: var(--main-color); }

    .content-title-area { display: flex; justify-content: space-between; align-items: flex-end; border-bottom: 2px solid #333; padding-bottom: 15px; margin-bottom: 30px; }
    .content-title-area h1 { margin: 0; font-size: 28px; letter-spacing: -1px; }
    .sns-group { display: flex; gap: 12px; }
    .sns-group img { width: 22px; cursor: pointer; opacity: 0.8; }

    .main-box { display: flex; gap: 50px; align-items: flex-start; }
    
    /* Left: Poster */
    .poster-side { flex: 0 0 400px; }
    .poster-img { width: 100%; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
    .like-count { display: flex; align-items: center; gap: 5px; margin-top: 15px; font-weight: bold; color: #444; }

    /* Right: Info & Reservation */
    .info-side { flex: 1; }
    .info-table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
    .info-table th { text-align: left; width: 100px; padding: 12px 0; color: #333; font-size: 15px; vertical-align: top; }
    .info-table td { padding: 12px 0; font-size: 15px; color: #555; line-height: 1.6; }

    .reserve-section { display: flex; gap: 20px; border-top: 1px solid #eee; padding-top: 30px; }
    #calendar { flex: 1.2; border: 1px solid #eee; border-radius: 10px; padding: 10px; background: #fff; font-size: 12px; }
    
    .time-selector { flex: 1; border: 1px solid #eee; border-radius: 10px; padding: 15px; background: #fafafa; }
    .time-title { font-weight: bold; font-size: 14px; margin-bottom: 15px; display: block; }
    .time-option { display: flex; align-items: center; padding: 10px; background: #fff; border: 1px solid #eee; border-radius: 6px; margin-bottom: 8px; cursor: pointer; transition: 0.2s; }
    .time-option:hover { border-color: var(--main-color); }
    .time-option input { margin-right: 12px; accent-color: var(--main-color); }
    .time-val { flex: 1; font-size: 14px; }
    .seat-val { font-size: 12px; color: var(--text-gray); }

    .action-btns { display: flex; gap: 10px; margin-top: 25px; }
    .btn-reserve { flex: 1; background: var(--main-color); color: #fff; border: none; padding: 16px; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; }
    .btn-share { width: 55px; background: #fff; border: 1px solid #ddd; border-radius: 6px; cursor: pointer; font-size: 20px; }
  </style>

  <script>
    $(function() {
      let selectedDate = null;
      let selectedTime = null;
      let scheduleId = null;

      const calendarEl = document.getElementById('calendar');
      const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko',
        height: 'auto',
        headerToolbar: { left: 'prev', center: 'title', right: 'next' },
        dateClick: function(info) {
          $(".fc-daygrid-day").css("background", ""); 
          $(info.dayEl).css("background", "rgba(77, 195, 255, 0.1)");
          selectedDate = info.dateStr;
          fetchTimes(selectedDate);
        }
      });
      calendar.render();

      function fetchTimes(date) {
        $.ajax({
          url: "${pageContext.request.contextPath}/schedule/time",
          data: { content_id: $("#content_id").val(), scheduled_at: date },
          success: function(res) {
            let html = `<span class="time-title">\${date} 시간 선택</span>`;
            if(res.length === 0) html += "<p style='font-size:12px; color:#999;'>예정된 회차가 없습니다.</p>";
            res.forEach(sch => {
              html += `
                <label class="time-option">
                  <input type="radio" name="sch_radio" data-id="\${sch.schedule_id}" data-time="\${sch.time_zone}">
                  <span class="time-val">\${sch.time_zone}</span>
                  <span class="seat-val">\${sch.current_ticket}석</span>
                </label>`;
            });
            $(".reservation_timezone").html(html);
          }
        });
      }

      $(document).on("change", "input[name='sch_radio']", function() {
        selectedTime = $(this).data("time");
        scheduleId = $(this).data("id");
      });

      $(".btn-reserve").click(function() {
        if(!selectedDate || !selectedTime) return alert("날짜와 시간을 선택해주세요.");
        $.post("${pageContext.request.contextPath}/reserve/schedule.do", {
          content_id: $("#content_id").val(),
          reserved_for_at: selectedDate,
          time_zone: selectedTime,
          schedule_id: scheduleId
        }, () => location.href = "${pageContext.request.contextPath}/reservation/select");
      });
    });
  </script>
</head>
<body>

<<<<<<< HEAD
  <header class="navbar">
    <div class="nav-left">
      <a href="/gotoday/main" class="nav-logo"><img src="https://via.placeholder.com/120x40?text=GoToday" alt="Logo"></a>
      <ul class="nav-menu">
        <li><a href="#">Q&A</a></li>
        <li class="active"><a href="/gotoday/popup">PopUp</a></li>
        <li><a href="/gotoday/exhibition">Exhibition</a></li>
=======
<div class="page-wrapper">
  <div class="content-container">
    <section class="top-area">
      <div class="content-info">
        <span>컨텐츠 &gt; 팝업</span>
        <a href="#" class="tag">#미디어</a>
        <h1>팝업 제목 : 치이카와 베이비 팝업</h1>
        <p class="period">2026.01.01 ~ 2026.03.02</p>
        <a href = "#" class="search-location">
          <p class="location">홍대 어딘가</p>
        </a>
      </div>

      <!-- 공유 버튼 그룹 -->
      <div class="share-group">
        <button class="share-btn" aria-label="인스타그램 링크">
          <img src="icon-share.svg" alt="링크">
        </button>
        <button class="share-btn" aria-label="엑스 링크">
          <img src="icon-share.svg" alt="링크">
        </button>
        <button class="share-btn" aria-label="공유">
          <img src="icon-share.svg" alt="공유">
        </button>

        <ul class="share-list">
          <li>
            <a href="#" class="share-item instagram">
              <img src="icon-instagram.svg" alt="카카오톡 공유">
            </a>
          </li>
          <li>
            <a href="#" class="share-item instagram">
              <img src="icon-instagram.svg" alt="인스타그램 공유">
            </a>
          </li>
          <li>
            <a href="#" class="share-item facebook">
              <img src="icon-facebook.svg" alt="엑스 공유">
            </a>
          </li>
          <li>
            <a href="#" class="share-item link">
              <img src="icon-link.svg" alt="URL">
            </a>
          </li>
        </ul>
        
      </div>

    </section>
    <!-- 좌측 영역 -->
    <section class="left-area">
      <div>
        <img src="poster.jpg" alt="포스터" class="poster" />
      </div>
      <button class="like-btn" aria-label="좋아요">
        <img src="icon-heart.svg" alt="좋아요">
        <span class="like-count">123</span>
      </button>
    </section>

    <!-- 우측 영역 -->
    <section class="right-area">
      <div class="info-box">
        <p>소개</p>
        <span>어쩌고 저쩌고 간략하게 소개하는 란</span>
      </div>
      
      <div class="price-box">
        <p>관람료</p>
        <ul>
          <li>성인 17,000원</li>
          <li>청소년 17,000원</li>
        </ul>
      </div>

      <div class="operating-hours">
        <p>운영시간</p>
        <span>10 : 00 ~ 18 : 00</span>
      </div>

      <div class="receive-method">
        <p>수령방법</p>
        <span>사전예매</span>
      </div>


      <!-- 예약 영역 -->
      <div class="reservation-box">

        <!-- 날짜 선택 -->
        <label>날짜 선택</label>
        <input type="date" id="dateInput" />

        <!-- 시간대 선택 -->
        <div id="timeSlotArea" class="hidden">
          <label>시간대</label>
          <select>
            <option value="1">
              10 : 00 ~ 12 : 00
            </option>
            <option value="2">
              12 : 00 ~ 14 : 00
            </option>
            <option value="3">
              14 : 00 ~ 16 : 00
            </option>
          </select>
          <ul id="timeSlotList"></ul>
        </div>

        <button class="reserve-btn">예매하기</button>
        <button class="calendar-btn">캘린더에 저장하기</button>
      </div>
    </section>

    <!-- 탭 영역 -->
    <div class="tab-wrapper">

      <!-- 탭 메뉴 -->
      <ul class="tab-menu">
        <li class="tab-item active">상세정보</li>
        <li class="tab-item">리뷰</li>
>>>>>>> origin
      </ul>
    </div>
    <div class="nav-right">
      <div class="search-bar">
        <input type="text" placeholder="검색어를 입력하세요">
        <i>🔍</i>
      </div>
      <div class="user-icon"><img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt="User"></div>
    </div>
  </header>

  <div class="container">
    <div class="breadcrumb">콘텐츠 > 팝업 > <span>#미디어</span></div>
    
    <div class="content-title-area">
      <div>
        <h1>컨텐츠명 : ${content.title}</h1>
        <p style="margin:8px 0 0; color:#666;">${content.start_at} ~ ${content.end_at} &nbsp;|&nbsp; ${content.location} 📍</p>
      </div>
      <div class="sns-group">
        <img src="https://cdn-icons-png.flaticon.com/512/733/733579.png" alt="X">
        <img src="https://cdn-icons-png.flaticon.com/512/2111/2111463.png" alt="IG">
        <img src="https://cdn-icons-png.flaticon.com/512/1358/1358023.png" alt="Link">
      </div>
    </div>

    <div class="main-box">
      <section class="poster-side">
        <img src="${content.main_image_path}" class="poster-img" alt="Poster">
        <div class="like-count">💙 ${content.like_count}</div>
      </section>

      <section class="info-side">
        <table class="info-table">
          <tr><th>소개</th><td>${content.description}</td></tr>
          <tr><th>관람료</th><td>성인 ${content.adult_price}원 / 청소년 ${content.teen_price}원 / 어린이 ${content.child_price}원</td></tr>
          <tr><th>운영시간</th><td>10:00 ~ 18:00 (월요일 휴관)</td></tr>
          <tr><th>수령방법</th><td>현장 QR 확인 후 입장</td></tr>
        </table>

        <div class="reserve-section">
          <div id="calendar"></div>
          <div class="time-selector">
            <div class="reservation_timezone">
              <span class="time-title">시간대 선택</span>
              <p style="font-size:12px; color:#999; margin-top:20px;">먼저 달력에서 날짜를 선택해주세요.</p>
            </div>
          </div>
        </div>

        <div class="action-btns">
          <input type="hidden" id="content_id" value="${content.content_id}">
          <button class="btn-reserve">예매하기</button>
          <button class="btn-share">🤍</button>
        </div>
      </section>
    </div>
  </div>

</body>
</html>