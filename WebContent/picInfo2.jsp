<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<%
	String context = request.getContextPath();
%>
<style>
hr.hrzz {
    color: #009999;
    border : 1px;
    border-style: 1px dotted;
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
            color: red;
            text-decoration: none;
        }
        .upload{
			margin: 35px 20px;
		}
		#btn{
			width: 120px;
			height: 30px;
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
function chk2() {
	var check;
	check = confirm("정말 삭제하시겠습니까?");
	if(check == true){
		return true;
	}else if(check == false){
		return false;
	}
	
	return true;
}
function remlike(){ 
	$.ajax({ 
		url: "<%=context%>/like.do", 
		type: "POST", 
		dataType: "json", 
		//by 지훈, 아이디가 like_form인 곳의 모든 정보를 가져와 파라미터 전송 형태(표준 쿼리형태)로 만들어줌 
		data: $('#remLike').serialize(),
		
		//by 지훈, ajax통신 성공시 넘어오는 데이터 =data 
		success: function(data){ 
			console.log("acttype ->"+data.acttype);
			if(data.acttype == 1){
				$('#removeHeart').attr("src", "img/heart1.png");
				//by 지훈,id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
				$("#like_result").html(data.likeCnt); 
			}else if(data.acttype == 0){
				$('#removeHeart').attr("src", "img/heart0.png");
				$("#like_result").html(data.likeCnt); 
			}
			
			 
		}, 
		error: function (request, status, error){ 
							alert("ajax실패") } 
		}); 
	}



 $(function() {
	
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
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

    <div class="tm-hero d-flex justify-content-center align-items-center"
      data-parallax="scroll" data-image-src="img/hero.jpg">
      <form class="d-flex tm-search-form" action="search.do">
         <input class="form-control tm-search-input" type="search"
            name="search" value="${search }" aria-label="Search"> <input
            type="hidden" name="searchPageNum" value="1">
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
                       				<!-- 회원일 때 -->
                       				<button style="border: 0;" type="button" onclick="return remlike()">
										<!-- 좋아요를 누른 상태일때 -->
										<c:if test="${acttype == 1 }">
											<img id="removeHeart" src="img/heart1.png" width="30px" height="30px">
										</c:if>
										<!-- 좋아요를 안누른 상태일때 -->
										<c:if test="${acttype == 0 }">
											<img id="removeHeart" src="img/heart0.png" width="30px" height="30px">
										</c:if>
									</button>
									<form id="remLike" style="display: inline-block;">
										<input type="hidden" name="acttype" value="${acttype}">
										<input type="hidden" name="id" value="${id}">
										<input type="hidden" name="pid" value="${pic.pid}">
										<div class="mr-4 mb-2" style="display: inline-block;">
                            				<span>좋아요 수 : <span class="tm-text-gray-dark" id="like_result">${pic.plike }</span>회</span> 
                        				</div>
									</form>	
				
							</c:if>
							<!-- 비회원이 좋아요 눌렀을 때 -->
							<c:if test="${id==null }">
								<a id="noclick" onclick="noclick()">
									<button style="border: 0;">
										<img src="img/heart0.png" width="30px" height="30px">
									</button>
								</a>
								<div class="mr-4 mb-2" style="display: inline-block;">
                            			<span>좋아요 수 : <span class="tm-text-gray-dark" id="like_result">${pic.plike }</span>회</span>
                        		</div>
							</c:if>
                       </div>
                        
                        <div class="mr-4 mb-2" style="width: 170px;">
                        	<span><img src="img/heart0.png" width="30px" height="30px" style="visibility: hidden;"></span>
                            &nbsp;<span class="tm-text-gray-dark">조회수 : ${pic.pcount } 회</span>
                        </div>
                    </div>
                    <p class="mb-4">
                     <h4 class="tm-text-gray-dark mb-3" style="display: inline-block;"> 작성자 : </h4> <span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${pic.id }</span> 
                    </p>                 
                   
                    <p class="mb-4">
                      <h4 class="tm-text-gray-dark mb-3" style="display: inline-block;"> 날짜 : </h4> <span class="tm-text-gray-dark" style="font-size: 20px;">&nbsp;&nbsp;${pic.p_date }</span>
                    </p>
                    <!--------------- 설명 ---------------->
                    <div class="mb-4">
                        <h4 class="tm-text-gray-dark mb-3">설명 : </h4>
                        <p>${pic.pcomment }</p>
                    </div>
              <!------------ 태그 --------------->
                    <div>
                    	<!-- 버튼클릭시 찾아가게할거면 태그에 각각  url걸어놔야함.. -->
                        <h4 class="tm-text-gray-dark mb-3">Tags : </h4>
                        <c:if test="${tag!=null }">
                        	<c:forEach var="tags" items="${tag }">
                        <a href="search.do?search=${tags }&searchPageNum=1" class="tm-text-primary mr-4 mb-2 d-inline-block">${tags }&nbsp;</a>
                     		</c:forEach>
                     	</c:if>
                    </div>
              <!------------다운로드--------------->
                    <br>
                    
                      <div class="text-center mb-5">
                        <a onclick="location.href='downloadCount.do?pid=${pic.pid }';" href='${pic.psave }' class="btn btn-primary tm-btn-sm" download='${pic.psave }'>Download</a>
                    	<div style="font-size: 13px;">다운로드 수 : ${pic.pdown }</div>
                    </div>
                    
                  </div>  
                </div>
            </div>
        </div>
        
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary">
                Comment(${fn:length(rlist)}) <!-- 댓글 개수 카운트 -->
            </h2>
        </div>
        <hr >
		<!------------- 댓글------------- -->
		
			<c:if test="${id!=null }">
			<form action="insertReplyFormAction.do?pid=${pid }" name="frm" onsubmit="return chk()">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
								&nbsp;&nbsp;${id}
								<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i>
								</label> <input type="password" class="form-control ml-2" placeholder="Enter password" name="passwd2">
										 <input type="hidden" name="passwd" value="${member.passwd }">
										 <input type="hidden" name="pid" value="${pid }">
						</div> <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="reply"></textarea>
						<button type="submit" class="btn btn-outline-secondary btn-sm" style="margin-top: 10px;">댓글입력</button>
					</li>
				</ul>
			</div>
			</form>
			</c:if>
			<!------------ 댓글 리스트 -------------->
		<c:if test="${pid != null }">
		<c:forEach var="list" items="${rlist }">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2">
							<label for="replyId"><i class="fa fa-user-circle fa-2x"></i></label>
							 &nbsp;&nbsp;${list.id }&nbsp;&nbsp;${list.pr_date }
							 <c:if test="${id==list.id }">&nbsp;&nbsp;&nbsp;&nbsp; 
							 	<span><a onclick="location.href='replyUpdateForm.do?id=${id }&pid=${pic.pid}&prseq=${list.prseq }';" class="btn btn-outline-info btn-sm">댓글수정</a></span>
								<form action="replyDeleteAction.do" onsubmit="return chk2()">
                                        <input type="hidden" name="pid" value="${pid }">
                                        <input type="hidden" name="prseq" value="${list.prseq }">
                                        <input type="submit" value="댓글삭제" class="btn btn-outline-info btn-sm">
 
 								  </form>
							 </c:if>
							 <c:if test="${id!=list.id &&state==1 }">&nbsp;&nbsp;&nbsp;&nbsp; 
							 	
							    <form action="replyDeleteAction.do" onsubmit="return chk2()">
                                        <input type="hidden" name="pid" value="${pid }">
                                        <input type="hidden" name="prseq" value="${list.prseq }">
                                        <input type="submit" value="댓글삭제" class="btn btn-outline-info btn-sm">
 
 								  </form>
 
 							 </c:if>
						</div> 
						<div class="form-control" id="exampleFormControlTextarea1">${list.reply }</div>
					</li>
				</ul>
			</div>
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
                  <div class="row mb-4">
            <h2 class="col-12 tm-text-primary">
                연관 이미지
            </h2>
        </div>
        <div class="row tm-mb-90 tm-gallery" style="margin-bottom: 30px;">
            
            <c:forEach var="pic" items="${pList }" varStatus="status" end="7">
            
              <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                 <figure class="effect-ming tm-video-item">
                    <img src="${pic.psave }" alt="Image" class="img-fluid" >
                    
                    <figcaption class="d-flex align-items-center justify-content-center">
                       <h2>${tag[0]}</h2>
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