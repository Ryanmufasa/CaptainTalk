package member.memberVO;

public class MemberVO {
	
	private int mem_no; 
	private String mem_id;
	private String mem_password;
	private String mem_name;
	private String mem_tel1;
	private String mem_tel2;
	private String mem_tel3;
	
	public MemberVO() {}

	public MemberVO(String mem_id, String mem_password, String mem_name, String mem_tel1, String mem_tel2,
			String mem_tel3) {
		super();
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.mem_name = mem_name;
		this.mem_tel1 = mem_tel1;
		this.mem_tel2 = mem_tel2;
		this.mem_tel3 = mem_tel3;
	}
	
	public MemberVO(int mem_no, String mem_id, String mem_password, String mem_name, String mem_tel1, String mem_tel2,
			String mem_tel3) {
		super();
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_password = mem_password;
		this.mem_name = mem_name;
		this.mem_tel1 = mem_tel1;
		this.mem_tel2 = mem_tel2;
		this.mem_tel3 = mem_tel3;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_tel1() {
		return mem_tel1;
	}

	public void setMem_tel1(String mem_tel1) {
		this.mem_tel1 = mem_tel1;
	}

	public String getMem_tel2() {
		return mem_tel2;
	}

	public void setMem_tel2(String mem_tel2) {
		this.mem_tel2 = mem_tel2;
	}

	public String getMem_tel3() {
		return mem_tel3;
	}

	public void setMem_tel3(String mem_tel3) {
		this.mem_tel3 = mem_tel3;
	}
	
}