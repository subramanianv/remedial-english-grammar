//
//  LessonsViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "LessonsViewController.h"
#import "QuestionView.h"
//#import "LessonsList.h"

@implementation LessonsViewController
@synthesize beginButton,slider,qlabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            
    }
    NSLog(@"Called");
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}
-(IBAction)BeginButtonClicked:(id)sender
{
    
    QuestionView *qc=[[QuestionView alloc]initWithNibName:@"QuestionView" bundle:nil withTotal:[[qlabel text]intValue]];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:qc];
    [self presentModalViewController:nav animated:YES];
    
}
-(IBAction)sliderMoved:(id)sender
{
   
    int x=roundl([slider value]);
    qlabel.text=[NSString stringWithFormat:@"%d",x];
    
    
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
