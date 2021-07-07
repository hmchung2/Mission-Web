<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>





<%!
	public String checkNull(String str ){
	if(str == null){
		str = "";
	}	
	return str;
}
%>

<% 
request.setCharacterEncoding("utf-8");
String id= checkNull( request.getParameter("id") );
String name = checkNull(request.getParameter("name"));
String password = checkNull(request.getParameter("password" ));
String password2 = checkNull(request.getParameter("password2" ));

String emailDomain = checkNull(request.getParameter("email_domain"));
String emailId =  checkNull(request.getParameter("email_id"));


String tel1 = checkNull(request.getParameter("tel1"));
String tel2 = checkNull(request.getParameter("tel2"));
String tel3 = checkNull(request.getParameter("tel3"));


String basicAddr = checkNull(request.getParameter("basic_addr") );
String detailAddr = checkNull(request.getParameter("detail_addr"));
String gender = request.getParameter("Gender");

%>
	alert(gender);
<% 


String post = checkNull(request.getParameter("post"));

if(!password.equals(password2)){
	%>
		<script>
			alert("입력 하신 비밀번혹 일치 하지 않습니다.")
			location.href = "signUp.jsp"	
		</script>
	<%
	}
else{

	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("insert into t_member(id , name , password , email_id , email_domain , tel1 , tel2, tel3 , post,  basic_addr , detail_addr , type )");
	sql.append(" values (?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, id);
	pstmt.setString(2 , name);
	pstmt.setString(3 , password);
	pstmt.setString(4 , emailId);
	pstmt.setString(5 , emailDomain);
	pstmt.setString(6 , tel1);
	pstmt.setString(7 , tel2);
	pstmt.setString(8 , tel3);
	pstmt.setString(9 , post);
	pstmt.setString(10 , basicAddr);
	pstmt.setString(11 , detailAddr);
	pstmt.setString(12 , gender);
	pstmt.executeQuery();
	JDBCClose.close(conn , pstmt);
	%> 
	<script>
		alert("회원가입 완료")
		location.href = "memberlist.jsp"	
	</script>
	<%
	}
	%>





