### 메이븐 프로젝트로 변경
프로젝트 우클 > configure > convert to maven project

### maven repository 에서 spring context dependency를 복사
[spring-context 5.0.2 링크](https://mvnrepository.com/artifact/org.springframework/spring-context/5.0.2.RELEASE)

maven 탭의 코드 복사
```xml
<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.0.2.RELEASE</version>
</dependency>
```

pom 을
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE4MTAyNzA4NDRdfQ==
-->