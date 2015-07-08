package com.bas.admin.web.controller.form;

import java.util.Date;

/**
 * 
 * @author Amogh
 * 
 */

public class DesignationForm {
	private int designationId;
	private String designationName;
	private String description;
	private Date doe;
	private Date dom;
	private String entryBy;

	public int getDesignationId() {
		return designationId;
	}

	public void setDesignationId(int designationId) {
		this.designationId = designationId;
	}

	public String getDesignationName() {
		return designationName;
	}

	public void setDesignationName(String designationName) {
		this.designationName = designationName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDoe() {
		return doe;
	}

	public void setDoe(Date doe) {
		this.doe = doe;
	}

	public Date getDom() {
		return dom;
	}

	public void setDom(Date dom) {
		this.dom = dom;
	}

	public String getEntryBy() {
		return entryBy;
	}

	public void setEntryBy(String entryBy) {
		this.entryBy = entryBy;
	}

	@Override
	public String toString() {
		return "DesignationForm [designationId=" + designationId
				+ ", designationName=" + designationName + ", description="
				+ description + ", doe=" + doe + ", dom=" + dom + ", entryBy="
				+ entryBy + "]";
	}

}
