package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String method = request.getMethod();		
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		System.out.println("method  : " + method);		
		System.out.println("url : " +  url.toString());		
		System.out.println("uri : " + uri);
		
		String data = request.getParameter("id");

		System.out.println( data);	
		response.setContentType("text/html; charset=utf-8");
		//클라이언트에 응답하기.
		PrintWriter out =  response.getWriter();
		out.print("<h1> ID : " +data +"</h1>");
		out.flush();
		out.close();
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		//post 방식일때는 바디에 한글이 날라가기때문에 html request 에 인코딩을 한번 더 해야 한다.
		request.setCharacterEncoding("utf-8");
		
		
		String method = request.getMethod();		
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		System.out.println("method  : " + method);		
		System.out.println("url : " +  url.toString());		
		System.out.println("uri : " + uri);
		
		String data = request.getParameter("id");

		System.out.println( data);
		
		
		response.setContentType("text/html; charset=utf-8");
		
		//클라이언트에 응답하기.
		PrintWriter out =  response.getWriter();
		out.print("<h1> ID : " +data +"</h1>");
		out.flush();
		out.close();
	}	
}
