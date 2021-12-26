<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${adlike > 0 }">
		<script type="text/javascript">
			location.href="picInfo.do?id=${id}&pid=${pid}";
		</script>
		<input type="hidden" id="dd">
	</c:if>
	<c:if test="${rmlike > 0 }">
		<script type="text/javascript">
			
			location.href = "picInfo.do?id=${id}&pid=${pid}";
		</script>
		<input type="hidden" id="dd">
	</c:if>

</body>
</html>