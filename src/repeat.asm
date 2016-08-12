section .rodata
    nl    db 0xa
    space db ' '

section .text
    global _start

_start:
    mov r8, [rsp]
    cmp r8, 2
    jl .end

    .lenloop:
        inc r9
        mov rsi, [r8 * 8 + rsp]
        cmp byte [r9 + rsi], 0
        jne .lenloop

    .loop:
        mov rax, 1
        mov rsi, [r8 * 8 + rsp]
        mov rdx, r9
        mov rdi, 1
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, nl
        mov rdx, 1
        syscall

        jmp .loop

    .end:
        mov rax, 60
        xor rdi, rdi
        syscall
