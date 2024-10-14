def solution(phone_book):
    dic = {}
    
    for pn in phone_book:
        dic[pn] = 0
    
    for pn in phone_book:
        num = ""
        for i in pn:
            num += i
            if num in dic and num != pn:
                return False
    
    return True