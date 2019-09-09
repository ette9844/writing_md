## AOP
Aspect Orient Programming
관점 지향 프로그래밍

## AOP 목적
재사용성을 높이자 (AOP, OOP 동일)

## AOP 구조
### OOP
공통 요소를 parent에 두고 child에 상속 시킨다 -> **수직 구조**
부모의 설계가 완벽해야 쓸 수 있는 구조
부모가 잘 못 되면 자식에 다 영향이 미친다.

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
AOP는 공통사항을 핵심사항의 전 또는 후에 엮을 수 있다. -> **수평 구조**
공통사항이 핵심사항에 영향을 주지 않는다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTY1ODQ0ODgwOV19
-->