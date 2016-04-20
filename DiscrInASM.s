		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// int32_t DiscrInASM(int32_t a, int32_t b, int32_t c)
// ------------------------------------------------------------------------------------------

		.globl  DiscrInASM
DiscrInASM:

	//  Yuya oguchi
	//  COEN20L Lab6
	//  10/29/2015
	//  Find discriminant of the quadratic equation

	// The first parameter (a) is passed to this function in R0.
	// The second parameter (b) is passed to this function in R1.
	// The second parameter (c) is passed to this function in R2.
	// The function should return the result in R0.

	// Registers R0 through R3 may be modified without
	// preserving their original content. However, the
	// value of all other registers must be preserved!

        LDR R3,=4 // save 4
        MUL R1,R1,R1 //B^2
        MUL R3,R2,R3 // c*4
        MUL R3,R3,R0 // 4ac
        SUB R0,R1,R3 // b^2 - 4ac

            BX	LR		            // return

		.end
