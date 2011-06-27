//
//  MyFinalAppViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "MyFinalAppViewController.h"
#import "LessonsViewController.h"
#import "TestsViewController.h"
@implementation MyFinalAppViewController
@synthesize LessonsButton,testButton;

//my method
-(IBAction)LessonsButtonClicked
{

        TestsViewController *vc=[[TestsViewController alloc]init];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    
    
    [self presentModalViewController:nav animated:YES];
    [vc release];
    [nav release];
    
    
    
}
-(IBAction)TestButtonClicked
{
    TestsViewController *test=[[TestsViewController alloc]init];
    [self presentModalViewController:test animated:YES];
    [test release];
    
    
}






- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
