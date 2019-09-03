
어노테이션을 사용함으로써 xml 코드의 길이를 줄일 수 있다.

## Spring Anootation

### 스프링 컨테이너에서 관리될 객체에서 사용되는 어노테이션들

클래스 선언 앞
@Controller
@Service
@Repository

프로퍼티 앞
@Autowired

메서드 앞
@RequestMapping
@GetMapping
@PostMapping

메서드의 파라메터(매개변수) 앞
@RequestParam
@ModelAttribute

---

### 스프링 컨테이너 설정용 자바 클래스에서 사용되는 어노테이션들
@Configuration
@Bean

## @Configuration / @Bean: Spring container 설정

@Configuration / @Bean

xml 파일을 대체하는 JAVA 파일을 생성하기 위해 사용하는 annotation

##### @Configuration description
@Component  
@Target(value={TYPE})  
@Retention(value=RUNTIME)  
@Documented
>@Component 어노테이션의 자식
>사용할 수 있는 위치: TYPE = class, interface등의 앞
>실행시에 효과를 내는 어노테이션: RUNTIME

자바 파일보다 xml이 관리하기 더 용이해서 java configuraion 보다는 xml을 더 많이 사용한다. 

### Java Annotation class로 bean 주입하기
##### 예제 xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:jdbc="http://www.springframework.org/schema/jdbc"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/jdbc http://www.springframework.org/schema/jdbc/spring-jdbc-4.3.xsd">
	<bean id="first" class="a.First">
		<property name="msg" value="금요일입니다."/>
	</bean>
</beans>
```

1. 일반 JAVA POJO CLASS 생성
2. 클래스 앞에 @Configuration 어노테이션 붙이기
3. 클래스 내부에 @Bean 어노테이션을 붙인 멤버함수 생성
`public 클래스명 id() {}`
4. 값을 주입해주는 코드 작성
5. `ApplicationContext ctx = new AnnotationConfigApplicationContext(yourbeanclassname.class);` 로 spring container 구동

<br>

##### 만들어진 java annotation class
```java
@Configuration
public class Beans {
	@Bean
	public First first() {
		First f = new First();
		f.setMsg("금요일입니다.");
		return f;
	}
}
```

##### testing code
```java
public class Test {

	public static void main(String[] args) {
		String path="beans.xml";
		
		// 1: xml 파일 일때의 구동 코드
		// ApplicationContext ctx = new ClassPathXmlApplicationContext(path);
		
		// 2: java annotation 파일 일때의 구동 코드
		ApplicationContext ctx = new AnnotationConfigApplicationContext(Beans.class);
		
		First f = ctx.getBean("first", a.First.class);
		System.out.println(f.getMsg());
	}
}
```

## @Autowired: 자동 주입

@Autowired

@Autowired 어노테이션을 사용하기 위해서는 beans.xml의 namespace 탭에서 context를 체크하고
```xml
<context:annotation-config/>
```
어노테이션을 사용할 수 있게 해주는 구문을 추가해준다.

##### Ex) First에 second 멤버 변수를 자동 주입한다
```java
public class First {
	private String msg;
	
	@Autowired
	private Second second;
	
	// 매개변수 없는 public 생성자가 compile 시에 추가됨
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	@Override
	public String toString() {
		return "msg = " + msg + ", second.info() = " + second.info();
	}
}
```
>xml파일에 first에 second를 주입하는 코드가 없어도 자동으로 주입된다.
>
>단, second bean을 선언하는 코드는 필요하다
>`<bean id="second" class="Second"/>`
>
>이 구문을 생략할 시 NoSuchBeanDefinitionException 발생

##### testing code
```java
public static void main(String[] args) {
	String path="beans.xml";
	// spring container 구동
	ApplicationContext ctx = new ClassPathXmlApplicationContext(path);
		
	First f = ctx.getBean("first", a.First.class);
	System.out.println(f);	// f.toString() 자동 호출
}
```
>msg = 금요일입니다., second.info() = Second2 객체입니다

### 장점
second에 대한 setter 메서드를 만들고, beans.xml에
```xml
<bean id="second" class="Second"/> <!-- 이 구문은 @Autrowired를 사용할 시에도 작성해주어야한다. -->
<bean id="first" class="First">
	...
	<property name="second" ref="second"/>
	<constructor-arg name="second" ref="second"/>
