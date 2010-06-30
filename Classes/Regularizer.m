//
//  Regularizer.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Regularizer.h"

@class LeftBrackit;
@class RightBrackit;
@class UnarySub;

@implementation Regularizer

- (id) init{
	self = [super init];
	if (self != nil) {
		result_ = [[NSMutableArray alloc]init];
		stack_ = [[Stack alloc]init];
	}
	return self;
}

- (void) dealloc{
	[result_ release];
	[stack_ release];
	[super dealloc];
}

-(NSArray*)Do:(NSArray*)objExpression{
	NSEnumerator *enumerator = [objExpression objectEnumerator];
	id obj = [enumerator nextObject];
	while (obj != nil) {
		[self ProcessObject:obj];
		obj = [enumerator nextObject];
	}
	return result_;
}

-(void) ProcessObject:(id<PriorityProtocol,TypeProtocol>)obj {
	if([obj Type] == TYPE_LEFT_BRACKIT){
		[stack_ Push:obj]; 
		return;
	}

	if([obj Type] == TYPE_RIGHT_BRACKIT){
		[self ProcessSuspendedSymbols:obj]; 
		[stack_ Pop];
		return;
	}
	
	if([obj Type] == TYPE_NUMBER){
		[result_ addObject:obj];
		return;
	}
	
	[self ProcessSuspendedSymbols:obj]; 
	[stack_  Push:obj];
}

-(void) ProcessSuspendedSymbols:(id<PriorityProtocol,TypeProtocol>)obj {
	while ([self PrecedesA:[stack_ Top] andB: obj])
		[result_ addObject:[stack_ Pop]];
}

-(BOOL) PrecedesA:(id<PriorityProtocol,TypeProtocol>)a andB:(id<PriorityProtocol,TypeProtocol>)b{
	if([a Type] == TYPE_LEFT_BRACKIT) return false;
	if([b Type] == TYPE_RIGHT_BRACKIT) return true; 
	if([a Priority] ==4 &&[b Priority] ==4)return false;
	return [a Priority] >=[b  Priority];
}

@end
