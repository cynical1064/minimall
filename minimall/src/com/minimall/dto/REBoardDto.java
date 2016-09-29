package com.minimall.dto;

import java.sql.Date;

public class REBoardDto {
	private int reb_no;
	private String reb_subject;
	private String reb_pass;
	private String m_id;
	private String reb_content;
	private String reb_file;
	private int reb_re_ref;
	private int reb_re_lev;
	private int reb_re_seq;
	private int reb_readcount;
	private Date reb_date;
	public int getReb_no() {
		return reb_no;
	}
	public void setReb_no(int reb_no) {
		this.reb_no = reb_no;
	}
	public String getReb_subject() {
		return reb_subject;
	}
	public void setReb_subject(String reb_subject) {
		this.reb_subject = reb_subject;
	}
	public String getReb_pass() {
		return reb_pass;
	}
	public void setReb_pass(String reb_pass) {
		this.reb_pass = reb_pass;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getReb_content() {
		return reb_content;
	}
	public void setReb_content(String reb_content) {
		this.reb_content = reb_content;
	}
	public String getReb_file() {
		return reb_file;
	}
	public void setReb_file(String reb_file) {
		this.reb_file = reb_file;
	}
	public int getReb_re_ref() {
		return reb_re_ref;
	}
	public void setReb_re_ref(int reb_re_ref) {
		this.reb_re_ref = reb_re_ref;
	}
	public int getReb_re_lev() {
		return reb_re_lev;
	}
	public void setReb_re_lev(int reb_re_lev) {
		this.reb_re_lev = reb_re_lev;
	}
	public int getReb_re_seq() {
		return reb_re_seq;
	}
	public void setReb_re_seq(int reb_re_seq) {
		this.reb_re_seq = reb_re_seq;
	}
	public int getReb_readcount() {
		return reb_readcount;
	}
	public void setReb_readcount(int reb_readcount) {
		this.reb_readcount = reb_readcount;
	}
	public Date getReb_date() {
		return reb_date;
	}
	public void setReb_date(Date reb_date) {
		this.reb_date = reb_date;
	}
	
}