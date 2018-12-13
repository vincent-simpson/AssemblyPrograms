TITLE Test Score Evaluation

INCLUDE irvine32.inc

.data

prompt1 db "Enter five numbers", 0
prompt2 db "Number is out of range from 0 to 100", 0
prompt3 db "Number of valid grades entered: ", 0
validTestScores db 0


.code

main PROC
	
	mov ecx, 5

	L1:

          cmp ecx, 0
          je exitP

		mov eax, 0
		mov edx, OFFSET prompt1
		call writestring
		call crlf

		call readint
		mov ebx, 100
		cmp ebx, eax
		jc outOfRange

          inc validTestScores
		mov ebx, 59
		cmp ebx, eax
		jnc gradeFLabel

		mov ebx, 69
		cmp ebx, eax
		jnc gradeDLabel

		mov ebx, 79
		cmp ebx, eax
		jnc gradeCLabel

		mov ebx, 89
		cmp ebx, eax
		jnc gradeBLabel

		mov ebx, 100
		cmp ebx, eax
		jnc gradeALabel
	
     exitP:
          mov edx, OFFSET prompt3
          call writestring
          movzx ax, validTestScores
          call writeint
          call crlf
          exit

	outOfRange:
		mov edx, OFFSET prompt2
		CALL writestring
		CALL crlf
          sub ecx, 1
		jmp L1

	gradeFLabel:
		call gradeF
          sub ecx, 1
		jmp L1
	gradeDLabel:
		call gradeD
          sub ecx, 1
		jmp L1
	gradeCLabel:
		call gradeC
          sub ecx, 1
		jmp L1
	gradeBLabel:
		call gradeB
          sub ecx, 1
		jmp L1
	gradeALabel:
		call gradeA
          sub ecx, 1
		jmp L1
                                  
	exit
main ENDP

gradeF PROC
	pushad
	mov eax, 46h
	call writechar
     call crlf
	popad
	ret
gradeF ENDP

gradeD PROC
	pushad
	mov eax, 44h
	call writechar
     call crlf
	popad
	ret
gradeD ENDP

gradeC PROC
	pushad
	mov eax, 43h
	call writechar
     call crlf
	popad
	ret
gradeC ENDP

gradeB PROC
	pushad
	mov eax, 42h
	call writechar
     call crlf
	popad
	ret
gradeB ENDP

gradeA PROC
	pushad
	mov eax, 41h
	call writechar
     call crlf
	popad
	ret
gradeA ENDP
END main


