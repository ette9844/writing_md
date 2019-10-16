## Component

HTML 을 반환하는 함수

## Component 사용하기
* index.js
`ReactDOM.render(<App />, document.getElementById())`
>`<App />`: JSX, react에 특화된 개념
두개 이상의 component를 로드할 수 없다.

커스텀 component를 만들고 표시하기 위해서는 index.js에서 호출하는 App.js 내부에서 커스텀 component를 호출해야한다.

App.js
```js
import `컴포넌트 이름` from `컴포넌트 경로`;
// Ex) import Potato from './P
```

## Component 만들기
```js
import React from "react";
```
추가
<!--stackedit_data:
eyJoaXN0b3J5IjpbNzkyNDc3NzIxLC0xNTYzNzkzMjg3XX0=
-->