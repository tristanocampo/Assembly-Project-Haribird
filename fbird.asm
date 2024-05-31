
        use16

        mov ax,0x0002   ; Set 80x25 text mode
        int 0x10        ; Call BIOS
        cld             ; Reset direction flag (so stosw increments registers)
        mov ax,0xb800   ; Point to video segment
        mov ds,ax       ; Both the source (common access)
        mov es,ax       ; and target segments
        

        ; Display menu
        ;
menu:
        call clear_screen
        mov di,0x0178   ; Start position for "GROUP 3 PRESENTS:" (row 6, column 30)
        mov ax,0x0e47   ; 'G' in yellow
        stosw
        mov al,0x52     ; 'R'
        stosw
        mov al,0x4f     ; 'O'
        stosw
        mov al,0x55     ; 'U'
        stosw
        mov al,0x50     ; 'P'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x33     ; '3'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x50     ; 'P'
        stosw
        mov al,0x52     ; 'R'
        stosw
        mov al,0x45     ; 'E'
        stosw
        mov al,0x53     ; 'S'
        stosw
        mov al,0x45     ; 'E'
        stosw
        mov al,0x4e     ; 'N'
        stosw
        mov al,0x54     ; 'T'
        stosw
        mov al,0x53     ; 'S'
        stosw
        mov al,0x3a     ; ':'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov ax,0x0e48   ; 'H' in yellow
        stosw
        mov al,0x41     ; 'A'
        stosw
        mov al,0x52     ; 'R'
        stosw
        mov al,0x42     ; 'B'
        stosw
        mov al,0x49     ; 'I'
        stosw
        mov al,0x52     ; 'R'
        stosw
        mov al,0x44     ; 'D'
        stosw


       ; add di,0x00a0*3 ; Move 3 rows down
       
        mov di,0x0364   ; Start position for "choose difficulty" (row 10, column 32-)
        mov ax,0x0e43   ; 'c' in yellow
        stosw
        mov al,0x68     ; 'h'
        stosw
        mov al,0x6f     ; 'o'
        stosw
        mov al,0x6f     ; 'o'
        stosw
        mov al,0x73     ; 's'
        stosw
        mov al,0x65     ; 'e'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x64     ; 'd'
        stosw
        mov al,0x69     ; 'i'
        stosw
        mov al,0x66     ; 'f'
        stosw
        mov al,0x66     ; 'f'
        stosw
        mov al,0x69     ; 'i'
        stosw
        mov al,0x63     ; 'c'
        stosw
        mov al,0x75     ; 'u'
        stosw
        mov al,0x6c     ; 'l'
        stosw
        mov al,0x74     ; 't'
        stosw
        mov al,0x79     ; 'y'
        stosw

        add di,0x00a0*2 ; Move 2 rows down

        mov di,0x04b0   ; Start position for "1) Easy" (row 12, column 30)
        mov ax,0x0e31   ; '1' in yellow
        stosw
        mov al,0x29     ; ')'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x45     ; 'E'
        stosw
        mov al,0x61     ; 'a'
        stosw
        mov al,0x73     ; 's'
        stosw
        mov al,0x79     ; 'y'
        stosw

        mov di,0x550   ; Start position for "2) Medium" (row 13, column 30)
        mov ax,0x0e32   ; '2' in yellow
        stosw
        mov al,0x29     ; ')'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x4d     ; 'M'
        stosw
        mov al,0x65     ; 'e'
        stosw
        mov al,0x64     ; 'd'
        stosw
        mov al,0x69     ; 'i'
        stosw
        mov al,0x75     ; 'u'
        stosw
        mov al,0x6d     ; 'm'
        stosw

        mov di,0x5f0   ; Start position for "3) Hard" (row 14, column 30)
        mov ax,0x0e33   ; '3' in yellow
        stosw
        mov al,0x29     ; ')'
        stosw
        mov al,0x20     ; ' ' (space)
        stosw
        mov al,0x48     ; 'H'
        stosw
        mov al,0x61     ; 'a'
        stosw
        mov al,0x72     ; 'r'
        stosw
        mov al,0x64     ; 'd'
        stosw
        
                ; Add a row gap
        add di, 0x00a0     ; Move 1 row down

        ; Add the text "enter your choice:"
        mov di, 0x684    ; Start position for "enter your choice:" (row 16, column 20)
        mov ax, 0x0e45  ; 'e' in yellow
        stosw
        mov al, 0x6e    ; 'n'
        stosw
        mov al, 0x74    ; 't'
        stosw
        mov al, 0x65    ; 'e'
        stosw
        mov al, 0x72    ; 'r'
        stosw
        mov al, 0x20    ; ' ' (space)
        stosw
        mov al, 0x79    ; 'y'
        stosw
        mov al, 0x6f    ; 'o'
        stosw
        mov al, 0x75    ; 'u'
        stosw
        mov al, 0x72    ; 'r'
        stosw
        mov al, 0x20    ; ' ' (space)
        stosw
        mov al, 0x63    ; 'c'
        stosw
        mov al, 0x68    ; 'h'
        stosw
        mov al, 0x6f    ; 'o'
        stosw
        mov al, 0x69    ; 'i'
        stosw
        mov al, 0x63    ; 'c'
        stosw
        mov al, 0x65    ; 'e'
        stosw
        mov al, 0x3a    ; ':'
        stosw
        mov al, 0x20    ; ' ' (space)
        stosw
        ; Setting of DI to the position where the user input will appear
        add di, 2    ; Move one position to the right to place the cursor after ": "

        ; Read user input
	;loop start here - DARIUS
		
