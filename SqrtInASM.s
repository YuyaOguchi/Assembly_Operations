		.syntax unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t SqrtInASM(uint32_t x)
//  Yuya Oguchi
//  COEN20L Lab7
//  11/05/2015
//  Square root function
// ------------------------------------------------------------------------------------------

		.globl  SqrtInASM
SqrtInASM:

	// R0 = X, R1 = Y, R2 =M= 0X4000000, R3 = B
        LDR     R1,=0
        LDR     R2,=0x40000000

        LOOP:
            CMP     R2,#0
            IT      EQ
            BEQ     FINISH
            ORR     R3,R1,R2
            LSR     R1,R1,#1
            CMP     R3, R0
            ITT     LS
            SUBLS   R0,R0,R3
            ORRLS   R1,R1,R2
            LSR     R2,R2,#2
            B       LOOP

        FINISH:
            MOV     R0,R1
            BX      LR

	        .end
