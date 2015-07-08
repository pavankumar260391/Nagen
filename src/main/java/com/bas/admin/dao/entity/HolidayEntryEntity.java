package com.bas.admin.dao.entity;

import java.util.Date;




/**
 * 
 * @author Amogh
 * 
 */
public class HolidayEntryEntity {

	private Date holidayDate;
	private String working;
	private String holiday;
	private String weekend;
	private String description;
	
	
	

	
	/**
	 * @return the holidayDate
	 */
	public Date getHolidayDate() {
		return holidayDate;
	}
	/**
	 * @param holidayDate the holidayDate to set
	 */
	public void setHolidayDate(Date holidayDate) {
		this.holidayDate = holidayDate;
	}
	public String getWorking() {
		return working;
	}
	public void setWorking(String working) {
		this.working = working;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getWeekend() {
		return weekend;
	}
	public void setWeekend(String weekend) {
		this.weekend = weekend;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "HolidayEntryEntity [holidayDate=" + holidayDate + ", working="
				+ working + ", holiday=" + holiday + ", weekend=" + weekend
				+ ", description=" + description + "]";
	}

	
}
