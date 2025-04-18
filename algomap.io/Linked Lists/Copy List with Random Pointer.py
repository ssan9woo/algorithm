"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""

class Solution:
    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        if not head: return None

        copy_dict = dict()

        cur = head
        while cur:
            copy_dict[cur] = Node(x = cur.val)
            cur = cur.next
        
        cur = head
        while cur:
            copy = copy_dict.get(cur)
            copy.next = copy_dict.get(cur.next)
            copy.random = copy_dict.get(cur.random)
                
            cur = cur.next

        return copy_dict[head]
