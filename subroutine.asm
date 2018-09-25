section .data
   	text1 db "Hello World",10,0
	text2 db "How are you?",10,0

section .text
	global _start

_start:
	mov rax, text1
	call _print

	mov rax, text2
        call _print

	mov rax, 60
	mov rdi, 0
	syscall

;input : rax
;output:print string at rax

_print:
	push rax
	mov rbx, 0
_printLoop:
	inc rax
	inc rbx
	mov cl, [rax]
	jne  _printLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	
