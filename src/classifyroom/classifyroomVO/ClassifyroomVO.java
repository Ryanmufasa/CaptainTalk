package classifyroom.classifyroomVO;

public class ClassifyroomVO {
	
	private String cla_name;
	private String cla_mem;
	
	
	public ClassifyroomVO() { }
	
	
	public ClassifyroomVO(String cla_name, String cla_mem) {
		super();
		this.cla_name = cla_name;
		this.cla_mem = cla_mem;
	}


	public String getcla_name() {
		return cla_name;
	}


	public void setCla_name(String cla_name) {
		this.cla_name = cla_name;
	}


	public String getcla_mem() {
		return cla_mem;
	}


	public void setCla_mem(String cla_mem) {
		this.cla_mem = cla_mem;
	}

	

	
	
}
