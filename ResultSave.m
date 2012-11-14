//
//  ResultSave.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/6/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "ResultSave.h"


@implementation ResultSave
@synthesize dict;
   
-(void)save:(int)correct total:(int)total
{
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[[pathArray objectAtIndex:0]stringByAppendingPathComponent:@"Results.plist"];
    NSError *error;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
      
        
        
        
    }
    else
    {
      
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"Results" ofType:@"plist"] toPath:path error:&error];
}     
    
    self.dict=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSNumber *totTest=[self.dict objectForKey:@"No_of_Test"];
    NSNumber *averageScore=[self.dict objectForKey:@"Average"];
    int t;
    if (totTest==nil) {
        totTest=[NSNumber numberWithInt:1];
        //average score
        float average=correct*100/total;
        
        averageScore=[NSNumber numberWithFloat:average];
        
        
        
    }
    else
    {
        
        t=[totTest intValue];
    float average=[averageScore floatValue];
    
     
    average=average*t;
   
    
    t+=1;
   
    
    float x=(correct*100/total);
    
    average=average+x;
   
    
    average=average/t;
    
    
    totTest=nil;
    totTest=[NSNumber numberWithInt:t];
    averageScore=[NSNumber numberWithFloat:average];
    
    }
   
    
    [self.dict setObject:totTest forKey:@"No_of_Test"];
    [self.dict setObject:averageScore forKey:@"Average"];
      [self.dict writeToFile:path atomically:YES];
    
   
}
   
-(void)dealloc
{
    [self.dict release];
    [super dealloc];
    
}
@end
