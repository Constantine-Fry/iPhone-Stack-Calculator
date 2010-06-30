//
//  Regularizer.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "PriorityProtocol.h"

@interface Regularizer : NSObject {
	NSMutableArray	*result_;
	Stack *stack_;
}
-(NSArray*)Do:(NSArray*)objExpression;
-(void) ProcessObject:(id<PriorityProtocol,TypeProtocol>)obj;
-(void) ProcessSuspendedSymbols:(id<PriorityProtocol,TypeProtocol>)obj;
-(BOOL) PrecedesA:(id<PriorityProtocol,TypeProtocol>)a andB:(id<PriorityProtocol,TypeProtocol>)b;
@end
