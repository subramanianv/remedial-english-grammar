//
//  ResultSave.h
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 7/6/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import <Foundation/Foundation.h>
#define FILE [[NSBundle mainBundle]pathForResource:@"Results" ofType:@"plist"]

@interface ResultSave : NSObject {
   NSMutableDictionary *dict;
    
}
@property(nonatomic,retain)NSMutableDictionary *dict;


-(void)save:(int)correct total:(int)total;
@end
