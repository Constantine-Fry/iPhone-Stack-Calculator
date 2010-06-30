//
//  Objectifizer.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import "Objectifizer.h"
#import "ObjectFactory.h"

@implementation Objectifizer

-(BOOL)IsDigit:(NSString*)str {
	NSString *trimmedString = [str stringByTrimmingCharactersInSet:
							   [NSCharacterSet decimalDigitCharacterSet]];
	if([trimmedString length] == 0)
		return TRUE;
	else 
		return FALSE;
}

- (NSMutableString *) ArrangeDot: (NSString *) str  {
	NSMutableString* temp =[[NSMutableString alloc]initWithString:str];
	for(int i = 0;i< temp.length;i++){
		NSString *cur =  [temp substringWithRange:NSMakeRange(i, 1)];
		NSString *prev = [temp substringWithRange:NSMakeRange(i-1, 1)];
		if( ![self IsDigit:cur] || ![self IsDigit: prev]){
			[temp insertString:@"." atIndex:i++];
		}
	}
	return [temp autorelease];;
}

- (void) FindUnaryOperation: (NSMutableArray *) result  {
	for(int  i = 1;i<[result count];i++){
		NSString *prev = [result objectAtIndex:i-1];
		NSString *cur = [result objectAtIndex:i];
		if( (![self IsDigit:prev]  || i==1)&& [cur isEqual:@"-"]){
			NSString *repStr = [[NSString alloc]initWithString:@"--"];
			[result replaceObjectAtIndex:i withObject:repStr];
			[repStr release];
		}
	}
}

-(NSArray*)StringToCodeArray:(NSString*)str{
	NSMutableString *strWithDotBetweenObj = [[NSString alloc] initWithString:
											 [self ArrangeDot: str]];
	NSMutableArray *result = [[NSMutableArray alloc]initWithArray:
							  [strWithDotBetweenObj componentsSeparatedByString:@"."]];
	[strWithDotBetweenObj release];
	[self FindUnaryOperation: result];
	[result removeObjectAtIndex:0];
	return [result autorelease];
}

-(NSArray*)Do:(NSString*)str{
	NSMutableArray *result = [[NSMutableArray alloc]init];
	ObjectFactory *factory = [[ObjectFactory alloc]init]; 
	[result addObject:[factory CreateOperation:@"("]];
	NSArray *strArray = [[NSArray alloc]initWithArray:[self StringToCodeArray:str]];
	for(NSString *str in strArray){
		@try{
			[result addObject:[factory CreateOperation:str]];
		}
		@catch (NSException *e) {
			[factory release];
			[result release];
			[e raise];
		}
	}
	[result addObject:[factory CreateOperation:@")"]];
	[factory release];
	return [result autorelease];
}







@end
