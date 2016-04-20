		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t ReverseByteOrder(uint32_t word)
//  Yuya Oguchi
//  COEN20L Lab10
//  12/03/2015
//  Bits inverter
// ------------------------------------------------------------------------------------------

		.globl  ReverseByteOrder
ReverseByteOrder:

		// On entry: R0 = word

		PUSH {R4}

		MOV R4,0xFF     //0001
		AND R3,R0,R4  	//000# -> #000
		LSL R3,R3,#24
		LSL R4,R4,#8
		AND R2,R0,R4	//00#0 -> 0#00
		LSL R2,R2,#8
		LSL R4,R4,#8
		AND R1,R0,R4	//0#00 -> 00#0
		LSR R1,R1,#8
		LSL R4,R4,#8
		AND R0,R0,R4	//#000 ->000#
		LSR R0,R0,#24

		ORR R0,R0,R1
		ORR R0,R0,R2
		ORR R0,R0,R3

		POP {R4}
		BX	LR		    // Return result in R0
		.end
