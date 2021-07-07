<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('#logo').hover(function(){
			$(this).css('background-color' , 'blue')
		} ,function(){
			$(this).css('background-color' , 'white')
		})
				
	})
	
</script>

<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width: 150px">
			
			<div style="margin-left: auto; margin-right: auto;">
			<div id="logo" align='center'>			
				<a href="/Mission-Web/index.jsp"><img src="/Mission-Web/resources/images/logo.png"
					style="width: 80%; height: 100%;" /></a></div>					
			</div>
		</td>
		<td align="right">즐겨찾기 <c:if test="${ not empty userVO }">
				[ ${userVO.name }] 님 로그인중
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${userVO.type eq '관리자' }">
				<a href="/Mission-Web/jsp/member/memberlist.jsp">
				회원관리 </a>
				|| 
				</c:if>
				<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> ||
				<c:choose>
					<c:when test="${empty userVO }">					
						<a href="/Mission-Web/jsp/signup/signUp.jsp">회원가입 </a> ||
				 		<a href="/Mission-Web/jsp/login/login.jsp">로그인</a>
					</c:when>
					<c:otherwise>
				 		|| 마이페이지 || 
				 		<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a>				 
				 	</c:otherwise>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>