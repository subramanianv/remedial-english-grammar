//
//  ContentView.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "ContentView.h"
//#define UIColorFromRGB(rgbValue) [UIColor \

@implementation ContentView
//@synthesize stopButton,webView,nextButton,prevButton;
@synthesize webView,pageControl,recognizer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)aTitle;
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
    }
    
    self.title=aTitle;
    current=0;
    
    return self;
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
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
    
}
- (void)swipeRightAction:(id)ignored
{
    NSLog(@"Swipe Right");
    [webView loadHTMLString:@"ManUtd" baseURL:nil];
    // [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.yahoo.com"]]];
}
- (void)swipeLeftAction:(id)ignored
{
    NSLog(@"Swipe Left");
    //add Function
    [webView loadHTMLString:@"Vinod" baseURL:nil];
  //  [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.manutd.com"]]];
    
}

-(void)loadView
{
   swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate = self;
   UIView *parentView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(20,20,287,286)];
    [webView addGestureRecognizer:swipeRight];
    webView.layer.cornerRadius=10.0f;
    webView.delegate=self;
   
   swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delegate = self;
    [webView addGestureRecognizer:swipeLeft];
    //webView.userInteractionEnabled=NO;
    [parentView addSubview:webView];
    parentView.backgroundColor=RGB(230, 230, 250);
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    activityIndicator.center=webView.center;
    
    [parentView addSubview:activityIndicator];
    
    self.view=parentView;
    

    [parentView release];
    [webView release];
    [swipeRight release];
    [swipeLeft release];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	swipeLeft.enabled=NO;
    swipeRight.enabled=NO;
    
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
    swipeLeft.enabled=YES;
    swipeRight.enabled=YES;
    [activityIndicator stopAnimating];
    

    
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
