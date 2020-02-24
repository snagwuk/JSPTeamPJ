<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판</title>
</head>


			<section class="banner_area">
			<div class="banner_inner d-flex align-items-center">
				<div class="overlay bg-parallax" data-stellar-ratio="0.9"
					data-stellar-vertical-offset="0" data-background=""></div>
				<div class="container">
					<div class="banner_content text-center">
						<h2>고객의 소리</h2>
						<div class="page_link">
							<a href="${pageContext.request.contextPath}/member/main">Home</a> <a href="${pageContext.request.contextPath}/minwon/list">고객의 소리</a>
						</div>
					</div>
				</div>
			</div>
			</section>
			<!--================End Home Banner Area =================-->
	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container">
<div class=" btnBox_tit">
				<p>	글쓰기 </p>
				<a href="${pageContext.request.contextPath}/minwon/list" class="genric-btn info radius">목록보기</a>
			</div>
	<div>
<div>


	<form method="post"  class="row contact_form form_rent"
		action="${pageContext.request.contextPath}/minwon/write">
   <div class="col-md-12">
                            <div class="form-group">
                            	<input type="hidden" name="id" value="${authUser.id}">
                            <span>제 목</span>
                                <input type="text" class="form-control" id="subject" name="subject"  placeholder="제목을 입력하세요">
                            </div>
                            
                           
                             <div class="form-group">
                             <span>내 용</span>
                                <textarea name="content" class="form-control"  id="purpose" rows="1" cols="40" placeholder="내용을 입력하세요"></textarea>
                            </div>
                        </div>
                      
                        <div class="col-md-12 btnBox_center">
              
                            <input type="submit"  class="btn submit_btn" value="등록">
                        </div>
                        
		<%-- <table>
			<input type="hidden" name="id" value="${authUser.id}">
			<tr>
				<td width="70" align="center">제 목</td>
				<td width="330"><input type="text" size="40" maxlength="50"
					name="subject"></td>
			</tr>
			<tr>
				<td width="70" align="center">내 용</td>
				<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2 align="center">
				<input type="submit" value="등록">
					<input type="button" value="목록보기"
					OnClick="window.location='${pageContext.request.contextPath}/minwon/list'">
				</td>
			</tr>
		</table> --%>
	</form>
</div>
<body>
	</div>
	</div>
 <!-- Footer Area start  -->
 	 <jsp:include page="/common/footer.jsp" />
    <!-- Footer Area end  -->
</body>
</html>