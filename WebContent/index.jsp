<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		section 부분
	</section>
	
	<footer>
		<%-- <c:import url="http://localhost:9999/Mission-Web/jsp/include/bottom.jsp" /> --%>
		<!-- xml ,include , forward 는 Mission-Web 생략. 루트가 Mission-Web 부터 시작 -->

		<%@ include file="/jsp/include/bottom.jsp" %>
		
	</footer>
	
</body>
</html>