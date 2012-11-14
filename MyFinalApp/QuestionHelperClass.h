//
//  QuestionHelperClass.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionHelperClass : NSObject<NSXMLParserDelegate> {
    Question *q;
    NSString *currentElement;
    BOOL shouldParse;
    NSInteger questionNo;
 //   NSXMLParser *_parser;
}
-(Question*)getQuestionForNo:(NSInteger)qno withParser:(NSXMLParser*)par;
//@property(nonatomic,copy)NSXMLParser *parser;

@end
