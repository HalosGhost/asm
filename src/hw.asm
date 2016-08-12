section .rodata
    hw db  'Hello, World!',0xa
    ln equ $ - hw

section .text
    global _start

_start:
    inc rax
    inc rdi
    mov rsi, hw
    mov rdx, ln
    syscall

    mov rax, 60
    dec rdi
    syscall
