# tic-tac-toe
Tic Tac Toe project for The Odin Project


Project Goal:  
Implement tictactoe in the console using reasonable OOP fundementals.


User is asked to enter a number between 1 and 9, representing their choice of cell on the board.

The board is laid out as below to mimic the layout of the num pad.

---------------
| 7 || 8 || 9 |
---------------
| 4 || 5 || 6 |
---------------
| 1 || 2 || 3 |
---------------

The basic logic of the game is now completed, it allows you to take turns, each placing different tokens on the board (X for player one, o for player two).
The game will check after each turn for win conditions and when it finds one or the game board is full(a draw), the game will end.

The biggest hurdle by far in this project was the logic for checking win conditions.  There is no doubt a more efficient or simnpler way of checking for win conditions but for now i am satisfied that it meets the basic requirements.

The game_won? method that checks for win conditions is also quite messy. It could probably be split up into smaller methods, one checking rows, one checking columns and one checking diagonals.  I will look into that in the future.  I could also add the ability to get player names.