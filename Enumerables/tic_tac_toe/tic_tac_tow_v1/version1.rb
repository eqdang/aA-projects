Tic-Tac-Toe
Let's write a Tic-Tac-Toe game! Read the entire instructions before getting started. You'll be creating this entire project from scratch, no skeleton. We'll build three iterations of the game, each adding an interesting twist on the gameplay:

Version 1 - Basic 3x3 grid game with 2 human players
Version 2 - Dynamic sized grid with 2 or more human players
Version 3 - Dynamic sized grid with 2 or more human or computer players
Version 1: Make it work
Below we have recommendations on how to design your game. For simplicity, we'll give the grid the dimensions of classic tic-tac-toe, 3x3. This can later be refactored for a dynamic grid size. Let's establish some guidelines that will help our game take shape later.

Programmatically, we'll use a 2-dimensional array to present the grid. Our players will have unique symbols for gameplay. We'll refer to those as marks. An empty position on the grid will be represented with an underscore '_'. Below is an example of a grid:

[
    [:X, :O, '_'],
    [:O, :X, '_'],
    ['_', '_', :X],
]
To refer to a position of the grid, we'll use an array containing the row and column indices. For example, the position of the first row, second column would be [0, 1]; this is the location of a :O.

Directory structure
We'll be building 3 classes to construct our basic game. Begin by creating a tic_tac_toe_v1 directory with the following structure:

tic_tac_toe_v1/
├── board.rb
├── human_player.rb
└── game.rb
Once we have the basic game down, we'll implement some fun additional features! Ready?

Board
The Board class is responsible for adding a player's marks, checking for winners, and printing the game board. A board instance must have an attribute to represent the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.

Board#initialize
A Board instance must have an instance variable to represent the game grid. For now, Board#initialize does not need to accept any arguments. Initialize the grid so that all positions are empty; this means that every position should contain an underscore ('_').

Board#valid?(position)
This method should return a boolean indicating whether or not the specified position is valid for the board, meaning the position is not "out of bounds."

Board#empty?(position)
This method should return a boolean indicating whether or not the specified position does not contain a player's mark.

Board#place_mark(position, mark)
This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not #valid? or not #empty?.

Checkpoint - Board yet?
At this point you've written a few Board methods that are critical to the gameplay. Now's a good opportunity to pause and test our code for correctness. A quick way to test is to use pry.

You should cd into the project folder and run pry. Then, use load 'board.rb' to load your code into the environment, this should return true if the file was successfully loaded. From there, play around with your class by creating an instance and calling some methods on it! If you edit the file you are going to have to load it into the environment again.

Here are a few lines that we executed to test our code, feel free to try your own scenarios:

[1] pry(main)> load 'board.rb'
=> true

[2] pry(main)> b = Board.new
=> #<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>

