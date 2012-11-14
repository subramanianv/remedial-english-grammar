//
//  FBViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/4/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"


@interface FBViewController : UIViewController<FBSessionDelegate,FBDialogDelegate>
{
    Facebook *facebook;
    UIAlertView *alertview;
    
}
@property(nonatomic,retain)Facebook *facebook;
-(void)publishStream;
@end
