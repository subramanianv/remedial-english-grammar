//
//  QuestionHelperClass.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/2/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "QuestionHelperClass.h"


@implementation QuestionHelperClass
//@synthesize parser;//=_parser;


-(Question*)getQuestionForNo:(NSInteger)qno withParser:(NSXMLParser*)par
{
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"questions" ofType:@"xml"]]];
    
    //parser=par;
    q=[[Question alloc]init];
    [parser setDelegate:self];
    shouldParse=NO;
    questionNo=qno;
    
    [parser parse];
    [parser release];
    

    return [q autorelease];
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(shouldParse)
    {
           if ([currentElement isEqualToString:@"QuestionText"]) {
            q._question=[NSString stringWithString:string];
        
                }
        if([currentElement isEqualToString:@"Correct"])
        {
            
            q._correct=[NSString stringWithString:string];
            
        }
        if([currentElement isEqualToString:@"Answer"])
        {
            q._answer=[NSString stringWithString:string];
        }
        
    }
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"Question"]) {
        if ([[attributeDict objectForKey:@"No"]isEqualToString:[NSString stringWithFormat:@"%d",questionNo]]) {
                       shouldParse=YES;
            
        }
    }
    if (shouldParse) {
        currentElement=[NSString stringWithFormat:@"%@",elementName];
        
    }
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (shouldParse) {
        if ([elementName isEqualToString:@"Question"]) {
            shouldParse=NO;
            
        }
    }
}
-(void)dealloc
{
    [super dealloc];
    
}
@end
