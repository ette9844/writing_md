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
mybatis-config.xml (New File로 생성해서 생성자를 xml 으로)
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <environments default="development">
    <environment id="development">
      <transactionManager type="JDBC"/>
      <dataSource type="POOLED">
        <property name="driver" value="${driver}"/>
        <property name="url" value="${url}"/>
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
      </dataSource>
    </environment>
  </environments>
  <mappers>
    <mapper resource="org/mybatis/example/BlogMapper.xml"/>
  </mappers>
</configuration>
```
>![enter image description here](https://github.com/ette9844/writing_md/blob/master/imgs/mybatis-path.PNG?raw=true)
>※경로를 resource = "mybatis-config.xml" 로 설정했을 경우. 현재 디렉토리(src 폴더 내부나 패키지 폴더 내부)가 아닌 프로젝트 root 디렉토리 내부를 뜻한다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbNTg1ODgxNDIyLDE1NzMyNTU5NTUsMTM5OD
M0ODAxNiwtMTc2MzEwNDEwNl19
-->