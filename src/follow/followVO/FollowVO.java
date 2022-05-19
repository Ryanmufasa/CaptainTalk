package follow.followVO;

import java.sql.Date;

public class FollowVO {
	
	private int fol_id;
	private int mem_no;
	private int target_mem_no;
	private Date fol_datetime;
	
	public FollowVO() {}
	
	public FollowVO(int fol_id, int mem_no, int target_mem_no, Date fol_datetime) {
		super();
		this.fol_id = fol_id;
		this.mem_no = mem_no;
		this.target_mem_no = target_mem_no;
		this.fol_datetime = fol_datetime;
	}
	public int getFol_id() {
		return fol_id;
	}
	public void setFol_id(int fol_id) {
		this.fol_id = fol_id;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getTarget_mem_no() {
		return target_mem_no;
	}
	public void setTarget_mem_no(int target_mem_no) {
		this.target_mem_no = target_mem_no;
	}
	public Date getFol_datetime() {
		return fol_datetime;
	}
	public void setFol_datetime(Date fol_datetime) {
		this.fol_datetime = fol_datetime;
	}
	

}
