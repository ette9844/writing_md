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

## 의존성 주입 (DI)

```java
public interface B {
	String b();
}

public class B1 implements B {
	public String b() { return "b1"; }
}
public class B2 implements B {
	public String b() { return "b2"; }
}

public class A {
	private B b;
	public void setB(B b) { this.b = b; }
	public B getB() { return b; }
	public String toString() { return b.b(); }
}
```
>A a1 = new A();
>a1.setB(new B1());
>sop(a1): 			// "b1"
>
>A a2 = new A();
>a2.setB(new B2());
>sop(a2);		// "b2"

A는 인터페이스 B하고만 HAS-A관계를 맺고 있다.
B에 들어갈 실객체는 사용자에 따라서 어떤 객체가 주입될지가 결정된다.

이렇듯 사용자가 주입을 통해 객체 생성에 관여하는 것을 **의존성 주입**이라고 한다.

## 의존 객체
위 예제에서 B1 객체와 B2 객체를 의존 객체라고 한다.

객체를 생성하는 a1.setB(new B1());, a2.setB(new B2()); 코드를 xml 파일로 설정할 수 있다.

소스 코드에는 각 xml 설정 파일을 호출하는 코드만 들어가고, xml파일만 
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI4ODMxMDc3NCwtNTM3MDU2OTk5XX0=
-->