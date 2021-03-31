      ******************************************************************
      * Author: Nicolas Filine
      * Date: 28 Mars 2021
      * Purpose: Effectuer des affichages et opérations basiques
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FANTASY-DUEL.
       DATA DIVISION.


       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 PLAYER-ACTION PIC 9.
       01 ENEMY-ACTION PIC 9V9(2).
       01 DMG-MODIFIER PIC 9(1)V(1).
       01 ELF.
           05 ELF-RACE PIC A(4) VALUE "Elfe".
           05 ELF-HP PIC 9(3) VALUE 50.
           05 ELF-ATTK-DMG PIC 9(2) VALUE 15.

       01 DWARF.
           05 DWARF-RACE PIC A(4) VALUE "Nain".
           05 DWARF-HP PIC 9(3) VALUE 75.
           05 DWARF-ATTK-DMG PIC 9(2) VALUE 10.



       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       DISPLAY "You, a brave Elf, are traveling through the forest.".
       DISPLAY "All of a sudden, you encounter a Dwarf".
       DISPLAY "He raises his shield and wield his silver sword".
       DISPLAY "Combat is inevitable, your life or his".
       DISPLAY "You get ready for battle".
       DISPLAY "    "
       DISPLAY "    "
       DISPLAY "----------------------------------"
       DISPLAY "    "
       DISPLAY "    "

       PERFORM until (DWARF-HP = 0 or ELF-HP = 0)

       DISPLAY
       "please choose your action: 1 Defense - 2 Attack - 3 Exit"
       ACCEPT PLAYER-ACTION
       IF PLAYER-ACTION < 1 OR > 3
           DISPLAY "Try again, choose 1 to Defend, 2 to Attack"
           ACCEPT PLAYER-ACTION
       END-IF
       IF PLAYER-ACTION = 3
           STOP RUN
       END-IF

       DISPLAY "The Dwarf is deciding what he will do..."
       COMPUTE ENEMY-ACTION = FUNCTION RANDOM
       IF ENEMY-ACTION < 0.50

           DISPLAY "The Dwarf raises his shield"

           IF PLAYER-ACTION = 1

               DISPLAY "You and your ennemy just raise your shields"
               DISPLAY "    "
               DISPLAY "    "
               DISPLAY "----------------------------------"
               DISPLAY "    "
               DISPLAY "    "

           END-IF

           IF PLAYER-ACTION = 2
               DISPLAY "You attack your ennemy"
               COMPUTE DMG-MODIFIER =
               1 + ELF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY ELF-RACE " attacks " DWARF-RACE " for "
               DMG-MODIFIER " dammage but " DWARF-RACE " blocks."
               COMPUTE DWARF-HP = DWARF-HP - DMG-MODIFIER /2
               DISPLAY DWARF-RACE " has " DWARF-HP " HP left"

               DISPLAY DWARF-RACE " counter-attacks"
               COMPUTE DMG-MODIFIER =
               1 + DWARF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY DWARF-RACE " attacks " ELF-RACE " for "
               DMG-MODIFIER " dammage"
               COMPUTE ELF-HP = ELF-HP - DMG-MODIFIER / 1.5
               DISPLAY ELF-RACE " has " ELF-HP " HP left"

           END-IF

       END-IF



       IF ENEMY-ACTION > 0.50

           IF PLAYER-ACTION = 1
               DISPLAY " You choose to raise your shield"


               COMPUTE DMG-MODIFIER =
               1 + DWARF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY DWARF-RACE " attacks " ELF-RACE " for "
               DMG-MODIFIER " dammage"
               COMPUTE ELF-HP = ELF-HP - DMG-MODIFIER / 2
               DISPLAY ELF-RACE " has " ELF-HP " HP left"


               DISPLAY "And you counter-attack"
               COMPUTE DMG-MODIFIER =
               1 + ELF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY ELF-RACE " attacks " DWARF-RACE " for "
               DMG-MODIFIER " dammage"
               COMPUTE DWARF-HP = DWARF-HP - DMG-MODIFIER / 1.5
               DISPLAY DWARF-RACE " has " DWARF-HP " HP left"
               DISPLAY "----------------------------------"
           END-IF

           IF PLAYER-ACTION = 2
               DISPLAY " You choose to attack the enemy"

               COMPUTE DMG-MODIFIER =
               1 + DWARF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY DWARF-RACE " attacks " ELF-RACE " for "
               DMG-MODIFIER " dammage"
               COMPUTE ELF-HP = ELF-HP - DMG-MODIFIER
               DISPLAY ELF-RACE " has " ELF-HP " HP left"


               COMPUTE DMG-MODIFIER =
               1 + ELF-ATTK-DMG * FUNCTION RANDOM
               DISPLAY ELF-RACE " attacks " DWARF-RACE " for "
               DMG-MODIFIER " dammage"
               COMPUTE DWARF-HP = DWARF-HP - DMG-MODIFIER
               DISPLAY DWARF-RACE " has " DWARF-HP " HP left"
               DISPLAY "----------------------------------"
           END-IF
       END-IF
           DISPLAY "    "
           DISPLAY "    "
           DISPLAY "New Turn"
           DISPLAY "    "
           DISPLAY "    "
       END-PERFORM

           IF ELF-HP <= 0
               DISPLAY ELF-RACE " is dead"
           END-IF

           IF DWARF-HP <= 0
               DISPLAY DWARF-RACE " is dead"
           END-IF


            STOP RUN.
       END PROGRAM FANTASY-DUEL.
