class Solution:
    def compress(self, chars: List[str]) -> int:
        prev, i = 0, 1

        while i <= len(chars):
            if i == len(chars) or chars[prev] != chars[i]:
                # 그룹의 문자가 하나일 경우
                if i == prev+1:
                    prev = i
                    i += 1
                    continue
                
                group = list(str(i - prev))
                group.insert(0, chars[prev])
                chars[prev:i] = group
                prev = i = prev + len(group)
            i += 1
        
        print('hello')

            

                
