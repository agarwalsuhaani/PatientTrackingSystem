package com.mit2.patient.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1617721579)
public class AddDoctor extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		Connection conn=null;
		PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
			
			String name=request.getParameter("DoctorName");
			String password= request.getParameter("password");
			String contact=request.getParameter("DoctorContact");
			String address=request.getParameter("DoctorAddress");
			String email= request.getParameter("DoctorEmail");
			InputStream inputStream=null;
			Part filePart = request.getPart("photo");
			
			
			if(filePart!=null)
			{
				inputStream = filePart.getInputStream();
			}
			
			if(name!=null && address!=null && contact!=null && email!=null)
			{
				PreparedStatement st=conn.prepareStatement("insert into `doctor`(doctorname,doctoraddress,doctorcontact,doctoremail,img) values(?,?,?,?,?)");
				PreparedStatement st2= conn.prepareStatement("insert into `login`(uname,pwd,role) values(?,?,?)");
				st.setString(1,name);
				st.setString(2,address);
				st.setString(3,contact);
				st.setString(4,email);
				if(inputStream!=null)
				{
					st.setBlob(5,inputStream);
				}
				st2.setString(1,name);
				st2.setString(2,password);
				st2.setString(3,"doctor");
				
				int r=st.executeUpdate();
				int rs= st2.executeUpdate();
				if(r>0&&rs>0)
				{
					response.sendRedirect("index.jsp");
					out.println("Doctor added Successfully");
				}
				
			}
		}
		catch(Exception e)
		{
			out.println("Some exception here "+e);
		}
	}
}