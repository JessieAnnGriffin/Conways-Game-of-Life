# Conways-Game-of-Life
CS Build Week 1 Project

Understand:
The Rules...

Plan:
How to implement the algorithm:
    If, For, While and Recursion
    "Use double buffering to update grid with next generation"
    
How to build the grid?
    Multi-dimensional array for the grid?
    Create coordinates like in TicTacToe? (but with views, not buttons?)

How will the user interact?
    Push a button to choose a preset starting point.
    User can choose 3 - 5 squares and the algorithm should run based on that.
        - how would you add a touch feature to a view? 
        - do they need to be buttons?

How to count generations?
    With a timer?
    By counting recursions?

UI Structure:
    Info bar button item to display view controller with info and rules, or an alert, or a group of alerts that the user can swipe through to read the rules.
        - story of the game can be on it's own view controller in that case


Execute:
First. Build a Grid

Reflect:


# Rules of the Game
These rules, which compare the behavior of the automaton to real life, can be condensed into the following:

1. Any live cell with two or three live neighbours survives.
2. Any dead cell with three live neighbours becomes a live cell.
3. All other live cells die in the next generation. Similarly, all other dead cells stay dead.
