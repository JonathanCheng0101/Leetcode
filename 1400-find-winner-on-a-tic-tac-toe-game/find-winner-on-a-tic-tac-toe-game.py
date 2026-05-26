class Solution:
    def tictactoe(self, moves: List[List[int]]) -> str:
        a_move = []
        b_move = []
        for i, move in enumerate(moves):
            if i % 2 == 0:
                a_move.append(move)
            else:
                b_move.append(move)

        def win_condition(moves):
            moves = set(tuple(move) for move in moves)
            # --
            for row in range(3):
                if all((row, col) in moves for col in range(3)):
                    return True
            # |
            for col in range(3):
                if all((row, col) in moves for row in range(3)):
                    return True

            #  \ 
            if all((col, col) in moves for col in range(3)):
                return True

            # /
            if all((col, 2-col) in moves for col in range(3)):
                return True
            
            return False


        if win_condition(a_move):
            return "A"
        elif win_condition(b_move):
            return "B"
        elif len(moves) == 9:
            return "Draw"
        else:
            return "Pending"
            