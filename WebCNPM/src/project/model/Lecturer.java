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