<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빛, 그리고 그리다1</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <!-- 검색바 추가 -->
   <!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
        /* 검색바 CSS */
        .searchbar {
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #00B8B8;
            border-radius: 30px;
            padding: 10px;
        }

        .search_input {
            color: white;
            border: 0;
            outline: 0;
            background: none;
            width: 0;
            caret-color: transparent;
            line-height: 40px;
            transition: width 0.4s linear;
        }

        .searchbar:hover>.search_input {
            padding: 0 10px;
            width: 450px;
            caret-color: red;
            transition: width 0.4s linear;
        }

        .searchbar:hover>.search_icon {
            background: white;
            color: #e74c3c;
        }

        .search_icon {
            height: 40px;
            width: 40px;
            float: right;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 50%;
            color: #e74c3c;
            text-decoration: none;
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
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a class="nav-link nav-link-3" href="myPageUpload.do?myPageNum=1">My page</a>
                    </li>
                    <li class="nav-item">
                    	<c:if test="${id==null }">
                        	<a class="nav-link nav-link-4" href="loginForm.do">Login</a>
                        </c:if>
                        <c:if test="${id!=null }">
                        	<a class="nav-link nav-link-4" href="logout.do">Log out</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

      <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
        <form class="d-flex tm-search-form" action="search.do">
            <input class="form-control tm-search-input" type="search" name="search" placeholder="Search" aria-label="Search">
           <input type="hidden" name="searchPageNum" value="1">
            <button class="btn btn-outline-success tm-search-btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>

    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">Latest Photos</h2>
        </div>
        
        <div class="row tm-mb-90 tm-gallery" style="margin-bottom: 30px;">
            <c:forEach var="pic" items="${picList }" varStatus="status">
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

        <!-- 검색바 추가 -->
               <div class="container h-100">
         <form class="d-flex justify-content-center" action="search.do?" style="background-color: transparent; ">
            <div class="d-flex justify-content-center h-100">
               <div class="searchbar">
                  <input class="search_input" type="search" name="search" placeholder="Search" aria-label="Search" autocomplete="off">
                     <input type="hidden" name="searchPageNum" value="1">
                  <button class="search_icon" type="submit" style="background-color:white; border-color: transparent">
                           <i class="fas fa-search"></i> 
                     </button>
               </div>
            </div>
         </form>
      </div>
        <br><br><br><br>
        
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