section .rodata
    nl    db 0xa
    space db ' '

section .text
    global _start

_start:
    mov r8, [rsp]
    cmp r8, 1
    jle .end
    mov r9, 2

    .loop:
        mov rax, 1
        mov rdi, 1
        mov rsi, [r9 * 8 + rsp]
        xor r10, r10

    .lenloop:
        inc r10
        cmp byte [r10 + rsi], 0
        jne .lenloop
        mov rdx, r10
        syscall

        cmp r8, r9
        je .end

        mov rax, 1
        mov rdi, 1
        mov rsi, space
        mov rdx, 1
        syscall

        inc r9
        jmp .loop

    .end:
        mov rax, 1
        mov rdi, 1
        mov rsi, nl
        mov rdx, 1
        syscall

        mov rax, 60
        xor rdi, rdi
        syscall
