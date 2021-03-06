<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/user/assets/css/detailClassStyle.css">
<script src='<c:url value="resources/user/assets/js/vendor/jquery-1.12.4.min.js"/>'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<jsp:include page="../common/navBar.jsp" />
	
	<script>		
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
	<main>
	      <!--================Blog Area =================-->
	      <section class="blog_area single-post-area section-padding">
	         <div class="container">
	            <div class="row">
	               <div class="col-lg-8 posts-list">
	                  <div class="single-post">
	                     <div class="feature-img">
	                        <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_1.png" alt="">
	                     </div>
	                     <div class="blog_details">
	                        <h2 style="color: #2d2d2d;">클래스 상세 페이지 상단 타이틀 이미지</h2>
	                        <br><br>
	                        <!-- 클래스 소개 -->
	                        <div class="quote-wrapper">
	                           <div class="quotes">
	                              <h2>클래스 소개 </h2>
	                              <br>
	                              <table>
	                                 <tr>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/calendar.png"></td>
	                                    <td width="300px;"><h5>25주 수강 가능</h5></td>
	                                    <td width="70px;"><img src="resources/user/assets/img/detailClassPage/clipboard.png"></td>
	                                    <td width="200px;"><h5>15개 컨텐츠</h5></td>
	                                 </tr>
	                              </table>
	                              <br><br>
	                              <!--첫번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_2.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
	                              <!--두번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_3.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
	                              <!--세번째 소개 글과 이미지-->
	                              <img class="img-fluid" src="resources/user/assets/img/blog/single_blog_4.png" alt="">
	                              <p>
	                                 MCSE boot camps have its supporters and its detractors. Some people do not understand why you
	                                 should have to spend money on boot camp when you can get the MCSE study materials yourself at a
	                                 fraction of the camp price. However, who has the willpower
	                              </p>
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
	                                 <h6>1. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a" >
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
	                                 <h6>2. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a">
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
	                                 <h6>3. 간단한 컬리튤럼 설명회</h6>
	                                 <ol type="a">
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                    <li>리스트 항목</li>
	                                 </ol>
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
	                        <img src="resources/user/assets/img/blog/author.png" alt="">
	                        <div class="media-body">
	                              <h4>요가킹 홍길룡</h4>
	                           <p>품고 맺어, 돋고, 품에 말이다. 유소년에게서 그들에게 곳이 피어나는 가지에 
					                              청춘에서만 것이다. 청춘의 얼마나 싹이 밝은 칼이다. 유소년에게서 그러므로 물방아 
					                              열락의 싹이 실로 힘있다. 하는 들어 이 공자는 이상의 설레는 따뜻한 피다.
					                              시들어 이상을 있는 운다. 사람은 피가 방황하였으며, 얼음과 생의 밝은 같지 오직 
					                              사막이다. 사랑의 인생을 얼음에 피에 싹이 풀이 이상, 관현악이며, 말이다. 보배를 
					                              이상 곳으로 뿐이다. 이상 영락과 가치를 안고, 쓸쓸하랴? 방지하는 석가는 가지에 
					                              얼마나 이상 무엇을 있으랴? 공자는 때까지 피어나는 운다.
					                              열락의 너의 천지는 싸인 남는 돋고, 실현에 속에서 사막이다. 
					                              우리는 인생에 청춘의 것이다. 뭇 내는 노년에게서 보이는 설레는 용기가 그것은 
					                              얼마나 약동하다. 구하지 얼음이 오직 청춘을 별과 목숨을 말이다. 
					                              광야에서 희망의 동산에는 그들을 것은 때문이다. 
					                              수 하였으며, 날카로우나 작고 긴지라 속잎나고, 별과 아름다우냐? 
					                              찬미를 같이, 그것을 희망의 새 뿐이다.
					           </p>
	                        </div>
	                     </div>
	                  </div>
	                  <!--end of 튜터 소개 -->

						<!--?FAQ-->
	                  <div class="blog-author">
	                     <div><h2>FAQ</h2></div>  
	                     <br>
	                     <div class="media align-items-center">
	                        <div class="media-body">
	                           <div class="faqQuestion">Q. 자바 할 수 있을까요??</div>
	                           <p class="faqAnswer">A. 누구나 다 할 수 있습니다... WHAT!?!!?!</p>
	                           <br>
	                           <div class="faqQuestion">Q. 자바스프링 할 수 있을까요??</div>
	                           <p class="faqAnswer">A. 나는 모르겠다 모르겠다 모르곘다</p>
	                           <br>
	                           <div class="faqQuestion">Q. DB 할 수 있을까요??</div>
	                           <p class="faqAnswer">A. 너가 잘해야지 멍충아  후아아어리ㅏㅁㄴㅇㄹ WHAT!?!!?!</p>
	                           
	                        </div>
	                     </div>
	                  </div>
					<!--end of FAQ-->
	               </div>
	            </div>
	         </div>
	      </section>

	</main>
	      <!--================ Blog Area end =================-->
	   <jsp:include page="../common/footer.jsp" />
</body>
</html>