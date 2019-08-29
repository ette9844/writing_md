## 특징
* 의존 주입(Dependency Injection: DI) 지원
* AOP (Aspect-Oriented Programming) 지원
* MVC 웹 프레임워크 제공
* JDBC, JPA 연동, 선언적 트랜잭션 처리 등 DB 연동 지원

### 선언적 트랜잭션
xml파일에 선언하여 트랜잭션을 처리하도록 하는 것.
exception 처리가 중요하다.

## Spring 의 배경: EJB
Enterprise Java Bean
기업형 **분산** 컴포넌트 개발 기술

기업에서 사용하는 Java Bean(=Component)

**EJB의 단점**
* 견고한 스펙
* 재사용성 저하
* 확장성 저하
* 무겁다
* 특정 WAS 필요 
(비용 때문에 소규모 회사는 EJB 사용 불가)

EJB의 대안으로 Spring 이 나왔다.

## Spring
기업형 **로컬** 컴포넌트

* 견고하지 않음
* POJO(일반 클래스) 지향
* 확장성 향상
* 가볍다
* 특정 WAS 필요 X
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUyNjYwMjAzMF19
-->