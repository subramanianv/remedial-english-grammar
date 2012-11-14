//
//  ResultsViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/1/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "ResultsViewController.h"
#import "ResultClass.h"
#import "FBViewController.h"
#import "MyFinalAppAppDelegate.h"
#import "ResultSave.h"

@implementation ResultsViewController
@synthesize ar=a,rptr,delegate,correct, total;

-(id)initWithArray:(NSArray *)array
{
    self=[super init];
    if (self) {
        self.ar=array;
        self.title=@"Test Summary";
    }
    
   self.correct=0;
   
    self.total=[self.ar count];
    
    return self;
    
}
- (void)dealloc
{
    [self.ar release];
    [self.rptr.correct release];
    [self.rptr.correctAnswer release];
    [self.rptr.question release];
    [self.rptr.SelectedAnswer release];
    [self.rptr release];
     [super dealloc];
}
-(void)fillRequest
{
    [self GenerateHtml];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];

    [webView loadHTMLString:htmlString baseURL:baseURL];
    [htmlString release];
    
}
-(void)GenerateHtml
{
    htmlString=[[NSMutableString alloc]initWithString:@"<html><head><style type=\"text/css\">.wrong{color:red;}.correct{color:green;}</style></head><body><b>Test Summary</b><hr/>"];
    
   
    for (int i=0; i<self.total; i++) {
    
        NSString *t;
        self.rptr=[self.ar objectAtIndex:i];
        
        [htmlString appendFormat:@"<b>Q%d)</b>%@",i+1,self.rptr.question];
        if ([self.rptr.SelectedAnswer isEqualToString:@"y"]) {
            t=[[NSString alloc]initWithString:@"Correct"];
            
        }
        else
            t=[[NSString alloc]initWithString:@"Incorrect"];
        
        
        if ([self.rptr.SelectedAnswer isEqualToString:self.rptr.correctAnswer]) {
            [htmlString appendFormat:@"<br/><b>Your Choice:</b><b>%@</b><br/><b>Result:</b><img src=\"correct.png\"><hr/>",t];
            self.correct++;
            
        }
        else
        {
            [htmlString appendFormat:@"<br/><b>Your Choice:</b><b>%@</b><br/><b>Result:<img src=\"worng1.png\"><br/></b><b><u>Correct Answer:</u></b><br/>%@<hr/>",t,self.rptr.correct];
        }
        [t release];
        
    }
    [htmlString appendFormat:@"Score:<b>%d/%d</b>",self.correct,self.total];
         
    ResultSave *rs=[[ResultSave alloc]init];
    
    [rs save:correct total:self.total];
    [rs release];

}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    UIView *mainView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    
       
    webView=[[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    [mainView addSubview:webView];
    self.view=mainView;
    
       
    
    
UIBarButtonItem *optionButton=[[[UIBarButtonItem alloc]initWithTitle:@"Options" style:UIBarButtonItemStyleBordered target:self action:@selector(showOptions)]autorelease];
self.navigationItem.rightBarButtonItem=optionButton;
UIBarButtonItem *BACK=[[[UIBarButtonItem alloc]initWithTitle:@"Quit" style:UIBarButtonItemStyleBordered target:self action:@selector(pop)]autorelease];
self.navigationItem.leftBarButtonItem=BACK;
    [mainView release];
    
}
-(void)showOptions
{
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"Options" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Email" otherButtonTitles:@"Facebook",nil];
    [action setBackgroundColor:[UIColor brownColor]];
    [action showInView:self.view];
    [action release];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        if ([MFMailComposeViewController canSendMail]) {
            
        
        MFMailComposeViewController *picker=[[MFMailComposeViewController alloc]init];
            picker.mailComposeDelegate=self;
            
        [picker setSubject:@"Grammar Test Result"];
        [picker setMessageBody:[webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"] isHTML:YES];
        [self presentModalViewController:picker animated:YES];
        [picker release];
        
        }
    }
    else if(buttonIndex==1)
    {
        FBViewController *fb=[[FBViewController alloc]initWithNibName:@"FBViewController" bundle:nil];
        
        
        [self.navigationController pushViewController:fb animated:YES];
        [fb release];
        
    }
     
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{ 
    // Notifies users about errors associated with the interface
             
   //         break;
 //   }
    [self dismissModalViewControllerAnimated:YES];
}
-(void)pop{
    [delegate didPressQuitButton];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    	UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    myIndicator.center=CGPointMake(160, 240);
    myIndicator.hidesWhenStopped=YES;
    [self.view addSubview:myIndicator];
    
    [myIndicator startAnimating];
    
    
    [self fillRequest];

    [myIndicator stopAnimating];
    [myIndicator release];
    
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
