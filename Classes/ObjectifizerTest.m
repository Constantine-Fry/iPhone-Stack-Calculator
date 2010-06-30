//
//  ObjectifizerTest.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "ObjectifizerTest.h"

@class UnarySub;
@class Add;
@class LeftBrackit;
@class RightBrackit;
@class Mul;
@class Sub;
@class Number;


@implementation ObjectifizerTest

- (void)setUp{
	testable_ = [[Objectifizer alloc] init];
	STAssertNotNil(testable_,@"Объект не создался!");
}

- (void)tearDown{
	[testable_ release];
}

- (void)testOnlyUnarySub{
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:@"--2"]];
	STAssertTrue([result count] == 5,
				 @"[result count] != 5 (is %d)", [result count] );
	int i = 0;
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[LeftBrackit class]] == YES,
				 @"isKindOfClass !=RightBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[RightBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	[result release];
}

- (void)testUnarySub{
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:@"1+--2"]];
	STAssertTrue([result count] == 7,
				 @"[result count] != 7 (is %d)", [result count] );
	int i = 0;
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[LeftBrackit class]] == YES,
				 @"isKindOfClass !=RightBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Add class]] == YES,
				 @"isKindOfClass != Add" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[RightBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	[result release];
}

- (void)test3{
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:@"(2-3)*-2"]];
	STAssertTrue([result count] == 10,
				 @"[result count] != 10 (is %d)", [result count] );
	int i= 0;
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[LeftBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[LeftBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Sub class]] == YES,
				 @"isKindOfClass != Sub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[RightBrackit class]] == YES,
				 @"isKindOfClass !=RightBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Mul class]] == YES,
				 @"isKindOfClass != Mul" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[RightBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	[result release];
}

- (void)test4{
	NSArray *result = [[NSArray alloc]initWithArray:[testable_ Do:@"-2+1"]];
	STAssertTrue([result count] == 6,
				 @"[result count] != 6 (is %d)", [result count] );
	int i = 0;
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[LeftBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[UnarySub class]] == YES,
				 @"isKindOfClass != UnarySub" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Add class]] == YES,
				 @"isKindOfClass != Add" );
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[Number class]] == YES,
				 @"isKindOfClass !=NSNumber");
	STAssertTrue([[result objectAtIndex:i++] isKindOfClass:[RightBrackit class]] == YES,
				 @"isKindOfClass !=LeftBrackit");
	[result release];
}

@end
