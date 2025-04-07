class Solution:
    def numJewelsInStones(self, jewels: str, stones: str) -> int:
        ans = 0
        jewel_dict = {i:1 for i in jewels}

        for stone in stones:
            if stone in jewel_dict:
                ans += 1

        return ans