read_input: mov ah, 00h     ; Function 0 of int 16h: read keyboard input
        int 0x16        ; BIOS interrupt call

		;CHANGE TO ACTUAL VALUES;	
		;Check which key was pressed
		;1
		cmp al, '1'
		je easy
		
		;2
		cmp al, '2'
		je medium
		
		;3
		cmp al, '3'
		je hard
		
		;else
		jmp read_input
		;BREAK OUT THE LOOP;

		
easy: 
		mov byte [user_choice], 1
		jmp fb21				
medium: 
		mov byte [user_choice], 2
		jmp fb21	
hard: 
		mov byte [user_choice], 3
		jmp fb21
		

        ;
        ; STARTING POINT
        ;
fb21:   mov di,pipe     ; Init variables in video segment (saves big bytes)
        xor ax,ax
        stosw           ; pipe
        stosw           ; score
        stosw           ; grav
        mov al,0xa0
        stosw           ; next
        mov al,0x60
        stosw           ; bird

        mov di,0x004a   ; Game title

        ; ASCII art representation of "Group 3: Haribird"
        mov ax, 0x0ef47 ; 'G' in white
        stosw
        mov ax, 0x0ef52 ; 'R' in white
        stosw
        mov ax, 0x0ef4f ; 'O' in white
        stosw
        mov ax, 0x0ef55 ; 'U' in white
        stosw
        mov ax, 0x0ef50 ; 'P' in white
        stosw
        mov ax, 0x0ef20 ; Space in white
        stosw
        mov ax, 0x0ef33 ; '3' in white
        stosw
        mov ax, 0x0ef3a ; ':' in white
        stosw
        mov ax, 0x0ef20 ; Space in white
        stosw
        mov ax, 0x0ef48 ; 'H' in white
        stosw
        mov ax, 0x0ef41 ; 'A' in white
        stosw
        mov ax, 0x0ef52 ; 'R' in white
        stosw
        mov ax, 0x0ef49 ; 'I' in white
        stosw
        mov ax, 0x0ef42 ; 'B' in white
        stosw
        mov ax, 0x0ef49 ; 'I' in white
        stosw
        mov ax, 0x0ef52 ; 'R' in white
        stosw
        mov ax, 0x0ef44 ; 'D' in white
        stosw

        mov cx,80       ; Introduce 80 columns of scenery

fb1:    push cx
        call scroll_scenery
        pop cx
        loop fb1

fb23:   mov ah,0x01     ; Check if key pressed
        int 0x16
        pushf
        xor ax,ax       ; Wait for a key
        int 0x16
        popf
        jnz fb23        ; Jump if key was accumulated, if not already waited for key ;)

        ;
        ; Main loop
        ;
