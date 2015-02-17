//
//  DEMO5ViewController.m
//  SimpleTABAPP
//
//  Created by Steven Shatz on 2/10/15.
//  Copyright (c) 2015 Aditya. All rights reserved.
//

#import "DEMO5ViewController.h"
#import "DEMOUtilities.h"

@interface DEMO5ViewController ()

@end

@implementation DEMO5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Red Screen";
        
//        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
        
        UIImage *image = [UIImage imageNamed:@"redFive.jpg"];
        UIImage *resizedImage = [DEMOUtilities imageWithImage:image scaledToSize:CGSizeMake(30.0,30.0)];
        resizedImage = [resizedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.title = @"Fifth";    // tabBarItem is a property of UIViewController
        self.tabBarItem.image = resizedImage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
