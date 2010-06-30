//
//  Div.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Div.h"


@implementation Div
-( int)PerfomOperationWithA:(short int)a andB:( short int)b{
	if(b == 0)
		[NSException raise:@"Divizion by zero" format:@"Divizion by zero."];
	return a/b;
}
-(int)Priority{
	return PRIORITY_DIV_AND_MUL;
}

@end
