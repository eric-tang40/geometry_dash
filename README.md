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

## Classes
- Player (Parent Class 1)
  - The parent class contains methods that check for collisions. 
  - Cube (Child Class 1)
    - This subclass is for the cube that the player uses to jump/move. It contains commands that tests for collisions, controls movement (probably will include gravity), keeps track of player data, etc. 
  - Ship (Child Class 2)
    - This subclass is for the ship tha the player controls. It has separate features and instance variables than the cube, which can only jump. This class contains commands that control the ship's unique movement, tests for collisions, and other necessary data.
  
- Block (Parent Class 2)
  - This class contains methods that check for collisions and deal with player interaction. 
  - Spike (Child Class 1)
    - Main purpose of this class is to display the spike's unique shape. It should inherit the collision checker and other methods that deal with collisions and player interaction. 
  - Surface (Child Class 2)
    - Surfaces are blocks that the player can move on safely. This class overrides collision check methods to make sure that the player doesn't die when in contact with a surface. It also contains commands that deal with player movement along the surface (maybe include friction).
  - Pad (Child Class 3)
    - Pad refers to the surfaces that the player automatically bounces off of. These are yellow circles in the real game. This class overrides collision methods and replaces them with methods that allow for a player to bounce off of it. This class should be similar to Fixed Orb with extra commands to deal with bouncing. 
  - Coin (Child Class 4)
    - This class utilizes the collision check methods of the parent class. Coins can be collected to increase a player's overall score and they are placed at certain places in the level. This class should contain methods that increase a player's score when he collects a coin and makes the coin appear/disappear upon contact. 

- Portal (Parent Class 3)
  - The portal class is meant to convert the player's object from cube to ship and vice versa. The class should identify what the player's current object is and contain methods to change the object when the player passes through the portal. It also contains other methods that change the background and other things related to changing the player's object.


## Files
- Driver File
  - Contains starting screen and menu that the player can click through to choose the difficulty. 
    - Also code for win/loss displays after the game ends
  - MousePressed and KeyPressed to allow the player to control movement and navigating the starting screen. 
  - Other code that deals with creating/instantiating objects.
  - Imports our Sound Library (Beads) and import images (or possibly videos) of a background screen. 
    - Contains code to make the sound and background images work.

## User Interaction
- KeyPressed
  - The space bar allows the player to move/jump. 
  - If the space bar is held down while the player's object is a ship, the ship should continue to move vertically and accelerate.
- MousePressed
  - Player should be able to use left click to jump/move and should be able to hold it down to control the ship.
  - Left click also allows player to access buttons (menu, level selection, etc.)


