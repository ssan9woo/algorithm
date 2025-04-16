# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        head = ListNode()
        tail = head

        # 1. 종료 조건
        # 리스트가 존재해야 비교 가능
        while list1 and list2:
            # 값 비교. 두 노드 중 value가 작은걸 기준으로 리스트 연결
            if list1.val < list2.val:
                # 꼬리에 둘 중 작은 노드 연결
                tail.next = list1
                # 연결한 list 는 다음 pointer 로 옮김
                list1 = list1.next
            else:
                tail.next = list2
                list2 = list2.next
            
            # 꼬리 옮기기
            tail = tail.next
        
        # 남아있는 리스트 처리
        tail.next = list1 if list1 else list2

        return head.next