## DI
Dependency Injection
의존 주입

## 주입
```java
public class A {
	private String msg="안녕하세요";
	public String toString(){
		return msg;
	}
}
```
>A a = new A();
sop(a);	// a.toString() 자동호출
>
>사용자는 정해진 값밖에 볼 수 없다.

```java
public class A {
	private String msg;
	public void setMsg(String msg){
		this.msg = msg;
	}
	public void getMsg() { return msg; }
	public String toString(){ return msg; }
}
```
>A a = new A();
>a.setMsg("HELLO");
>sop(a); // HELLO
>사용자가 입력한 값을 볼 수 있다.

이를 외부(사용자)에서 값을 주입한다고 말한다.

## 의존성 주입

```java
public interface B{
	String b();
}
public class B1 implements B{
	public String b() { return "b1"; }
}
public class A{
	private B b;
	public void setB(B b) { this.b = b; }
	public B getB() { return b; }\
	public 

```
	
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY1NDk3MjE3N119
-->