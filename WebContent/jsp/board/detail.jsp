<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="kr.ac.kopo.login.vo.LoginVO"%>
   
<%--
	http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=2
 --%>
 
<%--  <%
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();	
	pageContext.setAttribute("list", list); 	
%>
      --%>



<%

	String no = request.getParameter("no");
	String from = request.getParameter("from");
	
	BoardDAO dao = new BoardDAO();	
	if(from != null && from.equals("list")){
		dao.increaseView(Integer.parseInt(no));	
	}		
	BoardVO board = dao.selectOne(no);
	
	
	pageContext.setAttribute("board", board);	
	LoginVO userVO = (LoginVO)session.getAttribute("userVO");
	pageContext.setAttribute("member", userVO);
	
	List<BoardFileVO> fileList = dao.selectFileByNo(board.getNo());
	pageContext.setAttribute( "fileList", fileList);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script>

	if('${ userVO }' == '') {
		alert("로그인이 필요합니다.")
		location.href = "/Mission-Web/jsp/login/login.jsp"
	}


	function dataURLtoBlob(dataurl) {
		var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1], bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(
				n);
		while (n--) {
			u8arr[n] = bstr.charCodeAt(n);
		}
		return new Blob([ u8arr ], {
			type : mime
		});
	}

	function downloadImg(imgSrc) {
		var image = new Image();
		image.crossOrigin = "anonymous";
		image.src = imgSrc;
		var fileName = image.src.split("/").pop();
		image.onload = function() {
			var canvas = document.createElement('canvas');
			canvas.width = this.width;
			canvas.height = this.height;
			canvas.getContext('2d').drawImage(this, 0, 0);
			if (typeof window.navigator.msSaveBlob !== 'undefined') {
				window.navigator.msSaveBlob(dataURLtoBlob(canvas.toDataURL()),
						fileName);
			} else {
				var link = document.createElement('a');
				link.href = canvas.toDataURL();
				link.download = fileName;
				link.click();
			}
		};
	}

	/* function clickBtn(type) {
	 switch(type) {
	 case 'U' : 
	 location.href = 'updateForm.jsp?no=${ param.no }'
	 break
	 case 'D' : 
	 break
	 case 'L' :
	 location.href = "list.jsp"
	 break
	 }
	 }
	 */

	function gotoList() {
		location.href = "list.jsp"
	}

	function confirmDelete() {
		if (confirm("정말로 글을 삭제 하시 겠습니까?")) {
			return true
		} else {
			return false
		}
	}
</script>

</head>

<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr width="80%">
		<h2>게시판 상세</h2>
		<hr width="80%">
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<th width="25%">번호</th>
				<%-- <td> <%= rs.getInt("no") %></td> --%> 			
				<!--<td>${ no }</td>  -->
				
				<td><c:out value="${ board.no }"></c:out> </td>		
			</tr>
			<tr>
				<th width="25%">제목</th>			
				<%--<td><%= rs.getString("title") %></td> --%> 		
				<!--<td>${ title }</td>  -->
				<td><c:out value="${ board.title }"></c:out> </td>
				
			</tr>
			<tr>
				<th width="25%">작성자</th>		
				<%--<td><%= rs.getString("writer") %></td> --%> 						
				<!--<td>${ writer }</td>  -->
				<%-- <td>${ board.writer }</td> --%>
				<td><c:out value="${ board.writer }"></c:out> </td>
				
			</tr>
			<tr>
				<th width="25%">내용</th>
				<%--<td><%= rs.getString("content") %></td> --%> 		
				<!--<td>${ content }</td>  -->				
				<%-- <td>${ board.content }</td> --%>
				<td><c:out value="${ board.content }"></c:out> </td>
				
			</tr>
			<tr>
				<th width="25%">조회수</th>				
				<%--<td><%= rs.getInt("view_cnt") %></td> --%> 		
				<!--<td>${ viewCnt }</td>  -->
				<%-- <td>${ board.viewCnt }</td> --%>
				<td><c:out value="${ board.viewCnt }"></c:out> </td>
				
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<%--<td><%= rs.getString("reg_date") %></td> --%> 		
				<%--<td>${ regDate }</td>  --%>
				<%-- <td>${ board.regDate }</td> --%>
				<td><c:out value="${ board.regDate }"></c:out> </td>				
			</tr>
			<tr>
				<th width="25%">첨부 파일 </th>
				<td> 
					<c:forEach items="${fileList }" var = "file">
						<a href="/Mission-Web/upload/${file.fileSaveName }" >
						<c:out value="${file.fileOriName }" />
						</a>											
						(${file.fileSize } bytes)						
						<button onclick="downloadImg('/Mission-Web/upload/${file.fileSaveName}')"> download</button>
						<br>
												
					</c:forEach>
					
				</td>
			</tr>
			
		</table>
		</div>
		<div align="center">
		<table style="border: 0px solid #D4E0EE;">
		<tr>		
		<c:if test="${ not empty member }">
			<c:if test="${member.id eq board.writer }"> 
				<td style="border: 0px solid white">
				<form method="post" action="updatePage.jsp">
					<input type="hidden" name="no" value="${board.no}">
					<input type="submit" value="수정">	
				</form>
				</td>
				<td style="border: 0px solid white">				
				<form onclick="return confirmDelete()" method="post" action="delete.jsp">
					<input type="hidden" name="no" value="${board.no}">
					<input type="submit" value="삭제">	
				</form>									
				</td>
			</c:if>					
		</c:if>
			<td style="border: 0px solid #D4E0EE;">
			<button onclick="gotoList()" >목록</button>
			</td>
		</tr>
	</table>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>

</body>
</html>




