//
//  ResultsTableView.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/8/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "ResultsTableView.h"
#import <QuartzCore/QuartzCore.h>
@implementation ResultsTableView
@synthesize no_of_tests,dict,number,progressView,ave,ratingView,view1,view2,view3,notlabel,ratingLabel,aver_label;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGRect frame = CGRectMake(0, 0, 200, 44);
        UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"analgesics" size:35.0];
        label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = label;
        label.text=@"Progress";

        // Custom initialization
    }
    return self;
}
-(NSString*)stringPath
{
    

NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
return [[pathArray objectAtIndex:0]stringByAppendingPathComponent:@"Results.plist"];

}

-(IBAction)pop:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc
{
    [self.progressView release];
    [self.ave release];
    [self.ratingView release];
    [self.view2 release];
    [self.view1 release];
    [self.view3 release];
    [self.number release];
    [self.no_of_tests release];
    [self.dict release];
    [self.notlabel release];
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
{   NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[pathArray objectAtIndex:0]stringByAppendingPathComponent:@"Results.plist"];

    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        
             
        self.dict=[NSDictionary dictionaryWithContentsOfFile:path];
        
        
        
        self.no_of_tests.text=[NSString stringWithFormat:@"%@",[self.dict objectForKey:@"No_of_Test"]];
        if (self.no_of_tests.text==nil) {
            self.no_of_tests.text=@"0";
        }
        self.number=[self.dict objectForKey:@"Average"];

        if (self.number==nil) {
            [self.progressView setValue:0];
        }
        [self.progressView setValue:[self.number floatValue]];
        self.ave.text=[NSString stringWithFormat:@"%d/100",[self.number intValue]];
        
        
        
    }
    else
        {
        self.no_of_tests.text=@"0";
        }
    
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(pop:)]autorelease];
    self.navigationController.navigationBar.tintColor=[UIColor brownColor];
    self.title=@"Progress";
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]]];
    [no_of_tests setFont:[UIFont fontWithName:@"analgesics" size:22.0f]];   
     [notlabel setFont:[UIFont fontWithName:@"analgesics" size:22.0f]];
    [aver_label setFont:[UIFont fontWithName:@"analgesics" size:22.0f]];  
    [ratingLabel setFont:[UIFont fontWithName:@"analgesics" size:22.0f]];  
    [ave setFont:[UIFont fontWithName:@"analgesics" size:22.0f]];   
    [self.progressView setMaximumTrackImage:[UIImage imageNamed:@"grey_track.png"] forState:UIControlStateNormal];
    [self.progressView setMinimumTrackImage:[UIImage imageNamed:@"white_track.png"] forState:UIControlStateNormal];
    [self.progressView setThumbImage:[UIImage imageNamed:@"metal_screw.png"] forState:UIControlStateNormal];

    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
        [[self.view1 layer]setCornerRadius:10.0f];
    [[self.view1 layer]setBorderWidth:3.75];
    [[self.view1 layer]setBorderColor:[[UIColor brownColor]CGColor]];
    
    
    [[self.view2 layer]setBorderWidth:3.75];
    [[self.view2 layer]setBorderColor:[[UIColor brownColor]CGColor]];
    [[self.view2 layer]setCornerRadius:10.0f];
    
    [[self.view3 layer]setCornerRadius:10.0f];
    [[self.view3 layer]setBorderColor:[[UIColor brownColor]CGColor]];
    [[self.view3 layer]setBorderWidth:3.75];
    
    NSArray *subs=[self.ratingView subviews];
    for (int i=0; i<[subs count]; i++) {
        [[subs objectAtIndex:i]setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"unsel.jpg"]]];
    }
    
    //calculate out of 5
    float avea=[self.number floatValue];
    float rating=(avea*5)/100;
    int base=floor(rating);
    
    
    int j=0;
    //update view;
    for (j=0; j<base; j++) {
        [[subs objectAtIndex:j]setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"voting_14.jpg"]]];
        
    }
    if ((rating-base)>0) {
        [[subs objectAtIndex:j]setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"halfsel.jpg"]]];
        
    }
//    [subs release];
    
    
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
