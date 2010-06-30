//
//  CrazyCalculatorViewController.h
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/18/10.
//  Copyright home 2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CrazyCalculatorViewController : UIViewController {
	IBOutlet UILabel *answer_;
	IBOutlet UITextField *equation_;
	IBOutlet UIButton *button_;

}

-(IBAction)Click:(id)sender;



@end

