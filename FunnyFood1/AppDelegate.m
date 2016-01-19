//
//  AppDelegate.m
//  FunnyFood1
//
//  Created by Apple on 1/12/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "AppDelegate.h"
#import "About.h"
#import "Adress.h"
#import "SaleOff.h"
#import "MainScreen.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    MainScreen*mainScreen = [[MainScreen alloc]initWithNibName:@"MainScreen" bundle:nil];
    UINavigationController* naviMainScreen = [[UINavigationController alloc]initWithRootViewController:mainScreen];
    naviMainScreen.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Main Menu" image:[UIImage imageNamed:@"menuWhite.png"] selectedImage:[UIImage imageNamed:@"menuWhite.png"]];
    mainScreen.title = @"Main Menu";
    
    
    SaleOff*saleoff = [[SaleOff alloc] init];
    UINavigationController*navSaleOff = [[UINavigationController alloc]initWithRootViewController:saleoff];
    navSaleOff.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Sale Off" image:[UIImage imageNamed:@"sale.png"] selectedImage:[UIImage imageNamed:@"sale.png"]];
    saleoff.title = @"Sale Off";
    
    Adress*adress = [[Adress alloc]init];
    UINavigationController*navAdress = [[UINavigationController alloc]initWithRootViewController:adress];
    navAdress.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Adress" image:[UIImage imageNamed:@"shopWhite2.png"] selectedImage:[UIImage imageNamed:@"shopWhite2.png"]];
    adress.title = @"Adress";
    
    About*about = [[About alloc]init];
    UINavigationController*navAbout = [[UINavigationController alloc]initWithRootViewController:about];
    navAbout.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"About" image:[UIImage imageNamed:@"aboutWhite.png"] selectedImage:[UIImage imageNamed:@"aboutWhite.png"]];
    about.title = @"About";
    
    UITabBarController*tabbarcontroller = [[UITabBarController alloc]init];
    tabbarcontroller.viewControllers = [NSArray arrayWithObjects:naviMainScreen,navSaleOff, navAdress, navAbout, nil];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.rootViewController = tabbarcontroller;
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
