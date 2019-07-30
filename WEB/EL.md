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
* ${`JavaBean`.`property`}

### JavaBean?


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTYzMjI5MzMzMywtOTA4MDg2MjI1XX0=
-->