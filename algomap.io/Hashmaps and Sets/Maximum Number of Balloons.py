from collections import Counter

class Solution:
    def maxNumberOfBalloons(self, text: str) -> int:
        word = "balloon"
        max_count = len(text) // len(word)
        
        if max_count == 0:
            return 0
        
        word_dict, text_dict = Counter(word), Counter(text)
        
        for i in word_dict:
            if i not in text_dict:
                return 0
            
            required, have = word_dict[i], text_dict[i]
            max_count = min(max_count, have // required)
        
        return max_count