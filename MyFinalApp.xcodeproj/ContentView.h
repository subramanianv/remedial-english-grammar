//
//  ContentView.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface ContentView : UIViewController<UIWebViewDelegate,UIGestureRecognizerDelegate> {
    UIActivityIndicatorView *activityIndicator;
    
    UIWebView *webView;
    UIPageControl *pagecontrol;
    UISwipeGestureRecognizer *swipeLeft;
    UISwipeGestureRecognizer *swipeRight;
    int current;
    NSDictionary *contentDictionary;
    int total;
    UILabel *labelno;
    
    BOOL shouldanimate;
}

@property(nonatomic,retain)UIPageControl *pageControl;
@property(nonatomic,retain)NSDictionary *_contentDictionary;
@property(nonatomic,retain)UISwipeGestureRecognizer *recognizer;
@property(nonatomic,retain)IBOutlet UIWebView *webView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)aTitle withDictionary:(NSDictionary*)aDict withTotal:(int)atotal;
-(NSString*)loadHTMLforKey:(NSInteger)key;
- (void)swipeRightAction:(id)ignored;
- (void)swipeLeftAction:(id)ignored;
-(void)LoadRequest;

@end
