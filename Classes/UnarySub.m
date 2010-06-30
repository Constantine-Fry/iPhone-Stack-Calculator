//
//  UnarySub.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "UnarySub.h"


@implementation UnarySub

- (void)Do:(Stack*)stack {
	Number *first = [stack Pop];
	short int result = [self PerfomOperationWithA:[first Value] andB:0];
	Number *num = [[Number alloc]initWithShort:result];
	[stack Push:num];
	[num release];
}

-( int)PerfomOperationWithA:(short int)a andB:( short int)b{
	return -a;
}

-(int)Priority{
	return PRIORITY_UNARY_SUB;
}

@end
