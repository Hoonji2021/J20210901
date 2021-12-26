<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빛, 그리고 그리다6</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
</head>

<body>
    <!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.do">
                <i class="fas fa-film mr-2"></i>
                빛, 그리고 그리다
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link nav-link-1" href="index.do">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2" href="uploadForm.do">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3 active" aria-current="page" href="myPageUpload.do?myPageUploadNum=1" >My Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-4" href="logout.do">Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

	<div class="tm-hero d-flex justify-content-center align-items-center"
		data-parallax="scroll" data-image-src="img/hero.jpg"
		style="color: white;">
		<div style="font-size: 5.0em;">My page</div>
	</div>
	<br><br>
	<!-- 3개 네비 -->
	
	<div class="row justify-content-center text-center" style="margin:0 auto; display:flex;
  align-items:center; float: none;">
		<div class="col col-lg-2">
			<button type="button" class="btn btn-outline-info" onclick="location.href='myPageUpload.do?myPageNum=1';">내가 업로드 사진</button>
		</div>
		<div class="col col-lg-2">
			<button type="button" class="btn btn-outline-info" onclick="location.href='myPageLike.do?myPageNum=1';">내가 좋아요 사진</button>
		</div>
		<div class="col col-lg-2">
			<button type="button" class="btn btn-outline-info" onclick="location.href='myPageDownload.do?myPageNum=1';">내가 다운로드 사진</button>
		</div>
		<div class="col col-lg-2">
			<button type="button" class="btn btn-outline-info" onclick="location.href='infoForm.do';">회원정보 수정</button>
		</div>
	</div>



	<div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
                내가 다운로드한 사진
            </h2>
            <div class="col-6 d-flex justify-content-end align-items-center">
                <form action="" class="tm-text-primary">
                    Page ${myPageNum } of ${totPage }
                </form>
            </div>
        </div>
        
        <!-- 사진 구현 -->
        <div class="row tm-mb-90 tm-gallery" style="margin-bottom: 30px;">
            <c:forEach var="pic" items="${myDownloadList }" varStatus="status">
        		<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
        			<figure class="effect-ming tm-video-item">
        				<img src="${pic.psave }" alt="Image" class="img-fluid" >
        			<figcaption class="d-flex align-items-center justify-content-center">
        				<h2>${tagList[status.index] }</h2>
                       	<a href="picInfo.do?pid=${pic.pid }">View more</a>
        			</figcaption>
        			</figure>
        			<div class="d-flex justify-content-between tm-text-gray">
	                    <span class="tm-text-gray-light">${pic.p_date }</span>
	                    <span>${pic.pcount } views</span>
                	</div>
                </div>
        	</c:forEach>
        </div> 
        
        <!-- 페이징 -->
		<c:set var="page" value="${(param.p==null)?1:param.p }"/>
        <div class="row tm-mb-90">
			<div class="d-flex justify-content-center align-items-center tm-paging-col">
				<div class="col-md-12 text-center d-flex justify-content-center">
					<c:set var="startNum" value="${myPageNum-(myPageNum-1)%5 }"/>
					<c:set var="lastNum" value="${totPage }"/>
					<c:if test="${startNum > 1}">
						<a href="myPageDownload.do?myPageNum=${startNum-1 }" class="tm-paging-link col-md-auto">이전</a>
					</c:if>
					<c:if test="${startNum <= 1}">
						<span onclick="alert('이전 페이지가 없습니다');" class="tm-paging-link col-md-auto">이전</span>	
					</c:if>
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${(startNum+i) <= lastNum }">
							<a href="myPageDownload.do?myPageNum=${startNum+i }" class="tm-paging-link col-md-auto">${startNum+i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${startNum+5 < lastNum }">
						<a href="myPageDownload.do?myPageNum=${startNum+5 }" class="tm-paging-link col-md-auto">다음</a>
					</c:if>
					<c:if test="${startNum+5 >= lastNum }">
						<span onclick="alert('다음 페이지가 없습니다');" class="tm-paging-link col-md-auto">다음</span>	
					</c:if>
				</div>
			</div>
		</div> <!-- row -->
    </div> <!-- container-fluid, tm-container-content -->

    <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">빛, 그리고 그리다</h3>
                    <p>빛 그리고 그리다는 저작권이 없는 사진을 공유하는<br>활발한 사이트입니다.</p>
             	 	<p>모든 콘텐츠는 예술가에게 허가나 신용을 제공하지 않고 <br>안전하게 사용할 수 있습니다. </p>
               		<p>가입 후 사진을 무료로 다운로드하고 <br>당신의 사진을 사람들과 공유해보세요.</p>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">Contact</h3>
                    <p>abc@abc.com</p>
                </div>
            </div>
        </div>
    </footer>
	<script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function () {
            $('body').addClass('loaded');
        });
    </script>
</body>

</html>