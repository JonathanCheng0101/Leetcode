class Solution:
    def checkIfExist(self, arr: List[int]) -> bool:
        chk = set()
        reverse_chk = set()
        lst = sorted(arr)
        for r in lst:
            if r in chk:
                return True
            else:
                chk.add(2 * r)
        reversed_lst = sorted(arr, reverse = True)
        for r in reversed_lst:
            if r in reverse_chk:
                return True
            else:
                reverse_chk.add(2 * r)
        return False

        