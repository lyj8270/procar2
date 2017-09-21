package car.dto;

public class BoardDto {
	private int boardNum;
	private String title;
	private String content;
	private String boardDate;
	private String id;
	
	public BoardDto() {
	}

	public BoardDto(int boardNum, String title, String content, String boardDate, String id) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.boardDate = boardDate;
		this.id = id;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
