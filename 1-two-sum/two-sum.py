class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        res = {}
        for i, ele in enumerate(nums):
            need = target - ele
            if need in res:
                return [res[need], i]
                
            
            res[ele] = i
                

            
        



            

            
        