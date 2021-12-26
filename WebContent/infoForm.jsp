<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>빛, 그리고 그리다8</title>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <!-- 검색바 추가 -->
   <!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
     	#box1 {
  			text-align: center;
  		}
       
        body, ul, li {
            padding:0; 
            margin:0;
        } 
        #top {
            width:400px
        }
        #top li {
            width:40%; 
            display:inline-block;
            *display:inline;
            *zoom:1;
        }
        #wrap {
            width:50%; 
            margin:0 auto; 
        }
        .input {
            width: 450px;
        }
        form {
            font-size: 20px;
            margin: 20px 0px 40px 0px;
        }
      
         hr {
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 50%;
            color: #00B8B8;
            height: 3px;
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
                        <a class="nav-link nav-link-1"  href="index.do">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2" href="uploadForm.do">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3 active" aria-current="page" href="myPageUpload.do?myPageUploadNum=1">My page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-4" href="logout.do">Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	  <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
        
    </div>
    <!-- 이곳은 회원정보 수정폼입니다 -->
    <br><br><br>
    <form action="infoPro.do" method="post">
        <div style="text-align: center;"><h2>회원정보 수정</h2></div>
        <!-- 추후에 <br>대신에 마진바텀으로 공간을 넣어주세요 -->
        <br><br>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 회원ID</li>
                    <li><span class="form-control tm-search-input" style="border: #00B8B8 solid 3px; width: 450px; height: 55px; background-color: #EAEAEA">${member.id }</span><input value="${member.id }" type="hidden" name="id" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 비밀번호</li>
                    <li><input class="form-control tm-search-input" value="${member.passwd }" type="password" name="passwd" style="border:#00B8B8 solid 3px; width: 450px;" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 이름</li>
                    <li><input class="form-control tm-search-input" value="${member.name }" type="text" name="name" style="border:#00B8B8 solid 3px; width: 450px;" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 닉네임</li>
                    <li><input class="form-control tm-search-input" value="${member.nickname }" type="text" name="nickname" style="border: #00B8B8 solid 3px; width: 450px;" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 전화번호</li>
                    <li><input class="form-control tm-search-input" value="${member.phone }" type="text" name="phone" style="border: #00B8B8 solid 3px; width: 450px;" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="wrap">
            <div id="top">
                <ul>
                    <li style="text-align: left;"># 이메일</li>
                    <li><input class="form-control tm-search-input" value="${member.email }" type="text" name="email" style="border: #00B8B8 solid 3px; width: 450px;" ></li>
                </ul>
            </div>
        </div>
        <hr>
        <div id="box1">
            <span>
                <button class="btn btn-primary" type="submit" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;">회원정보 변경</button>
            </span>
            <span>
                <!-- <input type="submit" value="회원 탈퇴" style="width: 140px; height: 40px;"> -->
                <button class="btn btn-primary" type="button" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;" onclick="location.href='deleteForm.do' ">회원 탈퇴</button> 
            </span>
        </div>
       

    </form>
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