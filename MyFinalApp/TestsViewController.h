//
//  TestsViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    UITableView *table;
    NSArray *array;

}

@property(nonatomic,retain)UITableView *table;
@property(nonatomic,retain)NSArray *array;

-(void)enterBackGround;
-(void)FillData;

@end
