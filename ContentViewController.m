
#import "ContentViewController.h"
#import <QuartzCore/QuartzCore.h>
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define MAXS [array count]
@implementation ContentViewController
@synthesize webView,array,session,prev_button,next_button;//,LessonsDoneArray;
-(NSString*)filePath
{
    NSArray *Filearray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[Filearray objectAtIndex:0]stringByAppendingPathComponent:@"Property List.plist"];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withArray:(NSArray *)_array
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.array=_array;
        CGRect frame = CGRectMake(0, 0, 200, 44);
        UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"analgesics" size:35.0];
        label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = label;
        label.text=@"Lessons";
    }
    return self;
}
-(IBAction)next_button_clicked
{
    [self nextSlide];
    
}
-(IBAction)prevSlide
{
    
 
    if (currentIndex>intialIndex) {
        
        currentIndex--;
     
        NSNumber *num=[LessonsDoneArray objectAtIndex:currentIndex];
        [webView loadHTMLString:[self.array objectAtIndex:[num intValue]] baseURL:nil];
        
    }   
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion==UIEventSubtypeMotionShake) {
        [self nextSlide];
    }
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    swipe.enabled=NO;
    [act startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [act stopAnimating];
    swipe.enabled=YES;
}
- (void)dealloc
{   [act release];
    [LessonsDoneArray release];
    
    [prev_button release];
    [self.array release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(void)nextSlide
{
   
    if (currentIndex<[LessonsDoneArray indexOfObject:[LessonsDoneArray lastObject]]) {
        currentIndex++;
        [webView loadHTMLString:[self.array objectAtIndex:[[LessonsDoneArray objectAtIndex:currentIndex]intValue]] baseURL:nil];
        
    }
    else
        {
            if([LessonsDoneArray count]==MAXS )
            {
                    [LessonsDoneArray removeAllObjects];
    
            }
    
        int x=arc4random()%MAXS;
        while ([LessonsDoneArray containsObject:[NSNumber numberWithInt:x]])
            {
              x=arc4random()%MAXS;
            }

    [LessonsDoneArray addObject:[NSNumber numberWithInt:x]];
     
     [webView loadHTMLString:[self.array objectAtIndex:x] baseURL:nil];
        currentIndex=[LessonsDoneArray indexOfObject:[LessonsDoneArray lastObject]];
        
     }
}
-(void)goBack
{
    
    [self.webView release];
    [LessonsDoneArray writeToFile:[self filePath] atomically:YES];
    //[LessonsDoneArray release];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]]];
    

         act=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    act.frame=CGRectMake(0, 0, 40.0f, 40.0f);
    act.center=webView.center;
    self.webView=[[UIWebView alloc]initWithFrame:CGRectMake(8, 50, 306, 308)];
    swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(nextSlide)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self.webView layer]setCornerRadius:10];
    [self.webView setClipsToBounds:YES];
    [[webView layer] setBorderColor:
     [[UIColor brownColor] CGColor]];
    [[webView layer] setBorderWidth:3.75];
    
     self.navigationController.navigationBar.tintColor=RGB(156, 102, 31);
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)]autorelease];
       self.title=@"Flash cards";
    [webView addGestureRecognizer:swipe];
  
    [self.view addSubview:self.webView];
    
    [super viewDidLoad];
    prev_button.titleLabel.font=[UIFont fontWithName:@"analgesics" size:22.0f];
    next_button.titleLabel.font=[UIFont fontWithName:@"analgesics" size:22.0f];
    
   
                           
        }
-(void)viewDidAppear:(BOOL)animated
{
    if ([[NSFileManager defaultManager]fileExistsAtPath:[self filePath]]) {
        LessonsDoneArray=[[NSMutableArray alloc]initWithContentsOfFile:[self filePath]];
   
    }
    if ([LessonsDoneArray count]==0) {
     // c
        LessonsDoneArray=[[NSMutableArray alloc]init];
            
    }
   
     int x=arc4random()%MAXS;
 
    if ([LessonsDoneArray count]==MAXS) {
        [LessonsDoneArray removeAllObjects];
        
    }
    while ([LessonsDoneArray containsObject:[NSNumber numberWithInt:x]]) {
        x=arc4random()%MAXS;
           }
    [LessonsDoneArray addObject:[NSNumber numberWithInt:x]];

    currentIndex=[LessonsDoneArray indexOfObject:[LessonsDoneArray lastObject]];
    intialIndex=currentIndex;
    
     
    [self.webView loadHTMLString:[self.array objectAtIndex:x] baseURL:nil];//s[self.array objectAtIndex:0]);
  
    [self becomeFirstResponder];

}
-(void)viewWillDisappear:(BOOL)animated
{    [self.session release];
    
    [self resignFirstResponder];
 
    [LessonsDoneArray writeToFile:[self filePath] atomically:YES];
     
    
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
