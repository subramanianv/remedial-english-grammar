//
//  MyFinalAppViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFinalAppViewController : UIViewController {
    IBOutlet UIButton *testButton;
    IBOutlet UIButton *LessonsButton;
}
@property(nonatomic,retain)UIButton *testButton;
@property(nonatomic,retain)UIButton *LessonsButton;
-(IBAction)TestButtonClicked;
-(IBAction)LessonsButtonClicked;

@end
