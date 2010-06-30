//
//  Objectifizer.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityProtocol.h"

@interface Objectifizer : NSObject {

}
-(NSArray*)Do:(NSString*)str;
-(BOOL)IsDigit:(NSString*)str;
@end
