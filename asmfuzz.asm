section .bss
  buf: resw 50
  url: resb 70
  wordlist: resb 70
  fd_in: resb 1

section .rodata
  err0: db "missing arguments!", 0xa

section .text
global _start
_start:

  mov edx, dword [esp + 8]
  mov [url], edx

  mov ebx, dword [esp + 12]
  mov [wordlist], ebx

  push 20
  push err0

  cmp ebx, 0
  je error

  cmp edx, 0
  je error

  pop eax
  pop eax

  mov eax, 5
  mov ebx, dword [wordlist]
  mov ecx, 0

  int 80h

  mov [fd_in], eax
  mov eax, 3
  mov ebx, [fd_in]
  mov ecx, buf
  mov edx, 100

  int 80h

  push 0
  jmp exit


write:
  mov eax, 4
  mov ebx, 1
  pop ecx
  pop edx

  int 80h

error:
  mov eax, 4
  mov ebx, 2
  pop ecx
  pop edx

  int 80h

  push 1
  jmp exit

exit:
  mov eax, 1
  pop ebx

  int 80h
