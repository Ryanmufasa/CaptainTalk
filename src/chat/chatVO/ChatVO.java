package chat.chatVO;

public class ChatVO {

	private String chr_name;
	private String chr_mem;
	
	
	public ChatVO() { }
	
	
	public ChatVO(String chr_name, String chr_mem) {
		super();
		this.chr_name = chr_name;
		this.chr_mem =chr_mem;
	}
	
	
	public String getChr_name() {
		return chr_name;
	}
	
	public void setChr_name(String chr_name) {
		this.chr_name = chr_name;
	}
	
	public String getChr_mem() {
		return chr_mem;
	}
	
	public void setChr_mem(String chr_mem) {
		this.chr_mem = chr_mem;
	}
}
