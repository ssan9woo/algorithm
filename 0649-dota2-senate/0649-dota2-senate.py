from collections import deque

class Solution:
    def predictPartyVictory(self, senate: str) -> str:
        N = len(senate)
        r = N
        q_r, q_d = deque(), deque()

        for i in range(N):
            if senate[i] == "R":
                q_r.append(i)
            else:
                q_d.append(i)

        while q_r and q_d:
            R = q_r.popleft()
            D = q_d.popleft()

            if R < D:
                q_r.append(r)
            else:
                q_d.append(r)
            r += 1

        return "Radiant" if not q_d else "Dire"