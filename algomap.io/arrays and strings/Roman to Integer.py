class Solution:
    def romanToInt(self, s: str) -> int:
        roman = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000, 'IV': 4, 'IX': 9, 'XL': 40, 'XC': 90, 'CD': 400, 'CM': 900}
        N = len(s)
        ans = 0

        i = 0
        while i < N:
            cur_word = s[i]

            if i+1 < N:
                next_word = s[i+1]

                if cur_word + next_word in roman:
                    ans += roman[cur_word + next_word]
                    i += 1
                else:
                    ans += roman[cur_word]
            else:
                ans += roman[cur_word]
            
            i += 1

        return ans
        