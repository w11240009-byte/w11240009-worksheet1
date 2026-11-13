
%include "asm_io.inc"



segment .data

msg     db "Sum of 1-100 = ", 0



segment .bss

array   resd 100



segment .text

        global asm_main

asm_main:

        enter 0,0

        pusha



        mov  ecx, 100

        mov esi, 0

fill:

        lea  eax, [esi+1]

        mov  [array + esi*4], eax

        inc  esi

        loop fill

        
        mov ecx, 100

        mov esi, 0

        mov edx, 0

sum:

        add  edx, [array + esi*4]

        inc  esi

        loop sum



        mov  eax, msg

        call print_string

        mov  eax, edx

        call print_int

        call print_nl



        popa

        mov  eax, 0

        leave

        ret

