//
//  OpereationFactory.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "ObjectFactory.h"
#import "Number.h"

@implementation ObjectFactory
static NSDictionary *operationArray_;

static void  operationArray_remover(){
	[operationArray_ release];
}

- (void) dealloc{
	[digit_ release];
	[super dealloc];
}

- (id) init{
	self = [super init];
	if (self != nil) {
		digit_ = [[NSMutableArray alloc]init];
		if(operationArray_ == nil){
			NSArray *keys = [[NSArray alloc]initWithObjects:@"--",@"+",@"-",
							 @"*",@"/",@"(", @")",nil];
			Add *add = [[Add alloc]init];
			Mul *mul = [[Mul alloc]init];
			Sub *sub = [[Sub alloc]init];
			Div *div = [[Div alloc]init];
			LeftBrackit *left = [[LeftBrackit alloc]init];
			RightBrackit *right = [[RightBrackit alloc]init];
			UnarySub *unary = [[UnarySub alloc]init];
			NSArray *obj = [[NSArray alloc]initWithObjects:unary,add,sub,
							mul,div,left,right,nil];
			[add release];
			[mul release];
			[sub release];
			[div release];
			[right release];
			[left release];
			[unary release];
			operationArray_ =[[NSDictionary alloc]initWithObjects:obj forKeys:keys];
			[keys release];
			[obj release];
			atexit(operationArray_remover);
		}
	}
	return self;
}

-(id)CreateOperation:(NSString*)code{
	id operation  =  [operationArray_ objectForKey:code];
	if(operation == nil){
		Number *num = nil;
		num = [[Number alloc]initWithStr:code];
		[digit_ addObject:num];
		[num release];
		return [digit_ lastObject];
	}
	else
		return operation;
}

@end
