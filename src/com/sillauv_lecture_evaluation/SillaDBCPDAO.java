package com.sillauv_lecture_evaluation;

import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SillaDBCPDAO extends SILLADAO {
	private String dbcpResourceName;  
		
		public SillaDBCPDAO(String dbcpResourceName) {
			this.dbcpResourceName = dbcpResourceName;

		}
		
		protected void connectDB() throws SQLException {
			try {
				DataSource ds = (DataSource)(new InitialContext()).lookup("java:comp/env/"+dbcpResourceName);
				con = ds.getConnection();
				
			} catch (NamingException e) {
				throw new SQLException(e);
			}
		}
	

}
