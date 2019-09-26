## DFS / BFS의 목적
임의의 시작점 x에서 시작해서 모든 정점을 한번씩 방문하는 것

## DFS
Depth First Search
깊이 우선 탐색

* **스택**을 이용해서 갈 수 있는 만큼 최대한 많이 가고 
* 갈수 없으면 이전 정점으로 돌아간다

### 재귀 호출
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
>dfs(x): x에 방문했다.
>n : 그래프 정점 개수
>시간 복잡도: 정점의 개수 v

### 인접 리스트
```c++
void dfs(int x){
	check[x] = true;
	printf("%d", x);
	for(int i=0; i<a[x].size(); i++){
		int y = a[x][i];
		if(check[y] == false) {
			dfs(y);
		}
	}
}
```
>인접리스트에는 실제로 존재하는 간선만 존재하므로, 방문하지 않았으면 바로 방문하여도 괜찮다

## BFS
너비 우선 탐색
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3NTAyOTE0MTIsMTk3ODA4NzcwOV19
-->