//
//  DEMOAppDelegate.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOAppDelegate.h"
#import "DEMOFirstViewController.h"
#import "DEMOSecondViewController.h"
#import "DEMO3ViewController.h"
#import "DEMO4ViewController.h"
#import "DEMO5ViewController.h"
#import "DEMO6ViewController.h"

@implementation DEMOAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    // If NIB has same name has Class, new automatically implies initialization call to initWithNib
    UIViewController *viewController1 = [DEMOFirstViewController new];
    UIViewController *viewController2 = [DEMOSecondViewController new];
    UIViewController *viewController3 = [DEMO3ViewController new];
    UIViewController *viewController4 = [DEMO4ViewController new];
    UIViewController *viewController5 = [DEMO5ViewController new];
    UIViewController *viewController6 = [DEMO6ViewController new];

    // Each View Controller has its own Nav Controller
    
    UINavigationController *navcntrl1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController *navcntrl2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UINavigationController *navcntrl3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    UINavigationController *navcntrl4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    UINavigationController *navcntrl5 = [[UINavigationController alloc] initWithRootViewController:viewController5];
    UINavigationController *navcntrl6 = [[UINavigationController alloc] initWithRootViewController:viewController6];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    navcntrl1.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    navcntrl2.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    navcntrl3.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    navcntrl4.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    navcntrl5.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    navcntrl6.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    // Add all views to Tab Bar Controller. If there are more tabs than room to display them, the last visible tab will say "More..."
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navcntrl1, navcntrl2, navcntrl3, navcntrl4, navcntrl5, navcntrl6];
    //self.tabBarController.selectedViewController = navcntrl3;       // Set initial selection to Tab Bar Item 3 - via VC name
    self.tabBarController.selectedIndex = 0;                        // Set initial selection to Tab Bar Item 1 - via index [0] (the default)
    
    self.tabBarController.delegate = self;
    
    // Set this tabBar's tint color to red (seems to only affect titles of tabBarItems)
    self.tabBarController.tabBar.tintColor = [UIColor blueColor];
    
    // Set the color of the "More" tab's navigation bar. More only appears if there are more than 4 VCs
    self.tabBarController.moreNavigationController.navigationBar.tintColor = [UIColor blueColor];
    
    self.tabBarController.tabBar.translucent = NO;
    
    // Make all VC's in the tabBar customizable. Their tab order can be rearranged via the MORE tab's "edit" button
    
    self.tabBarController.customizableViewControllers = self.tabBarController.viewControllers;
    
    NSLog(@"Customizable TabBar Controllers:");
    for (UINavigationController *vc in self.tabBarController.customizableViewControllers) {
        NSLog(@"%@", vc.topViewController.title);
    }
    
    self.window.rootViewController = self.tabBarController;
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Set app's tint color to red
    // [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor redColor];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UITabBarController Delegate Methods (all optional)

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSLog(@"shouldSelectViewController");
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"didSelectViewController");

}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers {
    NSLog(@"willBeginCustomizingViewControllers");
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    NSLog(@"willEndCustomizingViewControllers");
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    NSLog(@"didEndCustomizingViewControllers");
}


@end
