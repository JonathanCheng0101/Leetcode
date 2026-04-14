class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        res = {}
        for i,ele in enumerate(nums):
            need = target - nums[i]
            if need in res:
                return [i,res[need]]
            else:
                res[nums[i]] = i
            
        
"""
我將問題轉換為在遍歷過程中查找補數， 並使用 HashMap 將查詢時間從 O(n) 降到 O(1)
"""


            

            
        