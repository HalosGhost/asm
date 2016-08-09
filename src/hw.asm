section .data
    hw db  'Hello, World!',0xa
    ln equ $ - hw

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, hw
    mov rdx, ln
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
