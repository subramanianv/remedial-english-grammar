//
//  SaveViewController.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/8/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SaveViewController : UIViewController {
    UIView *mainview;
    
    NSString * key;
    
}
@property(nonatomic,retain)NSString *HTMLString;
@property(nonatomic,retain)NSString *key;
@property(nonatomic,retain)NSDictionary *dict;

-(id)initWithTitle:(NSString*)aTitle withHTMLString:(NSString*)aString;


@end
