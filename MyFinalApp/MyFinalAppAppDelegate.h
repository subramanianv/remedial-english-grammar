//
//  MyFinalAppAppDelegate.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FBViewController.h"
@class MyFinalAppViewController;

@interface MyFinalAppAppDelegate : NSObject <UIApplicationDelegate> {

    FBViewController *controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MyFinalAppViewController *viewController;
-(void)setFBViewController:(FBViewController*)_controller;

@end
