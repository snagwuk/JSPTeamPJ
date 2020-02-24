<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>체육관 메인</title>
</head>
<body>



    <!--================Home Banner Area =================-->
    <section class="home_banner_area">
        <div class="banner_inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="banner_content">
                            <h2>시민과 함께<br /> 사회적 가치를 실현하는 전문 공기업</h2>
                            <p>Health & Beauty. Enjoy your life with 쌍용문화센터</p>
                            <a class="banner_btn" href="${pageContext.request.contextPath}/course/list">온라인 수강신청</a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="home_right_box">
                            <div class="home_item">
                                <a href="${pageContext.request.contextPath}/main/chart">
                                    <i class="fa fa-bar-chart"></i>
                                    <span class="main_icotxt ">프로그램 수강현황</span>
                                </a>
                            </div>
                            
                            <div class="home_item ">
                                <a href="${pageContext.request.contextPath}/course/list">
                                    <i class="fa fa-calendar"></i>
                                    <span class="main_icotxt ">수강신청</span>
                                </a>
                            </div>
                            <div class="home_item ">
                                <a href="${pageContext.request.contextPath}/rent/locationlist">
                                    <i class=" fa fa-building "></i>
                                    <span class="main_icotxt ">대관장소</span>
                                </a>
                            </div>
                            <div class="home_item ">
                                <a href="${pageContext.request.contextPath}/rent/rent">
                                    <i class=" fa fa-clone "></i>
                                    <span class="main_icotxt ">대관신청</span>
                                </a>
                            </div>
                           <!--  <div class="home_item ">
                                <a href="#none">
                                    <i class="fa fa-bullhorn "></i>
                                    <span class="main_icotxt ">공지사항</span>
                                </a>
                            </div> -->
                            <div class="home_item ">
                                <a href="${pageContext.request.contextPath}/member/contact">
                                    <i class=" fa fa-map "></i>
                                    <span class="main_icotxt ">오시는길</span>
                                </a>

                            </div>
                            <div class="home_item ">
                                <a href="${pageContext.request.contextPath}/minwon/list">
                                    <i class=" fa fa-envelope-open"></i>
                                    <span class="main_icotxt ">고객의소리</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
      <!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
    
</body>
</html>