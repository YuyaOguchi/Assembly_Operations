		.syntax unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// int32_t ExpInASM(int32_t x, uint32_t n)
//  Yuya Oguchi
//  COEN20L Lab7
//  11/05/2015
//  exponential equation
// ------------------------------------------------------------------------------------------

		.globl  ExpInASM
ExpInASM:
//R0 = X, R1 = n, load R2 = P, R3 = 1
        MOV     R2,R0
        LDR     R3,=1

        CMP     R1,#1
        BLO     FIRSTEND
        BEQ     FINISH

    LOOP:
        MUL     R2,R2,R0
        LSR     R1,#1
        CMP     R1,#1
        BHS     LOOP
    FINISH:
        MUL     R3,R2,R3
    FIRSTEND:
        MOV     R0,R3
		BX      LR

     		.end
