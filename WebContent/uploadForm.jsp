<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#box1 {
	text-align: center;
}

html, body {
	margin: 0;
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
    border: #00B8B8 solid 1px;
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
    max-width: 870px;
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
.label_b{
	width: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
    background-color: #00B8B8;
    color: white;
    border-radius: 30px;
    padding: 10px;
    font-size: 0.8em;
    cursor: pointer;
}
.File_submit{
	width: 10%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
    color: #00B8B8;
    padding: 10px;
    font-size: 0.8em;
    cursor: pointer;
    
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
    border-bottom: #00B8B8 solid 1px;
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
    background-color: #00B8B8;
    color: white;
    border-radius: 30px;
    padding: 10px;
    font-size: 0.8em;

    cursor: pointer;
}

.image-show {
    z-index: -1;
    display: inline-block;
    /* justify-content: center; */
    align-items: center;
    /* position: static; */
    width: 100%;
    height: 50%;


    
}

.img {
    /* margin : 20px;
    position: absolute; */
    
    margin: 0 auto;
}
.Submit{
   /*  margin-bottom: 100px;
	margin-top: 500px;  */
	margin-bottom: 20px;
	
}
.Tag_tag{
	width: 785px;
	border: #00B8B8 solid 2px;
}
.label_a{
	margin-top: 10px;
}
.body_window{
	box-sizing: border-box;
	display: block;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 60px;
	min-height: 600px;
	max-width: 1770px;
	padding-left: 30px;
	padding-right: 30px;
	width: auto;
}
.center_background {
	box-sizing: border-box;
	display: block;
	flex-wrap: auto;
	height : auto;
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 0;
	width: auto;
	max-width: 1200px;
	padding-left: 30px;
	padding-right: 30px;
	align-items: center;
	
	
}

.resetBtn{
	/* width: 175px;
    left: 1140px;
    position: absolute;
    border: none;
    display: none; */
    box-sizing: border-box;
    display: none;
    flex-wrap: auto;
    height: auto;
    /* margin-bottom: 30px; */
    margin-left: auto;
    /* margin-right: auto; */
    margin-top: 0;
    width: auto;
    max-width: 1200px;
    padding-left: 30px;
    padding-right: 30px;
    align-items: center;
    
}
.buttonContainer1 {
   color: #00B8B8;
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
                        <a class="nav-link nav-link-1 "  href="index.do">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2 active" aria-current="page" href="uploadForm.do">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3" href="myPageUpload.do?myPageNum=1">My Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-4" href="logout.do">Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg" >
      
    </div>
    <!-- 이미지 업로드 부분 -->
																		<!-- <div class="body_window"> -->	
		<form class="body_window" action="uploadPro.do" method="post" enctype="multipart/form-data">																		<!-- <form id="contact-form" method="post" enctype="multipart/form-data"> -->
	   		 <div class="center_background">
				<!-- <div id="hidden_container"> -->
					<button type="button" id="resetButton" class="buttonContainer1 resetBtn label_b" style="margin:0px auto; background-color:#00B8B8; border-color: transparent; color:white;">RESET</button> 
					<div class="image-upload" id="image-upload">
						<div class="button">
							<label class="label_b" for="chooseFile"> Choose File</label>
						</div>
						<input type="file" id="chooseFile" name="chooseFile"
							accept="image/*" onchange="loadFile(this)">
																							<!-- </form> -->
						
						<div class="fileContainer">
							<div class="fileInput">
								<p>파일이름:</p>
								<p id="fileName"></p>
							</div>
							<div class="buttonContainer">
									
								<div class="submitButton" id="submitButton">미리보기</div>
							</div>
						</div>
					</div>
	
					<div class="image-show" id="image-show"></div>
					
				</div>
	
				<script src="index.js"></script>
			<!-- </div> -->
			
			<div class="Tag" id="box1">
				<input type="text" name="tag" class="Tag_tag" placeholder="태그를 입력하세요.(ex:#강아지#반려견)" required="required" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
			</div>
	
			<div class="Remark"id="box1">
				<label class="label_a" for="story" >사진 설명</label>
	
				<textarea id="story" name="story" rows="5" cols="100" required="required"></textarea>
	
			</div>
			<div class="Submit" id="box1">
				<button class="btn btn-primary" type="submit" class="File_submit">
					<span>Upload</span>
				</button>
			</div>
     </form>
	<br><br>
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