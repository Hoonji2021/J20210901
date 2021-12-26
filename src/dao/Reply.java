package dao;

import java.util.Date;

public class Reply {
	int pid;
	int prseq;
	String reply;
	String id;
	Date pr_date;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPrseq() {
		return prseq;
	}
	public void setPrseq(int prseq) {
		this.prseq = prseq;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPr_date() {
		return pr_date;
	}
	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	
	
}
