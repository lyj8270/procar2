package car.dto;

public class BbsDto {
	private int boardNum;
	private String title;
	private String content;
	private String date;
	private String id;
	public BbsDto() {
	}
	public BbsDto(int boardNum, String title, String content, String date, String id) {
		super();
		this.boardNum = boardNum;
		this.title = title;
		this.content = content;
		this.date = date;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BbsVO [boardNum=");
		builder.append(boardNum);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", date=");
		builder.append(date);
		builder.append(", id=");
		builder.append(id);
		builder.append("]");
		return builder.toString();
	}
	
}
