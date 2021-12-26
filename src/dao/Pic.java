package dao;

import java.util.Date;

public class Pic {
	int pid;
	String psave;
	int plike;
	int pdown;
	int pcount;
	String id;
	Date p_date;
	String pcomment;
	String rownum;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPsave() {
		return psave;
	}
	public void setPsave(String psave) {
		this.psave = psave;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public int getPdown() {
		return pdown;
	}
	public void setPdown(int pdown) {
		this.pdown = pdown;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getPcomment() {
		return pcomment;
	}
	public void setPcomment(String pcomment) {
		this.pcomment = pcomment;
	}
}
