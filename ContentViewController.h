//
//  ContentViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/14/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ContentViewController : UIViewController<UIWebViewDelegate> {
    UIWebView *webView;
    NSArray *array;
    UISwipeGestureRecognizer *swipe;
    UIActivityIndicatorView *act;
    NSMutableArray *currentSession;
    NSMutableArray *LessonsDoneArray;
    int currentIndex;
    int intialIndex;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withArray:(NSArray*)_array;
-(void)goBack;
-(void)nextSlide;
-(IBAction)prevSlide;

-(IBAction)next_button_clicked;
@property(nonatomic,retain)NSMutableArray *session;
@property(nonatomic,retain)IBOutlet UIButton *next_button;
@property(nonatomic,retain)IBOutlet UIButton *prev_button;
@property(nonatomic,retain)NSArray *array;
@property(nonatomic,retain)UIWebView *webView;

@end
