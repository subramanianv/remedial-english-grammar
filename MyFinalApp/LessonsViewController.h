//
//  LessonsViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@protocol TestDelegate
-(void)didPressQuitButton;
@end

@interface LessonsViewController : UIViewController<TestDelegate> {
    
   int flag;
    UILabel *label;
}

@property(nonatomic,retain)IBOutlet UISlider *slider;
@property(nonatomic,retain)IBOutlet UIButton *beginButton;
@property(nonatomic,retain)IBOutlet UILabel *qlabel;
@property(nonatomic,retain)IBOutlet UILabel *label;
@property(nonatomic,retain)IBOutlet UIView *mainView;
-(IBAction)sliderMoved:(id)sender;
-(IBAction)BeginButtonClicked:(id)sender;
-(void)goBack;



@end
