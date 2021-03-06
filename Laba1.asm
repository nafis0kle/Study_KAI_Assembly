STACKSG SEGMENT PARA STACK 
    DB 64 DUP(?) 
STACKSG ENDS 

DATASG  SEGMENT PARA 'DATA' 
STR1    DB 'AB12345678CDEFG' 
STR2    DB 15 DUP(' ') 
DATASG  ENDS 

CODESG  SEGMENT PARA 'CODE' 
ASSUME  CS:CODESG,DS:DATASG,SS:STACKSG 
ENTRY   PROC FAR 
PUSH    DS 
SUB     AX,AX 
PUSH    AX 
MOV     AX,DATASG 
MOV     DS,AX
MOV	DX,8

MOV	CX,2
LEA	DI,STR1
LEA	SI,STR2
M0_1:
MOV	AL,[DI]
MOV	[SI],AL
INC	DI
INC	SI
LOOP	M0_1
 
MOV	CX,5
LEA	DI,STR1
LEA	SI,STR2
M0_2:
MOV	AL,[DI]+10
MOV	[SI]+10,AL
INC	DI
INC	SI
LOOP	M0_2
																																																										
M1: 
LEA     DI,STR1    
LEA     SI,STR2     
MOV     AL,[DI]+2    
MOV     [SI]+9,AL
INC	DI    

MOV	CX,7
M2: 
MOV     AL,[DI]+2
MOV     [SI]+2,AL 
INC     DI
INC     SI
LOOP    M2
 
LEA     DI,STR1 
LEA     SI,STR2 
MOV     CX,8 
M3: 
MOV     AL,[SI]+2 
MOV     [DI]+2,AL 
INC     DI 
INC     SI 
LOOP    M3 

DEC     DX 
CMP     DX,00 
JNE     M1 
RET
ENTRY   ENDP 
CODESG  ENDS
                  
END     ENTRY