fb12:   mov al,[bird]   ; Bird falls... 
        add al,[grav]   ; ...because of gravity...
        mov [bird],al   ; ...into new position.
        and al,0xf8     ; Row is a 5.3 fraction, nullify fraction
        mov ah,0x14     ; Given integer is x8, multiply by 20 to get 160 per line
        mul ah          ; Row into screen
        add ax,$0020    ; Fixed column
        xchg ax,di      ; Pass to DI (AX cannot be used as pointer)
        mov al,[frame]
        and al,4        ; Wing movement each 4 frames
        jz fb15
        mov al,[di-160] ; Get character below
        mov word [di-160],$0e1e ; Draw upper wing
        add al,[di]     ; Add another character below
        shr al,1        ; Normalize
        mov word [di],$0e14 ; Draw body
        jmp short fb16

fb15:   mov al,[di]     ; Get character below
        mov word [di], $0e1f ; Draw body with yellow color
fb16:   add al,[di+2]   ; Get character below head
        mov word [di+2], $0e10 ; Draw head with yellow color
        cmp al,0x40     ; Collision with scenery?
        jz fb19  ; jump to fb19 if walang collision else proceed with -> Stars and game over

        ;
        ; Stars and game over
        ;
        
        mov byte [di],$2a ; '*' Asterisks to indicate crashing
        mov byte [di+2],$2a
        mov di,0x07CA   
        mov ax,0x0f42   ; 'O' in white, good old ASCII
        stosw
        mov al,0x4F     ; 'P'
        stosw
        mov al,0x4E     ; 'P'
        stosw
        mov al,0x4B     ; 'S'
        stosw
        mov al,0x21     ; '!'
        stosw
        mov cx,80      ; Wait 80 frames
fb20:   push cx
        call wait_frame 
        pop cx
        loop fb20
        call clear_screen ; Clears the screen muna to setup for menu
        jmp game_over_menu        ; Restart
game_over_menu:
 
        mov di, 0x0364   ; Start position for "GAME OVER" (row 10, column 22)
        mov ax, 0x0447   ; 'G' in yellow
        stosw
        mov al, 0x41     ; 'A'
        stosw
        mov al, 0x4d     ; 'M'
        stosw
        mov al, 0x45     ; 'E'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x4f     ; 'O'
        stosw
        mov al, 0x56     ; 'V'
        stosw
        mov al, 0x45     ; 'E'
        stosw
        mov al, 0x52     ; 'R'
        stosw
        mov al, 0x21     ; '!'
        stosw

        add di, 0x00a0*2 ; Move 2 rows down

        ; Start position for the message (row 12, column 10)
        mov di, 0x0358 + 0x00a0*2
        mov ax, 0x0457   ; 'W' in yellow
        stosw
        mov al, 0x6f     ; 'o'
        stosw
        mov al, 0x75     ; 'u'
        stosw
        mov al, 0x6c     ; 'l'
        stosw
        mov al, 0x64     ; 'd'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x79     ; 'y'
        stosw
        mov al, 0x6f     ; 'o'
        stosw
        mov al, 0x75     ; 'u'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x6c     ; 'l'
        stosw
        mov al, 0x69     ; 'i'
        stosw
        mov al, 0x6b     ; 'k'
        stosw
        mov al, 0x65     ; 'e'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x74     ; 't'
        stosw
        mov al, 0x6f     ; 'o'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x74     ; 't'
        stosw
        mov al, 0x72     ; 'r'
        stosw
        mov al, 0x79     ; 'y'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x61     ; 'a'
        stosw
        mov al, 0x67     ; 'g'
        stosw
        mov al, 0x61     ; 'a'
        stosw
        mov al, 0x69     ; 'i'
        stosw
        mov al, 0x6e     ; 'n'
        stosw
        mov al, 0x3f     ; '?'
        stosw

        add di, 0x00a0   ; Move 1 row down

        ;"1) Yes"
        mov di, 0x0364 + 0x00a0*4   
        mov ax, 0x0431   ; '1' in yellow
        stosw
        mov al, 0x29     ; ')'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x59     ; 'Y'
        stosw
        mov al, 0x65     ; 'e'
        stosw
        mov al, 0x73     ; 's'
        stosw

        add di, 0x00a0   ;

        
        mov di, 0x0364 + 0x00a0*5  
        mov ax, 0x0432   ; '2' in yellow
        stosw
        mov al, 0x29     ; ')'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x4e     ; 'N'
        stosw
        mov al, 0x6f     ; 'o'
        stosw
        mov al, 0x2c     ; ','
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x62     ; 'b'
        stosw
        mov al, 0x61     ; 'a'
        stosw
        mov al, 0x63     ; 'c'
        stosw
        mov al, 0x6b     ; 'k'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x74     ; 't'
        stosw
        mov al, 0x6f     ; 'o'
        stosw
        mov al, 0x20     ; ' ' (space)
        stosw
        mov al, 0x6d     ; 'm'
        stosw
        mov al, 0x65     ; 'e'
        stosw
        mov al, 0x6e     ; 'n'
        stosw
        mov al, 0x75     ; 'u'
        stosw

        add di, 2    ; Move one position to the right to place the cursor after ": "


