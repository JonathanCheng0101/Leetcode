# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        """
        key takeaway 1. use dummy node  2. use carry 3. update cur
        """
        dummy = ListNode()    # use dummy node
        cur = dummy
        carry = 0

        while l1 or l2 or carry:
            v1 = l1.val if l1 else 0
            v2 = l2.val if l2 else 0

            total = v1 + v2 + carry
            carry = (total)// 10    # whether plus one on next digit
            new_val = total % 10    # number to put in this digit

            cur.next = ListNode(new_val)   ### update to next node
            cur = cur.next                 ###

            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next

        return dummy.next


        
