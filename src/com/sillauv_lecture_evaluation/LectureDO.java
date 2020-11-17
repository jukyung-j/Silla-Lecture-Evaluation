package com.sillauv_lecture_evaluation;


public class LectureDO {
	private int idx;
	private String lec_name;
	private String p_name;
	private int star;
	private int attendance;
	private int assign;
	private int grade;
	private int learning;
	private int difficulty;
	private String dept;
	private String todate;
	private String content;
	
	public LectureDO() {
		
	}
	public LectureDO(int idx, String lec_name, String p_name, int star, int attendance, int assign, int grade,
			int learning, int difficulty, String dept, String todate, String content) {
		super();
		this.idx = idx;
		this.lec_name = lec_name;
		this.p_name = p_name;
		this.star = star;
		this.attendance = attendance;
		this.assign = assign;
		this.grade = grade;
		this.learning = learning;
		this.difficulty = difficulty;
		this.dept = dept;
		this.todate = todate;
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getLec_name() {
		return lec_name;
	}
	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getAttendance() {
		return attendance;
	}

	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}

	public int getAssign() {
		return assign;
	}

	public void setAssign(int assign) {
		this.assign = assign;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getLearning() {
		return learning;
	}

	public void setLearning(int learning) {
		this.learning = learning;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
