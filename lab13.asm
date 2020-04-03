%include "io.inc"


section .data
nums dw 0x21, 0x22, 0x23, 0x24, 0x25, 0x26

snums dd 0x21, 0x22, 0x23, 0x24
section .text
global CMAIN

CMAIN:
    mov ebp, esp; for correct debugging
    
    mov eax, 0
    call sprint_element
    mov eax, 1
    call get_element
    NEWLINE
    PRINT_HEX 2,[eax]
    NEWLINE
    NEWLINE
    ;mov ebx, 1
    ;call add_num
    mov eax, 0
    call print_element
    ;PRINT_DEC 4, eax
    ret
    
global get_element
get_element:
.L2:
;lea eax, [eax + 2 * eax]
lea eax, [nums + 2 * eax]  
ret    

    
global print_element
print_element:
.L2:
PRINT_HEX 2, [nums+eax]
NEWLINE
add eax, 2
cmp eax, 8
jne .L2
ret 

global add_num
add_num:
.L2:
add  [nums+eax], ebx
add eax, 2
cmp eax, 8
jne .L2
ret 
 
global sprint_element
sprint_element:
.L2:
PRINT_HEX 1, [nums+eax]
NEWLINE
add eax, 2
cmp eax, 8
jne .L2
 ret 