<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b83ca2a69cde8ed5d1be89d082ee137"></script>
<body>
	<!-- 공통해더부분시작  -->
 	 <jsp:include page="/common/head.jsp" />
    <!-- 공통해더부분  -->
    <!--================Home Banner Area =================-->
    <section class="banner_area">
        <div class="banner_inner d-flex align-items-center">
            <div class="overlay bg-parallax" data-stellar-ratio="0.9" data-stellar-vertical-offset="0" data-background=""></div>
            <div class="container">
                <div class="banner_content text-center">
                    <h2>CONTACT US</h2>
                    <div class="page_link">
                        <a href="${pageContext.request.contextPath}/member/main">Home</a>
                        <a href="${pageContext.request.contextPath}/member/contact">CONTACT US</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Contact Area =================-->
    <section class="contact_area p_120">
        <div class="container">
  
<p style="margin-top:-12px">
    <em class="link">
        <a href="/web/documentation/#MapTypeId" target="_blank"></a>
    </em>
</p>
<div id="map" class="mb-30" style="width:100%;height:300px;"></div>

<div class="row">
                <div class="col-md-4">
                    <div class="contact_info">
                        <div class="info_item">
                            <i class="lnr lnr-home"></i>
                            <h6>서울 강남구 테헤란로 132</h6>
                            <p>Handogyakpum Building</p>
                        </div>
                       
                    </div>
                    </div>
					<div class="col-md-4">
						<div class="contact_info">

							<div class="info_item">
								<i class="lnr lnr-phone-handset"></i>
								<h6>
									<a href="#">00 (440) 9865 562</a>
								</h6>
								<p>Mon to Fri 9am to 6 pm</p>
							</div>
							
						</div>
					</div>
					<div class="col-md-4">
						<div class="contact_info">

							
							<div class="info_item">
								<i class="lnr lnr-envelope"></i>
								<h6>
									<a href="#">support@gmail.com</a>
								</h6>
								<p>Send us your query anytime!</p>
							</div>
						</div>
					</div>
				</div>
            </div>
            
    </section>
    <!--================Contact Area =================-->

   <!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->

   


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.499314, 127.033217), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.499314, 127.033217); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">쌍용문화센터 <br><a href="https://map.kakao.com/link/map/쌍용문화센터,37.499314, 127.033217" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</body>

</html>