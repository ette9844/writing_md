### 메이븐 프로젝트로 변경
프로젝트 우클 > configure > convert to maven project

### maven repository 에서 spring context dependency를 복사
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

### 생성된 pom.xml에 `<dependencies>` 태그 생성

### `<dependencies>` 태그 내부에 복사한 내용 붙여넣기


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0OTY1MjA3MTNdfQ==
-->