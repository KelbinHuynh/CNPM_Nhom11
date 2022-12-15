package project.model;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public class Tkb {
	private String id;
	private String room;
	private Date date;
	private Time timeofday;
	private List<Team> team;
	private List<Lecturer> lecturer;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTimeofday() {
		return timeofday;
	}
	public void setTimeofday(Time timeofday) {
		this.timeofday = timeofday;
	}
	public List<Team> getTeam() {
		return team;
	}
	public void setTeam(List<Team> team) {
		this.team = team;
	}
	public List<Lecturer> getLecturer() {
		return lecturer;
	}
	public void setLecturer(List<Lecturer> lecturer) {
		this.lecturer = lecturer;
	}
}
