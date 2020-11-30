package com.sillauv_lecture_evaluation;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SillaDBCPDAO extends SillaDao {
	private String dbcpResourceName;  
	private String db_url;
	private String db_id;
	private String db_pwd;
	
		public SillaDBCPDAO(String dbcpResourceName,String dburl,String dbuserid,String dbuserpasswd) {
			this.dbcpResourceName = dbcpResourceName;
			this.db_url = dburl;
			this.db_id = dbuserid;
			this.db_pwd = dbuserpasswd;
		}
		
		protected void connectDB() {
				//DataSource ds = (DataSource)(new InitialContext()).lookup("java:comp/env/"+dbcpResourceName);
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					
					con = DriverManager.getConnection(db_url,db_id,db_pwd);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
}
