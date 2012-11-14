//
//  ResultClass.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResultClass : NSObject {
    NSString *CorrectAnswer;
    NSString *SelectedAnswer;
    NSString *question;
    NSString *correct;
    
}
@property(nonatomic,retain)NSString *correctAnswer;
@property(nonatomic,retain)NSString *SelectedAnswer;
@property(nonatomic,retain)NSString *question;
@property(nonatomic,retain)NSString *correct;
@end
