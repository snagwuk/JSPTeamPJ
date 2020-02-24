package model;

import java.io.Serializable;

public class Location implements Serializable {
	private String mcategory;
	private String scategory;
	private String locationCode;
	private int cost;
	private int capacity;
	

	public Location(String mcategory, String scategory, String locationCode, int cost, int capacity) {
		this.mcategory = mcategory;
		this.scategory = scategory;
		this.locationCode = locationCode;
		this.cost = cost;
		this.capacity = capacity;
	}
	public Location(){}
	public String getMcategory() {
		return mcategory;
	}
	public void setMcategory(String mcategory) {
		this.mcategory = mcategory;
	}
	public String getScategory() {
		return scategory;
	}
	public void setScategory(String scategory) {
		this.scategory = scategory;
	}
	
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}

	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	
	
}
