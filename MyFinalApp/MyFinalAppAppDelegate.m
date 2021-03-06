//
//  MyFinalAppAppDelegate.m
//  MyFinalApp
//
//  Created by Subramanian Venkatesan on 6/26/11.
//  Copyright 2011 SRv. All rights reserved.
//

#import "MyFinalAppAppDelegate.h"

#import "MyFinalAppViewController.h"
#import "FBViewController.h"
@implementation MyFinalAppAppDelegate


@synthesize window=_window;

@synthesize viewController=_viewController;
-(NSString*)FilePathString
{
    NSArray *array=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[array objectAtIndex:0]stringByAppendingPathComponent:@"Property List.plist"];
    
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     
    application.applicationSupportsShakeToEdit=YES;
   
    MyFinalAppViewController *vc=[[MyFinalAppViewController alloc]initWithNibName:@"MyFinalAppViewController" bundle:nil];

    [self setViewController:vc];
    [vc release];
    if ([[NSFileManager defaultManager]fileExistsAtPath:[self FilePathString]]) {
        
    }
    else
    {
    NSError *error;
    
    [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"] toPath:[self FilePathString] error:&error];
    
    
                                                                            
    }
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)setFBViewController:(FBViewController *)_controller
{
    controller=_controller;
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
        
    return [[controller facebook]handleOpenURL:url];
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
