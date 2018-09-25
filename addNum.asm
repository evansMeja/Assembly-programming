section .data
	digit db 0,10
	prompt db "Enter Number?",10

section .bss
	num resb 10

section .text
	global _start

_start:

	mov rax, 1
	mov rdi, 1
	mov rsi, prompt
	mov rdx,14
	syscall

	mov rax, 0
        mov rdi, 0
        mov rsi, num
        mov rdx,10
        syscall

	mov rax, num
        call _printRAXDigit

	mov rax, 60
	mov rdi, 0
	syscall

_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, 1
        mov rdi, 1
        mov rsi, digit
        mov rdx,2
        syscall
        ret
