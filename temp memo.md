#### radio
```html
<input type="radio" name="r" value="a">A
<input type="radio" name="r" value="b" checked>B
<input type="radio" name="r" value="c">C
```
radio: name 속성값이 같은 값들 중 하나만 선택
value: 무엇을 선택했는지 구분하기 위한 값
checked: B가 기본 선택되어있도록 함


#### 이미지 버튼
```html
<button><img src="a.jpg"></button>
```

#### 패키지 이름
회사 도메인을 꺼꾸로 작성하는 게 관례

#### UML
`+dupchk(String): String`
`+login(String, String): String`
>`+` : public
>`:String` : return type

#### 비지니스 로직

#### import java.util.*
`.*` 연산자는 import한 요소가 명확하지 않아, 유지보수에 좋지 않기 때문에 지양한다.

`ctrl` + `shift` + `m`: 자동import
`ctrl` + `s`: 저장 + 자동 import

#### 특정 파일 내에서 한글 깨짐이 발생할 때

**※ 편집기에 띄워져있는 깨진 파일을 모두 닫고 진행**

우클 > `properties` > `resource` > `text encoding` > `others` 체크 > `utf-8` 로 설정 > `apply`


#### html 파일 -> jsp 파일 변경
1) html의 확장자를 jsp로 변경
2) jsp 파일의 encoding 변경
3) page 지시자로 응답 형식 지정

#### eclipse 대소문자 토글 단축키
`ctrl` + `shift` + `y` : 대문자 -> 소문자

#### eclipse import 단축키
`ctrl` + `space bar`

#### Tomcat에서의 include 지시자 주의점
include 지시자로 한 페이지를 다른  페이지에 포함 시킬때 두 페이지의 contentType이 일치해야한다.
대소문자까지 맞춰야한다.
혹은 한 페이지에만 응답 형식을 써준다.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE5MTg5NTc0NzAsLTkyMTE3NjUzMCw3Nz
g3Mjg0OTgsLTE2MzkwODUyMzUsMzU2MjAwMzgxLC0yNjc3Njgy
NzQsMTEyNDQ3ODQ0NSwtMTE2OTgzODI4OCwtMTE2NDEzNDQ4Ml
19
-->