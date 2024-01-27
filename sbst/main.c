#include "tests.h"


const signature_t const GOLDEN_SIGNATURES[NUMTESTS] = {
	0xCAFECAFE,	// TEST1
};

int main()
{
	int i, fails;
	signature_t signatures[NUMTESTS];
	
	//i = test1_short_div();
        //i = test2_long_div();
	//i = test3_short_mul();
	//i = test4_long_mul();
	//i = test5_div_mul();
	i = test6_tmax();
	//i = test7_nocode();


 	return i;
}
