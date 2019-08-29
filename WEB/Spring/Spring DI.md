## DI
Dependency Injection
의존 주입

```java
public class A {
	private String msg="안녕하세요";
	public String toString(){
		return msg;
	}
}
```
A a= new A();
sop(a);	// a.toString() 자동호출
사용자는 정해진 값밖에 볼 수 없다.

```java
public class A {
	private String msg;
	public void setMsg(String msg){
		this.msg = msg;
	}
	public void getMsg()
	public String toString(){
		return msg;
	}
}
```
사용자가 주입한 값을 출력한다.

두번째 방법이 의존성을 주입하는 방법이다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTQzMjQ3MDgzXX0=
-->