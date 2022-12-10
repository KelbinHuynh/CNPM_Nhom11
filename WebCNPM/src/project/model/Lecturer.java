<<<<<<< HEAD:src/project/model/Lecturer.java
package project.model;

public class Lecturer {
	private String id;
	private String fullname;
	private boolean male;
	private String level;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public boolean isMale() {
		return male;
	}
	public void setMale(boolean male) {
		this.male = male;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String lever) {
		this.level = lever;
	}
}
=======
package project.model;

import java.sql.Date;

public class Student {
	private String id;
	private String fullname;
	private boolean male;
	private Date dateofbirth;
	private String phonenumber;
	private Team team;
	private Major major;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public boolean isMale() {
		return male;
	}
	public void setMale(boolean male) {
		this.male = male;
	}
	public Date getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	
	
}
>>>>>>> 8cab83567cce0d9cf315728e307c6914940660b5:WebCNPM/src/project/model/Student.java
