//
//  FBViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/4/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "FBViewController.h"
#import "MyFinalAppAppDelegate.h"

@implementation FBViewController
@synthesize facebook;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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

#pragma mark - View lifecycle


-(void)viewDidLoad
{
    self.title=@"Facebook";
    
    facebook=[[Facebook alloc]initWithAppId:@"194693807246476"];
    MyFinalAppAppDelegate *del=[[UIApplication sharedApplication]delegate];
    [del setFBViewController:self];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    NSArray* permissions =  [[NSArray arrayWithObjects:
                              @"email", @"read_stream", nil] retain];
    
    
    if (![facebook isSessionValid]) {
        [facebook authorize:permissions 
         delegate:self];
    }
        
        [self publishStream];
    

    [permissions release];
    
}




- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
}
- (void)publishStream
    {
        NSLog(@"Called");
        
    
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"http://www.manutd.com",@"link",@"Grammar App",@"name",@"Score",@"caption",@"",@"message",nil];
        
                            
    
    
    [facebook dialog:@"feed"
            andParams:params
          andDelegate:self];
}

-(void)dialogDidNotCompleteWithUrl:(NSURL *)url
{
    alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Could not complete request" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [alertview setBackgroundColor:[UIColor brownColor]];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(performDismiss) userInfo:nil repeats:NO];
    [alertview show];
    
}
-(void)dialogDidNotComplete:(FBDialog *)dialog
{
    alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Could not complete request" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [alertview setBackgroundColor:[UIColor brownColor]];
    
  //  NSError *error;
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(performDismiss) userInfo:nil repeats:NO];
    
    [alertview show];
   
    
}
-(void)performDismiss
{
    [alertview dismissWithClickedButtonIndex:0 animated:NO];
    [alertview release];
    [self dismissModalViewControllerAnimated:YES];
    
    
}
-(void)dialog:(FBDialog *)dialog didFailWithError:(NSError *)error
{
    alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Could not complete request" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    NSError *r;
    [dialog dismissWithError:r animated:YES];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(performDismiss) userInfo:nil repeats:NO];
    [alertview show];
    
    
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
-(void)dialogDidComplete:(FBDialog *)dialog
{
    NSLog(@"Completed");
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


@end
