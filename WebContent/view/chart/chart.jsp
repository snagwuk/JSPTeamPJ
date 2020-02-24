<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2> 프로그램 수강현황</h2>
						<div class="page_link">
							<a href="${pageContext.request.contextPath}/member/main">Home</a> <a href="${pageContext.request.contextPath}/main/chart">프로그램 수강현황</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--================End Home Banner Area =================-->
	
	<div class="whole-wrap">
		<div class="container mb-30">
		<div class=" btnBox_tit">
				<p>프로그램 수강현황</p>	
			</div>
<div class=" btnBox_center">
<input type="button" class="genric-btn info radius" value='월 별 수강생 성비 '  onclick = "changeIframeUrl('${pageContext.request.contextPath}/chart/femaleMaleCountByMonth.jsp')"/>
<input type="button"  class="genric-btn info radius"value='월 별 수강생 수  '  onclick = "changeIframeUrl('${pageContext.request.contextPath}/chart/studentCountByMonth.jsp')"/>
<input type="button" class="genric-btn info radius"value='과목 별 수강생 현황'  onclick = "changeIframeUrl('${pageContext.request.contextPath}/chart/studentCountBySubject.jsp')"/>
<input type="button"  class="genric-btn info radius"value='강사 평점 랭킹'  onclick = "changeIframeUrl('${pageContext.request.contextPath}/chart/trainerRanking.jsp')"/>
					
				</div>


 <br>
 <iframe src = "${pageContext.request.contextPath}/chart/femaleMaleCountByMonth.jsp" width="100%" height="650"
  frameborder="0" border="0" scrolling="yes" bgcolor=#EEEEEE 
  bordercolor="#FF000000" marginwidth="0" marginheight="0" 
  name="main_frame" id="main_frame"></iframe> 
 
<script>
function changeIframeUrl(url) 
{
    document.getElementById("main_frame").src = url;
}

</script>

</div>
</div>

<!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
</body>


</html>