# NeXTCS Final Project
### Name 0: Kai Chandan
### Name 1: Eric Tang
### Class period: 5th

---

## Project Description
We're going to try to recreate __Geometry Dash__. We're going to have one player (the block) that can jump, but cannot double jump. There are blocks that the player cannot touch or he will die and there are surfaces that the player can safely land on. There are places where the player can bounce off of. We might include a part of the level where the player goes through a portal and turns into a ship. The ship has different movement. The player can control the ship's vertical movement. The player can use either the keybooard or the space bar to jump/move. Ebverything except the player moves automatically to the left side of the screen. 
We might make 3 levels and we will keep track of score and attempts. 

## Class Topic Usage
We're going to store all of the blocks in a 2d array and to display the blocks, we will use a linked list. As blocks move off of the screen, they will be removed from the linked list and the next block will be added. We're going to use image processing for the background. We're going to use gravity for the player (block and ship). We're going to have two parent classes for the player and the blocks and we're going to make subclassses for the different types of player objects and blocks. The user will be able to use the space bar or left click to move the block. 

## Libraries (optional)
Sound Library:
- Beads by Ollie Bown
- We're going to play the Geometry Dash background music. 

