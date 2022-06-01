package membersocket.membersocketVO;

public class ClassifyroomVO {
	
	private String room;
	private String mem_id;
	
	
	public ClassifyroomVO() { }
	
	
	public ClassifyroomVO(String room, String mem_id) {
		super();
		this.room = room;
		this.mem_id = mem_id;
	}

	

	public String getRoom() {
		return room;
	}


	public void setRoom(String room) {
		this.room = room;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	
}
