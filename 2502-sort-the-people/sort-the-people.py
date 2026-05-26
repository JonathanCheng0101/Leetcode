class Solution:
    def sortPeople(self, names: List[str], heights: List[int]) -> List[str]:
        zip_lst = list(zip(names, heights))
        sort_lst = sorted(zip_lst, key = lambda x:x[1], reverse = True)
        res = []

        for name, height in sort_lst:
            res.append(name)

        return res