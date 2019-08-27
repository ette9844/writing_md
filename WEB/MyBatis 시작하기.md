## 주의 사항
MyBatis2 와 MyBatis3 / MyBatis 와 iBatis 는 상호간에 버전호환이 안되므로 잘 구분해서 사용해야한다.

## 시작하기

### 1) [mybatis-3.x.x.jar](https://github.com/mybatis/mybatis-3/releases) 파일을 다운 받는다

### 2) 다운 받은 라이브러리를 프로젝트에 넣는다
> properties > java built path > add external jar > mybatis.jar 등록
> 
### 3) Java 소스 코드를 통해 XML에서 SqlSessionFactory 빌드한다
```java
String resource =  "프로젝트의 mybatis config.xml 경로/mybatis-config.xml";  
InputStream inputStream =  Resources.getResourceAsStream(resource);
SqlSessionFactory sqlSessionFactory =  new  SqlSessionFactoryBuilder().build(inputStream);
```
설정용 xml 파일에 SqlSessionFactory 객체를 생성
>SqlSessionFactory는 디자인 패턴 : **Factory 패턴**을 사용한다.
>
>설정을 위해 **클래스패스 자원**을 사용하는 것을 추천하나 파일 경로나 file:// URL로부터 만들어진 InputStream인스턴스를 사용할 수도 있다. 
>
>마이바티스는 **클래스패스**와 다른 위치에서 자원을 로드하는 것으로 좀더 쉽게 해주는 Resources 라는 유틸성 클래스를 가지고 있다.

#### 클래스패스
- 클래스가 저장되어있는 경로
- 기본 클래스패스: bin
- 파일을 src 폴더로 이동하면 bin폴더에 자동으로 복붙 됨.

### 4) mybatis-config.xml을 위에서 지정해준 경로에 생성해준다
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
>

#### xml
- xml 파일의 첫줄에는 선언부가 반드시 필요. (주석도 달면 안된다.)
- root element는 단 한개

- `<configuration>`의 Content Model
>Content Model : (properties?, settings?, typeAliases?, typeHandlers?, objectFactory?, objectWrapperFactory?, 
 reflectorFactory?, plugins?, environments?, databaseIdProvider?, mappers?)
> `?` : 없거나 한개만 올 수 있다. 0또는 1
> `*` : 없거나 여러개 올 수 있다. 
> `,` : 이 순서대로 와야한다.

### 5) mybatis-config.xml 파일의 property 값을 프로젝트의 driver/url/username/password 값으로 설정해준다.
```xml
<property name="driver" value="oracle.jdbc.driver.OracleDriver"/>
<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
<property name="username" value="user1"/>
<property name="password" value="password"/>
```

### 6) SqlSessionFactory 에서 SqlSession 만들기 
= DB 연결 작업

SqlSessionFactory 이름에서 보듯이 SqlSession 인스턴스를 만들수 있다. SqlSession 은 데이터베이스에 대해 SQL명령어를 실행하기 위해 필요한 모든 메소드를 가지고 있다.

SQL이 들어있는 xml 파일 = Mapper용 xml 파일

```java
SqlSession session = sqlSessionFactory.openSession();
Blog blog = session.selectOne("org.mybatis.example.BlogMapper.selectBlog", 101);
```

### 7) 매퍼용 xml 파일 생성
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="org.mybatis.example.BlogMapper">
  <update id="updateName">
    UPDATE customer SET name='마이' WHERE id = #{id}
  </update>
</mapper>
```
>namespace: 구별해줄 수 있는 중복되지 않는 이름으로 설정
>select를 사용할 때에는 `<select>`
>update를 사용할 때에는 `<update>` ...
>기존 JAVA내 sql문의 `?` 바인드 변수는 `#{}`로 표기한다.

### 8) mybatis-config.xml의 매퍼용 xml파일 경로를 지정해준다.
```xml
  <mappers>
    <mapper resource="customerMapper.xml"/>
  </mappers>
  ```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEyMjIyNDMxNjMsMjYwNTU3MzI1LDU4NT
g4MTQyMiwxNTczMjU1OTU1LDEzOTgzNDgwMTYsLTE3NjMxMDQx
MDZdfQ==
-->