package com.dto;

import java.util.Date;

public class RequestVO {
	private int req_index;
	private String id;
	private String user_id;
	private String user_name;
	private String title;
	private String content;
	private Date request_date;
	private String etc;
	private String manager_id;
	private String manager_name;
	private String priority_id;
	private String process_type_id;
	private String process_type_name;
	private String process_form_id;
	private String process_form_name;
	private String process_state_id;
	private String process_state_name;
	private String process_content;
	private String process_hour;
	private String complete_date;

	public String getProcess_type_name() {
		return process_type_name;
	}

	public void setProcess_type_name(String process_type_name) {
		this.process_type_name = process_type_name;
	}

	public String getProcess_form_name() {
		return process_form_name;
	}

	public void setProcess_form_name(String process_form_name) {
		this.process_form_name = process_form_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getProcess_state_name() {
		return process_state_name;
	}

	public void setProcess_state_name(String process_state_name) {
		this.process_state_name = process_state_name;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getPriority_id() {
		return priority_id;
	}

	public void setPriority_id(String priority_id) {
		this.priority_id = priority_id;
	}

	public String getProcess_type_id() {
		return process_type_id;
	}

	public void setProcess_type_id(String process_type_id) {
		this.process_type_id = process_type_id;
	}

	public String getProcess_form_id() {
		return process_form_id;
	}

	public void setProcess_form_id(String process_form_id) {
		this.process_form_id = process_form_id;
	}

	public String getProcess_state_id() {
		return process_state_id;
	}

	public void setProcess_state_id(String process_state_id) {
		this.process_state_id = process_state_id;
	}

	public String getProcess_content() {
		return process_content;
	}

	public void setProcess_content(String process_content) {
		this.process_content = process_content;
	}

	public String getProcess_hour() {
		return process_hour;
	}

	public void setProcess_hour(String process_hour) {
		this.process_hour = process_hour;
	}

	public String getComplete_date() {
		return complete_date;
	}

	public void setComplete_date(String complete_date) {
		this.complete_date = complete_date;
	}

	public int getReq_index() {
		return req_index;
	}

	public void setReq_index(int req_index) {
		this.req_index = req_index;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRequest_date() {
		return request_date;
	}

	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}
}
