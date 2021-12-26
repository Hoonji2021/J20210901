<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
      <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빛, 그리고 그리다7</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <!-- 검색바 추가 -->
   <!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
        integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  
  <script type="text/javascript">
	function chk() {
		if (frm.passwd.value != frm.passwd3.value) {
			alert("암호가 다릅니다");
			frm.passwd3.focus();
			return false;
		}
		return true;
	}
</script>
  
    <style>
    	
     
     #check {
            text-align:center
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
        }
        hr {
            margin: auto;
            margin-top: 20px;
            margin-bottom: 20px;
            width: 40%;
            color: #00B8B8;
            height: 3px;
        }
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
            color: white;
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
                        <a class="nav-link nav-link-1"  href="index.do">Photos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-2" href="uploadForm.do">Upload</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-3" href="myPageUpload.do">My page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-4 active" aria-current="page" href="loginForm.do">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="img/hero.jpg">
      
    </div>

    <!-- 이곳은 회원가입 폼 입니다 -->
     <br><br><br>
    <form action="joinPro.do" name="frm" onsubmit="return chk()">
        <div style="text-align: center;"><h2>회원가입</h2></div>
        <!-- 추후에 <br>대신에 마진바텀으로 공간을 넣어주세요 -->
        <br><br>
      
        <div style="justify-content: center; display: flex;">
      	 
        	<div style="width:12%;font-size:20px;text-align:center; margin-top: 10px;">회원 ID</div> 
        		<input type="text" name="id" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="아이디를 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px;text-align:center; margin-top: 10px;">비밀번호</div> 
        		<input type="password" name="passwd" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="비밀번호를 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px;text-align:center; margin-top: 10px;">비밀번호<br>확인</div> 
        		<input type="password" name="passwd" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="비밀번호를 재입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px; text-align:center; margin-top: 10px;">이름</div> 
        		<input type="text" name="name" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="이름을 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px; text-align:center; margin-top: 10px;">닉네임</div> 
        		<input type="text" name="nickname" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="이름을 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px; text-align:center; margin-top: 10px;">휴대전화</div> 
        		<input type="tel" name="phone" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="이름을 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
      	 
        		<div style="width:12%;font-size:20px; text-align:center; margin-top: 10px;">이메일</div> 
        		<input type="email" name="email" class="form-control tm-search-input" style="border: #00B8B8 solid 3px;" placeholder="이름을 입력하세요." required="required">
         
      	</div>
        <hr>
        <div style="justify-content: center; display: flex;">
        <span style="width: 100px; text-align: center;">
                    <button class="btn btn-primary" type="submit" style="font-size:15px; WIDTH: 100pt; HEIGHT: 25pt; padding: 0;" onclick="location.href='joinForm.do'">회원가입</button>
                </span>
        </div>
        
       <!--  <div style="text-align: center;">
            <span>
                <input type="submit" value="회원가입" style="width: 116px; height: 32px;">
            </span>
            
        </div> -->
    </form>
     
    <br><br><br><br><br> 
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
    