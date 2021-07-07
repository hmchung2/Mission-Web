package kr.ac.kopo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class HelloServlet extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("init() : 최초 한번만 실행되는 메소드 입니다.");		
	}
	 
	// 서비스가 없으면 405 에러 발생. 서비스는 무조건 있어야한다.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("service() : 실제 작업이 실행되는 메소드");
		System.out.println("사용자의 요청할 때마다 호출되는 메소드 입니다.");
		
		
		
		
		
		
		
		
		
	}	
}
