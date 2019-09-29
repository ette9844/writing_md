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

### 관련 문제
[2178번: 미로 탐색](https://www.acmicpc.net/problem/2178)

[7576번: 토마토](https://www.acmicpc.net/problem/7576)

### 그래프 형태 아닌 문제

[1697번: 숨바꼭질](https://www.acmicpc.net/problem/1697)

## 간선에 횟수 제한이 있는 그래프

![그래프 예시1](https://github.com/ette9844/writing_md/blob/master/imgs/%EA%B7%B8%EB%9E%98%ED%94%84%20%EC%98%88%EC%A0%9C1.PNG?raw=true)

특정 간선 그룹에 사용 횟수 제한이 있을 경우, 해당 간선을 사용하여 도착한 A정점과 해당 간선을 사용하지 않고 도착한 A정점은 서로 다른 정점이다.
이를 구분해서 그래프를 작성해야한다.


![그래프 예시2](https://github.com/ette9844/writing_md/blob/master/imgs/%EA%B7%B8%EB%9E%98%ED%94%84%20%EC%98%88%EC%A0%9C2.PNG?raw=true)

>파란 간선을 사용한 횟수 기준으로 정점을 나눈다.

### 관련 문제
[14226번: 이모티콘](https://www.acmicpc.net/problem/14226)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE0ODUwOTA4ODUsOTQ3MTUzMjczLDUzMz
Y3NTg0MSwtMTQ0NzM3MDUxOCwtMTY3NDA4MTM1Nl19
-->