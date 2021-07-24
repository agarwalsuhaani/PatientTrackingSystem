package com.mit2.patient.impl;

import java.sql.*;

public class PatientDetails {
	
	private String patientaddress;
	private String patientemail;
	
	private Connection conn=null;
	private Statement st=null;
	private ResultSet rs=null;
	
	
	
	public String getPatientAddress() {
		return patientaddress;
	}
	public void setPatientAddress(String paddress) {
		this.patientaddress=paddress;
	}
	public String getPatientEmail() {
		return patientemail;
	}
	public void setPatientEmail(String pemail) {
		this.patientemail=pemail;
	}
	
	public void setDetails(String patientname)
	{
		try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root","burlmouse77");
				String sql = "Select  patientaddress, patientemail from patient where patientname='"+patientname+"'";
				 st = conn.createStatement();
				 rs = st.executeQuery(sql);
				
				 while(rs.next())
				 {
					 patientaddress=rs.getString(1);
					 patientemail=rs.getString(2);
				 }
			}
			catch (Exception e) {
				System.out.println(e);
			}
		}
	}

