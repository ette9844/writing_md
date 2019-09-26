## DFS / BFS의 목적
임의의 시작점 x에서 시작해서 모든 정점을 한번씩 방문하는 것

## DFS
Depth First Search
깊이 우선 탐색

* **스택**을 이용해서 갈 수 있는 만큼 최대한 많이 가고 
* 갈수 없으면 이전 정점으로 돌아간다

### 재귀 호출을 이용한 구현
```c++
void dfs(int x){
	check[x] = true;
	printf("%d", x);
	for(int i=1; i<=n; i++){
		if(a[x][i] == 1 && check[i] == false) {
			dfs(i);
		}
	}
}
```
>dfs(x) : x에 방문했다.

## BFS
너비 우선 탐색
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExMDIzMjU0OTAsMTk3ODA4NzcwOV19
-->