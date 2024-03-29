package member.addMemberVO;

import java.sql.Date;

public class AddMemberVO {
	
	private int infonum;
	private int mem_no; 
	private int mem_sex;
	private Date mem_birthday;
	private String mem_email;
	private String mem_region;
	private String mem_memo;
	
	
	public int getInfonum() {
		return infonum;
	}

	public void setInfonum(int infonum) {
		this.infonum = infonum;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	
	public int getMem_sex() {
		return mem_sex;
	}

	public void setMem_sex(int mem_sex) {
		this.mem_sex = mem_sex;
	}

	public Date getMem_birthday() {
		return mem_birthday;
	}

	public void setMem_birthday(Date mem_birthday) {
		this.mem_birthday = mem_birthday;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_region() {
		return mem_region;
	}

	public void setMem_region(String mem_region) {
		this.mem_region = mem_region;
	}

	public String getMem_memo() {
		return mem_memo;
	}

	public void setMem_memo(String mem_memo) {
		this.mem_memo = mem_memo;
	}

	public AddMemberVO() { }

	public AddMemberVO(int infonum, int mem_no, int mem_sex, Date mem_birthday, String mem_email, String mem_region,
			String mem_memo) {
		super();
		this.infonum = infonum;
		this.mem_no = mem_no;
		this.mem_sex = mem_sex;
		this.mem_birthday = mem_birthday;
		this.mem_email = mem_email;
		this.mem_region = mem_region;
		this.mem_memo = mem_memo;
	}
	


}
