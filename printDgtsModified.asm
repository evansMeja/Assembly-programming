%include "linux64.inc"

section .data
	digit db 0,10
	delay dq 5,500000000


section .text
	global _start

_start:
	
	printDgt 1
	printDgt 8
	printDgt 6
	delay5sec
	exit

_printRAXDigit:
	add rax, 48
	mov [digit], al
	mov rax, 1
        mov rdi, 1
        mov rsi, digit
        mov rdx,2
        syscall
        ret
