package com.sillauv_lecture_evaluation;


public class LectureDO {
	private String lec_name;
	private String p_name;
	private int star;
	private String dept;
	private String todate;
	private String content;
	
	public LectureDO() {
		
	}
	
	public LectureDO(String lec_name, String p_name, int star, String dept, String todate, String content) {
		super();
		this.lec_name = lec_name;
		this.p_name = p_name;
		this.star = star;
		this.dept = dept;
		this.todate = todate;
		this.content = content;
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
