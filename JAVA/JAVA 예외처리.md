절차지향 언어`(C)`에서는 return값으로 성공/실패 여부를 판별했다면, 
객체지향 언어`(Java)`에서는 예외처리를 통해 성공/실패 여부를 판별한다.

### 절차지향 언어
```c
int result = m(1);
```
```c
int m (int a) {
	if(a<10) {
		return 1; 	// 성공
	} else {
		return -1;	// 실패
	}
}
```
>성공 실패 여부가 결과값의 의미를 침범.

---
### 객체지향 언어
```java
try{
	m(1);
} catch(Exception e) {
	sop(e.getMessage());
}
```
```java
void m(int a) throws Exception {
	if(a >= 10) {
		throw new Exception("error");
	}
}
```
>결과값은 결과값의 의미로만 사용됨. 
>성공/실패 여부는 예외처리로 처리.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI2NjI4OTgwN119
-->