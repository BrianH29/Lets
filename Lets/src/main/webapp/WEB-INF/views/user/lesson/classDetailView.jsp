<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta property="og:url" content="http://localhost:8888/ee/" />
<meta property="og:title" content="Lets Experience is Everything" />
<meta property="og:type" content="website" />
<meta property="og:description" content="요기서 배워 배우라고!!" />
<meta property="og:image" content="http://localhost:8888/ee/resources/user/assets/img/logo/logo.png" />
<meta property="og:image:width" content="200"  />
<meta property="og:image:height" content="100"  />
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/detailClassStyle.css">
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<script src='<c:url value="resources/user/assets/js/vendor/jquery-1.12.4.min.js"/>'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />
	
	<script>
		//기타 사유 클릭시 보여질 모달 창 
        $(function(){
           $('#report-etc').on('change', function(){
               if($(this).is(':checked')){
                   $('#etcReportModal').modal();
               }
           }); 
       });

		// 기타 사유 작성후 신고 모달 화면에서 작성한 글 보이게끔 
       function getReason(){
        var reason = $("#reportReasonArea").val();

        $("#report-etc").val(reason);
        $("#reportReason").text(reason);
       }
		
		//FAQ slideUp / Down
       $(function() {
			$(".blog-author .media-body .faqQuestion").click(function() {
				var $p = $(this).next();
				if ($p.css("display") == "none") {
					$(this).siblings("p").slideUp();
					$p.slideDown();
				} else {
					$p.slideUp();
				}
			});
		});
	</script>
   <!-- end of 신고하기  -->
	<main>
	      <!--================Blog Area =================-->
	      <section class="blog_area single-post-area section-padding">
	         <div class="container">
	            <div class="row">
                 	<!-- value 나중에 수정해야 함. -->
                 	<input type="hidden" name="lessonNo" value="${l.lessonNo }">
	               <div class="col-lg-8 posts-list">
	                  <div class="single-post">
	                     <div class="feature-img">
	                        <img class="img-fluid" src="${l.lessonCoverImg }" alt="">
	                     </div>
	                     <div class="blog_details">
	                        <h2 style="color: #2d2d2d;">${l.lessonTitle }</h2>
	                        <br><br>
	                        <!-- 클래스 소개 -->
	                        <div class="quote-wrapper">
	                           <div class="quotes">
	                              <h2>클래스 소개 </h2>
	                              <br>
	                              <table>
	                                 <tr>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/calendar.png"></td>
	                                    <td width="300px;"><h5>${l.period } 수강 가능</h5></td>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/clipboard.png"></td>
	                                    <td width="200px;"><h5>${l.lessonContNo }개 컨텐츠</h5></td>
	                                 </tr>
	                              </table>
	                              <br><br>
	                              <!--첫번째 소개 글과 이미지-->
	                             <div style="width:100%;">
	                             <p>
	                             ${l.lessonInstr }</p>
	                             </div>
	                           </div>
	                        </div>
	                        
	                        <!-- 컬리큘럼 소개 -->
	                        <div class="quote-wrapper">
	                           <div class="quotes">
	                              <h2>컬리큘럼 소개 </h2>
	                              <br>
	                              <div class="curriculum-area">
	                                 <h5><b>이 클래스에 오신것을 환경합니다.intro</b></h5>
	                              </div> 
	                              <br>
	                              <div class="ordered-list">
	                              <c:forEach var="c" items="${c }" varStatus="status">
	                              	<c:choose>
	                              		<c:when test="${c.curLevel eq 1}">
	                              			<h6>${c.curriculumCont }</h6>
	                              		</c:when>
	                              		<c:otherwise>
			                                 <ol type="a" >
			                                    <li>${c.curriculumCont }</li>
			                                 </ol>
	                              		</c:otherwise>
	                              	</c:choose>
	                               </c:forEach>
	                              </div>  
	                              <br><br>
	                           </div>
	                        </div>
	                        <!-- end of 컬리큘럼-->
	                     </div>
	                  </div>
	                  <!--? 튜터 소개 -->
	                  <div class="blog-author">
	                     <div><h2>튜터 소개</h2></div>  
	                     <br>
	                     <div class="media align-items-center">
	                        <img src="${t.tutorPic }" alt="">
	                        <div class="media-body">
	                              <h4>${t.nickname }</h4>
	                           <p>${t.tutorInfo }</p>
	                        </div>
	                     </div>
	                  </div>
	                  <!--end of 튜터 소개 -->
	                  <!--?리뷰 area-->
		                  <div class="comments-area">
		                     <div class="text-right">
		                        <i class="fas fa-plus" id="showMore"> 더보기</i>
		                        <input type="hidden" name="lessonNo" value="${l.lessonNo }">
		                     </div>
		                     <div class="container">
		                        <h4>리뷰 </h4>
		                      </div>
	                  		<c:forEach var="review" items="${list }">
			                     <div class="comment-list">
			                        <div class="single-comment justify-content-between d-flex">
			                           <div class="user justify-content-between d-flex">
			                              <div class="thumb">
			                                 <img src="resources/user/assets/img/comment/cat1.jpg" alt="">
			                              </div>
			                              <div class="desc">
			                                 <p class="comment">${review.reviewContent}</p>
			                                 <div class="d-flex justify-content-between" style="width:670px;">
			                                    <div class="d-flex align-items-center">
			                                       <span>${review.nickname}</span>
			                                       <p class="date">${review.reviewEnrollDate} </p>
			                                    </div>
			                                    <div class="review-ratting">
			                                    	<c:forEach var="s" begin="1" end="${review.star }">
			                                        <i class="fas fa-star" style="color:#fbba42"></i> 
			                                        </c:forEach>
			                                        <c:forEach var="j" begin="${review.star}" end="4">
			                                        <i class="fas fa-star" style="color:#e6e6e6"></i>
			                                        </c:forEach>
			                                    </div>
			                                 </div>
			                              </div>
			                           </div>
			                        </div>
			                     </div>
	                  		</c:forEach>
		                  </div>
	                  <!--? end 리뷰 area-->

	                  <script>
	                  var result = "";
	                  
	                 //후기 더보기 클리시 실행
	                  	$(function(){
	                  		$("#showMore").click(function(){
	                  			location.href="showMore.rev?lessonNo="+$(this).siblings("input[name=lessonNo]").val();
	                  		})
	                  		
	                  		//페이지 실행되자마자 커뮤니티 실행시키기 위해 
	                  		selectReplyList();
	                  		
	                  	});
	                 
	                 	function addCommunity(){
	                 		$.ajax({
	                 			url:"insertReply.le",
	                 			data:{
	                 				totalNo:${l.lessonNo},
	                 				memNo:${loginUser.memNo},
	                 				replyContent:$("#communityContent").val()
	                 			},
	                 			success:function(result){
	                 				if(result == "success"){
	                 					$("#communityContent").val("");
	                 					$("#writeReviewArea").hide(); 
	                 					selectReplyList(); 
	                 				}
	                 			},
	                 			error:function(){
	                 				alert("댓글 작성 실패했습니다.");
	                 			}
	                 		});
	                 		
	                 	}
	             		//상세페이지 커뮤니티 ajax로 리스트 불러오기
	                  	function selectReplyList(){
	                  		$.ajax({
	                  			url:"selectReplyList.le",
	                  			data:{
	                  				totalNo:${l.lessonNo}
	                  			},
	                  			success:function(list){
	                  				$("#replyCount").text(list.list.length);
	                  				
	                  				var pi = list.pi;
	                  				var list = list.list;
	                  				
	                  				result ="";
           							var page = "";
           							
	                  				for(var i in list){
	                  					result += '<div class="comment-list">'
	                  					result += "<input type='hidden' id='replyNo' value='"+list[i].replyNo+"'>"
	                  					result += "<input type='hidden' id='memNo' value='"+list[i].memNo+"'>"
	        	                        result += '<div class="single-comment justify-content-between d-flex">'
	     	                            result += '<div class="user justify-content-between d-flex">'
	     	                            result += '<div class="thumb">'
	     	                            result += '<img src="resources/user/assets/img/comment/cat1.jpg" alt="">'
	     	                            result += '</div>'
	     	                            result += '<div class="desc">'
	     	                            result += '<p class="comment">'+list[i].replyContent+'</p>'
	     	                            result += '<div class="d-flex justify-content-between" style="width:670px;">'
	     	                            result += '<div class="d-flex align-items-center">'
	     	                            result += '<span>'+list[i].nickname+'</span>'
	     	                            result += '<p class="date">'+list[i].replyEnrollDate+'</p>'
	     	                            result += '</div>'
	     	                            result += '<div class="reply-btn">'
	     	                            result += '<div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-no="'+list[i].replyNo+'" onclick="reReplySet(this); return false">'+ "답장" +'</a></div>'
	     	                            result += '<div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-no="'+list[i].replyNo+'" onclick="updateReplySet(this); return false">'+ "수정" + '</a></div>'
	     	                            result += '<div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#deleteModal" data-no="'+list[i].replyNo+'" onclick="deleteReplySet(this)">'+"삭제"+'</a></div>'
	     								result += '<div class="communityBtn"><a href="#" class="btn-reply text-uppercase" data-toggle="modal" data-target="#reportModal" data-no="'+list[i].replyNo+'" onclick="reportSet(this)">'+"신고"+'</a></div>'
	     	                            result += '</div>'
	     	                            result += '</div>'
	     	                            result += '</div>'
	     	                            result += '</div>'
	     	                            result += '</div>'
	     	                            result += "<div class='reviewReplyArea'></div>"
	     	                            result += '</div>'
	     	                           
	     	                            	for(var r=0; r<list[i].reList.length; r++){
	     	                            		if(list[i].reList[r].replyNo2 != 0){
	     	                            		
			             					result += "<div class='comment-list reReply'>" 
			             					result += "<input type='hidden' id='reReplyNo' data-num='"+list[i].reList[r].replyNo+"'>"
		                              		result += "<div class='single-comment justify-content-between d-flex'>"
		                              		result += "<div class='user justify-content-between d-flex'>"
		                              		result += "<div class='thumb1'>"
		                              		result += "<img src='resources/user/assets/img/detailClassPage/replyArrow.png'>"
		                              		result += "</div>"
		                              		result += "<div class='desc1'>"
		                              		result += "<p class='comment' id='replyCommentArea'>" + list[i].reList[r].replyContent + "</p>"   
		                              		result += "<div class='d-flex justify-content-between' style='width:670px;'>"
		                              		result += "<div class='d-flex align-items-center'>"
		                              		result += "<span>" + list[i].reList[r].nickname + "</span>"
		                              		result += "<p class='date'>" + list[i].reList[r].replyEnrollDate + "</p>"
		                              		result += "</div>"
		                              		result += "<div class='reply-btn'>"
		                              		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='reply() return false'>" + '답장' + "</a></div>"
		                              		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' onclick='updateReReplySet(this); return false' data-no='" + list[i].reList[r].replyNo2 + "'>" + '수정' + "</a></div>"
		                              		result += "<div class='communityBtn'><a href='#' class='btn-reply text-uppercase' data-toggle='modal' data-target='#deleteReplyModal' data-no='"+ list[i].reList[r].replyNo2 + "' onclick='deleteReReplySet(this) return false'>" + '삭제' + "</a></div>"
		                              		result += "</div>"        
		                              		result += "</div>"
		                              		result += "</div>"
		                              		result += "</div>"
		                              		result += "</div>"
		                              		result += "</div>"
		                              		
	     	                              		}
	     	                            }
	                  				}
	                  				
	                  				page += '<ul class="pagination">'
	                  				if (pi.currentPage == 1) {
	                  	            	 page += '<li class="disabled"><a href="">&laquo;</a></li>'
	                  	             } else {
	                  	                 page += '<li><a href="selectReplyList.le?currentPage=('+ (pi.currentPage-1) +')">&laquo;</a></li>'
	                  	             }
	                  	             
	                  	             for(var p=pi.startPage; p<=pi.endPage; p++){
	                  	            	 if(p != pi.currentPage){
	                  	            		page += '<li><a href="selectReplyList.le?currentPage='+ p +'">'+ p +'</a></li>' 
	                  	            	 } else {
	                  	            		 page += '<li class="disabled"><a href="">'+ p +'</a></li>'
	                  	            	 }
	                  	             }
	                  	             
	                  	             if (pi.endPage == pi.maxPage){
	                  	            	page += '<li class="disabled"><a href="#">&raquo</a></li>'
	                  	             } else {
	                  	            	page += '<li><a href="selectReplyList.le?currentPage=('+ (pi.currentPage+1) +')">&raquo</a></li>'
	                  	             }
	                  	             page += '</ul>'
	                  				$(".comments-area > .replyArea").html(result); 
	                  				$(".comments-area > .container1").html(page);
	                  				
	                  			},
	                  			error:function(){
	                  				console.log("댓글 list ajax fail")
	                  			}
	                  		});
	                  	}
	             		
	             		function updateReplySet(e){
	             			var replyNo = $(e).data("no");
	             			var replyContent = $(e).parents().siblings(".comment").text();
	             			
	             			var repEditForm = "";
	             			
	             			repEditForm += '<input type="hidden" id="updateReplyNo" value="'+ replyNo +'">'
	            			repEditForm += '<div class="mt-10">'
	                        repEditForm += "<textarea class='review-textarea' id='repContent' required>" + replyContent + "</textarea>"
	                        repEditForm += '</div>'
	                        repEditForm += '<div align="right">'
	                        repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="updateReply();">'+ "등록" + '</button>'
	                		repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelUpdateReview(this); return false">'+ "취소" + '</button>'
	                		repEditForm += '</div>'
	            			
	                		$(e).parents(".comment-list").html(repEditForm); 
	             		}
	             		
	             		function updateReply(){
	             			var replyNo = $("#updateReplyNo").val()
	             			var replyContent = $("#repContent").val(); 
	             			
	             			$.ajax({
	             				url:"updateReply.le",
	             				data:{
	             					replyNo:replyNo,
	             					replyContent:replyContent
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						selectReplyList(); 
	             					}else{
	             						alert("댓글 수정 실패 했습니다.")
	             					}
	             				},
	             				error:function(){
	             					console.log("댓글 수정 ajax fail")
	             				}
	             			})
	             		}
	             		
	             		//수정 취소하기
	             		function cancelUpdateReview(e){
	             			$(e).parents(".replyArea").html(result);
	             			selectReplyList(); 
	             		}
	             		
	             		//모달로 reply_no 보내기 
	             		function deleteReplySet(e){
	             			$("#replyNo").val($(e).data("no"));
	             		}
	             		
	             		//첫번쨰 글 삭제하기 요청(모달)
	             		function deleteReply(){
	             			$.ajax({
	             				url:"deleteReply.le",
	             				data:{
	             					replyNo:$("#replyNo").val() 
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						$("#closeModal").click(); 
	             						selectReplyList(); 
	             					}
	             				},
	             				error:function(){
	             					alert("댓글 삭제 실패하셨습니다.")
	             				}
	             				
	             			});
	             		}
	             		
	             		//커뮤니티 답장 누를시 보여질 창 
	             		function reReplySet(e){
	             			var replyNo = $(e).data("no");
	             			
	             			var replyArea = "";
	             			
	             			replyArea += '<input type="hidden" id="reReplyNo" value="'+ replyNo +'">'
	             			replyArea += '<div class="mt-10">'
	             			replyArea += "<textarea class='review-textarea' id='reRepContent' required></textarea>"
	             			replyArea += '</div>'
	             			replyArea += '<div align="right">'
         					replyArea += '<button class="genric-btn1 primary-border extrasmall" onclick="reReply();">'+ "등록" + '</button>'
         					replyArea += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelUpdateReview(this); return false">'+ "취소" + '</button>'
         					replyArea += '</div>'
	             			
	             			$(e).parents(".comment-list").children(".reviewReplyArea").html(replyArea);
	             		}
	             		
	             		// 답장 장석하고 insert 할 ajax
	             		function reReply(){
	             			var replyNo2 = $("#reReplyNo").val();
	             			var replyContent = $("#reRepContent").val(); 
	             			
	             			$.ajax({
	             				url:"reReply.le",
	             				data:{
	             					replyNo:replyNo2,
	             					memNo:${loginUser.memNo},
	             					replyContent:replyContent,
	             					totalNo:${l.lessonNo}
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						selectReplyList(); 
	             					}else{
	             						alert("댓글 작성 실패")
	             					}
	             				},
	             				error:function(){
	             					console.log("댓글 작성 ajax fail")
	             				}
	             			}); 
	             		}
	             		
	             		//모달로 reply_no 보내기 
	             		function deleteReReplySet(e){
	             			$("#reReplyNo2").val($(e).data("no"));
	             			$("#reReplyNo").val($(e).parents().siblings("#reReplyNo").data("num"));

	             		}
	             		
	             		function deleteReReply(){
	             			$.ajax({
	             				url:"deleteReReply.le",
	             				data:{
	             					replyNo:$("#reReplyNo").val(),
	             					replyNo2:$("#reReplyNo2").val()
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						$("#modalClose").click();
	             						selectReplyList();
	             					} else {
	             						alert("댓글 삭제 실패했습니다.")
	             					}
	             					
	             				},
	             				error:function(){
	             					console.log("대댓글 삭제 ajax fail")
	             				}
	             			});
	             		}
	             		
	             		function updateReReplySet(e){
	             			var replyNo = $(e).parents().siblings("#reReplyNo").data("num");
	             			var replyNo2 = $(e).data("no");
	             			var replyContent = $(e).parents().siblings("#replyCommentArea").text();
	             			
	             			var repEditForm = "";
	             			
	             			repEditForm += '<input type="hidden" id="updateReReplyNo2" value="'+replyNo2+'">'
	             			repEditForm += '<input type="hidden" id="updateReReplyNo" value="'+ replyNo +'">'
	            			repEditForm += '<div class="mt-10">'
	                        repEditForm += "<textarea class='review-textarea' id='repContent' required>" + replyContent + "</textarea>"
	                        repEditForm += '</div>'
	                        repEditForm += '<div align="right">'
	                        repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="updateReReply(); return false">'+ "등록" + '</button>'
	                		repEditForm += '<button class="genric-btn1 primary-border extrasmall" onclick="cancelUpdateReview(this); return false">'+ "취소" + '</button>'
	                		repEditForm += '</div>'

	             			$(e).parents(".comment-list").html(repEditForm); 
	             		}

	             		function updateReReply(){
	
	             			$.ajax({
	             				url:"updateReReply.le",
	             				data:{
	             					replyNo:$("#updateReReplyNo").val(),
	             					replyNo2:$("#updateReReplyNo2").val(),
	             					replyContent:$("#repContent").val()
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						selectReplyList(); 
	             					}else{
	             						alert("댓글 수정 실패 했습니다.")
	             					}
	             				},
	             				error:function(){
	             					console.log("댓글 수정 ajax fail")
	             				}
	             			})
	             		}
	             		
	             		function reportSet(e){
	             			$("#reportReplyNo").val($(e).data("no"));
	             			$("#reportedMemNo").val($(e).parents().siblings("#memNo").val());
	             		}
	             		
	             		function reportRequest(){
	             			$.ajax({
	             				url:"reportReply.le",
	             				data:{
	             					memNo:$("#reportedMemNo").val(),
	             					replyNo:$("#reportReplyNo").val(),
	             					reportType:$("input:radio[name=reportType]:checked").val()
	             				},
	             				success:function(result){
	             					if(result == "success"){
	             						alert("신고 성공했습니다.")
	             					} else {
	             						alert("신고 실패했습니다.")
	             					}
	             				},
	             				error:function(){
	             					console.log("신고 ajax 실패")
	             				}
	             			})
	             		}
	                  	//커뮤니티 작성하기 버튼 누르면 실행 될 스크립트
                        function writeReview(){
                           	if($("#writeReviewArea").css("display") == "none"){
                           		//조건문 필요 >> 회원이 이 강의를 수강시 가능.
                           		$("#writeReviewArea").show();
                           	}else{
                           		$("#writeReviewArea").hide(); 
          
                           	}
                       	}  
	                  	
	                  </script>
	                  <!--?댓글area-->
	                  <c:choose>
	                  	<c:when test="${!empty loginUser }">
	                  		<div class="comments-area">
							<div>
								<h4>커뮤니티 (<span id="replyCount"></span>)</h4>
							</div>
							<div id="review-writeBtn" align="right">
								<button type="button" class="genric-btn primary-border" onclick="writeReview();">글작성</button>
							</div>
							
							<div id="writeReviewArea" style="display:none">
								<div class="mt-10">
									<textarea class='review-textarea' id='communityContent' required></textarea>
								</div>
								<div align="right">
									<button class="genric-btn1 primary-border extrasmall" onclick="addCommunity();">등록</button>
								</div>
							</div>
							<br>
							<div class="replyArea"></div>
							<br>
							<div class="container1" align="center"></div>
						</div>
						<!--? end 리뷰 area-->
	                  	</c:when>
	                  </c:choose>
					
						
						<!--댓글 신고 모달-->
						<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-content">
										<!-- Modal body -->
										<div class="modal-body" align="center">
											<table>
												<tr>
													<td style="background: gray;" id="reportWriter"></td>
												</tr>
												<tr>
													<td style="background: gray;" id="reportContentTitle">제목
														:</td>
												</tr>
												<tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<br> 
														<label for="report-ad" style="width: 90%;">광고</label>
														<input type="radio" name="reportType" id="report-ad" value="부적절한 게시물"> 
														<label for="report-ad"></label>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-insult" style="width: 90%;">욕설</label>
														<input type="radio" name="reportType" id="report-insult" value="음란 또는 청소년에게 부적합한 내용"> 
														<label for="report-insult"></label>
													</td>
												</tr>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-obscence" style="width: 90%;">음란 또는 청소년에게 부적합한 내용</label> 
														<input type="radio" name="reportType" id="report-obscence" value="음란 또는 청소년에게 부적합한 내용">
														<label for="report-obscence"></label>
													</td>
												</tr>

												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">
														<label for="report-etc" style="width: 90%;">기타</label> 
														<input type="radio" name="reportType" id="report-etc" value="">
														<label for="report-etc"></label>
														<div id="reportReason"></div>
													</td>
												</tr>
												<tr>
													<th style="padding: 5px;">신고하기전에 잠깐?</th>
												</tr>
												<tr>
													<td>
														<div style="color: gray;">게시물로 인해 개인(단체)이 명예훼손 피해를
															입었거나 저작권을 침해 당한 경우에는 게시중단 서비스를 통해 신고해 주시기 바랍니다.</div>
													</td>
												</tr>
											</table>
											<br> 
											<input id="reportReplyNo" type="hidden" name="no" value=""> 
											<input id="reportedMemNo" type="hidden" name="no" value="">
											<button type="button" class="genric-btn primary small" data-dismiss="modal">취소</button>
											<button type="submit" class="genric-btn primary small" data-dismiss="modal" onclick="reportRequest();">신고하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--end of reportModal-->
						<!-- 댓글 신고 기타 사유 작성 모달 -->
						<div class="modal fade" id="etcReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-content">
										<!-- Modal body -->
										<div class="modal-body" align="center">

											<table>
												<tr>
													<td style="border-bottom: 1px solid grey; padding: 5px;">기타사유</td>
												</tr>
												<tr>
													<td><textarea id="reportReasonArea" cols="50" rows="4" style="resize: none;"></textarea></td>
												</tr>
											</table>

											<button type="button" class="genric-btn primary-border small" data-dismiss="modal">취소</button>
											<button type="button" class="genric-btn primary-border small" data-dismiss="modal" onclick="getReason();">확인</button>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!--댓글 글 삭제-->
							<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-content" align="center">
											<!-- Modal body -->
											<div class="modal-body">
												<p>삭제 하시겠습니까?</p>
												<input type="hidden" id="replyNo" value="">
												<button type="button" class="genric-btn primary small" id="closeModal" data-dismiss="modal">취소</button>
												<button type="button" class="genric-btn primary small" onclick="deleteReply();">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="modal fade" id="deleteReplyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered" role="document">
									<div class="modal-content">
										<div class="modal-content" align="center">
											<!-- Modal body -->
											<div class="modal-body">
												<p>삭제 하시겠습니까?</p>
												<input type="hidden" id="reReplyNo" value="">
												<input type="hidden" id="reReplyNo2" value="">
												<button type="button" class="genric-btn primary small" id="modalClose" data-dismiss="modal">취소</button>
												<button type="button" class="genric-btn primary small" onclick="deleteReReply();">삭제</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						<!-- end of 댓글 삭제 -->
						<!--?FAQ-->
	                  <div class="blog-author">
	                     <div><h2>FAQ</h2></div>  
	                     <br>
	                     <div class="media align-items-center">
								<div class="media-body">
									<c:forEach var="faq" items="${faqList }">
										<div class="faqQuestion">Q. ${faq.faqQuestion }</div>
										<p class="faqAnswer" style="display:hide;">A. ${faq.faqAnswer }</p>
										<br>
									</c:forEach>
								</div>
							</div>
	                  </div>
	                  <script>
	                  	$(".faqAnswer").hide(); 
	                  </script>
					<!--end of FAQ-->
	               </div>
	               <!--?right-side-blog-->
	               <!--? payment-->
	               <div class="col-lg-4">
	                  <div class="blog_right_sidebar">
	                     <!--사용할것-->
	                     <aside class="single_sidebar_widget post_category_widget">
	                        <h4 class="widget_title" style="color: #2d2d2d;">${l.lessonTitle}</h4>
	                        <table>
	                           <tr>
	                           <c:choose>
	                           	<c:when test="${!empty l.discount }">
	                           		<td class="discount-suggestion" colspan="2"><b>${l.discountPeriod }</b>개월할부시</td>
		                            <td class="discount-percentage">${l.discount}%</td>
	                           	</c:when>
	                           	<c:otherwise>
		                           	<td class="discount-suggestion" colspan="2"><b></b></td>
		                            <td class="discount-percentage"></td>
	                           	</c:otherwise>
	                           </c:choose>
	                              <td class="discount-price">
	                              	<fmt:formatNumber type="currency" value="${l.payTotal }"/>
	                              </td>
	                           </tr>
		                           <c:set var="disc" value="${l.discount }"/>
		                           <c:set var="divide" value="100"/>
		                           <c:set var="total" value="${l.payTotal }" />
		                           <c:set var="totalAmount" value="${total-(total*disc/100) }" />
	                           <tr>
	                           <c:choose>
	                           		<c:when test="${!empty l.discount }">
	                           			<td class="discount-suggestion" colspan="2"><b>총금액</b></td>
	                              		<td class="discount-price" colspan="2">
	                              			<fmt:formatNumber type="currency" value="${totalAmount }"/>
	                              		</td>
	                           		</c:when>
	                           		<c:otherwise>
	                           			<td class="discount-suggestion" colspan="2"><b>총금액</b></td>
	                              		<td class="discount-price" colspan="2">
	                              			<fmt:formatNumber type="currency" value="${l.payTotal }"/>
	                              		</td>
	                           		</c:otherwise>
	                           </c:choose>
	                           </tr>
	                           <tr> 
	                              <td class="discount-like" colspan="2" align="center">
		                           	<c:choose>
		                           		<c:when test="${!empty loginUser && isWished eq 'Y' }">
		                           			<input type="radio" data-show="liked" id="liked" name="heart" class="like-button" style="color:#ff3252 !important;" onclick="testBtn(this);">
		                           		</c:when>
		                           		<c:when test="${!empty loginUser && isWished eq 'N'}">
		                                 	<input type="radio" name="heart" data-show="unliked" id="unlike" class="like-button" style="color: #b2b2b2;" onclick="testBtn(this);;">
		                           		</c:when>
		                           		<c:otherwise>
		                           			<input type="radio" id="dislike" name="heart" class="like-button">
		                           		</c:otherwise>
		                           	</c:choose>
	                              </td>
	                              <td class="discount-share" colspan="2" align="center">
	                                <a href="javascript:;" id="kakao-link-btn"> 
								       <img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" />
								    </a>
	                              </td>
	                           </tr>
	                           <tr>
	                              <td colspan="4" align="center">
	                              <c:choose>
	                              	<c:when test="${empty loginUser }">
	                                 	<button class="genric-btn primary discount-pay disabled">로그인 후 사용</button>
	                              	</c:when>
	                              	<c:when test="${!empty loginUser && isWatching eq 'Y' }">
	                              		<button class="genric-btn primary discount-pay" id="curr">컬리큘럼으로 이동</button>
	                              	</c:when>
	                              	<c:otherwise>
	                              		<button class="genric-btn primary discount-pay" id="pay">수강하기</button>
	                              	</c:otherwise>
	                              </c:choose>
	                              </td>
	                           </tr>
	                        </table>
	                     </aside>
	                     <script>
	                     	$("#pay").click(function(){
	                     		location.href="payClass.le?lessonNo="+${l.lessonNo}
	                     	})
	                     	
	                     	$("#curr").click(function(){
	                     		location.href="detailCurri.cr?lessonNo="+${l.lessonNo}
	                     	})
	                     </script>
	                     <!--end of payment-->
	                  </div>
	               </div>
	               <!--end of right-side-blog -->
	            </div>
	         </div>
	      </section>
	      	<!-- 카톡 공유하기 스크립트 -->
	<script>
		Kakao.init('5e8cc8871721dbc11a35361c7cb406be')
	    Kakao.Link.createDefaultButton({
	        container: '#kakao-link-btn',
	        objectType : 'feed',
	        content : {
	            title : $('meta[property="og:title"]').attr('content'),
	            description : $('meta[property="og:description"]').attr('content'),
	            imageUrl : "http://localhost:8888/ee/resources/user/assets/img/logo/logo.png",
	          
	            link : {
	                mobileWebUrl : 'http://localhost:8888/ee',
	                webUrl : 'http://localhost:8888/ee',
	            },
	        },
	        social : {
	            likeCount : 200,
	            commentCount : 45,
	            sharedCount : 25,
	        },
	        buttons : [{
	                title : '웹으로 보기',
	                link : {
	                    mobileWebUrl : 'http://localhost:8888/ee',
	                    webUrl : 'http://localhost:8888/ee',
	                    },
	                }, ],
	    });
	
        	
			//페이지 이동
        	$("#pay").click(function(){
         		location.href="payClass.le?lessonNo="+${l.lessonNo}
         	})
         	
         	$("#curr").click(function(){
         		location.href="detailCurri.cr?lessonNo="+${l.lessonNo}
         	})
         	
			//하트 모양 변화주기
        	document.querySelector('.like-button').addEventListener('click', e => {
           	e.currentTarget.classList.toggle('liked');
          	});
			
			
			function testBtn(e) {
				console.log($(e).data("show"));
				
				if($(e).data("show") == "liked") {
					dislike();
				} else {
					like();
				};	
			}
         	//좋아요 카운트 없다운
         		function like(){
         			$.ajax({
         				url:"likeCount.le",
         				data:{
         					lessonNo:${l.lessonNo},
         					memNo:${loginUser.memNo}
         				},
         				success:function(result){
         					if(result == "success"){
	     						$("input[name=heart]").data("show","liked");
         						$("input[name=heart]").css("color","#ff3252");
         						console.log("like success");
         					} else {
         						console.log("like fail");
         					}
         				},
         				error:function(err){
         					console.log(err.message);
         					console.log("like ajax fail");
         				}
         			});
        			}
         	
  				function dislike(){
	     			$.ajax({
	     				url:"dislikeCount.le",
	     				data:{
	     					lessonNo:${l.lessonNo},
	     					memNo:${loginUser.memNo}
	     				},
	     				success:function(result){
	     					if(result == "success"){
	     						$("input[name=heart]").data("show","unlike");
	     						$("input[name=heart]").css("color","#b2b2b2");
	     						console.log("dislike success");
	     					} else {
	     						console.log("dislike fail");
	     					}
	     				},
	     				error:function(err){
	     					console.log(err.message);
	     					console.log("dislike ajax fail");
	     				}
	     			});
	     			
					
	     			}

         	$(document).ready(function(){
				$("#dislike").attr("disabled",true);
			});
         	
    </script>

	</main>
	      <!--================ Blog Area end =================-->
	   <jsp:include page="../common/footer.jsp" />
</body>
</html>