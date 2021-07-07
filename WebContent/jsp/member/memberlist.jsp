
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.vo.MemberDetailVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	
	MemberDAO dao = new MemberDAO();
	List<MemberDetailVO> list = dao.selectAll();
	pageContext.setAttribute("list", list);
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>
	function doAction(name){
		<c:choose>
			<c:when test="${ not empty userVO}">
				location.href = "memberdetail.jsp?name=" + name
			</c:when>
			<c:otherwise>
				if (confirm('로그인이 필요한 서비스입니다\n로그인페이지로 이동하시겠습니까?'))
					location.href = "/Mission-Web/jsp/login/login.jsp"
			</c:otherwise>
		</c:choose>
	}

	$(document).ready(function() {
		$('#gotosignin').click(function() {
			location.href = "/Mission-Web/jsp/login/login.jsp"
		})
	})
</script>

</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>

	<div align="center">
		<hr width="80%">
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<th width="17%"> 이름 </th>
				<th>이메일</th>
				<th width="17%"> 계급 </th>
			</tr>			
				<c:forEach items="${list}" var="member" varStatus="loop">				
					<tr <c:if test="${ loop.index mod 2 ne 0 }"> class="odd" </c:if>>
					<td><a href="javascript:doAction('${member.name }')" > 
							<c:out value="${member.name }" />
					  </a>
					<td> ${member.emailDomain }@${member.emailId }  </td>
					<td> ${member.type } </td>
				
				</tr>			
				</c:forEach>
		</table>		
	</div>
	<c:if test="${ empty userVO }">
		<div align="center">		
			<button value="로그인" id="gotosignin"> 로그인 </button>	
		</div>	
	 </c:if>
</body>
</html>

