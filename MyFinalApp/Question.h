//
//  Question.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Question : NSObject {
    NSString *question;
    NSString *answer;
    NSString *correct;
    
}
@property(nonatomic,retain)NSString *_question;
@property(nonatomic,retain)NSString *_correct;
@property(nonatomic,retain)NSString *_answer;
@end
