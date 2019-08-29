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
## DI  방식 1: setter 메서드 방식

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

#### 의존 객체 변경의 유연함
소스 코드에는 각 xml 설정 파일을 호출하는 코드만 들어가고, xml파일만 수정하면 된다.

## 객체 조립기
spring용 설정 xml 파일을 생성해주는 도구

## Annotation 방식
@Configuration / @Bean

class / java 소스코드 / xml 파일을 모두 관리해주기 어려우므로 xml 파일 대신 자바 소스 코드를 이용해서 조립하는 방식


## DI 방식 2: 생성자 방식
```java
public class A {
	private B b;
	public A(B b) { this.b = b; }
	public String toString() { return b.b(); }
}
```
>A a1 = new A(new B2());
>


## 실제 적용
#### beans 탭에서 의존성 주입
![injection](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean-injection.PNG?raw=true)
>class를 a.Second1 에서 a.Second2로 변경한다.
>
>![result1](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean-result1.PNG?raw=true)  &nbsp;&nbsp;&nbsp;→ &nbsp;&nbsp;&nbsp;![result2](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean-result2.PNG?raw=true)

beans 탭에서 의 실객체 클래스를 바꿔줄 경우 소스 코드에 아무런 변경이 없음에도 달라진 결과값이 출력되는 것을 볼 수 있다.

인터페이스와 실객체 간의 실체 주입을 외부 xml 파일로 결정하기 위해서 이러한 기능을 제공한다.

## 생성자 방식으로 DI 

setter 메서드 방식 DI : property 태그
```xml
<bean id="first-set" class="a.First"><!-- First first = new First(); -->
	<property name="num" value="77"></property><!-- first.setNum(99); //값 주입 -->
	<property name="second" ref="second"></property><!-- first.setSecond(second); -->
</bean>
```

생성자 방식 DI : constructor-arg 태그
```xml
<bean id="first-con" class="a.First"><!-- First first = new First(); -->
	<!-- 매개변수가 총 4개인 생성자에 매개변수 주입 -->
	<constructor-arg name="num" value="88"/>
	<constructor-arg name="flag" value="true"/>
	<constructor-arg name="msg" value="hello"/>
	<constructor-arg name="second" ref="second"/> <!-- 이미 만들어져있는 second 객체 사용: ref -->
</bean>
```

테스팅 코드

```java
// first1과 first2의 비교
// id에 해당하는 객체는 하나씩 만들어지지만, id가 서로 다르면 다른 객체
System.out.println(first1 == first2); 	// false
		
// 두 객체가 ref 하는 second 객체는 같은 객체이기 때문에 true
System.out.println(first1.getSecond() == first2.getSecond()); 	// true
```
>id에 해당하는 객체는 하나씩만 만들어진다.(singleton 패턴)
>id가 다를 경우에는 다른 객체
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE1MTMwMzk2OTksOTU5MjQxMzg1LC01Mz
cwNTY5OTldfQ==
-->