section .data
    char   db 0
    fd     db 0

section .text
    global _start

print_file:
    inc rdx

    .getchar:
        xor rax, rax
        mov rdi, [fd]
        mov rsi, char
        syscall

        cmp rax, 0
        jg .success
        xor rax, rax
        jmp .putchar

    .success:
        mov rax, [char]

    .putchar:
        cmp rax, 0
        je .end
        mov rax, 1
        mov rdi, 1
        mov rsi, char
        syscall
        jmp .getchar

    .end:
        ret

_start:
    mov r8, [rsp]
    cmp r8, 1
    jle .end
    mov r9, 2

    .loop:
        mov rax, 2
        mov rdi, [r9 * 8 + rsp]
        xor rsi, rsi
        xor rdx, rdx
        syscall

        mov [fd], rax
        call print_file

        mov rax, 3
        mov rdi, [fd]
        syscall

        cmp r8, r9
        je .end

        inc r9
        jmp .loop

    .end:
        mov rax, 60
        xor rdi, rdi
        syscall
