//
//  Validator.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/27/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Validator.h"


@implementation Validator

-(void)Do:(NSString*)str{
	NSString *trimmedString = [str stringByTrimmingCharactersInSet:
							   [NSCharacterSet characterSetWithCharactersInString:
							   @"-+/*0123456789()"]];
	if([trimmedString length] != 0)
		[NSException raise:@"Invalid symbol in textField" format:@"Invalid symbol in textField."];
}
@end
