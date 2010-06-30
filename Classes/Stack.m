//
//  Stack.m
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import "Stack.h"


@implementation Stack

- (id)init{
	self = [super init];
	if (self != nil) {
		array_ = [[NSMutableArray alloc]init];
	}
	return self;
}

- (void)dealloc{
	[array_ release];
	[super dealloc];
}

-(void)Push:(id)obj{
	if(nil != obj){
		[array_ addObject:obj];
	}
}

-(id)Top{
	return  [array_ lastObject];
}

-(id)Pop{
	if (0 != [array_ count]){
		id obj = [[array_ lastObject] retain];
		[array_ removeLastObject];
		return [obj autorelease];;
	} else {
		return nil;
	}
}

-(void)Compute:(NSString*)c{
	NSString *a = [self Pop];
	NSString *b = [self Pop];
	int r = 0;
	if([c isEqual:@"+"])
		r = [a intValue]  + [b intValue];
	if([c isEqual:@"-"])
		r = [a intValue]  - [b intValue];
	if([c isEqual:@"*"])
		r = [a intValue]  * [b intValue];
	if([c isEqual:@"/"])
		r = [a intValue]  / [b intValue];
	NSString *result =[[NSString alloc] initWithFormat:@"%d",r];
	[self Push:result];
	[result release];
}

- ( NSString * ) description {
	NSMutableString *result = [[NSMutableString alloc]init];
	for(NSString *str in array_)
		[result appendString:str];
	return [result autorelease];
}

@end
