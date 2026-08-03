from collections import deque
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        res = 0
        n = len(grid)

        rows = len(grid)
        cols = len(grid[0])

        directions = [
        (-1, 0),
        (1, 0),
        (0, -1),
        (0, 1)
        ]
        for row in range(rows):
            for col in range(cols):


                if grid[row][col] == "1":
                    res += 1

                    queue = deque([(row, col)])

                    grid[row][col] = "0"

                    while queue:
                        cur_row, cur_col = queue.popleft()

                        for dr, dc in directions:
                            new_row = cur_row + dr
                            new_col = cur_col + dc

                            if (0 <= new_row < rows and 0 <= new_col < cols and grid[new_row][new_col] == '1'):
                                grid[new_row][new_col] = '0'
                                queue.append((new_row, new_col))

        return res
