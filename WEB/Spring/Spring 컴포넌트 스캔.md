
## @Component: 컴포넌트 스캔

@Component 어노테이션을 사용하기 위해서는 beans.xml의 namespace 탭에서 context를 체크하고
```xml
<context:component-scan base-package="a"/>
```
>base-package: bean class들이 있는 패키지명
>
위 구문을 추가해준다.

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
>
>
>```java
>@Component("orderDAO")
>public class OrderDAOOracle implements OrderDAO {} 
>
><bean id="orderDAO" >class="com.my.dao.OrderDAOOracle">
>```
>위 두 구문은 같은 의미

@Component 어노테이션이 붙어있는 클래스를 bean 객체로 자동 생성.

### @Component 상속 관계
```text

					@Component
			|			|			|
	@Repository		@Service	@Controller
		[DAO]		[Service]	[Controller]

```
즉, DAO 클래스에 Component 선언을 하고 싶을 때에는 @Repository로 선언하는 것이 맞다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTgzMDc2NjQxLC0xNjA5MzE2NzA1XX0=
-->