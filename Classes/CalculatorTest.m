//
//  CalculatorTest.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "CalculatorTest.h"
#import "Objectifizer.h"
#import "Regularizer.h"

@implementation CalculatorTest

- (void)setUp{
	testable_ = [[Calculator alloc] init];
	STAssertNotNil(testable_,@"Объект не создался!");
}

- (void)tearDown{
	[testable_ release];
}

- (void)testOnlyUnarySub{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"--2"]];
	Regularizer *regularizer = [[Regularizer alloc]init];
	NSArray *stackExpression = [[NSArray alloc]initWithArray:[regularizer Do:objExpression]];
	int result = [testable_ Do:stackExpression];
	STAssertTrue(result == 2,
				 @"[result count] != 2 (is %d)", result);
	[stackExpression release];
	[objExpression release];
	[objectifizer release];
	[regularizer release];
}

- (void)testUnarySub{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"1+--2"]];
	Regularizer *regularizer = [[Regularizer alloc]init];
	NSArray *stackExpression = [[NSArray alloc]initWithArray:[regularizer Do:objExpression]];
	int result = [testable_ Do:stackExpression];
	STAssertTrue(result== 3,
				 @"[result count] != 3 (is %d)", result );
	[stackExpression release];
	[objectifizer release];
	[objExpression release];
	[regularizer release];
}

- (void)test3{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"(2-3)*-2"]];
	Regularizer *regularizer = [[Regularizer alloc]init];
	NSArray *stackExpression = [[NSArray alloc]initWithArray:[regularizer Do:objExpression]];
	int result = [testable_ Do:stackExpression];
	STAssertTrue(result== 2,
				 @"[result count] != 2 (is %d)", result );
	[stackExpression release];
	[objectifizer release];
	[objExpression release];
	[regularizer release];
}

- (void)test4{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"-2+1"]];
	Regularizer *regularizer = [[Regularizer alloc]init];
	NSArray *stackExpression = [[NSArray alloc]initWithArray:[regularizer Do:objExpression]];
	int result = [testable_ Do:stackExpression];
	STAssertTrue(result== -1,
				 @"[result count] != -1 (is %d)", result );
	[stackExpression release];
	[objectifizer release];
	[objExpression release];
	[regularizer release];
}
@end
