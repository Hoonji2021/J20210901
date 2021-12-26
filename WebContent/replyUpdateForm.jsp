<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<style>
hr.hrzz {
    color: #009999;
    border : 1px;
    border-style: 1px dotted;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function chk() {
	if(!frm.passwd2.value){
		alert("비밀번호를 입력하세요");
		frm.passwd2.focus();
		return false;
		
	}
	if (frm.passwd.value != frm.passwd2.value) {
		alert("암호가 다릅니다");
		frm.passwd2.focus();
		return false;
	}
	
	return true;
}

$(function() {
	$('#remclick').click(function() {
		alert("좋아요 취소!");
		location.href="like.do?id=${id}&pid=${pid}&acttype=${acttype}";
		
	});
	$('#addclick').click(function() {
		alert("좋아요 클릭!")
		location.href="like.do?id=${id}&pid=${pid}&acttype=${acttype}";
	});
	$('#noclick').click(function() {
		var answer;
		answer = confirm("회원만 가능한 기능입니다. 로그인 하시겠습니까?");
		if(answer == true){
			location.href="loginForm.do";
		}else
			history.go(-1);
	});
	
	$('#picdelete').click(function() {
		var check;
		check = confirm("정말 삭제하시겠습니까?");
		if(check == true){
			location.href="deletePicPro.do?id=${id}&pid=${pid}";
		}else
			history.go(-1);
	});
	
});

</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빛, 그리고 그리다5</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	
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
        <form class="d-flex tm-search-form">
            <input class="form-control tm-search-input" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success tm-search-btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </div>
    
	<!---------------------------- 본문------------------------------>
	
    <div class="container-fluid tm-container-content tm-mt-60" style="margin-top: 30px;">
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary"></h2>
        </div>
        <div class="row tm-mb-90">            
            <div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
                <img src="${pic.psave }" alt="Image" class="img-fluid" id="dbclick" style="width:1200px; height: 600px; ">
            </div>
            <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
                <div class="tm-bg-gray tm-video-details">
                <c:if test="${state==1 }">
                <div style="display: inline-block; float: right;">
                       	<button type="button" class="btn btn-outline-secondary btn-sm" id="picdelete" >사진삭제</button>
                     </div >
                     <div style="display: inline-block; float: right;">
                       	<button type="button" onclick="location.href='picUpdateForm.do?id=${id}&pid=${pid }'" class="btn btn-outline-secondary btn-sm" >사진수정</button>
                     </div>
                 </c:if>
                <div class="tm-bg-gray tm-video-details" style="padding:0px; height: 500px;">
                	<div class="mb-4 d-flex flex-wrap" >
                       <div>
                       <!-------------------- 좋아요 -------------------->
                       		<c:if test="${id!=null }">
								<c:if test="${acttype==1 }">
									<a id="remclick" >
										<button style="border: 0;">
											<img src="img/heart1.png" width="30px" height="30px">
										</button>
									</a>
								</c:if>
								
								<c:if test="${acttype==0 }">
									<a id="addclick"  >
										<button style="border: 0;">
											<img src="img/heart0.png" width="30px" height="30px">
										</button>
									</a>
								</c:if>
							</c:if>
								<c:if test="${id==null }">
									<a id="noclick" onclick="noclick()">
										<button style="border: 0;">
											<img src="img/heart0.png" width="30px" height="30px">
										</button>
									</a>
								</c:if>
                       </div>
                        <div class="mr-4 mb-2">
                            <span class="tm-text-gray-dark">좋아요수 : ${pic.plike }회</span>
                        </div>
                        <div class="mr-4 mb-2" style="width: 170px;">
                        	<span><img src="img/heart0.png" width="30px" height="30px" style="visibility: hidden;"></span>
                            &nbsp;<span class="tm-text-gray-dark">조회수 : ${pic.pcount } 회</span>
                        </div>
                    </div>
                    <p class="mb-4">
                     <h3 class="tm-text-gray-dark mb-3" style="display: inline-block;"> 작성자 : </h3> <span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${pic.id }</span> 
                    </p>                 
                   
                    <p class="mb-4">
                      <h3 class="tm-text-gray-dark mb-3" style="display: inline-block;"> 날짜 : </h3> <span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${pic.p_date }</span>
                    </p>
                    <div class="mb-4">
              <!--------------- 설명 ---------------->
                        <h3 class="tm-text-gray-dark mb-3">설명 : </h3>
                        <p>${pic.pcomment }</p>
                    </div>
              <!------------ 태그 --------------->
                    <div>
                    	<!-- 버튼클릭시 찾아가게할거면 태그에 각각  url걸어놔야함.. -->
                        <h3 class="tm-text-gray-dark mb-3">Tags : </h3>
                        <c:if test="${tag!=null }">
                        	<c:forEach var="tags" items="${tag }">
                        <a href="search.do?search=${tags }&searchPageNum=1" class="tm-text-primary mr-4 mb-2 d-inline-block">${tags }&nbsp;</a>
                     		</c:forEach>
                     	</c:if>
                    </div>
              <!------------다운로드--------------->
                    <br>
                    
                      <div class="text-center mb-5">
                        <a onclick="location.href='downloadCount.do?pid=${pic.pid }';" href='${pic.psave }' class="btn btn-info btn-lg" download='${pic.psave }'>Download</a>
                    	<div>다운로드 수 : ${pic.pdown }</div>
                    </div>
                    
                  </div>  
                </div>
            </div>
        </div>
        
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary">
                Comment(${fn:length(rlist)})
            </h2>
        </div>
        <hr >
		<!------------- 댓글 수정------------- -->
		<c:if test="${pid != null }"> <!-- pid가 null이 아니면 댓글 리스트출력 -->
		<c:forEach var="list" items="${rlist }"> <!-- 댓글리스트에 있는 것들 하나씩 출력 -->
			 <c:if test="${list.prseq == reply.prseq }"> <!-- 댓글 리스트중 수정 버튼 누른 댓글만 아래내용으로 출력  -->
					<form action="replyUpdatePro.do?id=${id }" name="frm" onsubmit="return chk()">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="form-inline mb-2">
										<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label> &nbsp;&nbsp;${id} 
										<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i> </label> 
										<input type="password" class="form-control ml-2" placeholder="Enter password"
											name="passwd2"> 
										<input type="hidden" name="passwd" value="${member.passwd }"> 
										<input type="hidden" name="pid" value="${pid }">
										<input type="hidden" name="prseq" value="${reply.prseq }">
									</div> 
										<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reply">${reply.reply }</textarea>
										<button type="submit" class="btn btn-info mt-3">수정완료</button>
								</li>
							</ul>
						</div>
					</form>
				</c:if>
			<c:if test="${list.prseq != reply.prseq }"><!-- 수정할 댓글이 아닌 녀석들은 아래내용으로 출력 reply.prseq가 수정할 댓글번호 -->
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
							 &nbsp;&nbsp;${list.id }&nbsp;&nbsp;${list.pr_date }
						</div> 
						<div class="form-control" id="exampleFormControlTextarea1">${list.reply }</div>
					</li>
				</ul>
			</div>
			</c:if>
		</c:forEach>
			</c:if>
		<!-- 	<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
							 &nbsp;&nbsp;한지민123 <input >
						</div> 
						<div class="form-control" id="exampleFormControlTextarea1">zzz</div>
					</li>
				</ul>
			</div>
 -->
	</div> <!-- container-fluid, tm-container-content -->

    <footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
        <div class="container-fluid tm-container-small">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
                    <h3 class="tm-text-primary mb-4 tm-footer-title">About Catalog-Z</h3>
                    <p>Integer ipsum odio, pharetra ac massa ac, pretium facilisis nibh. Donec lobortis consectetur molestie. Nullam nec diam dolor. Fusce quis viverra nunc, sit amet varius sapien.</p>
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
                    Designed by <a href="https://templatemo.com" class="tm-text-gray" rel="sponsored" target="_parent">TemplateMo</a>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="js/plugins.js"></script>
    <script>
        $(window).on("load", function() {
            $('body').addClass('loaded');
        });
    </script>
</body>
</html>