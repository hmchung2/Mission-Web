<%@page import="kr.ac.kopo.login.vo.LoginVO"%>
<%@page import="kr.ac.kopo.login.dao.LoginDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 작업 순서
	1. login.jsp 에서 날라오는 파라미터 추출 (id, password)
	2. 추출된 id , password 에 맞는 회원의 존재여부 판단 (DB , t_member)
	3. 로그인 서옥ㅇ시 세션에 회원정보를 등록
	4. 존재여부에 따른 페이지를 이동 ( 로그인 성공 : index.jsp , 로그인 실패 : login.jsp) 
	
--%>


<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<%
	request.setCharacterEncoding("utf-8");

	//파라미터 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// 객체 생성 및 초기화
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
		
	// DB 에서 로그인 수행
	LoginDAO dao = new LoginDAO();	
	LoginVO userVO = dao.login(loginVO);
	
	/*  
		userVO null 이면 로그인 실패
		userVO null 이 아니면 로그인 성공
	*/
	String msg = null;
	String url = null;
	if(userVO == null){
		msg = "아이디 또는 패스워드를 잘못 입력하셧습니다.";
		url = "/Mission-Web/jsp/login/login.jsp";
	}else{		
		msg = userVO.getName() + "님 환영합니다.";
		url = "/Mission-Web/index.jsp";
				
		// 세션 등록
		session.setAttribute("userVO", userVO);
	}
	
	//response.sendRedirect(url + "?msg=" + msg);

	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
	 
		
	
/* 		
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select id , name , password , email_id , email_domain , tel1 , tel2 , tel3 , post , basic_addr , detail_addr , type , reg_date");
	sql.append(" from t_member");
	sql.append(" where id=?");	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	pstmt.setString(1, id);	
	ResultSet rs = pstmt.executeQuery();
	
	
	pageContext.setAttribute("dbPw", "");
	if(rs.next()){
		String passwordCheck = rs.getString("password");
		pageContext.setAttribute("dbPw", passwordCheck);
		if(password.equals(passwordCheck) ){			
			String name = rs.getString("name");
			String emailId = rs.getString("email_id");
			String emailDomain = rs.getString("email_domain");
			String tel1 = rs.getString("tel1");
			String tel2 = rs.getString("tel2");
			String tel3 = rs.getString("tel3");
			String post = rs.getString("post");
			String basicAddr = rs.getString("basic_addr");
			String detailAddr = rs.getString("detail_addr");
			String type = rs.getString("type");
			String regDate = rs.getString("reg_date");		
			MemberDetailVO member = new MemberDetailVO(name, id, emailDomain,emailId,tel1,tel2,tel3,basicAddr, detailAddr, post, regDate); 
			session.setAttribute("member", member);		
			pageContext.setAttribute("confirmed", "good"); 
			response.sendRedirect("/Mission-Web");
		}else{
			pageContext.setAttribute("confirmed", "wrong_pw");
		}
	}else{
		pageContext.setAttribute("confirmed", "no_id");
	}	 */
%>


<script>
	alert('${ msg }'  )
	location.href='${ url }'
	
</script> 

<%-- <jsp:forward page="${url }">
	<jsp:param name="msg" value="${msg }" />
</jsp:forward>
 --%>



