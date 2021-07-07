<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public String checkNull(String str){
	if(str == null){
		str = "";
	}
	return str;
}
%>

<%
	request.setCharacterEncoding("utf-8");
	String no = checkNull(request.getParameter("no"));
	int boardNo = Integer.parseInt(no);
	BoardDAO dao = new BoardDAO();
	dao.delete(boardNo);
%>

<script>
	alert("삭제가 완료되었습니다..")
	location.href = "list.jsp"	
</script>