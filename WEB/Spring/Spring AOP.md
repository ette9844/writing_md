## AOP
Aspect Orient Programming
관점 지향 프로그래밍

## AOP 목적
재사용성을 높이자 (AOP, OOP 동일)

## AOP 구조
### OOP
공통 요소를 parent에 두고 child에 상속 시킨다 -> 수직 구조

### AOP
```java
System.out.println("before");
a.a();
System.out.println("after");

---

sop("before");
b.b();

---

c.c();
sop("after");

---

sop("before");
d.d();
sop("after");
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbNDE5NTM5ODAwXX0=
-->