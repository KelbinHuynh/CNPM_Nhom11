package project.model;

import java.sql.Date;

public class Project {
	private String id;
	private String name;
	private String details;
	private Date completion_time;
	private boolean is_graduate;
	private float score;
	private boolean protecte;
	private Major major;
	private Lecturer lecturer;
	private Team team;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getCompletion_time() {
		return completion_time;
	}
	public void setCompletion_time(Date completion_time) {
		this.completion_time = completion_time;
	}
	public boolean isIs_graduate() {
		return is_graduate;
	}
	public void setIs_graduate(boolean is_graduate) {
		this.is_graduate = is_graduate;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public boolean isProtecte() {
		return protecte;
	}
	public void setProtecte(boolean protecte) {
		this.protecte = protecte;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public Lecturer getLecturer() {
		return lecturer;
	}
	public void setLecturer(Lecturer lecturer) {
		this.lecturer = lecturer;
	}
	public Team getTeam() {
		return team;
	}
	public void setTeam(Team team) {
		this.team = team;
	}

}
