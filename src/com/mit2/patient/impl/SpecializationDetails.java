package com.mit2.patient.impl;

import java.sql.*;
public class SpecializationDetails {
	
	private int spec_fees;
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	
	
	public int getPrice() {
		return spec_fees;
	}
	public void setPrice(int spec_fees) {
		this.spec_fees=spec_fees;
	}
		public void setSpecDetails(String specname)
		{
			try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
					String sql = "Select fees from specialization where spec_name='"+specname+"'";
					 st = conn.createStatement();
					 rs = st.executeQuery(sql);
					
					 while(rs.next())
					 {
						 spec_fees=rs.getInt(1);
					 }
				}
				catch (Exception e) {
					System.out.println(e);
				}
			}
		}