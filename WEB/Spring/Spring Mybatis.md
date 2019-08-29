## mybatis + spring

### 1.  pom.xml에 아래 라이브러리 dependency 추가

spring mybatis 라이브러리
[mybatis-spring 1.3.2](https://mvnrepository.com/artifact/org.mybatis/mybatis-spring/1.3.2)

spring jdbc 라이브러리
[spring jdbc 5.0.2](https://mvnrepository.com/artifact/org.springframework/spring-jdbc/5.0.2.RELEASE)

pom.xml
```xml
<version ~~>
<dependencies>
  	<!-- https://mvnrepository.com/artifact/org.springframework/spring-context -->
<dependencies>
	<dependency>
    	<groupId>org.springframework</groupId>
   	 	<artifactId>spring-context</artifactId>
    	<version>5.0.2.RELEASE</version>
	</dependency>
	<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
	<dependency>
    	<groupId>org.mybatis</groupId>
  		<artifactId>mybatis-spring</artifactId>
   		<version>1.3.2</version>
	</dependency>
	<!-- https://mvnrepository.com/artifact/org.springframework/spring-jdbc -->
	<dependency>
    	<groupId>org.springframework</groupId>
    	<artifactId>spring-jdbc</artifactId>
    	<version>5.0.2.RELEASE</version>
	</dependency>
</dependencies>
<build ~~>
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUxOTI5Njg4OCwxODU5NTI3NDYwLDExMT
YzMzY1ODNdfQ==
-->