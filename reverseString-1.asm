include irvine32.inc

.DATA
prompt db "Enter a string and I will reverse it", 0
inputString db 30 dup(?),0
inputStringSize db ?

.CODE
main PROC

MOV edx, offset prompt
call writestring
call crlf

MOV edx, offset inputString
MOV ecx, 29
call readstring
MOV inputStringSize, al
call crlf

MOVZX ax, inputStringSize
MOV bl, 2
DIV bl
MOVZX ecx, al

MOV esi, 0
MOVZX edi, inputStringSize
SUB edi, 1

Loop1:
	MOV al, inputString[esi]
	MOV bl, inputString[edi]
	MOV inputString[esi], bl
	MOV inputString[edi], al
	INC ESI
	DEC EDI
loop Loop1



MOV edx, OFFSET inputString
call writestring
call crlf

exit
main ENDP
end main
