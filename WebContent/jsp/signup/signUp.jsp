<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css" />
<link rel="stylesheet" href="/Mission-Web/resources/css/board.css" />
<style>
	.required{
		border-color: red;
	}
		
	input{
		width: 150px;
	}
	

	
</style>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
	$('#cancel').click(function() {
		location.href = "list.jsp"
	})
	
	$('#gotolist').click(function() {
		location.href = "memberlist.jsp"
	})
	
})


</script>


</head>
<body>


<div align=center>
<h1>회원가입</h1>


<form action="signupcheck.jsp" method="post">

<table>
<tr>
<th>아이디:</th> <td>  <input type="text" size="60" name="id"> </td>
</tr>
<tr>
<th>이름: </th> <td> <input type="text" size="60" name="name"></td>
</tr>
<tr>
<th>비밀번호 :</th> <td> <input type="text" size="60" name="password"> </td>
</tr>
<tr>
<th>비밀번호 확인 :</th> <td><input type="text" size="60" name="password2"> </td>
</tr>
<tr>
<th>이메일 : </th><td>  <input type="text" size="60" name="email_domain"> @ <input type="text" size="60" name="email_id"> </td>
</tr>
<tr>
<th> 전화번호 :</th> <td> <input type="text" size="60" name="tel1"> - <input type="text" size="60" name="tel2"> - <input type="text" size="60" name="tel3"> </td>
</tr>

<tr>
<th>도시군 : </th> <td><input type="text" size="60" name="basic_addr"> </td>
</tr>
<tr>
<th>상세 주소 : </th> <td> <input type="text" size="60" name="detail_addr"> </td> </tr>


<tr>
<th>우편번호 :</th> <td> <input type="text" size="60" name="post"> </td>
</tr>

<tr>
<td>
<input type="Radio" Name="Gender" Value="남">남 </td>
<td>
<input type="Radio" Name="Gender" Value="여">여 </td>
</tr>
</table>

<input type="submit" value="확인" >
<input type="button" value="취소" id="cancel">

</form>

<br>
<br>


<button value="회원조회" id="gotolist"> 회원 조회 </button>
</div>
</body>
</html>