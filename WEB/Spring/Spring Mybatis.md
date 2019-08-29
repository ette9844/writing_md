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
>dataSource를 연겷
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3NjM0MDM2NDAsMTg1OTUyNzQ2MCwxMT
E2MzM2NTgzXX0=
-->