## DFS / BFS의 목적
임의의 시작점 x에서 시작해서 모든 정점을 한번씩 방문하는 것

## DFS
Depth First Search
깊이 우선 탐색

* **스택**을 이용해서 갈 수 있는 만큼 최대한 많이 가고 
* 갈수 없으면 이전 정점으로 돌아간다
* 스택이 비면 탐색 완료

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
>dfs(x) : x에 방문했다.
>n : 그래프 정점 개수
>시간 복잡도 : O(V^2^)  (V: 정점개수)

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
>시간 복잡도 : O(V+E) (V: 정점개수, E: 간선개수)

## BFS
Breadth First Search
너비 우선 탐색

* **큐**를 이용하여 지금 위치에서 갈 수 있는 것을 모두 큐에 넣는 방식
* 큐에 **넣을 때** 방문했다고 체크해야 한다.
넣을 때 방문 체크하지 않으면, 큐에 중복 정점이 들어가게 됨
* 큐가 비면 탐색 완료

### Queue (인접 행렬)
```c++
queue<int> q;
// 시작점 넣어주기
check[1] = true;
q.push(1);
while(!q.empty()) {
	int x = q.front();
	q.pop();
	printf("%d", x);
	for(int i=1; i<=n; i++){
		if(a[x][i] == 1 && check[i] == false) {
			// 방문과 동시에 check
			check[i] = true;
			q.push(i);
		}
	}
}
```
>java는 `Queue<Integer>`
>시간 복잡도: O(V^2^)

### Queue (인접 리스트)
```c++
queue<int> q;
// 시작점 넣어주기
check[1] = true;
q.push(1);
while(!q.empty()) {
	int x = q.front();
	q.pop();
	printf("%d", x);
	for(int i=0; i<a[x].size(); i++){
		int y = a[x][i];
		if(check[y] == false) {
			// 방문과 동시에 check
			check[y] = true;
			q.push(y);
		}
	}
}
```
>시간 복잡도: O(V+E)

## 관련 문제
[1260번: DFS와 BFS](https://www.acmicpc.net/problem/1260)
정렬은 필수가 아니나 문제 내에서 작은 것 부터 방문하라는 조건이 제시되었으므로 sort

## 연결 요소
Connected Component
* 두 그래프가 나누어져있지 않고, 둘 사이를 잇는 간선이 없을 경우, 나누어진 각각의 그래프를 연결 요소 라고 한다.
* 위 경우에서는 연결 요소가 2개
* 연결 요소에 속한 모든 정점을 연결하는 경로가 있어야 한다. 
* 다른 연결 요소에 속한 정점과 연결하는 경로가 있어서는 안된다.

연결 요소를 구하는 것은 DFS/BFS 탐색을 통해 구할 수 있다.

DFS나 BFS가 시작되는 횟수를 통해 연결 요소를 유추해 낼 수 있다.

## 관련 문제
[1260번: DFS와 BFS](https://www.acmicpc.net/problem/1260)

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTA3MTU2MjUyNSwxOTc4MDg3NzA5XX0=
-->