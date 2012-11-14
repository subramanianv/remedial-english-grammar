//
//  Question.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "Question.h"


@implementation Question
@synthesize _answer=answer,_question=question,_correct=correct;
-(void)dealloc
{
    [answer release];
    [correct release];
    [question release];
    [super dealloc];
}


@end
