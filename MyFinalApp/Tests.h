//
//  Tests.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "LessonsViewController.h"

#define MAXQ 30

@interface Tests : UIViewController<TestDelegate> {
    
    NSXMLParser *parser;
   
    NSString *answer;
    int current;
    int total;
    int correct;
    NSMutableArray *final;
    NSString *correctAnswer;
   
   
}
@property(nonatomic,retain)NSString *correctAnswer;
@property(nonatomic,retain)IBOutlet UIView *adview;
@property(nonatomic,retain)IBOutlet UIView *qView;
@property(nonatomic,retain)Question *q;
@property(nonatomic,retain)NSString *answer;
@property(nonatomic,retain)IBOutlet UILabel *question;
@property(nonatomic,retain)IBOutlet UIButton *buttonA;
@property(nonatomic,retain)IBOutlet UIButton *buttonB;
@property(nonatomic,assign) int total;
@property(nonatomic,assign) int current;
@property(nonatomic,assign) int correct;

//button Methods;
-(IBAction)quitTest:(id)sender;

-(IBAction)optionAPressed:(id)sender;
-(IBAction)optionBPressed:(id)sender;
-(void)getQuestion;
-(void)checkAnswerwithOption:(NSString*)string;
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTotal:(int)t;

@end
