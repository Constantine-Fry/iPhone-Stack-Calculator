//
//  Stack.h
//  CrazyPainter
//
//  Created by Fry Constantine on 10/4/09.
//  Copyright 2009 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Stack;
@interface Stack : NSObject {
	NSMutableArray *array_;
}

-(void)Push:(id)obj;
-(id)Pop;
-(id)Top;
-(void)Compute:(NSString*)c;
@end
