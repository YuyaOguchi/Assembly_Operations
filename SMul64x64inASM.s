		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// int64_t SMul64x64inASM(int64_t a, int64_t b)
//  Yuya Oguchi
//  COEN20L Lab9
//  11/19/2015
//  Signed 64 bits integer multiplication
// ------------------------------------------------------------------------------------------

		.globl  SMul64x64inASM
SMul64x64inASM:

	// The two parameters are passed to this function as follows:
	//
	// a<63..32> is in register R1; a<31..0> is in register R0
	// b<63..32> is in register R3; b<31..0> is in register R2
	//
	// Bits 63..32 of the product must be returned in register R1
	// Bits 31..0 of the product must be returned in register R0
	//
	// The value of all other registers must be preserved!


    //R0=Alo, R1=Ahi, R2=Blo, R3=Bhi,
    // R4=HI , R5=LO

        PUSH {R4,R5}
        UMULL R5,R4,R0,R2

        UMULL R2,R1,R1,R2 //Lo * hi -> R2
        ADD R4,R4,R2

        UMULL R2,R1,R0,R3
        ADD R4,R4,R2

        MOV R0,R5
        MOV R1,R4

        POP {R4,R5}
		BX	    LR		    	// Return to calling program.

        	.end
