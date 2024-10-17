def solution(clothes):
    dic = {}
    ans = 1
    
    for c, t in clothes:
        if t in dic:
            dic[t] += 1
        else:
            dic[t] = 2
    
    for val in dic.values():
        ans *= val
    
    return ans - 1