//
//  LessonsViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//
#import "Tests.h"
#import "LessonsViewController.h"
#import <QuartzCore/QuartzCore.h>
//#import "LessonsList.h"




@implementation LessonsViewController
@synthesize beginButton,slider,qlabel,label,mainView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        CGRect frame = CGRectMake(0, 0, 200, 44);
        UILabel *Titlelabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
        Titlelabel.backgroundColor = [UIColor clearColor];
       Titlelabel.font = [UIFont fontWithName:@"analgesics" size:35.0];
        Titlelabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        Titlelabel.textAlignment = UITextAlignmentCenter;
        Titlelabel.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = Titlelabel;
        Titlelabel.text=@"Tests";
        
    }
   
    
    return self;
}
-(void)didPressQuitButton
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
    [pool release];
    [self dismissModalViewControllerAnimated:YES];
    
}
- (void)dealloc
{
    [super dealloc];
}
-(IBAction)BeginButtonClicked:(id)sender
{
    int x=roundl([slider value]);
    flag=1;
    Tests *test=[[Tests alloc]initWithNibName:@"Tests" bundle:nil withTotal:x];
   
    if(slider.value>0.0)
    {
    [self.navigationController pushViewController:test animated:YES];
    }
    [test release];
    
    
      
    
}
-(void)goBack
{
    [self dismissModalViewControllerAnimated:YES];
    
}
-(IBAction)sliderMoved:(id)sender
{
 
    int x=roundl([slider value]);
    
    label.text=[NSString stringWithFormat:@"No of Questions: %d",x];
    
    
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
    self.navigationController.navigationBar.tintColor=RGB(156, 102, 31);

    UIBarButtonItem *button=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)]autorelease];
    self.navigationItem.leftBarButtonItem=button;
    
    [[self.mainView layer]setCornerRadius:10.0f];                       
label.text=@"No of Questions:0";
    
    self.title=@"Tests";
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]]];
    UIImage *minImage = [UIImage imageNamed:@"grey_track.png"];
	UIImage *maxImage = [UIImage imageNamed:@"white_track.png"];
	UIImage *tumbImage= [UIImage imageNamed:@"metal_screw.png"];
    
	minImage=[minImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	maxImage=[maxImage stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
    [self.slider setThumbImage:tumbImage forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:minImage forState:UIControlStateNormal];
    [self.slider setMaximumTrackImage:maxImage forState:UIControlStateNormal];
    [super viewDidLoad];
    
    minImage=nil;
    minImage=nil;
    tumbImage=nil;
    //self.beginButton.enabled=;
    [self.label setFont:[UIFont fontWithName:@"analgesics" size:25.0f]];   
    [self.mainView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"qbg.jpg"]]];
    [[self.mainView layer]setCornerRadius:10.0f]; 
    [[self.mainView layer]setEdgeAntialiasingMask:12];
    [self.mainView setClipsToBounds:YES];
    [[self.mainView layer]setBorderColor:[[UIColor brownColor]CGColor]];
    [[self.mainView layer]setBorderWidth:4.0f];
    beginButton.titleLabel.font=[UIFont fontWithName:@"analgesics" size:28.0f];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewDidAppear:(BOOL)animated
{
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
