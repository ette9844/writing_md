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


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTM5ODM0ODAxNiwtMTc2MzEwNDEwNl19
-->