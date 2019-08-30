```xml
<context:annotation-config/>
<context:component-scan base-package="a"/>
```
>base-package: bean class들이 있는 패키지명
```java
@Component
public class First {
	@Autowired
	@Qualifier("s1")
	private Second second;
	...
}

@Component(value = "s1")
public class Second1 implements Second {	
	...
}
```
>component의 value : id 값
>같은 클래스인 bean 객체가 있을? 경우 qualifier로 인식

@Component 어노테이션이 붙어있는 객체만 선언.
어노테이션을 통해 xml 코드의 길이를 줄인다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2MDkzMTY3MDVdfQ==
-->