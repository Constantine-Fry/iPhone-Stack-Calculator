//
//  Calculator.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Calculator.h"
#import "Stack.h"
#import "Operation.h"

@implementation Calculator

-(short int)Do:(NSArray*)stackExpression{
	NSEnumerator *enumerator =[stackExpression objectEnumerator];
	Stack *stack = [[Stack alloc]init];
	id obj = [enumerator nextObject];
	while (obj != nil) {
		if([obj Type] == TYPE_NUMBER)
			[stack Push:obj];
		else{
			@try{
			[(Operation*)obj Do:stack];
			}
			@catch (NSException *e) {
				[stack release];
				[e raise];
			}
		}
		obj = [enumerator nextObject];
	}
	short int result = [[stack Pop] Value];
	[stack release];
	return result;			  
}
@end
