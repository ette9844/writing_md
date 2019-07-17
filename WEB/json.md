## JSON 이란?
[JavaScript Object Notation](https://ko.wikipedia.org/wiki/JSON)

## JSON을 사용하는 이유
```html
<tr><th>우편번호</th><th>주소</th></tr>
<tr><td>12345</td><td>주소1</td></tr>
...
```
서버가 응답하는 내용이 길어지면 응답 시간은 조금 길어지지만, client가 하는 일이 적어진다.

```html
우편번호:주소,12345:주소1,2345:주소2,34567:주소3,...
```
서버가 응답하는 내용이 단순해지면 client에서 할일이 늘어난다.
데이터의 총량이 줄어들어 네트워크의 응답 비용이 감소하지만, **유지보수성이 떨어진다.**

***최소한의 가독성을 유지한채 응답 비용을 줄이기 위해 json 형태로 응답을 한다.***

## 장점

-   JSON은 텍스트로 이루어져 있으므로, 사람과 기계 모두 읽고 쓰기 쉽다.
-   [프로그래밍 언어](https://ko.wikipedia.org/wiki/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_%EC%96%B8%EC%96%B4 "프로그래밍 언어")와  [플랫폼](https://ko.wikipedia.org/wiki/%EC%BB%B4%ED%93%A8%ED%8C%85_%ED%94%8C%EB%9E%AB%ED%8F%BC "컴퓨팅 플랫폼")에 독립적이므로, 서로 다른 시스템간에 객체를 교환하기에 좋다.
- [자바스크립트](https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8 "자바스크립트")의 문법을 채용했기 때문에 쉽게 사용할 수 있다.


## JSON
```json
[
  {
    "d1":"우편번호",
    "d2":"주소"
  },
  {
    "d1":"12345",
    "d2":"양천구 시흥시 구일234길 롯데타워"
  }
]
```

>[]: 배열
{}: 객체
"property": 프로퍼티(속성)
"value" or value: 숫자값은 "" 필요 없음

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwOTI1NTI5MjksLTE1NTgzODk2OCwtMT
g1ODI3Nzg4OCwtMTYxNjI5NzM1NywyMDM4MzgzODBdfQ==
-->