</bean>
```
를 추가하는 구문을 @Autowired를 사용함으로써 생략할 수 있다.


### @Autowired 사용시 주의할 점
#### 1. NoSuchBeanDefinitionException
```xml
<!-- beans.xml 파일에 Second 클래스 bean객체가 없을 경우 -->
<!-- <bean id="second" class="a.Second2"/> -->
```
>Second 객체가 없어서 자동주입 실패
>NoSuchBeanDefinitionException
>
>Second 객체가 없어서 자동주입이 되지않아도 null로 유지하려면 @Autowired(required = false)로 설정한다. (권장x)

#### 2. NoUniqueBeanDefinitionException
```xml
<bean id="second1" class="a.Second1"/>
<bean id="second2" class="a.Second2"/>
```
>Second 객체가 여러개여서 자동주입 실패
>NoUniqueBeanDefinitionException

<br>

**qualifying을 통해 해결하기**

`<qualifier>` 태그 사용
```xml
<bean id="second1" class="a.Second1">
	<qualifier value="s1"/>
</bean>
<bean id="second2" class="a.Second2">
	<qualifier value="s2"/>
</bean>
```
@Qualifier() 어노테이션 사용
```java
@Autowired
@Qualifier("s1")
private Second second;
```
>여기서 "s1"을 annotation의 property 라고한다.

#### 3. 클래스 앞에는 사용할 수 없다.

@Target(value={ANNOTATION_TYPE, CONSTRUCTOR, FIELD, METHOD, PARAMETER})  

생성자, 멤버 필드, 메서드 등의 앞에 사용 가능하지만, 클래스의 앞에는 사용할 수 없다.

#### 4. 실행시에 효과를 내는 어노테이션이다.

@Retention(value=RUNTIME)  

## @PostConstruct: 자동 호출

### 자동 호출 property

init-method

```xml
<bean id="first" class="a.First" init-method="init">
	<property name="msg" value="금요일입니다."/>
</bean>
```
>객체가 생성될때 init() 메서드가 자동 호출

### 자동 호출 annotation

@PostConstruct

```java
@PostConstruct
public void init() {
	System.out.println("init 메서드 호출됨");
	flag = true;
}
```
>spring annotation이 아닌 javax annotation

## @Import: 다수의 configuration java 파일 사용


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

### exclude-filter

@Component가 설정되어 있어도 특정 조건에 만족하는 클래스를 객체 생성에서 제외한다.

```xml
<context:component-scan base-package="com.my.dao">
	<context:exclude-filter type="annotation" expression=".*Oracle"/>
</context:component-scan>
```
>regex: 정규식(regular expression: 언어 독립적 표현식)
>~~Oracle인 클래스를 객체 생성에서 제외한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU4MTk0MDEwMSwtMTU3OTA0MDU0OCwtMT
c2MjE5NzQ3LDUwMzUxMTk5MywtMTQ2NjQ3MjcxOCwtNzk3NDIy
ODQ0LC0xNjg4MTU0Mjg2LDE3MTE2MDcxOTgsMjA3NjQ4MTE3LC
0xMjc5MTg1MDk5LDE0MTk0MzY0NTksMTYyODE5ODk5MSwtNDk1
MjU3MzUzLC0xNjk2ODI4NzQ1LC0xMjY2NzgyNjUxLDU4OTcyMD
gyMCwtMjQzMjE3NjE4LDY2MDUwMDY2NywtMTUzNDY2NDg3M119

-->