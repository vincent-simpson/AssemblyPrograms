TITLE Prime Numbers

INCLUDE irvine32.inc

.data
	prompt1 db "Enter a number and I will tell you if it is prime. Enter 0 to exit", 0
	prompt2 db "The number is prime", 0
	prompt3 db "The number is not prime", 0
	count dword 0
     divisor dword 2h
     dividend dword 0
     
.code

main PROC
Top:
	mov edx, OFFSET prompt1
	call writestring
	call crlf

	call readint
	cmp eax, 0
	je exitP

	mov ebx, 4
	cmp eax, ebx
	jb isPrime

     push eax
     mov edx, 0
     mov ebx, 2
	div divisor
	mov count, eax 
     pop eax

whileLoop1:
	cmp count, 1
	jbe isPrime
	
	push eax
	mov ebx, count
     mov edx, 0
	div ebx
	pop eax

	cmp dl, 0
	je isNotPrime
	
	dec count
	jmp whileLoop1


	jmp isPrime
	


	isPrime:
		pushad
		mov edx, OFFSET prompt2
		call writestring
		call crlf
		popad
		jmp Top
	isNotPrime:
		pushad
		mov edx, OFFSET prompt3
		call writestring
		call crlf
		popad
		jmp Top

	exitP:
		exit


exit
main ENDP
END main