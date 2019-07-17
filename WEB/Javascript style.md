
## float, clear

```html
<div style="float:left;width:100px;">A</div>
<div style="float:right;width:100px;">B</div>
<div style="width:100px">C</div>
```
A &nbsp;&nbsp;&nbsp;&nbsp; B(C가 겹쳐져 안보임)

```html
<div style="float:left;width:100px;">A</div>
<div style="float:right;width:100px;">B</div>
<div style="clear:both;width:100px">C</div>
```
A &nbsp;&nbsp;&nbsp;&nbsp; B
C
clear: 왼쪽 오른쪽 정렬과 무관하게 다음줄에 C



<!--stackedit_data:
eyJoaXN0b3J5IjpbMTgxMzQ1NzcxM119
-->