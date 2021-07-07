<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
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
	String title = checkNull(request.getParameter("title"));
	String writer = checkNull(request.getParameter("writer"));
	String content = checkNull(request.getParameter("content"));
	String no = checkNull(request.getParameter("no"));
	int boardNo = Integer.parseInt(no);
	
	BoardVO board =new BoardVO();
	board.setNo(boardNo);
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	BoardDAO dao = new BoardDAO();
	dao.update(board);
%>

<script>
	alert("새글 등록이 완료 되었습니다.")
	location.href = "detail.jsp?no=${param.no}" 			
</script>