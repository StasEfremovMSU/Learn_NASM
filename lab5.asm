%include "io.inc"
section .data
extern printf
str_t_input_1 :   db  'Input first number'
t1: dd 0
str_t_input_2 :   db  'Input operator'
t2: dd 0
str_t_input_3 :   db  'Input second number'
t3: dd 0
output_format: db " %d %c %d" , 10, 0
n1: dd 34536
n2: dd 0
op:	db '+'
	
SECTION .bss
flttmp:	resq 1

section .text
global CMAIN
input:
push ebp
mov ebp, esp
push ebx
PRINT_STRING str_t_input_1
GET_DEC 4, n1
PRINT_DEC 4, n1
NEWLINE
PRINT_STRING str_t_input_2
GET_DEC 4, op
PRINT_DEC 4, op
NEWLINE
PRINT_STRING str_t_input_3
GET_DEC 4, n2
PRINT_DEC 4, n2
NEWLINE
pop ebx
pop ebp
ret

CMAIN:
    call input
    PRINT_DEC 4, n1
    PRINT_CHAR  op
    PRINT_DEC 4, n2
    NEWLINE
    push dword [n1]
    push dword [op]
    push dword [n2]
    push dword output_format
    call printf
    add esp, 16
    ret