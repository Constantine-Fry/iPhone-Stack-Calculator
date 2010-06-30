//
//  Operation.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"
#import "PriorityProtocol.h"
#import "Number.h"


@interface Operation : NSObject<PriorityProtocol>{

}

-(void)Do:(Stack*)stack;
-(int)PerfomOperationWithA:(short int)a andB:(short  int)b;
@end
