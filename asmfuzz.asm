section .bss
  url: resb 100
  wordlist: resb 100

section .text
global _start
_start:

  mov edx, dword [esp + 8]
  mov [url], edx

  mov edx, dword [esp + 12]
  mov [wordlist], edx

  xor edx, edx

  mov eax, 1
  mov ebx, 0

  int 80h
