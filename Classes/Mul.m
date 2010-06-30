//
//  Mul.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Mul.h"


@implementation Mul
-( int)PerfomOperationWithA:(short int)a andB:( short int)b{
	return a*b;
}

-(int)Priority{
	return PRIORITY_DIV_AND_MUL;
}


@end
