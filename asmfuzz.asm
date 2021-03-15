section .bss
        wordlist: resw 50
        url: resb 70
        wl_file: resb 70
        fd_in: resb 1
        char: resb 1
        wd: resb 50
section .rodata
        err0: db "Error: missing arguments!", 0xa
        err1: db "Error: wordlist not found!", 0xa
        banner:
db "    ___   _____ __  _________", 0xA
db "   /   | / ___//  |/  / ____/_  __________", 0xA
db "  / /| | \__ \/ /|_/ / /_  / / / /_  /_  /", 0xA
db " / ___ |___/ / /  / / __/ / /_/ / / /_/ /_", 0xA
db "/_/  |_/____/_/  /_/_/    \__,_/ /___/___/", 0xA, 0xA
db "https://Github.com/blackbinn/asmfuzz", 0xA
db "Version: 1.0.0a", 0xA
db "__________________________________________________", 0xA, 0xA
        banlen: equ $-banner

section .text
global _start
_start:

;       push ebp
;       mov ebp, esp

        mov eax, 4
        mov ebx, 1
        mov ecx, banner
        mov edx, banlen

        int 80h

        mov edx, dword [esp + 8]
        mov [url], edx

        mov ebx, dword [esp + 12]
        mov [wl_file], ebx

        push 26
        push err0

        cmp ebx, 0
        je error

        cmp edx, 0
        je error

        pop eax
        pop eax

        mov eax, 5
        mov ebx, dword [wl_file]
        mov ecx, 0

        int 80h

        push 27
        push err1
        cmp eax, 0xfffffffe
        je error

        pop ecx
        pop ecx

        mov [fd_in], eax
        mov eax, 3
        mov ebx, [fd_in]
        mov ecx, wordlist
        mov edx, 100

        int 80h

        mov edx, 0
        call findlf

        push 0

        jmp exit

; aqui começa as parada loka

findlf:

        lea esi, [wordlist+edx]
        lodsb

        cmp al, `\n`
        je 0x080490b1

        mov [wd+edx], al

        cmp al, 0
        je 0x0804908b

        mov [char], al

        inc edx

        cmp al, `\n`
        jne 0x08049086

        mov eax, 4
        mov ebx, 1
        mov ecx, wd
        mov edi, edx
        mov edx, 100

        int 80h

        mov edx, edi

        xor eax, eax

        mov [wd], eax

        jmp 0x0804908f

        ret

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
