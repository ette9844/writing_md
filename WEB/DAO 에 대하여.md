## 기존
서블릿에서 DB 연결, 연결, 요청 송신, SQL 결과값 받기, DB 닫기 등의 역할을 모두 담당했음.

## 개선

크게 두 가지로 역할 분담
1. 요청에 대한 처리
2. DB와의 일처리 담당

## 서블릿 역할
**요청에 대한 처리** 

클라이언트의 요청 받기
DB CLASS 호출
결과 분석
결과에 따른 응답 생성
응답 송신 등

## DAO
**DB와의 일처리 담당**

**D**ata**A**ccess**O**bject
DB와의 일처리를 담당하는 CLASS


## 예외처리

### 1) 예외 처리를 DAO 내에서 try-catch로 처리
예외 메세지가 Tomcat console에 출력되어, servlet과 사용자UI에서는 어떠한 예외가 발생했는지 확인 불가

**반환값을 NULL로 설정할 경우:**
 servlet 개발자는 늘 반환값이 NULL인지를 검사해야한다. (자칫하면 NullPointException에 빠지게 됨)
→ 좋은 코드가 아니다.

### 2) 예외 처리를 throws로 넘겨 servlet에서 처리
servlet이 어떤 예외가 발생했는지 확인 가능.
예외에 대한 반응을 사용자에게 보여줄 수 있다.

EX) DAO.java
```java
public Ex2(){
	try{
		// TODO
	} catch(Exception e) {
		dos.writeUTF(e.getMessage());
	}
}
```
```java
public Ex2() throws NotFoundException {
	try{
		// TODO
	} catch(Exception e) {
		// 사용자 정의 Exception 강제 발생
		throw new NotFoundExveption(e.getMessage());
	}
}
```

<br/>
---

**※ 무조건 throws로 servlet에 넘겨주는게 좋다고 할 수는 없다. 상황에 따라 유연하게 대체해야한다.**

throws를 사용해야 할 때, try-catch를 사용해야 할때를 구분해야한다


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
---
**+) 비지니스 로직**
:DB 연결, 요청 송신, SQL 결과값 받기, DB 닫기


<!--stackedit_data:
eyJoaXN0b3J5IjpbMTQ2MjMwMjIzLC03MDE0NTYzOV19
-->