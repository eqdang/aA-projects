Version 2: Make it scalable
Make a copy of your entire tic_tac_toe_v1 directory and rename it tic_tac_toe_v2. Open the version 2 in your editor and terminal so we can refactor it to support more features. This will be our new working directory.

Our goal for this version is to make the game scale on two fronts:

support a dynamic board size
support more than two players
Board size refactor
We need to change a few things to support any size board. We'll mention a few general todos, but you may need to change more if you hard-coded a 3x3 size in your first iteration.

Board#initialize
Refactor this method to accept a number argument, n. The grid should be set to a 2-dimensional array with size 'n x n', instead of '3 x 3'. It's worth noting that the grid will always be a square (meaning its height is equal to its width). This will somewhat simplify things as we refactor our other methods.

Consider refactoring these critical board methods if they contain any hardcoded values:

#valid?
#print
#win_row?
#win_col?
#win_diagonal
#win?
#empty_positions?
Checkpoint - Test the fruits of your labor(ed)
Load board.rb using pry. Create different sized boards and invoke all board methods on them. Here are our initial tests, but you should be much more thorough:

[1] pry(main)> load 'board.rb'
=> true

[2] pry(main)> small = Board.new(4)
=> #<Board:0x
 @grid=[
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"],
   ["_", "_", "_", "_"]]
   >

[3] pry(main)> large = Board.new(6)
=> #<Board:0x
 @grid=
  [["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"],
   ["_", "_", "_", "_", "_", "_"]]>

[4] pry(main)> small.valid?([3, 3])
=> true

[5] pry(main)> small.valid?([5, 5])
=> false

[6] pry(main)> large.valid?([5, 5])
=> true





______________________
Game#initialize
Refactor this method to also accept a number for the board size as the first argument.

That should be all we need to refactor, since we designed our version 1 to avoid as much coupling to Board as possible. However, take a moment to scan the rest of your Game and HumanPlayer class to be sure.

Use pry to play a few games of varying size to completion before continuing further.

Number of players refactor
Adding support for any number of players should require a decent refactor of the Game class, but no major changes to HumanPlayer. The only logic that should change is how we decide which player should move, but the capabilities of any single player remains unchanged.

Game#initialize
An instance of Game will now need to track an array of many players instead of just two. Make this an instance variable. Allow your #initialize to accept any number of mark values. The number of marks passed to #initialize will decide how many players are in the game.

Game#switch_turn
For our switching logic, we'll use a "Round Robin" strategy. This means that players continually take turns in the same order. For example, if we had players A, B, and C, then the turns would be ABCABCABC... until the game is over.

For simplicity, we'll always designate whoever is at the front of the array as the current player. Consider using Array#rotate! to accomplish this.

Test the switching logic in isolation using pry. Here is how our class works:

[1] pry(main)> load 'game.rb'
=> true

[2] pry(main)> g = Game.new(4, 'A', 'B', 'C')
=> #<Game:0x
 @board=
  #<Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]>,
 @current_player=#<HumanPlayer:0x @mark="A">,
 @players=
  [#<HumanPlayer:0x @mark="A">,
   #<HumanPlayer:0x @mark="B">,
   #<HumanPlayer:0x @mark="C">]>

[3] pry(main)>    
=> #<HumanPlayer:0x @mark="B">

[4] pry(main)> g.switch_turn
=> #<HumanPlayer:0x @mark="C">

[5] pry(main)> g
=> #<Game:0x
 @board=
  #<Board:0x
   @grid=[["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"],
          ["_", "_", "_", "_"]]>,
 @current_player=#<HumanPlayer:0x @mark="C">,
 @players=
  [#<HumanPlayer:0x @mark="C">,
   #<HumanPlayer:0x @mark="A">,
   #<HumanPlayer:0x @mark="B">]>
After you see that the current player is switching properly, you should be able to play your game! Play a few rounds of varying size for good measure. Pretty neat, huh?

