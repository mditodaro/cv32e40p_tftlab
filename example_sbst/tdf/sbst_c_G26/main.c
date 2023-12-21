// Developed by Mario Zurlo 253946
//
// testing all exe-stage
// Fault coverage = 73.96
// Sim. duration = 10836.66


#include <stdio.h>
#include <stdlib.h>
#define N_PATT_ALU 6
#define N_PATT_MULT 8
#define N_PATT_DIV 10

int main(int argc, char *argv[])
{
	int i,j;
	volatile int reg;
	volatile int mem;
	volatile int mem1;
	register  int a ;
	register  int b ;
	register  int c ;
	register  int d ;
	register  int e ;
	register  int f ;

	//***************************************ALU**********************************

	int patternB [N_PATT_ALU] = {0x00000001, 0x00000011, 0x00000101, 
				     0x00001101, 0x01001101, 0x10111111};	
	int patternA [N_PATT_ALU] = {0x55555555, 0x66666666, 0x77777777, 
				     0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC};

	for ( i=0;i<N_PATT_ALU;i++) {

		if(i % 2 == 0)
		a=patternA[i];
		else
		a=-patternA[i];
		
		b=patternB[i];

		if(i % 2 == 0)
		e=-patternA[N_PATT_ALU - i];
		else
		e=patternA[N_PATT_ALU - i];
		
		f=patternB[N_PATT_ALU - i];

		//addition
		asm volatile("add  %0,%1,%2": "=r" (c): "r" (a),"r" (b) );
		asm volatile("add  %0,%1,%2": "=r" (d): "r" (e),"r" (f) );
		reg=c;
		reg=d;

		// immediate addition
		asm volatile("addi %0 , %1, %2": "=r" (c) : "r" (a) , "i" (0x0F));
		reg=c;

		// subtraction
		asm volatile("sub  %0,%1,%2": "=r" (c): "r" (a),"r" (b) );
		asm volatile ("sub  %0,%1,%2": "=r" (d): "r" (e),"r" (f) );
		reg=c;
		reg=d;

		//and
		asm volatile ("and %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	 
		asm volatile("and %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//or
		asm volatile("or %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		asm volatile("or %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//xor
		asm volatile("xor %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("xor %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//shift left logic
		asm volatile("sll %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("sll %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//shift right logic 
		asm volatile("srl %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("srl %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//shift left arithmetic
		asm volatile("slt %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("slt %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//shift left arithmetic unsigned
		asm volatile("sltu %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("sltu %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		//shift right arithmetic
		asm volatile("sra %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		asm volatile("sra %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		// integer module
		asm volatile("rem %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("rem %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		// integer unsigned module
		asm volatile("remu %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));
		asm volatile("remu %0, %1 ,%2": "=r" (d): "r" (e), "r" (f));	
		reg=c;
		reg=d;

		// nope
		asm volatile("nop");	
		reg=c;
		asm volatile ("lui %0,%1": "=r" (c): "n" (0x000FF));
		reg=c;
		asm volatile ("auipc %0,%1": "=r" (c): "n" (0x000FF));
		reg=c;

		//c=b+a;
		asm volatile("add x0,%0,%1": : "r" (a),"r" (b) );
		asm volatile("add x0,%0,%1": : "r" (e),"r" (f) );
		reg=c;
		reg=c;

		asm volatile ("li %0,%1": "=r" (c): "i" (0x3245));
		reg=c;
		asm volatile ("mv %0,%1":"=r" (c): "r" (a));
		reg=c;
		asm volatile ("not %0,%1":"=r" (c): "r" (e));
		reg=c;
		asm volatile ("seqz %0,%1":"=r" (c): "r" (a));
		reg=c;
		asm volatile ("snez %0,%1":"=r" (c): "r" (e));
		reg=c;
		asm volatile ("sltz %0,%1":"=r" (c): "r" (a));
		reg=c;
		asm volatile ("sgtz %0,%1":"=r" (c): "r" (e));
		reg=c;

		// pulp extension 
		asm volatile ("p.extract %0,%1,3,2": "=r" (c): "r" (a));
		reg=c;	
		asm volatile ("p.extractu %0,%1,3,2": "=r" (c): "r" (a));
		reg=c;	
		asm volatile ("p.extractr %0,%1,%2": "=r" (c): "r" (a),"r" (b));
		reg=c;	
		asm volatile ("p.extractur %0,%1,%2": "=r" (c): "r" (b),"r" (a));
		reg=c;	
		asm volatile ("p.insert %0,%1,3,2": "=r" (c): "r" (a));
		reg=c;		
		asm volatile ("p.insertr %0,%1,%2": "=r" (c): "r" (a),"r" (b));
		reg=c;
		asm volatile ("p.bclr %0,%1,3,2": "=r" (c): "r" (a));
		reg=c;		
		asm volatile ("p.bclrr %0,%1,%2": "=r" (c): "r" (a),"r" (b));
		reg=c;
		asm volatile ("p.bset %0,%1,3,2": "=r" (c): "r" (a));
		reg=c;		
		asm volatile ("p.bsetr %0,%1,%2": "=r" (c): "r" (a),"r" (b));
		reg=c;

		asm volatile ("p.ff1 %0,%1": "=r" (c): "r" (a));
		reg=c;	

		asm volatile ("p.fl1 %0,%1": "=r" (c): "r" (a));
		reg=c;	

		asm volatile ("p.clb %0,%1": "=r" (c): "r" (a));
		reg=c;	

		asm volatile ("p.cnt %0,%1": "=r" (c): "r" (a));
		reg=c;	

		asm volatile ("p.ror %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;

		asm volatile ("p.abs %0,%1": "=r" (c): "r" (b) );
		reg=c;

		asm volatile ("p.slet %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;
		asm volatile ("p.slet %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;

		asm volatile ("p.min %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;
		asm volatile ("p.min %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;

		asm volatile ("p.minu %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;
		asm volatile ("p.minu %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		asm volatile ("p.max %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;
		asm volatile ("p.max %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		asm volatile ("p.maxu %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;
		asm volatile ("p.maxu %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;

		asm volatile ("p.exths %0,%1": "=r" (c): "r" (a) );
		reg=c;
		asm volatile ("p.exthz %0,%1": "=r" (c): "r" (b));
		reg=c;

		asm volatile ("p.extbs %0,%1": "=r" (c): "r" (a) );
		reg=c;
		asm volatile ("p.extbz %0,%1": "=r" (c): "r" (b) );
		reg=c;

		asm volatile ("p.clip %0,%1,4": "=r" (c): "r" (a) );
		reg=c;
		asm volatile ("p.clipr %0,%1,%2": "=r" (c):"r" (a), "r" (b));
		reg=c;
		asm volatile ("p.clipu %0,%1,4": "=r" (c): "r" (b));
		reg=c;

		asm volatile ("p.clipur %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		reg=c;

		// arithmetic pulp extentions 

		asm volatile ("p.addN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.addN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.adduN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.adduN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.addRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.addRN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.adduRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.adduRN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.addNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.addNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.adduNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.adduNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.addRNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.addRNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.adduRNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.adduRNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		// sub
		asm volatile ("p.subN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subuN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subuN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subRN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subuRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subuRN %0,%1,%2,3": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subuNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subuNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subRNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subRNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		asm volatile ("p.subuRNr %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
		asm volatile ("p.subuRNr %0,%1,%2": "=r" (c): "r" (b) , "r" (a));
		reg=c;
		reg=c;

		// extensions
		asm volatile ("p.lb %0,%1": "=r" (c): "m" (mem), "i" (0x00E));
		asm volatile ("p.lb %0,%1": "=r" (f): "m" (mem1), "i" (0x00F));
		reg=c;
		reg=f;

		asm volatile ("p.lbu %0,%1": "=r" (c): "m" (mem), "i" (0x00E));
		asm volatile ("p.lbu %0,%1": "=r" (f): "m" (mem1), "i" (0x00F));
		reg=c;
		reg=f;

		asm volatile ("p.lh %0,%1": "=r" (c): "m" (mem), "i" (0x00E));
		asm volatile ("p.lh %0,%1": "=r" (f): "m" (mem1), "i" (0x00F));
		reg=c;
		reg=f;
		
		asm volatile ("p.lhu %0,%1": "=r" (c): "m" (mem), "i" (0x00E));
		asm volatile ("p.lhu %0,%1": "=r" (f): "m" (mem1), "i" (0x00F));
		reg=c;
		reg=f;

		asm volatile ("p.lw %0,%1": "=r" (c): "m" (mem), "i" (0x00E));
		asm volatile ("p.lw %0,%1": "=r" (f): "m" (mem1), "i" (0x00F));
		reg=c;
		reg=f;

		asm volatile ("p.lb %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.lb %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.lbu %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.lbu %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.lh %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.lh %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.lhu %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.lhu %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.lw %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.lw %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.lb %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.lb %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.lbu %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.lbu %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.lh %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.lh %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.lhu %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.lhu %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.lw %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.lw %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.sb %0,%1": "=r" (c): "m" (mem), "i" (0x00D));
		asm volatile ("p.sb %0,%1": "=r" (f): "m" (mem1), "i" (0x01F));
		reg=c;
		reg=f;

		asm volatile ("p.sh %0,%1": "=r" (c): "m" (mem), "i" (0x00D));
		asm volatile ("p.sh %0,%1": "=r" (f): "m" (mem1), "i" (0x01F));
		reg=c;
		reg=f;

		asm volatile ("p.sw %0,%1": "=r" (c): "m" (mem), "i" (0x00D));
		asm volatile ("p.sw %0,%1": "=r" (f): "m" (mem1), "i" (0x01F));
		reg=c;
		reg=f;

		asm volatile ("p.sb %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.sb %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.sh %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.sh %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.sw %0,%1": "=r" (c): "m" (mem));
		asm volatile ("p.sw %0,%1": "=r" (f): "m" (mem1));
		reg=c;
		reg=f;

		asm volatile ("p.sb %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.sb %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.sh %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.sh %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

		asm volatile ("p.sw %0,%1": "=r" (c): "m" (mem), "m" (mem1));
		asm volatile ("p.sw %0,%1": "=r" (f): "m" (mem1), "m" (mem));
		reg=c;
		reg=f;

	
	}
	


	//****************************DIVISOR******************************


	int pattern2 [N_PATT_DIV] = {0x000000000, 0x0000001D, 0x0000010A, 
				0x00001234, 0x000100AB, 0x001101FF, 
				0x01046711, 0x1D126531, 0xFFFFFFFF,
				0x01010101};	
	int pattern1 = "0xFFFFFFFF";

	for ( i=0;i<N_PATT_DIV;i++) {

		a = pattern1;
		b = pattern2[i];
		d = pattern1;
		e = pattern2[N_PATT_DIV - i];  
				
		// integer division
		asm volatile("div %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		reg=c;

		asm volatile("div %0, %1 ,%2": "=r" (c): "r" (e), "r" (d));	
		reg=c;

		// integer unsigned division 
		asm volatile("divu %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		reg=c;

		asm volatile("divu %0, %1 ,%2": "=r" (c): "r" (e), "r" (d));	
		reg=c;

	}
	
	for ( i=0;i<N_PATT_DIV;i++) {

		a = -pattern1;
		b = -pattern2[i];	  
		d = pattern1;
		e = -pattern2[N_PATT_DIV - i]; 
				
		// integer division
		asm volatile("div %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		reg=c;

		asm volatile("div %0, %1 ,%2": "=r" (c): "r" (e), "r" (d));	
		reg=c;

		// integer unsigned division 
		asm volatile("divu %0, %1 ,%2": "=r" (c): "r" (a), "r" (b));	
		reg=c;

		asm volatile("divu %0, %1 ,%2": "=r" (c): "r" (e), "r" (d));	
		reg=c;

	}

	

	//******************************MULTIPLIER********************************

	int test_values[N_PATT_MULT]= {0x00000000, 0x12345678, 0x33333333, 0x4404D444, 
				       0x70077777, 0x99999999, 0xDDD11010, 0xFFFFFFFF};

	for(j=0;j<N_PATT_MULT; j++) {

		if(j % 2 == 0)
		a=test_values[j];
		else
		a=-test_values[j];
		
		if(j % 2 == 0)
		d=-test_values[N_PATT_MULT - j - 1];
		else
		d=test_values[N_PATT_MULT - j - 1];

		for(i=0;i<N_PATT_MULT;i++) {

			b=test_values[i];

			e=-test_values[i];

			asm volatile("mul %0,%1,%2": "=r" (c) :"r" (a), "r" (b));
			asm volatile("mul %0,%1,%2": "=r" (f) :"r" (d), "r" (e));
			reg=c;
			reg=f;
			asm volatile ("mulh %0,%1,%2": "=r" (c) :"r" (a), "r" (b));
			asm volatile ("mulh %0,%1,%2": "=r" (f) :"r" (d), "r" (e));
			reg=c;
			reg=f;
			asm volatile ("mulhu %0,%1,%2": "=r" (c) :"r" (a), "r" (b));
			asm volatile ("mulhu %0,%1,%2": "=r" (f) :"r" (d), "r" (e));
			reg=c;
			reg=f;
			asm volatile  ("mulhsu %0,%1,%2": "=r" (c) :"r" (a), "r" (b));
			asm volatile  ("mulhsu %0,%1,%2": "=r" (f) :"r" (d), "r" (e));
			reg=c;
			reg=f;

			/// extensions

			asm volatile ("p.mac %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mac %0,%1,%2": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.msu %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.msu %0,%1,%2": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.muls %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.muls %0,%1,%2": "=r" (f): "r" (d) , "r" (e));		
			reg=c;
			reg=f;
			asm volatile ("p.mulhhs %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhs %0,%1,%2": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulsN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulsN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulhhsN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhsN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulsRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulsRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulhhsRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhsRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulu %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulu %0,%1,%2": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulhhu %0,%1,%2": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhu %0,%1,%2": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.muluN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.muluN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulhhuN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhuN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.muluRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.muluRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.mulhhuRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.mulhhuRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.macsN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.macsN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.machhsN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.machhsN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.macsRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.macsRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.machhsRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.machhsRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.macuN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.macuN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.machhuN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.machhuN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.macuRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.macuRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.machhuRN %0,%1,%2,3": "=r" (c): "r" (a) , "r" (b));
			asm volatile ("p.machhuRN %0,%1,%2,3": "=r" (f): "r" (d) , "r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotup.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotup.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotusp.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotup.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotup.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotusp.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.sci.b %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotup.sci.b %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotup.sci.h %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotup.sci.h %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.sci.h %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotusp.sci.h %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotusp.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotusp.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotusp.sci.b %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotusp.sci.b %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotsp.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotsp.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotsp.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.sci.b %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotsp.sci.b %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.sci.h %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.dotsp.sci.h %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.dotsp.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.dotsp.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotup.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotup.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotup.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotup.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.sci.b %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotup.sci.b %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotup.sci.h %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotup.sci.h %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotusp.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotusp.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotusp.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotusp.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.sci.b %0,%1,%2": "=r" (f) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotusp.sci.b %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotusp.sci.h %0,%1,%2": "=r" (f) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotusp.sci.h %0,%1,%2": "=r" (f) : "r" (d),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotsp.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotsp.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.sc.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotsp.sc.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.sc.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.sdotsp.sc.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.sci.b %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotsp.sci.b %0,%1,%2": "=r" (f) : "r" (a),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.sdotsp.sci.h %0,%1,%2": "=r" (c) : "r" (a),"i" (0x00f));
			asm volatile ("pv.sdotsp.sci.h %0,%1,%2": "=r" (f) : "r" (a),"i" (0x00f));
			reg=c;
			reg=f;
			asm volatile ("pv.shuffle.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.shuffle.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.shuffle2.h %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.shuffle2.h %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.shuffle2.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.shuffle2.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.packhi.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.packhi.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("pv.packlo.b %0,%1,%2": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("pv.packlo.b %0,%1,%2": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
			asm volatile ("p.addRN %0,%1,%2,5": "=r" (c) : "r" (a),"r" (b));
			asm volatile ("p.addRN %0,%1,%2,5": "=r" (f) : "r" (d),"r" (e));
			reg=c;
			reg=f;
		}
	}

	return EXIT_SUCCESS;
}
