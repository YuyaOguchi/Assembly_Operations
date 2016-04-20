		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t BitFieldInsert(uint32_t word, int lsb, int width, uint32_t value)
//  Yuya Oguchi
//  COEN20L Lab8
//  11/12/2015
//  Bit field insert function
// ------------------------------------------------------------------------------------------

		.globl  BitFieldInsert
BitFieldInsert:

		// On entry: R0 = word, R1 = lsb, R2 = width, R3 = value
        //R4 = temp 0001
        //R5 = temp2

        PUSH {R4,R5}
		LDR     R4,=1
		LDR     R5,=1
		LSL     R4,R4,R1   //shift lsb
		LSL     R4,R4,R2    //shift width
		LSL     R5,R5,R1    //shift lsb
		SUB     R4,R4,R5    //mask = R4
		BIC     R0,R0,R4    //word &= ~mask

        MOV     R4,#1
        LSL     R4,R4,R2
        SUB     R4,R4,#1
        AND     R3,R3,R4
        LSL     R3,R3,R1

        ORR     R0,R0,R3
		POP {R4,R5}

		BX      LR		            // return result in R0

		.end
