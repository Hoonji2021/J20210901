<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>빛, 그리고 그리다4</title>
    <!-- 검색바 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <!-- 나머지 html 틀 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!-- 이미지 미리보기 스크립트 -->
    <script language='javascript'>

		function fileSize() {
		alert(document.aaa.pre.fileSize);
		}
		
		function dreamkos_imgview()
		{
		  img_pre = 'pre';
		  if(event.srcElement.value.match(/(.jpg|.jpeg|.gif|.png)/)) {
		    document.images[img_pre].src = event.srcElement.value;
		    document.images[img_pre].style.display = '';
		  }
		  else {
		  document.images[img_pre].style.display = 'none';
		  }
		}
	
	</script>
    <style>
/* 검색바 CSS */
  .searchbar {
            margin-bottom: auto;
            margin-top: auto;
            height: 60px;
            background-color: #353b48;
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
            color: white;
            text-decoration: none;
        } 

/* 서현님 헤더 푸터 */
html, body {
	margin: 0;
}

#box1 {
	text-align: center;
}

.Remark {
	position: center;
}

.button {
	display: flex;
	justify-content: center;
}

label {
	cursor: pointer;
	font-size: 1em;
}

/* 못생긴 기존 input 숨기기 */
#chooseFile {
	visibility: hidden;
}
.label_a,
textarea {
    font-size: 1.0rem;
    letter-spacing: 1px;
}
textarea {
    padding: 10px;
    max-width: 100%;
    line-height: 1.5;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    margin: 10px;
    position: relative;
    
}

.label_a {
    display: block;
    margin-bottom: 10px;
}
.file_background{
	position: fixed;
}
.container {
    display: flex;
    height: 100%;
    flex-direction: column;
}

.image-upload {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.button {
    display: flex;
    justify-content: center;
}

label {
    cursor: pointer;
    font-size: 1em;
}

#chooseFile {
    visibility: hidden;
}

.fileContainer {
    display: flex;
    justify-content: center;
    align-items: center;
}

.fileInput {
    display: flex;
    align-items: center;
    border-bottom: solid 2px black;
    width: 60%;
    height: 30px;
}

#fileName {
    margin-left: 5px;
}

.buttonContainer {
    width: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
    background-color: black;
    color: white;
    border-radius: 30px;
    padding: 10px;
    font-size: 0.8em;

    cursor: pointer;
}

.image-show {
    z-index: -1;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    width: 50%;
    height: 50%;
}

.img {
    margin : 20px;
    position: absolute;
}
.Submit{
	margin-bottom: 100px;
	margin-top: 500px;
}
.Tag_tag{
	width: 795px;
}
.label_a{
	margin-top: 10px;
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
    <!-- 네비게이션 -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">
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
                        <a class="nav-link nav-link-1 "  href="index.jsp">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2 active" aria-current="page" href="uploadForm.jsp">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3" href="myPage.jsp">My page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-4" href="loginForm.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg" >
      
    </div>
    <!-- 이미지 업로드 부분 -->
	<form id="contact-form" method="post" enctype="multipart/form-data">
		<div class="center_background">
			<div class="container">
				<div class="image-upload" id="image-upload">

					<form method="post" enctype="multipart/form-data">
						<div class="button">
							<label for="chooseFile">  이미지 업로드 클릭(사진으로 수정예정)  </label>
						</div>
						<input type="file" id="chooseFile" name="chooseFile"
							accept="image/*" onchange="loadFile(this)">
					</form>

					<div class="fileContainer">
						<div class="fileInput">
							<p>FILE NAME:</p>
							<p id="fileName"></p>
						</div>
						<div class="buttonContainer">
							<div class="submitButton" id="submitButton">SUBMIT</div>
						</div>
					</div>
				</div>

				<div class="image-show" id="image-show"></div> 
			</div>

			<script src="index.js"></script>
		</div>
		<div class="Submit" id="box1">
			<button type="submit" class="File_submit">
				<span>첨부버튼</span>
			</button>
		</div>
		<div class="Tag" id="box1">
			<input type="text" name="tag" class="Tag_tag" placeholder="태그 입력">
		</div>

		<div class="Remark"id="box1">
			<label class="label_a" for="story">사진 설명</label>

			<textarea id="story" name="story" rows="5" cols="100"></textarea>

		</div>

	</form>

	<br><br>
 <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">About Catalog-Z</h3>
                    <p>Catalog-Z is free <a rel="sponsored" href="https://v5.getbootstrap.com/">Bootstrap 5</a> Alpha 2
                        HTML Template for video and photo websites. You can freely use this TemplateMo layout for a
                        front-end integration with any kind of CMS website.</p>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">Our Links</h3>
                    <ul class="tm-footer-links pl-0">
                        <li><a href="#">Advertise</a></li>
                        <li><a href="#">Support</a></li>
                        <li><a href="#">Our Company</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
                    <ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
                        <li class="mb-2"><a href="https://facebook.com"><i class="fab fa-facebook"></i></a></li>
                        <li class="mb-2"><a href="https://twitter.com"><i class="fab fa-twitter"></i></a></li>
                        <li class="mb-2"><a href="https://instagram.com"><i class="fab fa-instagram"></i></a></li>
                        <li class="mb-2"><a href="https://pinterest.com"><i class="fab fa-pinterest"></i></a></li>
                    </ul>
                    <a href="#" class="tm-text-gray text-right d-block mb-2">Terms of Use</a>
                    <a href="#" class="tm-text-gray text-right d-block">Privacy Policy</a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-md-7 col-12 px-5 mb-3">
                    Copyright 2020 Catalog-Z Company. All rights reserved.
                </div>
                <div class="col-lg-4 col-md-5 col-12 px-5 text-right">
                    Designed by <a href="https://templatemo.com" class="tm-text-gray" rel="sponsored"
                        target="_parent">TemplateMo</a>
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

<!-- https://bootsnipp.com/snippets/exVWQ 4장의 사진을 넘기면서 보여주기  -->
<!-- https://bootsnipp.com/snippets/xBdN 한장의 사진을 넘기면서 보여주기 -->