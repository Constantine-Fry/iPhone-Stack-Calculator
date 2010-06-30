//
//  Number.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/26/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Number.h"


@implementation Number

- (id) initWithShort:( int) value
{
	//if((int)value>32767 || (int)value < -32767)
	//	[NSException raise:@"Invalid number" format:@"Invalid number"];
	self = [super init];
	if (self != nil) {
		value_ = value;
	}
	return self;
}

- (id) initWithStr:(NSString*) value{	
	if([ value intValue]>32767 ||[ value intValue]< -32767 ||[value length] >5)
		[NSException raise:@"Invalid number" format:@"Invalid number"];
	self = [super init];
	if (self != nil) {
		value_ = [value intValue];
	}
	return self;
}

-(short int)Value{
	return value_;
}

-(int)Type{
	return TYPE_NUMBER;
}
@end
