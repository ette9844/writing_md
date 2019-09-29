## BFS
* BFS의 목적은 임의의 정점에서 시작해서, 모든 정점을 한 번씩 방문하는 것

* BFS는 **모든 가중치가 1**일 때, **최단 거리**를 구하는 알고리즘이다.
* 같은 정점을 두번 이상 방문하면 BFS가 아닌 부르트 포스 알고리즘


BFS를 이용해 해결할 수 있는 문제는 아래와 같은 조건을 만족해야 한다
1. **최소 비용**(최단 거리) 문제여야 한다.
2. 간선의 **가중치가 1**이어야 한다.
3. 정점과 간선의 개수가 적어야 한다. 
(시간 제한/메모리 제한이 있는 문제)

가중치가 1이 아니라면
간선의 가중치가 문제에서 구하려고 하는 최소 비용과 의미가 일치해야한다.
>거리의 최솟값을 구하는 문제라면 가중치는 거리를 의미, 시간의 최솟값을 구하는 문제라면 가중치는 시간을 의미해야 함.

## 관련 문제
[2178번: 미로 탐색](https://www.acmicpc.net/problem/2178)

[7576번: 토마토](https://www.acmicpc.net/problem/7576)

### 그래프 형태 아닌 문제

[1697번: 숨바꼭질](https://www.acmicpc.net/problem/1697)


## 


[14226번: 이모티콘](https://www.acmicpc.net/problem/14226)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEwMDk4MDQ4ODQsOTQ3MTUzMjczLDUzMz
Y3NTg0MSwtMTQ0NzM3MDUxOCwtMTY3NDA4MTM1Nl19
-->