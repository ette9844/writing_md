## 주의 사항
MyBatis2 와 MyBatis3 / MyBatis 와 IBatis 는 상호간에 버전호환이 안되므로 잘 구분해서 사용해야한다.

## 시작하기
1) [mybatis-3.jar](https://github.com/mybatis/mybatis-3/releases) 파일을 다운 받는다.
2) XML에서 SqlSessionFactory 빌드하기
``
String resource =  "org/mybatis/example/mybatis-config.xml";  InputStream inputStream =  Resources.getResourceAsStream(resource);  SqlSessionFactory sqlSessionFactory =  new  SqlSessionFactoryBuilder().build(inputStream);
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTU4MjEwNTQyNF19
-->