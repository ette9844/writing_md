
### C++14
```c++
#include <cstdio>
#include <algorithm>
#include <cstring>
#include <vector>
#include <queue>
using namespace std;
vector<int> a[1001];	// stack
bool check[1001];

void dfs(int node) {
	check[node] = true;
	printf("%d ", node);
	for (int i = 0; i < a[node].size(); i++){
		int next = a[node][i];
		// 이전에 방문하지 않았다면 다음 노드로
		if (check[next] == false){
			dfs(next);
		}
	}
}

void bfs(int start) {
	queue<int> q;
	// 시작점 넣어주기
	check[start] = true;
	q.push(start);
	while (!q.empty()){
		// queue의 front 체크
		int node = q.front(); 
		// 방문한 노드 pop
		q.pop();
		printf("%d ", node);

		for (int i = 0; i < a[node].size(); i++){
			int next = a[node][i];
			// 이전에 방문하지 않았다면 방문하고 push
			if (check[next] == false) {
				check[next] = true;
				q.push(next);
			}
		}
	}
}

int main() {
	// 정점의 개수n / 간선의 개수m / 탐색을 시작할 정점 번호v
	int n, m, v;
	scanf("%d %d %d", &n, &m, &v);
	for (int i = 0; i < m; i++){
		int x, y;
		scanf("%d %d", &x, &y);
		// 인접 리스트에 대입
		a[x].push_back(y);
		a[y].push_back(x);
	}

	// 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문
	for (int i = 1; i <= n; i++){
		sort(a[i].begin(), a[i].end());
	}

	// DFS 수행한 결과 출력
	dfs(v);
	printf("\n");

	// check 초기화
	memset(check, false, sizeof(check));

	// BFS 수행한 결과 출력
	bfs(v);
	printf("\n");
}
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTI1MTYwMTQ4MV19
-->