package car.dto;

public class BookmarkDto {
	private int bNum;
	private String id;
	private int sId;
	
	
	// 기본생성자
	public BookmarkDto() {
	}

	// 생성자
	public BookmarkDto(int bNum, String id, int sId) {
		super();
		this.bNum = bNum;
		this.id = id;
		this.sId = sId;
	}

	// getter, setter
	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}
	
	
}
