//
//  CrazyCalculatorViewController.m
//  CrazyCalculator
//
//  Created by Fry Constantine on 1/18/10.
//  Copyright home 2010. All rights reserved.
//

#import "CrazyCalculatorViewController.h"
#import "ModelController.h"

@implementation CrazyCalculatorViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

-(IBAction)Click:(id)sender{
	NSString *str = [[NSString alloc]initWithString:equation_.text];
	ModelController *mc =[ [ModelController alloc]init];
	short int res =0;
	@try {
		res = [mc Compute:str];
		answer_.text = [NSString stringWithFormat:@"=%d",res];
	}
	@catch(NSException *e){
		answer_.text = [NSString stringWithFormat:@"%@",e];
	}
	
	[str release];
	[mc release];
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	button_ = nil;
	answer_ = nil;
	equation_ = nil;
}

- (void)dealloc {
    [super dealloc];
}

@end
