<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == 1 }">
	<script type="text/javascript">
		location.href="index.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("비밀번호를 확인하세요.");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디를 확인하세요.");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result == 2 }">
	<script type="text/javascript">
		alert("탈퇴한 회원입니다.");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result == 3 }">
	<script type="text/javascript">
		alert("관리자 모드로 로그인하셨습니다.");
		location.href="index.do";
	</script>
</c:if>
</body>
</html>