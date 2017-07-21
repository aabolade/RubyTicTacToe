# Ruby Tic Tac Toe

Specifications
==============

The rules of tic-tac-toe are as follows:

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Further Features
================

* Declare's the correct winner at the end of the game.
* Allows player to choose symbol 'X' or 'O'
* Allows player to choose whether to go first or not.
* Three types of games:
1. player vs player
2. player vs computer
3. computer vs computer

Approach and Technologies used
==============================

* Code written in Ruby
* Tests written using RSpec

The project uses five main classes:

**Board** responsible for the position and contents of each square in the grid.

**Human** allows a player to choose a spot to select on the board..

**Computer** calculates and plays a move based on the available spaces on the board.

**Game** responsible for storing each player and the grid. After each move the game switches the turns correctly and allows a move to be played.

**Interface** receives options from user to set up game.


Instructions and Installation
=============================

1. Fork and clone this repository

2. To see the tests, run:

``` rspec ```

3. To play the game, run:

``` ruby index.rb ```
