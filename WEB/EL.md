## Expression Language = EL
jsp의 getProperty, setProperty 태그의 확장성이 떨어지는 점을 보완하기 위해 사용. (EL외에도 JSTL을 사용하기도 함)


### EL 산술 연산자
<table border="1">
          <thead>
        <tr><td><b>EL Expression</b></td>
        <td><b>Result</b></td>
      </tr></thead>
      <tbody><tr>
        <td>${1}</td>
        <td>1</td>
      </tr>
      <tr>
        <td>${1 + 2}</td>
        <td>3</td>
      </tr>
      <tr>
        <td>${1.2 + 2.3}</td>
        <td>3.5</td>
      </tr>
      <tr>
        <td>${1.2E4 + 1.4}</td>
        <td>12001.4</td>
      </tr>
      <tr>
        <td>${-4 - 2}</td>
        <td>-6</td>
      </tr>
      <tr>
        <td>${21 * 2}</td>
        <td>42</td>
      </tr>
      <tr>
        <td>${3/4}</td>
        <td>0.75</td>
      </tr>
      <tr>
        <td>${3 div 4}</td>
        <td>0.75</td>
      </tr>
      <tr>
        <td>${3/0}</td>
        <td>Infinity</td>
      </tr>
      <tr>
        <td>${10%4}</td>
        <td>2</td>
      </tr>
      <tr>
        <td>${10 mod 4}</td>
        <td>2</td>
      </tr>
    <tr>
      <td>${(1==2) ? 3 : 4}</td>
      <td>4</td>
    </tr>
    </tbody></table>

>정수를 정수로 나눈 결과가 실수가 나올 수 있다.
java언어이지만, 연산 결과는 javaScript와 비슷하다.


※ ${ EL 표현식 }과 $( jQuery의 선택자 )를 헷갈리지 말아야한다.

### EL 비교 연산자
숫자 비교
<table border="1">
          <thead>
        <tr><td><b>EL Expression</b></td>
        <td><b>Result</b></td>
      </tr></thead>
      <tbody><tr>
        <td>${1 &lt; 2}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${1 lt 2}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${1 &gt; (4/2)}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${1 gt (4/2)}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${4.0 &gt;= 3}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${4.0 ge 3}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${4 &lt;= 3}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${4 le 3}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${100.0 == 100}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${100.0 eq 100}</td>
        <td>true</td>
      </tr>
      <tr>
        <td>${(10*10) != 100}</td>
        <td>false</td>
      </tr>
      <tr>
        <td>${(10*10) ne 100}</td>
        <td>false</td>
      </tr>
    </tbody></table>
<br/>

문자 비교
<table border="1">
          <thead>
            <tr><td><b>EL Expression</b></td>
            <td><b>Result</b></td>
          </tr></thead>
          <tbody><tr>
            <td>${'a' &lt; 'b'}</td>
            <td>true</td>
          </tr>
          <tr>
            <td>${'hip' &gt; 'hit'}</td>
            <td>false</td>
          </tr>
          <tr>
            <td>${'4' &gt; 3}</td>
            <td>true</td>
          </tr>
        </tbody></table>

>문자열 비교: equals() 사용하지 않음 == 로 비교

### EL 내장 객체
**<주요 내장 객체>**
* requestScope: request의 attribute에 관련된 Map 자료구조
`${requestScope.foo}` 는 `<%=request.getAttribute("foo")%>`와 동일

* param: request의 parameter에 관련된 Map 자료구조
`${param.foo}` 는 `<%=request.getParameter("foo")%>`와 동일


### EL의 .연산자
* ${`Map`.`key`}
ex) ${ param.foo }
* ${`JavaBean`.`property`}
ex) ${ requestScope.c.id }

### JavaBean?

JavaBean = JavaComponent

재사용성이 높은 큰 덩어리.
클래스(+ α)의 모임.
시중에 다양한 Component가 제공되고 있다. 유료로 구매하면 쉽게 응용하여 사용할 수 있다.
UI적인 Component는 다양한 property를 제공하고 있다.
property는 사용자가 설정

ex) Swing의 JButton, Android Studio의 Button등

**Java Component의 조건**
1) public class 여야한다
2) public 매개변수 없는 생성자 필요
3) property용 mf는 public 이면 안된다
4) property용 public setter/getter 메서드 필요

자바빈의 포맷으로 만들어진 클래스
```java
public Ex {
	private String id;
	private boolean power;
	
	// 생성자
	public Ex() {}

	// setter, getter
	public void setId(String id){this.id = id;}
	public void setPower(boolean power){this.power = power;}
	public String getId(){return id;}
	public boolean isPower(){return power;}
}
```

Eclipse의 자동 source 생성 메서드를 통해 만들면 자바빈의 조건을 만족하는 클래스가 만들어진다.






<!--stackedit_data:
eyJoaXN0b3J5IjpbODc4MjQ5OTM2LDc0NjY2NDkwLC02MzIyOT
MzMzMsLTkwODA4NjIyNV19
-->