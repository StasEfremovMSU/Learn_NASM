%include "io.inc"

section .text
global CMAIN

global sum
sum:
 push ebp
 mov ebp, esp
 mov eax, dword [ebp+12]
 add eax, dword [ebp+8]
 pop ebp
 ret
global sub
sub:
 push ebp
 mov ebp, esp
 mov eax, dword [ebp+8]
 sub eax, dword [ebp+12]
 pop ebp
 ret
global mul
mul:
 push ebp
 mov ebp, esp
 mov eax, dword [ebp+12]
 imul eax, dword [ebp+8]
 pop ebp
 ret
global div
div:
 push ebp
 mov ebp, esp
 mov edx, dword [ebp+8]
 mov eax, edx ; cdq
 sar edx, 31 ;
 idiv dword [ebp+12]
 pop ebp
 ret
global eval
eval:
 push ebp
 mov ebp, esp
 sub esp, 8
 mov edx, dword [ebp+12]
 mov eax, dword [ebp+16]
 mov ecx, dword [ebp+8]
 mov dword [esp], edx
 mov dword [esp+4], eax
 call ecx
 mov esp, ebp
 pop ebp
 ret 

CMAIN:
    ;write your code here
    xor eax, eax
    ret