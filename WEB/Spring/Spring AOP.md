## AOP
Aspect Orient Programming
관점 지향 프로그래밍

## AOP 목적
재사용성을 높이자 (AOP, OOP 동일)

## AOP 구조
### OOP

공통 요소를 parent에 두고 child에 상속 시킨다.

**수직 구조**

부모의 설계가 완벽해야 쓸 수 있는 구조. 
설계의 완벽함을 추구한다.(실무에 적용하기 어려움)
부모가 잘 못 되면 자식에 다 영향이 미친다.

IS - A 관계가 성립되지 않으면 상속 관계를 맺으면 안된다.
Employee is a Person (Person을 상속)
Customer is a Person (Person을 상속)
Account is a Person (X)
Account has a Person (Account 에 Person 타입 멤버변수를 갖게함)

### AOP
```java
System.out.println("before");	// 공통사항
a.a();	// 핵심사항
System.out.println("after");	// 공통사항

---

sop("before");	// 공통사항
b.b();	// 핵심사항

---

c.c();	// 핵심사항
sop("after");	// 공통사항

---

sop("before");	// 공통사항
d.d();	// 핵심사항
sop("after");	// 공통사항
```

AOP는 공통사항을 핵심사항의 전 또는 후에 엮을 수 있다. 

**수평 구조**

공통사항이 핵심사항에 영향을 주지 않는다.
공통사항에 이상이 있으면 엮었던 것을 풀기만 하면 된다.

공통사항의 관점과 핵심사항의 관점을 분리한다.

**트랜재션에서 사용됨**

선언적 트랜잭션 처리
```
공통사항(관점)
[트랜잭션 시작]
a.a(); 핵심사항(관점)
[트랜잭션 종료](commit/rollback)
```

## Weaving

: 공통사항(관심)과 핵심사항(관심)을 엮는다.

### weaving 방법
1. 핵심사항이 컴파일될시에 바이트코드에 공통사항을 추가
2. 핵심사항용 클래스 로드시 바이트 코드에 공통사항을 추가
3. 핵심사항용 클래스 런타임시 프록시객체를 생성해서 공통사항을 추가

위 예제에서
before 출력하는 공통 사항:  
a()**pointcut**, b(), d()  - **joinpoint**(무엇을)
>pointcut을 묶어서 joinpoint라고 함

호출전에 	- **Advice**(언제)
처리되도록 
> 1) Before Advice - b
> 2) After Advice - c
> 3) Around Advice - a, d

엮여있다.

## PointCut 설정
```xml
<aop:pointer id="a" expression="execution(public void com.A.(...)"/>
<aop:advice id=""/>
<aop:config>
  <aop:advisor advice-ref="b" pointcut-ref="a"/>
</aop:config>
```


## AspectJ Weaver
[aspectjweaver](https://mvnrepository.com/artifact/org.aspectj/aspectjweaver)


## 트랜잭션 전파
### Propagation-required
* 한 트랜잭션 내에서 실행되는 경우
* 트랜잭션 내에서 UncheckedException이 발생하면 모든 트랜잭션이 롤백된다.
* 트랜잭션 내에서 CheckedException이 발생하면 롤백되지 않음.
>unchecked exception : 컴파일러에서 감지 되지 않는 exception
ex) NullPointException, ArrayIndexBoundException ...
>
>checked exception : 컴파일러에서 감지 되는 exception
>ex) IOException...

### Propagation-not-supported
* 호출된 메서드가 트랜잭션 없이 실행되는 경우
* 첫번째 트랜잭션이 보류되면서 두 번쨰 메소드가 트랜잭션 없이 실행
* 호출된 메서드에서 uncheckedException이 발생해도 트랜잭션이 아니기 때문에 롤백이 되지 않는다.
* 첫번째 트랜잭션에서 
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYzNjE0NDc2NiwtNzg2MTcwMTM4LDk3OT
czMDYxMywxMTI2NDkyMjQ4LDg5OTUwODQ4MCw5NTgxMjIwNTUs
NzQ0NDY4NTQzLC05ODkxMDM2ODIsLTEzMzE5NjI3MjZdfQ==
-->