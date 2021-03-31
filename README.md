# COBOL-FANTASY-DUEL
A small textual minigame coded to learn the very basics of COBOL

<h1>How the game works</h1>

You are an Elf, walking through the woods, when you encounter a Dwarf. You quickly realise a combat is inevitable.
At the begining of each turn, you are asked to chose between 3 actions: Attack, Defend and counter-attack, and exit the game
After your choice is made, a pseudo random generation allows your ennemy to choose between Attack and Defend + CounterAttack.

All the damages are calculated based on a random number between 0 and attack-dmg value specified for each duelist.
If an attack is blocked, it still does some damage to the opponent then he strikes back with a diminished attack.

When either the player or the ennemy's HP come to 0, the game ends.


<h1>Basic functions used </h1>

IF - END-IF
PERFORM-UNTIL - END-PERFORM
FUNCTION RANDOM

<h1>Improvements to be made </h1>

For now, the game calculations only use pseudo-random numbers. In consequence, each time the program is launched, the sequence of numbers generated will be the same.
The objective is to make these numbers true random numbers.

The game is written in a single file and could be divided in more files to optimise and be easier to read.
