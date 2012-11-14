//
//  Tests.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "Tests.h"
#import "QuestionHelperClass.h"
#import "ResultsViewController.h"
#import "ResultClass.h"
#import <QuartzCore/QuartzCore.h>

@implementation Tests
@synthesize question,buttonA,buttonB,total,adview,correct,current,q,answer,correctAnswer,qView;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTotal:(int)t;
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        self.current=0;
        self.correct=0;
        self.total=t;
    }
    return self;
}
-(void)didPressQuitButton
{
   [self dismissModalViewControllerAnimated:YES];
    
}
-(IBAction)quitTest:(id)sender
{
    [final release];
    [self.navigationController dismissModalViewControllerAnimated:YES];
    
     
}
-(void)checkAnswerwithOption:(NSString *)string
{
    
    ResultClass *rptr=[[ResultClass alloc]init];
    rptr.question=question.text;
    rptr.SelectedAnswer=[NSString stringWithFormat:@"%@",string];
    rptr.correctAnswer=[NSString stringWithString:self.answer];
    rptr.correct=[NSString stringWithString:self.correctAnswer];
    [final addObject:rptr];
    [rptr release];
           
    
}

-(void)updateTitle

{
    self.title=[NSString stringWithFormat:@"%d/%d",self.current,self.total];
    
}
- (void)dealloc
{
    //[parser release];
    
    
    [super dealloc];
}
-(IBAction)optionAPressed:(id)sender
{
       
    if (self.current==self.total) {
        [self checkAnswerwithOption:@"y"];
        
        ResultsViewController *res=[[ResultsViewController alloc]initWithArray:final];
        res.delegate=self;
        [final release];
        
        [self.navigationController pushViewController:res animated:YES];
        [res release];
    }
    else
    {
    
         [self checkAnswerwithOption:@"y"];
        [self getQuestion];
        
    }
    
}
-(IBAction)optionBPressed:(id)sender
{
   
    
    if (self.current==self.total)
        {
         [self checkAnswerwithOption:@"n"];
        
        ResultsViewController *res=[[ResultsViewController alloc]initWithArray:final];
        res.delegate=self;
        [final release];
        
        [self.navigationController pushViewController:res animated:YES];
        [res release];
    }
    else
    {
        [self checkAnswerwithOption:@"n"];
        [self getQuestion];
        
    }
}
-(void)getQuestion
{
    self.current+=1;
    int x=rand()%MAXQ;
   QuestionHelperClass *qh=[[QuestionHelperClass alloc]init];
    self.q=[qh getQuestionForNo:x withParser:parser];
    question.text=self.q._question;
    self.answer=self.q._answer;
    self.correctAnswer=self.q._correct;
       [self updateTitle];
       
    self.q=nil;
    
    [qh release];
    [self.q release];
    
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor=RGB(156, 102, 31);
    self.navigationItem.hidesBackButton=NO;
    
    final=[[NSMutableArray alloc]init];
    [[self.qView layer]setCornerRadius:10.0f];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]]];
    [self.qView setClipsToBounds:YES];
    [[self.qView layer]setBorderWidth:2.75];
    [[self.qView layer]setBorderColor:[[UIColor brownColor]CGColor]];
    [self getQuestion];
    
    
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
