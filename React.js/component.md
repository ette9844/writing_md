## Component

HTML 을 반환하는 함수

## Component 사용하기
### ndex.js
`ReactDOM.render(<App />, document.getElementById())`
>`<App />`: JSX, react에 특화된 개념
두개 이상의 component를 로드할 수 없다.

커스텀 component를 만들고 표시하기 위해서는 index.js에서 호출하는 App.js 내부에서 커스텀 component를 호출해야한다.

### App.js
```js
import `컴포넌트 이름` from `컴포넌트 경로`;
// Ex) import Potato from './Potato';

function App(){
	return ( ...
		<Potato />	// JSX 형태로 component를 호출한다.
		... );	
}
```

## Component 만들기
```js
// 리액트가 component를 인식하기 위해 필요한 것
import React from "react";

function Potato(){
	return <div>추가하고 싶은 html	</div>;
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI4OTAzNTUyNSwtMTU2Mzc5MzI4N119
-->