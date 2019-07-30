### JavaBean?

JavaBean = JavaComponent

재사용성이 높은 큰 덩어리.
클래스(+ α)의 모임.
시중에 다양한 Component가 제공되고 있다. 유료로 구매하면 쉽게 응용하여 사용할 수 있다.
UI적인 Component는 다양한 property를 제공하고 있다.
property는 사용자가 설정

ex) Swing의 JButton, Android Studio의 Button등

**Java Component의 조건**
1) public class 여야한다
2) public 매개변수 없는 생성자 필요
3) property용 mf는 public 이면 안된다
4) property용 public setter/getter 메서드 필요

자바빈의 포맷으로 만들어진 클래스
```java
public Ex {
	private String id;
	private boolean power;
	
	// 생성자
	public Ex() {}

	// setter, getter
	public void setId(String id){this.id = id;}
	public void setPower(boolean power){this.power = power;}
	public String getId(){return id;}
	public boolean isPower(){return power;}
}
```

Eclipse의 자동 source 생성 메서드를 통해 만들면 자바빈의 조건을 만족하는 클래스가 만들어진다.

## CBD
Component Based Development
컴포넌트 기반 개발

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyODM2MTQxMTVdfQ==
-->