class Solution:
    def minimumAbsDifference(self, arr: List[int]) -> List[List[int]]:
        arr.sort()
        final = []
        temp = []

        for i in range(0, len(arr)-1):
            temp.append([abs(arr[i + 1] - arr[i]), arr[i], arr[i + 1]])
        temp.sort(key = lambda x:x[0])
        min_val = temp[0][0]
        for ele in temp:
            if ele[0] == min_val:
                final.append([ele[1], ele[2]])
            else:
                break

        return final