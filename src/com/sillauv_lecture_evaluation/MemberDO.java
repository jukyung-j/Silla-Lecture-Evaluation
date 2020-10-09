package com.sillauv_lecture_evaluation;

public class MemberDO {
	private String name;
	private String nickname;
	private String dept;
	private String id;
	private String pwd;
	private String email;
	
	public MemberDO() {
		
	}
	public MemberDO(String name, String nickname, String dept, String id, String pwd, String email) {
		super();
		this.name = name;
		this.nickname = nickname;
		this.dept = dept;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	

}
