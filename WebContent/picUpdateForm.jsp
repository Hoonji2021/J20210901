<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<script type="text/javascript">
 function noSpaceForm(obj) 
        {             
            var str_space = /\s/;               // 공백 체크
            if(str_space.exec(obj.value)) 
            {     // 공백 체크
                obj.focus();
                obj.value = obj.value.replace(' ','#'); // 공백제거
                return false;
            }
        }
 </script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빛, 그리고 그리다5</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
	<style type="text/css">
	.inputbar {
		/* width: 360px; */
		border-radius: 0;
		/* padding: 12px 15px; */
		color: #009999;
		border: none;
	}

	.inputbar:focus {
		border-color: #009999;
		box-shadow: 0 0 0 0.25rem rgb(0 153 153/ 0.25);
	}
</style>
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
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link nav-link-1 active" aria-current="page" href="index.do">Photos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-2" href="uploadForm.do">Upload</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-3" href="myPageUpload.do">My page</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-4" href="logout.do">Log out</a>
                </li>
            </ul>
            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
        <form class="d-flex tm-search-form">
            <input class="form-control tm-search-input" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success tm-search-btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>
    
	<!---------------------------- 본문------------------------------>
	
    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary"></h2>
        </div>
        <div class="row tm-mb-90">            
            <div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
                <img src="${pic.psave }" alt="Image" class="img-fluid" id="dbclick" style="width:1200px; height: 600px; ">
            </div>
    <!--------------------이미지 옆 상세 정보 -------------------------->
    
    		<!-----------------------수정창 ----------------------->
            <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
                <div class="tm-bg-gray tm-video-details" style="padding-bottom: 0; height: 600px;">
                	<form action="picUpdatePro.do?">
                		<input type="hidden" name="id" value="${id }">
                		<input type="hidden" name="pid" value="${pid }">
                		<br>
						<div class="mb-4">
							<h3 class="tm-text-gray-dark mb-3" style="display: inline-block;">작성자 :</h3>
							<span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${id}</span>
						</div>
					
						<div class="mb-4">
							<h3 class="tm-text-gray-dark mb-3" style="display: inline-block;">날짜 :</h3>
							<span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${pic.p_date }</span>
						</div>
						
						<div class="mb-4">
							<h3 class="tm-text-gray-dark mb-3" style="display: inline-block;">설명 :</h3>
							<span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp; <pre><textarea rows="3" cols="20" name="pcomment" class="inputbar"
							required="required">${pic.pcomment}</textarea></pre></span>
						</div>
						
						<div class="mb-4">
							<h3 class="tm-text-gray-dark mb-3" style="display: inline-block;">Tags : </h3>
							&nbsp;&nbsp;<input class="inputbar" type="text" name="tag" placeholder="#강아지#멍멍이" required="required" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
						</div>
                    
    
                      <div style="text-align: center;">
                        <input type="submit" class="btn btn-primary tm-btn-big" value="수정완료">
                      </div> 
               	</form>
            </div>
        </div>
        <!-- ---------------------수정창 끝--------------------- -->
        
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