package bean;

public class User1Bean {
	
	private String uid;
	private String name;
	private String hp;
	private int age;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	// 데이터 길이만큼의 자료를 저장해야하기때문에, 리스트구조를 만들어야하므로, jsp에 List 통을 하나 선언 하여 만들어줌 
	// private 으로 변수 선언하였으므로, 꼭 Lombok(Data) or getter/setter 메서드를 만들어줘야함 
	

}
