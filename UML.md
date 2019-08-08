프레젠테이션을 듣는 사람 중에는 세세하게 설명해도 못 알아듣는 사람이 있다는 점에 유의할 것.
UML을 작성하고 프레젠테이션에 첨가하지만, 그 흐름이나 HOW에 대해 세세하게 설명하지 말아야 한다.
세부사항은 질문이 들어올 경우에만 말한다.

## 1) use case diagram

유스 케이스(use case)는 사용자의 입장에서 본 시스템의 행동을 일컫는다.

유스 케이스는 시스템을 사용하는 **사용자에게서 정보**를 얻어내는데 매우 유용하다.​

-   유스 케이스의 목적​
    
시스템 사용자를 시스템 분석과 설계의 초기 단계에 포함시키는 것 ​
    
사용자들이 진정으로 도움을 받을 수 있는 시스템을 만들 확률을 높임

## use case diagram 구성요소
1. 액터
2. use case
3. relation

### 1. 액터

* 액터는 use case와 직접관계를 맺는다.

[그림: 액터]
>왼쪽 액터: **1차 액터**
>오른쪽 액터: **2차 액터**, 외부 시스템과 관련된 액터
>2차액터가 없을 시: 외부 시스템과의 연결이 없는 경우

* 액터는 액터간에 직접관계를 맺을 수 없다. 
[그림: 액터 식별 방법]
>위 그림에서는 직원만 액터에 해당
>고객이 직원을 통해서 시스템을 이용하는 경우는 명세하지 않는다.

### 2. use case
- 사용자 관점에서 정의해야 한다.
- 사용자와 교류없이 시스템 내부에서 수행되는 기능은 use case가 아니다.
- 반드시 하나 이상의 액터와 상호작용해야한다.
- What을 표현하며 How를 표현하지 않는다.

### use case의 순서 표현
use case사이에서의 흐름은 표현하지 않는다.
상세 흐름은 use case명세서에 작성
```
고객->검색->등록 (X)

고객->검색
고객->등록 (O)

팀원->휴가신청->팀장->휴가승인 (X)

팀원->휴가신청
팀장->휴가승인 (O)
```

### 3. 관계 relation
화살표나 실선으로 표현
1차액터는 왼쪽에 2차액터는 오른쪽에 둔다.

#### 포함 관계 include
[사진: include]
>로그인이 안되면 결제가 안되는 시스템

* 점선 사용, `<<include>>` 표기
* use case사이의 관계로 흐름이 **반드시** 사용됨을 의미한다.
* 실제 코드 내에 include 된 use case를 호출하는 코드가 있어야 성립.

#### 확장 관계 extend
[사진: extend]
>예매 취소 경우, 2시간 이내에는 환불하기 가능
>그 외에는 환불 불가.

* 점선 사용, 역방향 화살표, `<<extend>>` 표기
* use case 사이의 흐름이 **선택적으로 사용**됨을 의미한다.
* 실제 코드 내에 extend 된 use case를 선택적으로 호출하는 코드가 있어야 성립.

## 2) class diagram
* IS-A 
* HAS-A: 멤버 변수로 가지고 있을 경우
-객체와 맴베변수의 life scope이 서로 다를  때 : aggregation
-객체와 맴베변수의 life scope이 서로 같을  때 : composition

[그림: uml class diagram]
>너무 세세한 부분

###  aggregation
두 객체의 life scope이 다를 경우
ex) Customer ◇ㅡ Post : customer has a post
```java
public class Customer{
	private Post post;
	public void setPost(Post p){
		post = p;
	}
}
```
>```java
>Customer c = new Customer();
>Post p = new Post();
>c.setPost(p);
>c=null;		// c가 소멸되어도 p는 여전히 살아있음
>```
>customer 객체와 post객체의 life scope 이 상이

### composition
한 객체가 생성될때 다른 객체도 같이 생성되고
한 객체가 소멸될 때 다른 객체도 같이 소멸되는 관계
ex) 
```java
public class Customer{
	private Post post;
	public Customer(){
		post = new Post();
	}
}
```
>```java
>Customer c = new Customer();
>c=null; 	//c 내부에서 생성된 post도 같이 garbage collect됨
>```
>customer 객체와 post객체의 life scope 이 동일


---
### dependency
메서드의 매개변수나 리턴값으로 해당 클래스를 사용할 때

## 3) sequence diagram

객체들끼리 주고받는 메시지의 순서를 시간의 흐름에 따라 보여주는 그림이다. ​
use case 간의 메시지 이동을 표기

## UML 소프트웨어
EA: Enterprise Architect (기업용)
[STAR UML](http://staruml.io/) (개인용)

>setter getter generator plugin을 통해 setter/getter를 자동 작성할 수 있다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTkxNzAyODkwMywxMjg0MjQ5Njk4LDYyOT
E5ODQwMiw0OTUzNTA1MzAsOTg5MzQ0OTMyLDE5MDc0OTc0NzUs
NTI0MTEyMTIsLTk4NTY4Mzg2NSwtODk2NzUxOTQ0LDUyNzQ2OD
gxLC0xOTk5OTc5MDE0XX0=
-->