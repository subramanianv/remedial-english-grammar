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
@synthesize webView,pageControl,recognizer,_contentDictionary,total,current;
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
{if (motion==UIEventSubtypeMotionShake)
{
        [self swipeLeftAction:nil];
}
}
-(NSString*)loadHTMLforKey:(NSInteger)key
{return [NSString stringWithFormat:@"%@",[_contentDictionary objectForKey:[NSString stringWithFormat:@"%d",key]]];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)aTitle withDictionary:(NSDictionary*)aDict withTotal:(int)atotal
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    self.title=aTitle;
    self.current=1;
    self._contentDictionary=aDict;
    self.total=[self._contentDictionary count];
    return self;
}

-(void)LoadRequest
{
    [webView loadHTMLString:[self loadHTMLforKey:current] baseURL:nil];
    [labelno setText:[NSString stringWithFormat:@"%d/%d",current,total]];
    
}
- (void)dealloc
{
    [_contentDictionary release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
    
}
- (void)swipeRightAction:(id)ignored
{if (self.current==1) {}
 else{swipeLeft.enabled=YES;
     self.current--;
    [self LoadRequest];}}
- (void)swipeLeftAction:(id)ignored
{if (self.current==self.total)
{}else
    {self.current++;
    [labelno setText:[NSString stringWithFormat:@"%d/%d",self.current,self.total]];
    [self LoadRequest];}}

-(void)loadView
{
  //  self.navigationController.navigationBar.tintColor=RGB(240, 128, 128);// 240 	128 	128 	
   swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightAction:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate = self;
   UIView *parentView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    parentView.layer.contents=(id)[UIImage imageNamed:@"cbg.jpg"].CGImage;
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0,0,320,350)];
    webView.backgroundColor=[UIColor grayColor];
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
    [label1 setBackgroundColor:[UIColor clearColor]];
    labelno=[[UILabel alloc]initWithFrame:CGRectMake(148, 327, 42, 21)];
    labelno.text=[NSString stringWithFormat:@"%d/%d",current,total];
    [labelno setBackgroundColor:[UIColor clearColor]];
    [parentView addSubview:label1];
    [parentView addSubview:labelno];
    [label1 release];
        self.view=parentView;
   adview=[[UIView alloc]initWithFrame:CGRectMake(0, 364, 320, 48)];
    [adview setBackgroundColor:[UIColor yellowColor]];
    [parentView addSubview:adview];
    [adview release];
    [parentView release];
    [self LoadRequest];
    [webView release];
   [swipeRight release];
    [swipeLeft release];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{swipeLeft.enabled=NO;
swipeRight.enabled=NO;
[activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{swipeLeft.enabled=YES;
    swipeRight.enabled=YES;
    [activityIndicator stopAnimating];}
- (void)viewDidUnload
{
    [super viewDidUnload];
}
@end
