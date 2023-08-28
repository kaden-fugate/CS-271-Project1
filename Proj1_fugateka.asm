; Author: Kaden Fugate
; Last Modified: July 14th, 2023
; OSU email address: fugateka@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number: 1        Due Date: July 16th, 2023
; Description: This file will calculate simple arithmetic given 3 integers (A,B,C)
; Program will calculate A+B, A+C, B+C, A-B, A-C, B-C, A+B+C

INCLUDE Irvine32.inc

.data
    
    first_num BYTE ?        ; Will store first num
    second_num BYTE ?       ; Will store second num
    third_num BYTE ?        ; Will store third num
    introduction BYTE "Elementary Arithmetic by Kaden G. Fugate", 0 ; Introduction message
    instructions BYTE "Enter 3 numbers A > B > C, and I'll show you the sums and differences.", 0 ; Instructions for user
    first_prompt BYTE "First Number: ", 0 ; LINES 18 THROUGH 20 ARE NUMBER PROMPTS FOR USER
    second_prompt BYTE "Second Number: ", 0
    third_prompt BYTE "Third Number: ", 0
    plus_sign BYTE " + ", 0               ; LINES 21 THROUGH 23 ARE SIGNS FOR DISPLAYING A+B,A-B,B+C,etc.
    minus_sign BYTE " - ", 0
    equal_sign BYTE " = ", 0
    exit_message BYTE "Thanks for using Elementary Arithmetic! Goodbye!", 0 ; Exit message

.code

main PROC

    ; THE FOLLOWING CODE WILL HOLD THE INTRODUCTION AS WELL AS THE INSTRUCTIONS

    mov EDX, OFFSET introduction; Move introduction to EDX register with OFFSET
    call WriteString            ; Write introduction to screen
    call CrLf                   ; Move cursor to next, new line

    mov EDX, OFFSET instructions; Move instructions to EDX register with OFFSET
    call WriteString            ; Write new string
    call CrLf                   ; Move cursor to next, new line
    call CrLf                   ; Move again to make output look cleaner

    ; THE FOLLOWING CODE WILL GET THE USERS INPUTS FOR THE 3 NUMBERS

    mov EDX, OFFSET first_prompt; Move first prompt to EDX
    call WriteString            ; Print first prompt
    call ReadInt                ; Read the integer from user
    mov first_num, al           ; Move the lower 8 bits of EAX to first_num to store value

    mov EDX, OFFSET second_prompt; Move second prompt to EAX
    call WriteString             ; Print second prompt
    call ReadInt                 ; Read the integer from user
    mov second_num, al           ; Move the lower 8 bits of EAX to second_num to store value

    mov EDX, OFFSET third_prompt; Move third prompt to EAX
    call WriteString            ; Print third prompt
    call ReadInt                ; Read the integer from user
    mov third_num, al           ; Move the lower 8 bits of EAX to third_num to store value

    ; THE FOLLOWING CODE IN LINES 58 TO 207 BOTH CALCULATE THE USERS NUMBERS AS WELL AS
    ; OUTPUT THE CODE. IT DOES THIS BY FIRST OUTPUTTING THE ARITHMETIC TO THE SCREEN
    ; THEN IT WILL CALCULATE THE FINAL NUM AND OUTPUT IT TO THE SCREEN.
    
    ; The following code will complete A+B (I would make this into a function if I knew how to)
    ; LINES 63 TO 75 ARE FOR DISPLAYING OUTPUT
    mov al, first_num           ; move first num to al
    call WriteDec               

    mov EDX, OFFSET plus_sign   ; move plus sign to be printed
    call WriteString

    mov al, second_num          ; move second to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 76 TO 81 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, first_num           ; do arithmetic
    add al, second_num
    call WriteDec
    call CrLf

    ; The following code will complete A-B (I would make this into a function if I knew how to)
    ; LINES 83 TO 95 ARE FOR DISPLAYING OUTPUT
    mov al, first_num           ; move first num to al
    call WriteDec               

    mov EDX, OFFSET minus_sign   ; move minus sign to be printed
    call WriteString

    mov al, second_num          ; move second to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 96 TO 101 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, first_num           ; do arithmetic
    sub al, second_num
    call WriteDec
    call CrLf

    ; The following code will complete A+C
    ; LINES 103 TO 115 ARE FOR DISPLAYING OUTPUT
    mov al, first_num           ; move first num to al
    call WriteDec               

    mov EDX, OFFSET plus_sign   ; move plus sign to be printed
    call WriteString

    mov al, third_num          ; move third to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 116 TO 121 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, first_num           ; do arithmetic
    add al, third_num
    call WriteDec
    call CrLf

    ; The following code will complete A-C
    ; LINES 123 TO 135 ARE FOR DISPLAYING OUTPUT
    mov al, first_num           ; move first num to al
    call WriteDec               

    mov EDX, OFFSET minus_sign   ; move minus sign to be printed
    call WriteString

    mov al, third_num          ; move third to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 136 TO 141 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, first_num           ; do arithmetic
    sub al, third_num
    call WriteDec
    call CrLf

    ; The following code will complete B+C
    ; LINES 143 TO 155 ARE FOR DISPLAYING OUTPUT
    mov al, second_num           ; move second num to al
    call WriteDec               

    mov EDX, OFFSET plus_sign   ; move plus sign to be printed
    call WriteString

    mov al, third_num          ; move third to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 156 TO 161 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, second_num          ; do arithmetic
    add al, third_num
    call WriteDec
    call CrLf

    ; The following code will complete B-C
    ; LINES 163 TO 175 ARE FOR DISPLAYING OUTPUT
    mov al, second_num            ; move second num to al
    call WriteDec               

    mov EDX, OFFSET minus_sign    ; move minus sign to be printed
    call WriteString

    mov al, third_num             ; move third to al
    call WriteDec

    mov EDX, OFFSET equal_sign    ; move equal sign to be printed
    call WriteString

    ; LINES 176 TO 181 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, second_num            ; do arithmetic
    sub al, third_num
    call WriteDec
    call CrLf

    ; The following code will complete A+B+C
    ; LINES 183 TO 200 ARE FOR DISPLAYING OUTPUT
    mov al, first_num           ; move first num to al
    call WriteDec               

    mov EDX, OFFSET plus_sign   ; move minus sign to be printed
    call WriteString

    mov al, second_num          ; move second to al
    call WriteDec

    call WriteString            ; plus sign still stored in EDX, print

    mov al, third_num           ; move third to al
    call WriteDec

    mov EDX, OFFSET equal_sign  ; move equal sign to be printed
    call WriteString

    ; LINES 201 TO 207 WILL CALCULATE FINAL NUM AND DISPLAY TO CONSOLE
    mov al, first_num           ; do arithmetic
    add al, second_num
    add al, third_num
    call WriteDec
    call CrLf
    call CrLf                   ; Extra CrLf call for better formatted output

    ; THE FOLLOWING CODE FROM LINES 209 TO 211 WILL DISPLAY THE EXIT MESSAGE
    mov EDX, OFFSET exit_message ; Move exit_message to edx register
    call WriteString

	Invoke ExitProcess,0	    ; exit to operating system

main ENDP

END main
