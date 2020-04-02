%include "io.inc"

section .text
global CMAIN


CMAIN:
push ebp
mov ebp, esp
sub esp, 88
mov DWORD [ebp-16],0x4 
mov DWORD [ebp-12],0x4 
mov eax,DWORD [ebp-12] 
mov DWORD [esp+4],eax 
mov eax,DWORD [ebp-16] 
mov DWORD [esp],eax 
;call sum 
call multiplication
mov DWORD [ebp-8],eax 
PRINT_HEX 4, eax
leave
ret

global sum
sum:
push ebp 
mov ebp,esp 
sub esp,0x10 
mov edx,DWORD [ebp+12] 
mov eax,DWORD [ebp+8] 
add eax,edx 
mov DWORD [ebp-4],eax 
mov eax,DWORD [ebp-4] 
mov esp, ebp 
pop ebp 
ret 

global subtraction
subtraction:
push ebp 
mov ebp,esp 
sub esp,0x10 
mov edx,DWORD [ebp+12] 
mov eax,DWORD [ebp+8] 
sub eax,edx 
mov DWORD [ebp-4],eax 
mov eax,DWORD [ebp-4] 
mov esp, ebp 
pop ebp 
ret 


global multiplication
multiplication:
push ebp 
mov ebp,esp 
sub esp,0x10 
mov ebx,DWORD [ebp+12] 
mov eax,DWORD [ebp+8] 
mul ebx 
mov DWORD [ebp-4],eax 
mov eax,DWORD [ebp-4] 
mov esp, ebp 
pop ebp 
ret 

global division
division:
push ebp 
mov ebp,esp 
sub esp,0x10 
mov ebx,DWORD [ebp+12] 
mov eax,DWORD [ebp+8] 
div ebx 
mov DWORD [ebp-4],eax 
mov eax,DWORD [ebp-4] 
mov esp, ebp 
pop ebp 
ret 
