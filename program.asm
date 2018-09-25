section .data
	quiz db "How are you doing today? ",10
	response db "Well done am doing "
      	also db " too ",10


section .bss
        answ resb 20

section .text
	global _start

_start:
	call _askQuenstion
	call _getAnswer
	call _giveResponse
        call _giveRepeatResponse
       	call _giveCompletingResponse

	mov rax, 60
	mov rdi, 0
	syscall

_giveResponse:
	mov rax, 1
	mov rdi, 1
	mov rsi, response
	mov rdx, 19
        syscall
	ret

_giveRepeatResponse:
        mov rax, 1
        mov rdi, 1
        mov rsi, answ
        mov rdx, 32
        syscall
        ret

_giveCompletingResponse:
        mov rax, 1
        mov rdi, 1
        mov rsi, also
        mov rdx, 6
        syscall
        ret


_sayName:
	mov rax, 1
        mov rdi, 1
        mov rsi, response
        mov rdx, 20
	syscall
	ret

_askQuenstion:
	call _prepareForWrite
        mov rsi, quiz
        mov rdx,26
        syscall
        ret

_getAnswer:
	mov rax, 0
	mov rdi, 0
	mov rsi, answ
	mov rdx, 20
	syscall
	ret
	

_prepareForWrite:
	mov rax, 1
        mov rdi, 1
	ret
