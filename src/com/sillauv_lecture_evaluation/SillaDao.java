package com.sillauv_lecture_evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


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
					result = 1;		//  닉네임이나 아이디 중복
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
				stmt.setString(4, member.getNickname());
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
		public List<LectureDO> Search(String name) throws SQLException {
			List<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT lec_name, p_name from lecture where lec_name LIKE ? or p_name LIKE ?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, "%"+name+"%");
				stmt.setString(2, "%"+name+"%");
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
		public List<LectureDO> Search_dept(String dept) throws SQLException {
			ArrayList<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql="SET @ROWNUM:=0";
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				sql = "select @ROWNUM:=@ROWNUM+1 AS rownum, e.lec_name, e.p_name, e.dept, e.star, e.attendance, e.assign, e.grade, e.learning,e.difficulty, e.content,e.writer, e.todate,e.idx "
						+ "from (SELECT * FROM eval ORDER BY todate DESC)e "
						+ "where dept = ? LIMIT 3";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, dept);
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lecture.setStar(rs.getInt("star"));
						lecture.setAttendance(rs.getInt("attendance"));
						lecture.setAssign(rs.getInt("assign"));
						lecture.setGrade(rs.getInt("grade"));
						lecture.setLearning(rs.getInt("learning"));
						lecture.setDifficulty(rs.getInt("difficulty"));
						lecture.setDept(rs.getString("dept"));
						lecture.setContent(rs.getString("content"));
						lecture.setWriter(rs.getString("writer"));
						lecture.setTodate(rs.getString("todate"));
						lecture.setIdx(rs.getInt("idx"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
		public int insertdept(LectureDO lecture) throws SQLException {
			connectDB();
			
			int result = 0;
			PreparedStatement stmt = null;
			try {
				
				String sql= "insert into lecture(lec_name, p_name, dept) values (?,?,?)";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				stmt.setString(3, lecture.getDept());
				result = stmt.executeUpdate();	
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return result;
		} 
		public List<LectureDO> inquiry(String lec_name,String p_name) throws SQLException {
			ArrayList<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * "
						+ "FROM (SELECT * FROM eval where lec_name = ? AND p_name = ? ORDER BY todate DESC) e";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,lec_name);
				stmt.setString(2, p_name);
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lecture.setStar(rs.getInt("star"));
						lecture.setAttendance(rs.getInt("attendance"));
						lecture.setAssign(rs.getInt("assign"));
						lecture.setGrade(rs.getInt("grade"));
						lecture.setLearning(rs.getInt("learning"));
						lecture.setDifficulty(rs.getInt("difficulty"));
						lecture.setContent(rs.getString("content"));
						lecture.setWriter(rs.getString("writer"));
						lecture.setTodate(rs.getString("todate"));
						lecture.setIdx(rs.getInt("idx"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
		public double avg_star(String lec_name, String p_name) throws SQLException{
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			double result = 0;
			try {						
				String sql="SELECT AVG(star) FROM eval WHERE lec_name = ? AND p_name=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,lec_name);
				stmt.setString(2, p_name);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getDouble("AVG(star)");
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
		public int insert_eval(LectureDO lecture) throws SQLException {
			connectDB();
			
			int result = 0;
			ResultSet rs = null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String ss=sdf.format(new java.util.Date());
			Timestamp time= Timestamp.valueOf(ss);
			PreparedStatement stmt = null;
			try {
				String dept = "SELECT dept FROM lecture WHERE lec_name = ? AND p_name = ?";
				stmt = con.prepareStatement(dept);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				rs = stmt.executeQuery();
				rs.next();
				dept = rs.getString("dept");
				String sql= "insert into eval(lec_name, p_name, dept, star,attendance,assign,grade,learning,difficulty, content,writer, todate,idx)"
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?,(SELECT IFNULL(MAX(idx)+1,1) FROM eval a))";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				stmt.setString(3, dept);
				stmt.setInt(4, lecture.getStar());
				stmt.setInt(5, lecture.getAttendance());
				stmt.setInt(6, lecture.getAssign());
				stmt.setInt(7, lecture.getGrade());
				stmt.setInt(8, lecture.getLearning());
				stmt.setInt(9, lecture.getDifficulty());
				stmt.setString(10, lecture.getContent());
				stmt.setString(11, lecture.getWriter());
				stmt.setTimestamp(12, time);
				result = stmt.executeUpdate();	
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return result;
		}
		public List<LectureDO> Search_admin() throws SQLException {
			ArrayList<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM eval ORDER BY idx DESC";
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setIdx(rs.getInt("idx"));
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lecture.setStar(rs.getInt("star"));
						lecture.setAttendance(rs.getInt("attendance"));
						lecture.setAssign(rs.getInt("assign"));
						lecture.setGrade(rs.getInt("grade"));
						lecture.setLearning(rs.getInt("learning"));
						lecture.setDifficulty(rs.getInt("difficulty"));
						lecture.setDept(rs.getString("dept"));
						lecture.setContent(rs.getString("content"));
						lecture.setTodate(rs.getString("todate"));
						lecture.setWriter(rs.getString("writer"));
						
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
		public LectureDO SearchIdx(int idx) throws SQLException {
			LectureDO lecture = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * FROM eval WHERE idx = ?";
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, idx);
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					lecture = new LectureDO();
					lecture.setIdx(rs.getInt("idx"));
					lecture.setLec_name(rs.getString("lec_name"));
					lecture.setP_name(rs.getString("p_name"));
					lecture.setStar(rs.getInt("star"));
					lecture.setAttendance(rs.getInt("attendance"));
					lecture.setAssign(rs.getInt("assign"));
					lecture.setGrade(rs.getInt("grade"));
					lecture.setLearning(rs.getInt("learning"));
					lecture.setDifficulty(rs.getInt("difficulty"));
					lecture.setContent(rs.getString("content"));
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lecture;
		}
		public int updateAdmin(LectureDO lecture) throws SQLException {
			connectDB();
			int result = 0;
			PreparedStatement stmt = null;
			try {
				String sql="update eval set lec_name=?, p_name=?, star=?,attendance=?,assign=?,grade=?,learning=?,difficulty=?, content=? where idx=?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				stmt.setInt(3, lecture.getStar());
				stmt.setInt(4, lecture.getAttendance());
				stmt.setInt(5, lecture.getAssign());
				stmt.setInt(6, lecture.getGrade());
				stmt.setInt(7, lecture.getLearning());
				stmt.setInt(8, lecture.getDifficulty());
				stmt.setString(9, lecture.getContent());
				stmt.setInt(10, lecture.getIdx());
				result = stmt.executeUpdate();	
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return result;
		}
		public int delete(int idx) throws  SQLException {
			connectDB();
			int result = 0;
			LectureDO lecture = new LectureDO();
			PreparedStatement stmt = null;
			try {
				
				String sql="DELETE FROM eval WHERE idx=?";						
				stmt = con.prepareStatement(sql);
				stmt.setInt(1, idx);
				result =stmt.executeUpdate();
				
				sql = "SET @ROWNUM:=0";
				stmt = con.prepareStatement(sql);
				result = stmt.executeUpdate();
				// idx값 업데이트하기
				sql="UPDATE eval AS e,"
						+ "(SELECT @ROWNUM:=@ROWNUM+1 rownum,idx"
						+ "FROM (SELECT idx FROM eval ORDER BY todate)"
						+ "SET idx=rownum";
				stmt = con.prepareStatement(sql);
				result = stmt.executeUpdate();
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			
			return result;
		}
		public int lecture_delete(String lec_name, String p_name) throws  SQLException {
			connectDB();
			int result = 0;
			LectureDO lecture = new LectureDO();
			PreparedStatement stmt = null;
			try {
				
				String sql="DELETE FROM lecture WHERE lec_name=? AND p_name = ?";						
				stmt = con.prepareStatement(sql);
				stmt.setString(1, lec_name);
				stmt.setString(2, p_name);
				result =stmt.executeUpdate();
				
				sql = "SET @ROWNUM:=0";
				stmt = con.prepareStatement(sql);
				result = stmt.executeUpdate();
				// idx값 업데이트하기
				sql="UPDATE eval AS e,"
						+ "(SELECT @ROWNUM:=@ROWNUM+1 rownum,idx"
						+ "FROM (SELECT idx FROM eval ORDER BY todate)"
						+ "SET idx=rownum";
				stmt = con.prepareStatement(sql);
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