game_over_read_input:
                xor al, al
                mov ah, 00h     ; Function 0 of int 16h: read keyboard input
                int 0x16        ; BIOS interrupt call

		cmp al, '1' ; restart game
		je fb21

		cmp al, '2' ; jump to menu again
		je menu

		jmp game_over_read_input
		;BREAK OUT THE LOOP;

; NEXT PROCEDURE AFTER THE FB 16 IF EVER THERES NO COLLISION
fb19:   call wait_frame ; Wait for frame 
        mov al,[frame]
        and al,7        ; 8 frames have passed?
        jnz fb17        ; No, jump
        inc word [grav] ; Increase gravity  
fb17:
    mov al, $20
    mov [di-160], al   ; Delete bird from screen
    mov [di+2], al
    stosb

   ; HANDLE USER INPUTS
    xor al, al
    mov al, [user_choice]
    cmp al, 1              ; Compare user_choice to 1
    je fb28                ; If equal to 1, jump to fb28
    
    cmp al, 2              ; Compare user_choice to 2
    je fb29                ; If equal to 2, jump to fb29

    cmp al, 3              ; Compare user_choice to 3
    je fb30                ; If equal to 3, jump to fb30

    ; If user_choice is not 1, 2, or 3, fall through and execute default choice
    call scroll_scenery    ; Call scroll_scenery once
    
    jmp fb_end             ; Jump to fb_end

fb28:
    call scroll_scenery    ; EASY
    call scroll_scenery    ; 
    jmp fb_end             ; 

fb29:
    call scroll_scenery    ; MED
    call scroll_scenery    ; Call scroll_scenery again
    call scroll_scenery
    jmp fb_end             ; 

fb30:
    call scroll_scenery    ; HARD
    call scroll_scenery    ; 
    call scroll_scenery    ; 
    call scroll_scenery    ; 
    jmp fb_end 

fb_end:
    cmp byte [0x00a0], 0xb0   ; Passed a column?
    jz fb27
    cmp byte [0x00a2], 0xb0  ; Passed a column?

fb27:   jnz fb24
        inc word [score]        ; Increase score
        mov ax,[score]
        mov di,0x008e   ; Show current score
fb25:   xor dx,dx       ; Extend AX to 32 bits
        mov bx,10       ; Divisor is 10
        div bx          ; Divide
        add dx,0x0c30   ; Convert remaining 0-9 to ASCII, also put color
        xchg ax,dx
        std
        stosw
        mov byte [di],0x20      ; Clean at least one character of prev. score
        cld
        xchg ax,dx
        or ax,ax        ; Score digits still remain?
        jnz fb25        ; Yes, jump
fb24:   mov ah,0x01     ; Any key pressed?
        int 0x16
        jz fb26         ; No, go to main loop
        mov ah,0x00
        int 0x16        ; Get key
        cmp al,0x1b     ; Escape key?
        jne fb4         ; No, jump
        int 0x20        ; Exit to DOS or to oblivion (boot sector)
