<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@page import="kr.ac.kopo.login.vo.LoginVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<script type="text/javascript" src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>




<script>

	window.onload = function(){
		
		if('${ userVO }' == '') {
			location.href = "/Mission-Web/jsp/login/login.jsp"
			}
		}
	
		/* if('${userVO.id}' != '${board.writer}' ){
			location.href = "/Mission-Web/jsp/login/logout.jsp"
		} */	
	
	$(document).ready(function() {
		$('#goListBtn').click(function() {
			location.href = "list.jsp"
		})
	})
	
	function doWrite() {		
		let f = document.writeForm
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false
		}	
		if(f.writer.value == '') {
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}		
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}		
		return true
	}

</script>



<% 
request.setCharacterEncoding("utf-8");
String no = request.getParameter("no");	
BoardDAO dao = new BoardDAO();
if(no != null){
	BoardVO board = dao.selectOne(no);
	pageContext.setAttribute("board", board);	
}else{
	out.write("<script> alert('잘못된 접근 방식 입니다. 로그인 페이지로 돌아갑니다.') </script>");
	session.invalidate();
	out.write("<script> location.href = '/Mission-Web/jsp/login/login.jsp' </script>");
}
%>


<%--  <%

	pageContext.setAttribute("board", board);
	
	LoginVO userVO = (LoginVO)session.getAttribute("userVO");
	
	if( ! userVO.getId().equals(board.getWriter())){
		%> 
			<script> alert("당신의 글이 아닙니다.")
					location.href = "/Mission-Web/jsp/login/logout.jsp"
			</script>
		<%
		session.invalidate();
	}		
%> --%>

</head>
<body>
<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<hr width="80%">
			<h2>게시글 수정</h2>
			<hr width="80%">
			<br>
			<form action="update.jsp" method="post" 
				  name="updateForm" onsubmit="return doWrite()">				 
 				<input type="hidden" name="no" value="${board.no}">
				  
				<input type="hidden" name="writer" value="${board.writer}">
				
				<table border="1" style="width: 80%">
					<tr>
						<th width="25%">제목</th>
						<td>
							<input type="text" size="60" name="title" value="${board.title }">
						</td>
					</tr>
					<tr>
						<th width="25%">작성자</th>
						<td>
							<c:out value="${ board.writer }" />
							<%-- <input type="text" size="60" name="writer" value="${ userVO.id }" readonly> --%>
						</td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td>
							<textarea rows="8" cols="60" name="content">${board.content }</textarea>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" value="등록">
				<input type="button" value="목록" id="goListBtn">
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>

<br>
</body>
</html>