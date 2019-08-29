## Spring 프로젝트 생성

### 1. 메이븐 프로젝트로 변경
프로젝트 우클 > configure > convert to maven project

### 2. maven repository 에서 spring context dependency를 복사
[spring-context 5.0.2 링크](https://mvnrepository.com/artifact/org.springframework/spring-context/5.0.2.RELEASE)

maven 탭의 코드를 복사
```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.0.2.RELEASE</version>
</dependency>
```

pom 을 사용할 수 있을 때는 위처럼 입력하면 eclipse가 알아서 build 해준다.

pom을 사용할 수 없을 경우에는 spring context jar파일과 아래에 있는 의존성 있는 다른 jar파일까지 모두 받아줘야한다.

### 3. 생성된 pom.xml에 `<dependencies>` 태그 생성

### 4. `<dependencies>` 태그 내부에 복사한 내용 붙여넣기

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>spring1</groupId>
  <artifactId>spring1</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <dependencies>
    <!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-context</artifactId>
      <version>5.0.2.RELEASE</version>
    </dependency>
  </dependencies>
  <build>
    <sourceDirectory>src</sourceDirectory>
    <plugins>
      <plugin>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.0</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
```
저장하고 build 완료될때까지 기다려야 함

### 5. xml 파일 관리를 용이하게 해주는 플러그인 설치
Help > Marketplace 에서 

![spring framework plugin](https://github.com/ette9844/writing_md/blob/master/imgs/spring-plugin.PNG?raw=true)
>Spring Tools 4 - for Spring boot : 
>spring boot를 사용하는 프로젝트에서 사용
>
>Spring Tools 3 Add-on for Spring tools 4 : 
>spring tools4에 spring tools3 의 컴포넌트를 추가해주는 애드온

### 6. CLASSPATH에 Spring Bean Configuration File 생성
![spring new file](https://github.com/ette9844/writing_md/blob/master/imgs/spring-newfile.PNG?raw=true)

Spring Bean Configuration File 생성

![spring new file2](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean3.PNG?raw=true)

필요한 namespace 선택 후 finish

### 7. beans 탭을 이용하여 xml 파일 작성

생성된 xml 파일의 beans 탭에서 쉽게 xml 파일을 작성할 수 있다.

beans 탭 페이지

![bean tab](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean2.PNG?raw=true)
>new Bean ... 으로 기존 클래스를 bean으로 등록할 수 있다.
>
>![spring-bean1.PNG](https://github.com/ette9844/writing_md/blob/master/imgs/spring-bean1.PNG?raw=true)


자동으로 생성된 코드

![bean source code](https://github.com/ette9844/writing_md/blob/master/imgs/spring-beansource.PNG?raw=true)

+) 작성된 xml 소스코드에서 ctrl 버튼을 누른채로 클래스명을 클릭하면 클래스 파일로 바로갈 수 있다.

### 8. xml 파일을 구동시켜 객체 생성
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

## List/Map 주입하기
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

```java

```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTkzMzEyMjI3Miw3OTQ5NzAzMiwxOTM2ND
czODgyLDE1MDEyODM5MDAsNTQxNzE0MjA3LC0zMDMwODQwMjgs
LTEzNTkyMTY1ODcsMTk5ODE3NzM4NywzNTE5MzcwNzcsLTQ0OD
E1MDMzNywxMjQ2MDA1OTM1LC0xNTI3MjA1NjA2LC03Njg0ODA4
MjRdfQ==
-->