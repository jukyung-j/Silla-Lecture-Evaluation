package com.sillauv_lecture_evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class SILLADAO {
	protected Connection con = null;
		
		protected abstract void connectDB() throws SQLException;

		protected void disconnectDB() throws SQLException {
			if(con != null) {
				con.close();
				con = null;
			}
		}
		public MemberDO Login(String id) throws SQLException {
			MemberDO member = null;
			
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "select id,pwd,nickname,dept from member where id=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					member = new MemberDO();
					member.setId(rs.getString("id"));
					member.setPwd(rs.getString("pwd"));
					member.setNickname(rs.getString("nickname"));
					member.setDept(rs.getString("dept"));
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return member;
		}
	

}
