//
//  ModelController.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "ModelController.h"
#import "Objectifizer.h"
#import "Calculator.h"
#import "Regularizer.h"
#import "Validator.h"

@implementation ModelController
-(short int)Compute:(NSString*)strExpression{
	Validator *validator = [[Validator alloc]init];
	@try {
		[validator Do:strExpression];
	}
	@finally {
		[validator release];
	}
	
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression  = nil;
	@try {
		objExpression =[[NSArray alloc]initWithArray:[objectifizer Do:strExpression]];
	}
	@finally {
		[objectifizer release];
	}
	
	
	
	Regularizer *reg = [[Regularizer alloc]init];
	NSArray * stackExpression = [[NSArray alloc]initWithArray:[reg Do:objExpression]];
	[reg release];
	[objExpression release];
							 
	Calculator *calc = [[Calculator alloc]init];
	int result  = 0;
	@try {
		result= [calc Do:stackExpression];
	}
	@finally {
		[calc release];
		[stackExpression release];
	}

	
	return result;
}
@end
