<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="reportManagement">
				<div class="content-header">
					<h1>FAQ 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<!-- 검색 div start -->
					<div>
						<div style="width:200px; float:left; text-align:left;">
							<button type="button" data-toggle="modal"
									data-target="#writeFaq" class="btn btn-default">FAQ 작성</button>
						</div>
						<div align="right">
							<form action="searchFaqMgmt.ad">
								<input type="hidden" name="currentPage" value="1"> 
								<select name="condition" style="height: 30px;">
									<option value="faqTitle">제목</option>
									<option value="faqCategory">유형</option>
									<option value="faqStatus">공개여부</option>
								</select>
		                       	<input type="text" name="keyword" value="${keyword}">
		                   		<button type="submit" class="btn btn-default">검색</button>
							</form> 
						</div>
					</div>
					<!-- 검색 div end -->
					<br>
					
					<table class="list-area" style="width:1030px;">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="90px">유형</th>
							<th width="90px">공개여부</th>
							<th width="500px">제목</th>
							<th width="120px">작성일</th>
						</tr>
						<c:forEach var="f" items="${list }" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>${f.faqCategory }</td>
							<td>${f.faqStatus }</td>
							<td>
								<a href="supportFaqDetail.su?faqNo=${f.faqNo}" target="_blank">
									${f.faqTitle }
								</a>
							
							</td>
							<td>${f.enrollDate }</td>
						</tr>
						</c:forEach>
					</table>
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 시작 ------------------------------------------------------>

					<!-- 공지 작성 Modal Start -->
					<div class="modal" id="writeFaq">
						<div class="modal-dialog">

							<!-- Modal content -->
							<div class="modal-content" align="center" style="width: 900px; ">
								<div class="modal-header" >
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">FAQ 작성</h3>
								</div>
								
								<div class="modal-body" align="center" style="width:800px;">
									<!-- 공지 등록 form start -->
									<form action="insertFaq.ad" method="post" onsubmit="return confirm('FAQ를 등록 하시겠습니까?');">
										<div style="height:36px;">
											<select name="faqType" style="width:100px; height:30px;">
												<option value="회원">회원</option>
												<option value="튜터">튜터</option>
											</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" style="width:640px;" name="faqTitle" placeholder="제목을 입력하세요.">
										</div>
										<div align="left" style="width:800px; height:30px;">
											<span>공개여부: </span>
											<label for="공개"><input type="radio" name="faqStatus" id="공개" value="공개">공개</label>&nbsp;&nbsp;&nbsp;
											<label for="비공개"><input type="radio" name="faqStatus" id="비공개" value="비공개">비공개</label>
										</div>
										<div align="left" style="width:800px; height:30px;">
											<span>유형 : </span>
											<label for="member"><input type="radio" name="faqCategory" id="member" value="회원">회원</label>&nbsp;&nbsp;&nbsp;
											<label for="tutor"><input type="radio" name="faqCategory" id="tutor" value="튜터">튜터</label>&nbsp;&nbsp;&nbsp;
											<label for="lesson"><input type="radio" name="faqCategory" id="lesson" value="클래스">클래스</label>&nbsp;&nbsp;&nbsp;
											<label for="pay"><input type="radio" name="faqCategory" id="pay" value="결제">결제</label>&nbsp;&nbsp;&nbsp;
											<label for="etc"><input type="radio" name="faqCategory" id="etc" value="기타">기타</label>
											
										</div>
										<div>
											<textarea style="resize:none; width:770px; height:500px;" name="faqContent" placeholder="내용을 입력하세요."></textarea>
										</div>
										<br>
										<div>
											<span>
												<button type="reset" class="btn btn-default">초기화</button>
											</span>
											&nbsp;&nbsp;&nbsp;
											<span>
												<button type="submit" class="btn btn-default">FAQ등록</button>
											</span>
										</div>
									</form>
								</div>	
							</div>
						</div>
					</div>
					<!-- 공지 작성 Modal End -->
					
					<!-- 공지사항 등록 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function noticeApply() {
							var num = 1;
							var result = confirm("공지사항을 등록 하시겠습니까??");

							if (result) {
								var str = "등록"
								document.getElementById("noticeApplyBtn").disabled = true;
							} else {
								return;
							}

							var noticeCondition = document
									.getElementById("noticeCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 공지사항 등록 확인 끝 -->
					
					<!-- 공지사항 리셋 확인 alert ** 컬럼별로 번호 매겨서야 한다(Condition 변경하기 위해) -->
					<script>
						function noticeReset() {
							var num = 1;
							var result = confirm("공지사항을 리셋 하시겠습니까??");

							if (result) {
								var str = "리셋"
								document.getElementById("noticeResetBtn").disabled = true;
							} else {
								return;
							}

							var noticeCondition = document
									.getElementById("noticeCondition" + num)
							blacklistCondition.innerHTML = "<p>" + str + "</p>"
						}
					</script>
					<!-- 공지사항 리셋 확인 끝 -->
					
					
<!------------------------------------------------------ 공지 작성 모달&스크립트 끝 ------------------------------------------------------>
					
					</div>
					<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.startPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="noticeManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="noticeManagement.ad?currentPage=${p}">${p}</a></li>
										</c:when>
										<c:otherwise>
											<c:url var="searchUrl" value="searchClassMgmt.ad">
												<c:param name="currentPage" value="${p }"/>
												<c:param name="condition" value="${condition }" />
												<c:param name="keyword" value="${keyword }" />
											</c:url>
											
											<li><a href="${searchUrl }">${p }</a></li>
										</c:otherwise>
									</c:choose>	
								</c:when>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage }">
								<li class="disabled"><a href="#">&gt;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="noticeManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
			</section>
		</div>
	</div>
</body>


</html>