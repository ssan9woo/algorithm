def solution(participant, completion):
    p_hash = {}
    
    for p in participant:
        if p not in p_hash:
            p_hash[p] = 1
        else:
            p_hash[p] += 1
    
    for c in completion:
        if p_hash[c] == 1:
            del p_hash[c]
        else:
            p_hash[c] -= 1
    
    return next(iter(p_hash))