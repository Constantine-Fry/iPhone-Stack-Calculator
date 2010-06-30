//
//  PriorityProtocol.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/25/10.
//  Copyright 2010 home. All rights reserved.
//

#import <Foundation/Foundation.h>
#define PRIORITY_LEFT_BRACKIT 0
#define PRIORITY_RIGHT_BRACKIT 1
#define PRIORITY_SUB_AND_ADD 2
#define PRIORITY_DIV_AND_MUL 3
#define PRIORITY_UNARY_SUB 4


#define TYPE_LEFT_BRACKIT 0
#define TYPE_RIGHT_BRACKIT 1
#define TYPE_OPERATION 2
#define TYPE_NUMBER 3

@protocol PriorityProtocol
-(int)Priority;
@end

@protocol TypeProtocol
-(int)Type;
@end

