# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def getSizeOfNodes(self, head: Optional[ListNode]) -> Optional[ListNode]:
        head
        cnt = 1 # head size always bigger than 1
        while head.next != None:
            cnt += 1
            head = head.next
        return cnt

    def deleteMiddle(self, head: Optional[ListNode]) -> Optional[ListNode]:
        n = self.getSizeOfNodes(head)
        x = n // 2

        if head.next == None:
            return None
        
        idx = 0
        temp = head
        while head.next != None:
            if idx + 1 == x:
                head.next = head.next.next
            else:
                head = head.next
            idx += 1
        
        head = temp
        return head
            
