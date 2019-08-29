## xml 파일을 구동시켜 객체 생성
```java
public class Test {

	public static void main(String[] args) {
		// * xml 파일 구동
		String path = "yourxmlfilename.xml";
		ApplicationContext ctx;	// Spring Container: Spring에서 쓰일 객체관리자
		
		// * 클래스패스(bin경로) 기준으로 xml 찾아오기
		ctx = new ClassPathXmlApplicationContext(path);
		
		// * xml에서 인자 불러오기
		First first = ctx.getBean("first", a.First.class);
		// 첫번째 인자: 찾고자 하는 객체의 name이나 id로 찾기
		// 두번째 인자: 찾아온 객체가 a.First.class 타입으로 다운 캐스팅이 가능한지 물어보고 다운 캐스팅

		System.out.println(first);
		System.out.println(first.getNum());
		System.out.println(first.getSecond().info());		

		First first1 = ctx.getBean("first", a.First.class);
		System.out.println(first1);	// 싱글톤으로 관리되기 때문에 둘다 같은 객체를 참조하게 됨
	}
}
```

실행 결과

![result](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean-result.PNG?raw=true)
>bean class의 생성자, setter 메서드가 자동으로 호출 된다.

## beans 탭에서 DI (의존성 주입)
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

## List/Map 주입하기
List 주입
```xml
<bean id="first-list" class="a.First">
	<property name="list">
		<list value-type="java.lang.String">
			<value>ONE</value>
			<value>TWO</value>
			<value>THREE</value>
		</list>
	</property>
</bean>
```
테스팅
```java
First first3 = ctx.getBean("first-list", a.First.class);
System.out.println(first3.getList());
```
>[ONE, TWO, THREE]

Map 주입
```xml
<bean id="first-map" class="a.First">
	<property name="map">
		<map value-type="java.lang.String">
			<entry key="1" value="ONE"/>
			<entry key="2" value="TWO"/>
			<entry key="3" value="THREE"/>
		</map>
	</property>
</bean>
```
테스팅
```java
First first4 = ctx.getBean("first-map", a.First.class);
System.out.println(first4.getMap());
```
>{1=ONE, 2=TWO, 3=THREE}
>
>실제 property type으로 자동 변환 된다.
>First class의 Map-key 타입이 int 타입이라면 "1", "2"는 int 타입으로 자동 형변환 된다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5NzkwNDgyMiwtMTIwOTQzMDA1N119
-->