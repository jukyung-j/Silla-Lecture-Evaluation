package com.sillauv_lecture_evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public abstract class SillaDao {
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
		public int Over_Confirm(String id,String input) throws SQLException{
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			int result = 0;
			try {						
				String sql="select "+input+" from member where "+input+"=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, id);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					result = 1;		// ?ïÑ?ù¥?îî Ï§ëÎ≥µ
				}
				
			}catch(SQLException e) {
				throw e;
			} finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();  
				disconnectDB();
			}
			return result;
		}
		public int Join(MemberDO member) throws SQLException {
			connectDB();
			
			int result = 0;
			PreparedStatement stmt = null;
			try {	
				
				String sql= "insert into member(id, pwd, name, nickname, dept, email) values (?,?,?,?,?,?)";
				stmt = con.prepareStatement(sql);
				
				stmt.setString(1, member.getId());
				stmt.setString(2, member.getPwd());
				stmt.setString(3, member.getName());
				stmt.setString(4, member.getName());
				stmt.setString(5, member.getDept());
				stmt.setString(6, member.getEmail());
				
				result = stmt.executeUpdate();	
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return result;
		} 
	

}
