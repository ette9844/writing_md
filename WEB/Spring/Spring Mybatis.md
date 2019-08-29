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

### 2. dataSource 연결

```xml
<bean id="dataSource"
		class="org.springframework.jdbc.datasource.DriverManagerDataSource">
		<property name="driverClassName"
			value="oracle.jdbc.driver.OracleDriver">
		</property>
		<property name="url"
			value="jdbc:oracle:thin:@localhost:1521:xe">
		</property>
	<property name="username" value="hyejin"></property>
	<property name="password" value="wow130"></property>
</bean>
```
>dataSource를 연결하지 않으면 주도권이 mybatis-config.xml으로 넘어가서 environment 태그를 사용
>
>DB와의 연결을 spring 연결에서 mybatis 연결을 사용하게 됨 (일관성 x)


DB와의 연결을 spring이 주도하고, spring에서 사용하는 DB연결 정보를 계속 유지하도록 하기 위해, dataSource를 연결한다.

연결한 이후에는 mybatis-config.xml 내의 environment 태그를 지워도 무방하다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU0MjA4NzYzMSwxODU5NTI3NDYwLDExMT
YzMzY1ODNdfQ==
-->