package car.dto;

public class AddressDto {
	private int addrNum;
	private String addrName;
	
	// 기본 생성자
	public AddressDto() {
	}
	
	// 생성자
	public AddressDto(int addrNum, String addrName) {
		super();
		this.addrNum = addrNum;
		this.addrName = addrName;
	}

	// getter, setter	
	public int getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddrName() {
		return addrName;
	}

	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}
	
	
	
	
	

}
