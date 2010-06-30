//
//  RegularizerTest.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "RegularizerTest.h"

@class UnarySub;
@class Add;
@class Sub;
@class Mul;
@class Number;
@implementation RegularizerTest
- (void)setUp{
	testable_ = [[Regularizer alloc] init];
	STAssertNotNil(testable_,@"Объект не создался!");
}

- (void)tearDown{
	[testable_ release];
}

- (void)testOnlyUnarySub{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"--2"]];
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:objExpression]];
	STAssertTrue([result count] == 3,
				 @"[result count] != 3 (is %d)", [result count] );
	

	STAssertTrue([[result objectAtIndex:0] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:1] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:2] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );

	[result release];
	[objExpression release];
	[objectifizer release];
}

- (void)testUnarySub{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"1+--2"]];
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:objExpression]];
	STAssertTrue([result count] == 5,
				 @"[result count] != 5 (is %d)", [result count] );
	
	STAssertTrue([[result objectAtIndex:0] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:1] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:2] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:3] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:4] isKindOfClass:[Add class]] == YES,
				 @"isKindOfClass != Add" );
	[result release];
	[objectifizer release];
}

- (void)test3{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"(2-3)*-2"]];
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:objExpression]];
	STAssertTrue([result count] == 6,
				 @"[result count] != 6 (is %d)", [result count] );
	int i= 0;

	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Sub class]] == YES,
				 @"isKindOfClass != Sub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Mul class]] == YES,
				 @"isKindOfClass != Mul" );
	[result release];
	[objectifizer release];
}

- (void)test4{
	Objectifizer *objectifizer = [[Objectifizer alloc]init];
	NSArray *objExpression = [[NSArray alloc]initWithArray:[objectifizer Do:@"-2+1"]];
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:objExpression]];
	STAssertTrue([result count] == 4,
				 @"[result count] != 4 (is %d)", [result count] );
	int i = 0;
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Add class]] == YES,
				 @"isKindOfClass != Add" );

	[result release];
	[objectifizer release];
}

@end
