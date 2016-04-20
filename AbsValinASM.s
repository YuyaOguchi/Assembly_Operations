		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t AbsValinASM(int32_t x)
// ------------------------------------------------------------------------------------------

		.globl  AbsValinASM
AbsValinASM:
	//  Yuya oguchi
	//  COEN20L Lab6
	//  10/29/2015
	//  Calculate Absolute value of number


	// The first parameter (x) is passed to this function in R0.
	// The function should return the result in R0.

	// Registers R0 through R3 may be modified without
	// preserving their original content. However, the
	// value of all other registers must be preserved!

        ASR R1,R0,#32   // create R1 that is either all 0 or all 1
        ADD R0,R0,R1    // add 0 or -1 depending on sign of the R0
        EOR R0,R0,R1    //Eor to flip all

		BX	LR		            // return

		.end