fb4:    mov ax,[bird]
        sub ax,0x10     ; Move bird two rows upward
        cmp ax,0x08     ; Make sure the bird doesn't fly free outside screen
        jb fb18
        mov [bird],ax
fb18:   mov byte [grav],0  ; Reset gravity
        mov al,0xb6        ; Flap sound
        out (0x43),al
        mov al,0x90
        out (0x42),al
        mov al,0x4a
        out (0x42),al
        in al,(0x61)
        or al,0x03      ; Turn on sound
        out (0x61),al
fb26:   jmp fb12

        ;
        ; Scroll scenery one column at a time
        ;
scroll_scenery:
        ;
        ; Move whole screen
        ;
        mov si,0x00a2   ; Point to row 1, column 1 in SI
        mov di,0x00a0   ; Point to row 1, column 0 in DI
fb2:    mov cx,79       ; 79 columns
        repz            ; Scroll!!!
        movsw
        mov ax,0x0e20   ; Clean last character
        stosw
        lodsw           ; Advance source to keep pair source/target
        cmp si,0x0fa2   ; All scrolled?
        jnz fb2         ; No, jump

fb5:    dec word [next] ; Decrease time (column really) for next pipe
        mov bx,[next]
        cmp bx,0x03     ; bx = 3,2,1,0 for the four columns making the pipe
        ja fb6
        jne fb8
        in al,(0x40)    ; Get "random" number
        and ax,0x0007   ; Between 0 and 7
        add al,0x04     ; Between 4 and 11
        mov [tall],ax   ; This will tell how tall the pipe is
fb8:    mov cx,[tall]
        or bx,bx        ; Rightmost?
        mov dl,0xb0
        jz fb7          ; Yes, jump
        mov dl,0xdb
        cmp bx,0x03     ; Leftmost?
        jb fb7          ; No, jump
        mov dl,0xb1
fb7:    mov di,0x013e   ; Start from top of screen
        mov ah,0x0a
        mov al,dl
fb9:    stosw
        add di,0x009e
        loop fb9
        mov al,0xc4
        stosw
        add di,0x009e*6+10
        mov al,0xdf     
        stosw
        add di,0x009e
fb10:   mov al,dl
        stosw
        add di,0x009e
        cmp di,0x0f00
        jb fb10
        or bx,bx
        jnz fb6
        mov ax,[pipe]
        inc ax          ; Increase total pipes shown
        mov [pipe],ax
        mov cl,3
        shr ax,cl
        mov ah,0x37    ; Decrease distance between pipes
        sub ah,al
        cmp ah,0x10
        ja fb11
        mov ah,0x10
fb11:   mov [next],ah   ; Time for next pipe
fb6:    ret

        ;
        ; Wait for a frame
        ;
wait_frame:
        mov ah,0x00     ; Use base clock tick
        int 0x1a

fb14:   push dx
        mov ah,0x00     ; Read again base clock tick
        int 0x1a
        pop bx
        cmp bx,dx       ; Wait for change
        jz fb14
        inc word [frame] ; Increase frame count
        in al,(0x61)
        and al,0xfc             ; Turn off sound
        out (0x61),al
        ret

        db "OTG"        ; 3 unused bytes

        db 0x55,0xaa    ; Bootable signature

; Clear Screen Function
clear_screen:
    ; Set video segment
    mov ax, 0xb800
    mov es, ax

    ; Set the number of words to clear (80 columns * 25 rows)
    mov cx, 2000

    ; Set the starting position
    xor di, di
    ; Preparation of the values to write (space character with attribute)
    mov ax, 0x0720  ; 0x07 is the attribute (light gray on black), 0x20 is the ASCII space

    ; Clear the screen
    rep stosw

    ; Sets the cursor position to top left corner
    mov dx, 0x0000  ; Row 0, Column 0
    mov bh, 0x00    ; Page number
    mov ah, 0x02    ; Function 02h - Set cursor position
    int 0x10        ; BIOS video service

    ret

; Game Variables
pipe:   equ 0x0fa0
score:  equ 0x0fa2
grav:   equ 0x0fa4
next:   equ 0x0fa6
bird:   equ 0x0fa8
tall:   equ 0x0faa
frame:  equ 0x0fac
user_choice: equ 0x0fae
