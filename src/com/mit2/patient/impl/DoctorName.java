package com.mit2.patient.impl;
import java.sql.*;

public class DoctorName {
	
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	public int getDoctorName(String doctorname )
	{
		int doctorid=0;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
			st=conn.createStatement();
			String sql="Select doctorid from doctor where doctorname='"+doctorname +"'";
			rs=st.executeQuery(sql);
			
			while (rs.next())
			{
				doctorid=rs.getInt(1);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return doctorid;
	}

}
