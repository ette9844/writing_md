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



ctrl 버튼을 누른채로 클릭하면 a.Second1 파일로 바로갈 수 있다.

### 7. beans 탭을 이용하여 xml 파일 작성

### 8. xml 파일을 구동시켜 객체 생성

#### bean class의 메서드가 자동으로 호출 됨

#### bean 탭에서 의존성 주입


인터페이스와 실객체 간의 실체 주입을 외부 xml 파일로 결정하기 위해서 이러한 기능을 제공한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTQxNzE0MjA3LC0zMDMwODQwMjgsLTEzNT
kyMTY1ODcsMTk5ODE3NzM4NywzNTE5MzcwNzcsLTQ0ODE1MDMz
NywxMjQ2MDA1OTM1LC0xNTI3MjA1NjA2LC03Njg0ODA4MjRdfQ
==
-->