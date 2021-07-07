package kr.ac.kopo.member.vo;

public class MemberDetailVO {
	
	private String name;
	private String id;
	private String emailDomain;
	private String emailId;
	private String tel1;
	private String tel2;
	private String tel3;
	private String basicAddr;
	private String detailAddr;
	private String post;
	private String regDate;
	private String type;
	private String password;
	
	public MemberDetailVO(){		
		
	}







	public MemberDetailVO(String name, String id, String emailDomain, String emailId, String tel1, String tel2,
			String tel3, String basicAddr, String detailAddr, String post, String regDate, String type,
			String password) {
		super();
		this.name = name;
		this.id = id;
		this.emailDomain = emailDomain;
		this.emailId = emailId;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.basicAddr = basicAddr;
		this.detailAddr = detailAddr;
		this.post = post;
		this.regDate = regDate;
		this.type = type;
		this.password = password;
	}







	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getBasicAddr() {
		return basicAddr;
	}

	public void setBasicAddr(String basicAddr) {
		this.basicAddr = basicAddr;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", id=" + id + ", emailDoamin=" + emailDomain + ", tel1=" + tel1 + ", tel2="
				+ tel2 + ", tel3=" + tel3 + ", basicAddr=" + basicAddr + ", detailAddr=" + detailAddr + ", regDate="
				+ regDate + "]";
	}
	
	
	
	
}
