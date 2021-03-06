<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="resources/user/assets/css/style.css">
<link rel="stylesheet" href="resources/user/assets/css/curriculum.css">
</head>
<body>

<!-- header -->
<jsp:include page="../common/navBar.jsp" />

<!-- 본문 -->
<div id="detail_video_box">

    <h1>${ video.videoName }</h1>

    <div class="iframe_box">
        <iframe src="${ video.videoUrl }" frameborder="0" allowfullscreen></iframe>
    </div>

    <h3>${ video.videoCont }</h3>

    <div id="video_button_box" align="center">
    	<c:choose>
	    	<c:when test="${ video.preVideoNo != null }">
	        	<button class="video_button" onclick="location.href='detailVideo.cr?videoNo=${video.preVideoNo}&memNo=${ loginUser.memNo }&lessonNo=${ video.lessonNo }';">이전 강의</button>
	        </c:when>
	        <c:otherwise>
	        	<button class="video_button" onclick="location.href='detailVideo.cr?videoNo=${video.preVideoNo}&memNo=${ loginUser.memNo }&lessonNo=${ video.lessonNo }';" disabled>이전 강의</button>
	        </c:otherwise>
        </c:choose>
        <button class="video_button" onclick="location.href='videoList.cr?lessonNo=${video.lessonNo}';">목록으로</button>
        <c:choose>
	    	<c:when test="${ video.preVideoNo != null }">
	        	<button class="video_button" onclick="location.href='detailVideo.cr?videoNo=${video.nextVideoNo}&memNo=${ loginUser.memNo }&lessonNo=${ video.lessonNo }';">다음 강의</button>
	        </c:when>
	        <c:otherwise>
	        	<button class="video_button" onclick="location.href='detailVideo.cr?videoNo=${video.nextVideoNo}&memNo=${ loginUser.memNo }&lessonNo=${ video.lessonNo }';" disabled>다음 강의</button>
	        </c:otherwise>
        </c:choose>
        
    </div>

</div>

<!-- footer -->
<jsp:include page="../common/footer.jsp" />

</body>
</html>