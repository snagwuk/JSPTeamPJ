package model;

import java.io.Serializable;

public class Course implements Serializable
{
	private String code;
	private String bigtype;
	private String course;
	private String course_time;
	private String course_Period_start;
	private String course_Period_end;
	private String course_location;
	private int course_person;
	private int price;
	private String train_code;
	private int grade;
	public Course(){}
	


    public Course(String code, String bigtype, String course,
            String course_time, String course_Period_start,
            String course_Period_end, String course_location, int course_person,
            int price, String train_code)
    {
        super();
        this.code = code;
        this.bigtype = bigtype;
        this.course = course;
        this.course_time = course_time;
        this.course_Period_start = course_Period_start;
        this.course_Period_end = course_Period_end;
        this.course_location = course_location;
        this.course_person = course_person;
        this.price = price;
        this.train_code = train_code;
    }



    // 전체 강좌 목록
	public Course(String code, String bigtype, String course, String course_time, String course_Period_start,
			String course_Period_end, String course_location, int course_person, int price) {
		this.code = code;
		this.bigtype = bigtype;
		this.course = course;
		this.course_time = course_time;
		this.course_Period_start = course_Period_start;
		this.course_Period_end = course_Period_end;
		this.course_location = course_location;
		this.course_person = course_person;
		this.price = price;
	}
	
	
	// 나의 강좌 목록
	public Course(String code, String bigtype, String course, String course_time, String course_Period_start,
			String course_Period_end, String course_location, int course_person, int price, int grade) {
		this.code = code;
		this.bigtype = bigtype;
		this.course = course;
		this.course_time = course_time;
		this.course_Period_start = course_Period_start;
		this.course_Period_end = course_Period_end;
		this.course_location = course_location;
		this.course_person = course_person;
		this.price = price;
		this.grade = grade;
	}






	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getBigtype() {
		return bigtype;
	}
	public void setBigtype(String bigtype) {
		this.bigtype = bigtype;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getCourse_time() {
		return course_time;
	}
	public void setCourse_time(String course_time) {
		this.course_time = course_time;
	}
	public String getCourse_Period_start() {
		return course_Period_start;
	}
	public void setCourse_Period_start(String course_Period_start) {
		this.course_Period_start = course_Period_start;
	}
	public String getCourse_Period_end() {
		return course_Period_end;
	}
	public void setCourse_Period_end(String course_Period_end) {
		this.course_Period_end = course_Period_end;
	}
	public String getCourse_location() {
		return course_location;
	}
	public void setCourse_location(String course_location) {
		this.course_location = course_location;
	}
	public int getCourse_person() {
		return course_person;
	}
	public void setCourse_person(int course_person) {
		this.course_person = course_person;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}



	public int getGrade() {
		return grade;
	}



	public void setGrade(int grade) {
		this.grade = grade;
	}



    public String getTrain_code()
    {
        return train_code;
    }



    public void setTrain_code(String train_code)
    {
        this.train_code = train_code;
    }



   
	
	
	
	
	
	
	
}