[3] pry(main)> b.place_mark([-1, 2], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'

[4] pry(main)> b.place_mark([1, 2], :X)
=> :X

[5] pry(main)> b
=> #<Board:0x @grid=[["_", "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

[6] pry(main)> b.place_mark([1, 3], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'

[7] pry(main)> b.place_mark([0, 0], :O)
=> :O

[8] pry(main)> b
=> #<Board:0x @grid=[[:O, "_", "_"], ["_", "_", :X], ["_", "_", "_"]]>

[9] pry(main)> b.place_mark([0, 0], :X) # this should fail
RuntimeError: invalid mark
from board.rb:28:in `place_mark'
Once you feel confident with your code, move forward. As a programmer, you should test your code often as you write. If you continue to write code on top of broken code, you may accumulate a deficit of bugs that will be hard to isolate later on. Be methodical! You should be testing your code often, and not just when we tell you!

Board#print
This method should simply print out the board and all of the marks that have been placed on it. Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. This will help us visualize the board better as we debug or even play the game!

Board#win_row?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.

Board#win_col?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.

Board#win_diagonal?(mark)
This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.

Board#win?(mark)
This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.

Board#empty_positions?
This method should return a boolean indicating whether or not there is at least one empty position on the grid.

Checkpoint - You're all winners
If you haven't already, take a moment to use pry to test your win-checking logic. Use your #place_mark to set the board up and #print to visually verify any winners. We'll leave it to you to decide reasonable test scenarios. As a rule of thumb for methods with boolean returns, be sure to test for "false-positives" and "false-negatives". In other words, verify that #win? and the related methods return true when they should and return false when they should. Don't forget to test your #empty_positions? method as well!





##
HumanPlayer
The HumanPlayer class is responsible for holding information about the user and prompting them to enter a position for gameplay.

HumanPlayer#initialize(mark_value)
We'll allow a player to use any mark they like, so an instance of HumanPlayer should have a instance variable to store their mark. The value of this mark should be provided as an argument when creating a new player. Consider adding a getter method for the player's mark, this may be useful later!

HumanPlayer#get_position
This method should prompt and allow the user to enter a valid row col position. We recommend that you ask the user to enter the position as two numbers with a space between them. Your method should return their entered position as an array of the form [row, col] so that it is compatible with the design of our previous Board methods. For usability, raise an error when they fail to enter a position in the specified format, such as if they only enter a single number, use letters, or have too many spaces.

No need to verify if the position they entered is a valid position in this class. That validation requires knowledge of the board and we want to keep our concerns separated. Besides, you previously implemented that logic in Board#valid? and Board#empty?.

It's also helpful if you state the player's mark when asking them to enter a move, so we know whose turn it is.

Checkpoint - Test often, we're only human after all
This is a great time to test your work! Load your HumanPlayer class into pry and test it. Here is how we tested our player:

load 'human_player.rb'
player_1 = HumanPlayer.new(:X)
player_1.mark
player_1.get_position


X [1] pry(main)> load 'human_player.rb'
=> true

X [2] pry(main)> player_1 = HumanPlayer.new(:X)
=> #<HumanPlayer:0x @mark=:X>

[3] pry(main)> player_1.mark
=> :X

[4] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
0 2
=> [0, 2]

[5] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
12 4
=> [12, 4]

[6] pry(main)> player_1.get_position
Player X, enter two numbers representing a position in the format `row col`
1 2 3
RuntimeError: sorry, that was invalid :(
Before you move on, double check that your Player#get_position returns an array of numbers, and not an array of strings. This will save you a ton of headaches later!






####
Game
The Game class will be the main class that houses the instances of Board and HumanPlayer required for gameplay. It will be responsible for passing data between the board and players. It will also serve to contain the main game loop.

Be sure to require your board.rb and human_player.rb files into game.rb.

Game#initialize(player_1_mark, player_2_mark)
An instance of Game should have instance variables for player one, player two, and the board. Design the #initialize method to accept the mark values to be used for the players.

You should also initialize an instance variable to contain the current player. By default, player one should begin as the current player.

Game#switch_turn
This method should set the current player to the other player. Calling this method repeatedly should switch the current player back and forth between the two players.

This method is critical for gameplay so be sure to test it in pry. Here is how our switching mechanic performs:

[1] pry(main)> load 'game.rb'
=> true

[2] pry(main)> game = Game.new(:X, :O)
=> #<Game:0x0
 @current_player=#<HumanPlayer:0x @mark=:X>,
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>

[3] pry(main)> game.switch_turn
=> #<HumanPlayer:0x @mark=:O>

[4] pry(main)> game
=> #<Game:0x00007f8b5ac725f8
 @current_player=#<HumanPlayer:0x @mark=:O>,
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>

[5] pry(main)> game.switch_turn
=> #<HumanPlayer:0x @mark=:X>

[6] pry(main)> game
=> #<Game:0x00007f8b5ac725f8
 @current_player=#<HumanPlayer:0x @mark=:X>,
 @player_1=#<HumanPlayer:0x @mark=:X>,
 @player_2=#<HumanPlayer:0x @mark=:O>>
 @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
Notice how @current_player changes when we call #switch_turn. With that, we now have all the mechanics needed to put the game together!

Game#play
This method will contain the main game loop. Here is some psuedocode for the loop:

while there exists empty positions on the board
print the board
get a position from the current player
place their mark at that position of the board
check if that user has won
if they win, print out a 'victory' message saying who won and return to end the game
otherwise they did not win, so switch turns
if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message
Test your game in pry. Play a few games by creating an instance of Game and invoking #play on it. After a game is over, be sure to create a new instance of Game to play again, this is the only way to get a fresh board. Some scenarios to test are: player one winning, player two winning, and a draw.

If any errors are raised during gameplay, your game loop and #play method will end immediately, so you'll have to start a new game and retry!

