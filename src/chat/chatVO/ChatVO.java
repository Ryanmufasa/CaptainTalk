package chat.chatVO;

public class ChatVO {

	private int ch_id;
	private String ch_title;
	
	
	public ChatVO() {}


	public ChatVO(int ch_id, String ch_title) {
		super();
		this.ch_id = ch_id;
		this.ch_title = ch_title;
	}


	public int getCh_id() {
		return ch_id;
	}


	public void setCh_id(int ch_id) {
		this.ch_id = ch_id;
	}


	public String getCh_title() {
		return ch_title;
	}


	public void setCh_title(String ch_title) {
		this.ch_title = ch_title;
	}
	
	
	
	
}
