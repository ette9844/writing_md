## 주의 사항
MyBatis2 와 MyBatis3 / MyBatis 와 iBatis 는 상호간에 버전호환이 안되므로 잘 구분해서 사용해야한다.

## 시작하기
### 1) [mybatis-3.x.x.jar](https://github.com/mybatis/mybatis-3/releases) 파일을 다운 받는다.
### 2) 다운 받은 라이브러리를 프로젝트에 넣기.
> properties > java built path > add external jar > mybatis.jar 등록
### 3) Java 소스 코드를 통해 XML에서 SqlSessionFactory 빌드하기
```java
String resource =  "프로젝트의 mybatis config.xml 경로/mybatis-config.xml";  
InputStream inputStream =  Resources.getResourceAsStream(resource);  
SqlSessionFactory sqlSessionFactory =  new  SqlSessionFactoryBuilder().build(inputStream);
```
설정용 xml 파일에 SqlSessionFactory 객체를 생성
>SqlSessionFactory는 디자인 패턴 : **Factory 패턴**을 사용한다.
### 4) mybatis-config.xml을 위에서 지정해준 경로에 생성해준다.
```
<?xml version="1.0" encoding="UTF-8"  ?>  
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">  
<configuration>  <environments  default="development">  <environment  id="development">  <transactionManager  type="JDBC"/>  <dataSource  type="POOLED">  <property  name="driver"  value="${driver}"/>  <property  name="url"  value="${url}"/>  <property  name="username"  value="${username}"/>  <property  name="password"  value="${password}"/>  </dataSource>  </environment>  </environments>  <mappers>  <mapper  resource="org/mybatis/example/BlogMapper.xml"/>  </mappers>  </configuration>
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTMzNTE5ODAzOSwxMzk4MzQ4MDE2LC0xNz
YzMTA0MTA2XX0=
-->