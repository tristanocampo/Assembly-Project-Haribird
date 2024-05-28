# GROUP 3 - BLOCK 2 ARCHITECTURE & ORGANIZATION

### MEMBERS: 
- Amper, Miracle Joy F.
- Bagaporo, Ma. Alice Euna M.
- Caliguia, Marcuz M.
- Catchillar, Ma. Geleen M.
- Cuchado, Xairyl Heart R.
- Endonila, Xian Gwion R.
- Lim, Darius II G.
- Obiña, Marc Warren V.
- Ocampo, Tristan Godwin Josh V.
- Perdigon, Aiyanne Yori Q.
- Rico, Julianne Cyrille T.
- Toribio, Louisse Andrea Mae M.

----------------------------------------------------------------------
## To compile and run the game on DOSBox, follow these steps: 

**1.) Download and Install NASM (Netwide Assembler)**

**2.) Clone or Download the Haribird Source Code**

**3.) Prepare the File Path:**
- Locate the file directory of the Haribird file
- Copy the file path

**4.) Assemble the Source Code:**
Open a NASM. 
Navigate to the directory of the game by pasting the copied file path:

      cd C:\Users\Documents\GitHub\haribird

Then, run the following command to assemble the source code into a COM file:

            nasm -f bin fbird.asm -o fbird.com

**5.) Run F-Bird in DOSBox:**
Open DOSBox.
Mount the directory of the Haribird file, for example:

          Mount C C:\Users\Documents\GitHub\haribird

Change to the C: drive by entering:

       c:

Run the game by typing:

      fbird.com
