//
//  ResultsTableView.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/8/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


@interface ResultsTableView : UIViewController
{
        
    
}
-(IBAction)pop:(id)sender;
@property(nonatomic,retain)IBOutlet UILabel *notlabel;
@property(nonatomic,retain)IBOutlet UILabel *no_of_tests;
@property(nonatomic,retain)IBOutlet UILabel *ratingLabel;
@property(nonatomic,retain)IBOutlet UILabel *aver_label;
@property(nonatomic,retain)IBOutlet UISlider *progressView;
@property(nonatomic,retain)NSDictionary *dict;
@property(nonatomic,retain)IBOutlet UILabel *ave;
@property(nonatomic,retain)IBOutlet UIView *ratingView;
@property(nonatomic,retain)IBOutlet UIView *view1;
@property(nonatomic,retain)IBOutlet UIView *view2;
@property(nonatomic,retain)IBOutlet UIView *view3;

@property(nonatomic,retain)NSNumber *number;
@end
