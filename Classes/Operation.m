//
//  Operation.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Operation.h"


@implementation Operation


- (void)Do:(Stack*)stack {
	Number *second = [stack Pop];
	Number *first = [stack Pop];
	int result = [self PerfomOperationWithA:[first Value] andB:[second Value]];
	if((int)result>32767 || (int)result < -32767)
		[NSException raise:@"Invalid number" format:@"Overflow"];
	Number *num = [[Number alloc]initWithShort:(int)result];
	[stack Push:num];
	[num release];
}

-(int)Type{
	return TYPE_OPERATION;
}

@end
