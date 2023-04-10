dosseg
		; ------------- MACRO START
print_str macro msg	
;----------------------------------------------------------------------------

	mov dx,offset msg	;MSG
	mov ah,9 ;		PRINT
	int 21h
endm 			
;----------------------------------------------------------------------------
print_int macro num
;----------------------------------------------------------------------------
	
	add num,48	;add 48 to ASCII CODE
	mov dl,num
	mov ah,2
	int 21h

endm 			
;----------------------------------------------------------------------------	
		; ------------- MACRO END

.model small
.stack 100h
.data		; ------------- DATA / VARIABLES START	

	intro db '------------- DIVISION PROGRAM ------------- $'

	numer_name db ' DIVIDEND: $'		; numer_name = numerator
	denomi_name db ' DIVISOR: $'		; denomi_name = denomimator

	q_name db ' QOUTIENT: $'
	r_name db ' REMAINDER: $'
	
	q db ?			; q= quotient
	r db ?			; r = remainder

	;dd db ?			;dd = dividend
	;draw db ?		;d = divisor 

		; ------------- DATA / VARIABLES END
.code
main proc	; ------------- CODE START

	mov ax,@data
	mov ds,ax

	print_str intro	; print '------------- DIVISION PROGRAM ------------- '
	call enterkey

	mov ax,21	;ax = 21 (dividend)
	mov bl,5	;bl = 5 (divisor)

	;mov dd,ax
	;mov d,bl

	;print_str numer_name 	; ' DIVIDEND: '
	;print_int dd		; print ax
	;call enterkey

	;print_str denomi_name 	; ' DIVISOR: '
	;print_int d		; print bl
	;call enterkey


	div bl		;declare bl = 5 as divisor and divide (ax/bl)

	mov q,al	;q(var) = al (qoutient)
	mov r,ah	;r(var) = ah (remainder) 
	
	print_str q_name	; 'QOUTIENT: '
	print_int q		; print q
	call enterkey

	print_str r_name	; ' REMAINDER: '
	print_int r		; print r
	call enterkey


	mov ah,4ch
	int 21h

main endp	; ------------- CODE END
		; ------------- PROCs START

enterkey proc

	mov dx,10 		;NEW LINE FEED
	mov ah,2 		;PRINT
	int 21h

	mov dx,13 		;CARRIAGE RETURN
	mov ah,2 		;PRINT
	int 21h

	ret
enterkey endp
		; ------------- PROCs END
end main