<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<jsp:include page="adminNav.jsp" />
	<div id="main-wrapper">
		<div class="main-content">
			<section id="memberManagement">
				<div class="content-header">
					<h1>회원 관리</h1>
				</div>
				
				<div class="welcome" align="center" style="width:1030px;">
					<div align="right">
						<form action="searchMemberMgmt.ad">
							<input type="hidden" name="currentPage" value="1"> 
							<select name="condition" style="height: 30px;">
								<option value="memName">이름</option>
								<option value="nickname">닉네임</option>
								<option value="memId">아이디</option>
							</select>
	                       	<input type="text" name="keyword" value="${keyword}">
	                   		<button type="submit" class="btn btn-default">검색</button>
						</form> 
					</div>
					
					 <script>
			        	$(".searchArea option[value=${condition}]").attr("selected",true); 
			        </script>
			        
					<br>
					<table class="list-area" style="width:1030px;">
						<tr>
							<th width="50px" height="40px">번호</th>
							<th width="80px">회원 분류</th>
							<th width="80px">이름</th>
							<th width="150px">닉네임</th>
							<th width="220px">아이디</th>
							<th width="110px">회원 상세조회</th>
						</tr>
						<c:forEach var="m" items="${list}" varStatus="status">
						<tr>
							<td height="40px">${status.count }</td>
							<td>
								<c:choose>
									<c:when test="${m.auth eq '1' }">
						               	<span>회원</span>
					                </c:when>
					                <c:when test="${m.auth eq '2' }">
						            	<span>튜터</span>
					                </c:when>
					                <c:when test="${m.auth eq '3' }">
						            	<span style="color: blue">* 관리자 *</span>
					                </c:when>
					                <c:when test="${m.status eq 'B' }">
						               	<span style="color: red;">* 블랙 *</span>
					                </c:when>
						        </c:choose>
							</td>
							<td>${m.memName }</td>
							<td>${m.nickname }</td>
							<td>${m.memId }</td>
							<td>
							<button onclick="memberArrayList(this);" data-toggle="modal" 
							data-memno="${m.memNo }" data-memid="${m.memId }" data-memname="${m.memName }"
							data-nickname="${m.nickname }" data-birthday="${m.birthday }" data-gender="${m.gender }"
							data-phone="${m.phone }" data-enrolldate="${m.enrollDate }" data-outdate="${m.outDate }"
							data-status="${m.status }" data-auth="${m.auth }"  
							data-target="#memberInfo" class="btn btn-default">상세 조회</button>
							</td>
						</tr>
						</c:forEach>
					</table>
					
					<!-- Modal Start -->
					<div class="modal" id="memberInfo">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content" align="left" style="width: 800px;">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h3 class="modal-title" style="text-align:center">회원 상세조회</h3>
								</div>
								 
								<div class="modal-body" align=center>
									<span><h4>회원정보</h4></span>
								
									<table class="list-area">
										<tr>
											<th width=80>회원 분류</th>
											<th width=80>이름</th>
											<th width=140>닉네임</th>
											<th width=220>이메일</th>
											<th width=140>연락처</th>
											<th width=120>생년월일</th>
											<th width=50>성별</th>											
										</tr>
										<tr>
											<td><p id="modalAuth"></p></td>
									        <td><p id="modalMemName"></p></td>
									        <td><p id="modalNickname"></p></td>
									        <td><p id="modalMemId"></p></td>
									        <td><p id="modalPhone"></p></td>
									        <td><p id="modalBirthday"></p></td>
											<td><p id="modalGender"></p></td>
										</tr>
									</table>
									<br>
									<table class="list-area">
										<tr>
											<th width=120>가입일</th>
											<th width=120>탈퇴일</th>
											<th width=80>회원상태</th>
										</tr>
										<tr>
										<td><p id="modalEnrollDate"></p></td>
										<td><p id="modalOutDate"></p></td>
										<td><p id="modalStatus"></p></td>
										</tr>
									</table>
									<hr>
									
									<span><h4>수강 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클래스 카테고리</th>
										</tr>
										<tr>
											<td><p id="modalLessonTitle"></p></td>
											<td><p id="modalLessonCategory"></p></td>
										</tr>
									</table>
									<br>
									
									<span><h4>강의 클래스 내역</h4></span>
									<table class="list-area">
										<tr>
											<th width=400>클래스 제목</th>
											<th width=140>클레스 카테고리</th>
										</tr>
										<tr>
											<td><p id="modalLessonTitle"></p></td>
											<td><p id="modalLessonCategory"></p></td>
										</tr>
									</table>
									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!--Modal End-->
					<script>
						$(function(){
							memberArrayList(); 
						})
					
						function memberArrayList(e){
							var memNo = $(e).data("memno");
							var memId = $(e).data("memid");
							var memName = $(e).data("memname");
							var nickname = $(e).data("nickname");
							var birthday = $(e).data("birthday");
							var gender = $(e).data("gender");
							var phone = $(e).data("phone");
							var enrollDate = $(e).data("enrolldate");
							var outDate = $(e).data("outdate");
							var status = $(e).data("status");
							var auth = $(e).data("auth");
							
							$("#modalMemNo").text(memNo);
							$("#modalMemId").text(memId);
							$("#modalMemName").text(memName);
							$("#modalNickname").text(nickname);
							$("#modalBirthday").text(birthday);
							$("#modalGender").text(gender);
							$("#modalPhone").text(phone);
							$("#modalEnrollDate").text(enrollDate);
							$("#modalOutDate").text(outDate);
							$("#modalStatus").text(status);
							$("#modalAuth").text(auth);
							
						}
					</script>
					
				</div>
				<div class="container" align="center">
						<ul class="pagination">
						<c:choose>
							<c:when test="${pi.startPage eq 1 }">
								<li class="disabled"><a href="">&lt;</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="memberManagement.ad?currentPage=${pi.currentPage -1 }">&lt;</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:choose>
								<c:when test="${pi.currentPage ne p }">
									<c:choose>
										<c:when test="${empty sc }">
											<li><a href="memberManagement.ad?currentPage=${p}">${p}</a></li>
										</c:when>
										<c:otherwise>
											<c:url var="searchUrl" value="searchMemberMgmt.ad">
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
								<li><a href="memberManagement.ad?currentPage=${pi.currentPage +1 }">&gt;</a></li>
							</c:otherwise>
						</c:choose>	
						</ul>
					</div>
			</section>
		</div>
	</div>
</body>


</html>