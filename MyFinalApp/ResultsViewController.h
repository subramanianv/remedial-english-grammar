//
//  ResultsViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/1/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ResultClass.h"
#import "LessonsViewController.h"
@interface ResultsViewController : UIViewController<UIActionSheetDelegate,MFMailComposeViewControllerDelegate> {
    UIWebView *webView;
    NSMutableString *htmlString;
    int total;
    NSArray *a;
    int correct;

    id<TestDelegate> delegate;
}
@property(nonatomic,retain)id<TestDelegate> delegate;
@property(nonatomic,retain)ResultClass *rptr;
@property(nonatomic,retain)NSArray *ar;
@property(assign)int correct;
@property(assign)int total;
-(id)initWithArray:(NSArray*)array;

-(void)GenerateHtml;
-(void)fillRequest;
-(void)showOptions;
-(void)pop;

@end
