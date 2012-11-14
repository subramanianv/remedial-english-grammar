//
//  SaveViewController.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/8/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "SaveViewController.h"


@implementation SaveViewController
@synthesize HTMLString,key,dict;



-(id)initWithTitle:(NSString *)aTitle withHTMLString:(NSString *)aString
{
    self=[super init];
    if (self) {
        
        self.title=aTitle;
        self.HTMLString=aString;
        
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    
}


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
