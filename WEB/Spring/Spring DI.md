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
>A a= new A();
sop(a);	// a.toString() 자동호출
>
>사용자는 정해진 값밖에 볼 수 없다.

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
>사용자가 입력한 값을 볼 수 있다.

이를 외부(사용자)에서 값을 주입한다고 말한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTEzODI4Nzc4XX0=
-->