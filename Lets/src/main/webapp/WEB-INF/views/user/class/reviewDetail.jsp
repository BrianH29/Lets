<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/reviewDetailPage.css">
</head>
<body>

	<jsp:include page="../common/navBar.jsp" />
	<main>
      <!--================Blog Area =================-->
      <section class="blog_area single-post-area review-padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-8">
                  <!--?댓글area-->
                  <div class="review-area">
                    <div class="review-header">
                        <div id="review-count">
                            <h2>후기 10</h2>
                        </div>
                        <div id="review-writeBtn" align="right">
                          <button type="button" class="genric-btn primary-border" onclick="writeReview();">리뷰작성</button>
                        </div>
                    </div>
                    <!-- 조건문 줘야함  수강하지 않을경우 -->
                    <script>
                        function writeReview(){
                            alert('수강 후 리뷰 작성 가능합니다.');
                        }
                    </script>
                    <!--?리뷰 작성하기 클릭시 보여지게 할 창-->
                    <br><br>
                    <div class="mt-10">
                        <textarea class="review-textarea" placeholder="Message" onfocus="this.placeholder = ''"
                        onblur="this.placeholder = 'Message'" required></textarea>
                    </div>
                    <div class="review-writeArea">
                        <div id="review-writeRatting">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div id="submitReview" align="right"><button class="genric-btn1 primary-border extrasmall">등록</button></div>
                    </div>
                    <!--end of 리뷰 작성하기-->
                    <br><br><br>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/cat1.jpg" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="review-ratting">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="reply-btn">
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">삭제</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/comment_2.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="review-ratting">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="reply-btn">
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">삭제</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="comment-list">
                        <div class="single-comment justify-content-between d-flex">
                           <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                 <img src="resources/user/assets/img/comment/comment_3.png" alt="">
                              </div>
                              <div class="desc">
                                 <p class="comment">
                                    Multiply sea night grass fourth day sea lesser rule open subdue female fill which them
                                    Blessed, give fill lesser bearing multiply sea night grass fourth day sea lesser
                                 </p>
                                 <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                       <span>Emilly Blunt</span>
                                       <p class="date">December 4, 2017 at 3:12 pm </p>
                                    </div>
                                    <div class="review-ratting">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="reply-btn">
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">답장</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">수정</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">삭제</a></div>
                                       <div class="communityBtn"><a href="#" class="btn-reply text-uppercase">신고</a></div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!--? end 리뷰 area-->
            </div>
         </div>
      </section>
      <!--================ Blog Area end =================-->
   </main>
   
   <jsp:include page="../common/footer.jsp" />
</body>
</html>