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
#import "ResultsTableView.h"
#import "ContentViewController.h"
@implementation MyFinalAppViewController
@synthesize LessonsButton,testButton,ResultButton;

//my method
-(IBAction)LessonsButtonClicked
{


    NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"AppContent" ofType:@"plist"]];
    NSArray *array=[dict objectForKey:@"New item"];
    
                    
   ContentViewController *vc=[[ContentViewController alloc]initWithNibName:@"ContentViewController" bundle:nil withArray:array];
 //   TestsViewController *vc=[[TestsViewController alloc]init];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
    [self presentModalViewController:nav animated:YES];
    [vc release];
    [nav release];
}
-(IBAction)ShowSavedTests
{
    ResultsTableView *tvc=[[ResultsTableView alloc]initWithNibName:@"ProgressView" bundle:nil];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:tvc];
    [self presentModalViewController:nav1 animated:YES];
    [self.navigationItem setHidesBackButton:NO];
    
    [nav1 release];
    [tvc release];
    
    
}
-(IBAction)TestButtonClicked
{
   
    
    LessonsViewController *lc=[[LessonsViewController alloc]initWithNibName:@"TestView" bundle:nil];
    UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:lc];
    
    
    
    [self presentModalViewController:vc animated:YES];
    [lc release];
    [vc release];
    
    
    
    
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg7.jpg"]]];
    
}

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
