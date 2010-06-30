//
//  CrazyCalculatorAppDelegate.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/18/10.
//  Copyright home 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrazyCalculatorViewController;

@interface CrazyCalculatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CrazyCalculatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CrazyCalculatorViewController *viewController;

@end

