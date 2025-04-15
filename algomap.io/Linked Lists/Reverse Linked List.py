# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head: 
            return head
        
        cur = head

        while cur.next:
            temp = cur.next
            cur.next = cur.next.next
            temp.next = head
            head = temp
        
        return head