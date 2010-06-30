//
//  OpereationFactory.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Div.h"
#import "Sub.h"
#import "Mul.h"
#import "Add.h"
#import "LeftBrackit.h"
#import "RightBrackit.h"
#import "UnarySub.h"

@interface ObjectFactory : NSObject {
	NSMutableArray* digit_;
}
-(id)CreateOperation:(NSString*)code;
@end
