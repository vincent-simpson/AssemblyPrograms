INCLUDE irvine32.inc

.DATA
numArray BYTE 5 dup(0)
sum BYTE ?
prompt1 db "Enter five numbers to be summed (press enter after each number)", 0
prompt2 db "The sum is ", 0

buffer BYTE 20 dup(0)
inputCount DWORD ?

.CODE
main PROC

	MOV esi, OFFSET numArray
	MOV ecx, SIZEOF numArray
	
	CALL populateArray
	CALL sumArray
	
	MOV edx, OFFSET prompt2
	CALL writestring
	CALL writeint
	CALL crlf

exit
main endp


populateArray PROC

	PUSH esi
	PUSH ecx

	MOV edx, OFFSET prompt1
	CALL writestring
	CALL crlf
	
	Loop2:
		CALL readint
		MOV [esi], al
		ADD esi, TYPE BYTE
	loop Loop2
	
	POP ecx
	POP esi
ret
populateArray endp

sumArray PROC
		
	MOV eax, 0
	
	Loop1:
		ADD al, [esi]
		ADD esi, TYPE BYTE
		
	loop Loop1	

ret
sumArray endp

end main
