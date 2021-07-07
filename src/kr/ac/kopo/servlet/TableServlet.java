package kr.ac.kopo.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tableEx")
public class TableServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int rowNum;
		int colNum;
		try {
			rowNum = Integer.parseInt(request.getParameter("row" ) );
		}
		catch (Exception e) {
			rowNum = 5;
		}
		try {
			colNum = Integer.parseInt(request.getParameter("col" ) );
		}
		catch (Exception e) {
			colNum = 5;
		}		
		System.out.println();		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out =  response.getWriter();
		out.println("<table border='1'>");
		request.getRequestDispatcher("servlet/table.html").include(request, response);
		for(int i = 0 ; i < rowNum ; i ++) {
			out.println("<tr>");
			for(int j  = 0 ; j < colNum ; j++) {
				out.println("<th>");	
				out.println("cell (" + i  +", " + j+ ")");
				out.println("</th>");
			}			
			out.println("</tr>");
		}		
		out.println("</table>");
	}	
}
