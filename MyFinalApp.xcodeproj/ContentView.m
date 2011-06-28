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
@synthesize webView,pageControl,recognizer,_contentDictionary;



-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    
}
-(void)viewDidDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    
    [super viewDidDisappear:animated];
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion==UIEventSubtypeMotionShake) {
        [self swipeLeftAction:nil];
        
    }
}
-(NSString*)loadHTMLforKey:(NSInteger)key
{
    
    return [NSString stringWithFormat:@"%@",[_contentDictionary objectForKey:[NSString stringWithFormat:@"%d",key]]];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)aTitle withDictionary:(NSDictionary*)aDict withTotal:(int)atotal
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
    }
    
    self.title=aTitle;
    current=1;
    self._contentDictionary=aDict;
    total=[_contentDictionary count];
    
    return self;
}

-(void)LoadRequest
{
    [webView loadHTMLString:[self loadHTMLforKey:current] baseURL:nil];
    [labelno setText:[NSString stringWithFormat:@"%d/%d",current,total]];
    
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
    if (current==1) {
        
    }
    else
    {
        
        swipeLeft.enabled=YES;
        
        current--;
        
        [self LoadRequest];
        
    }
    

}
- (void)swipeLeftAction:(id)ignored
{
   
    
    NSLog(@"Swipe Right%d",total);
    if (current==total) {
        
    }
    else
    {
        current++;
        [labelno setText:[NSString stringWithFormat:@"%d/%d",current,total]];
        

        [self LoadRequest];
        
    }

    
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
    
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(95, 324, 53, 24)];
    label1.text=@"Slide:";
    [label1 setBackgroundColor:RGB(230, 230, 250)];
    
    
    labelno=[[UILabel alloc]initWithFrame:CGRectMake(148, 327, 42, 21)];
    labelno.text=[NSString stringWithFormat:@"%d/%d",current,total];
    [labelno setBackgroundColor:RGB(230, 230, 250)];
    
    
    [parentView addSubview:label1];
    [parentView addSubview:labelno];
    
    
    [label1 release];
        self.view=parentView;
    

    [parentView release];
    
    [self LoadRequest];
    
    
    
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
