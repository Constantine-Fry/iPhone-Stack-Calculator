//
//  Number.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/26/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityProtocol.h"

@interface Number : NSObject<TypeProtocol> {
	short int value_;
}
- (id) initWithShort:(int) value;
- (id) initWithStr:(NSString*) value;
-(short int)Value;
@end
