//
//  DEMO3ViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMO3ViewController.h"
#import "DEMOUtilities.h"

@interface DEMO3ViewController ()

@end

@implementation DEMO3ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TURN TO TECH";
//        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        UIImage *image = [UIImage imageNamed:@"threeInGreenCircle.png"];
        UIImage *resizedImage = [DEMOUtilities imageWithImage:image scaledToSize:CGSizeMake(30.0,30.0)];
        resizedImage = [resizedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.title = @"Third";    // tabBarItem is a property of UIViewController
        self.tabBarItem.image = resizedImage;
    }
    return self;
}

- (void)viewDidLoad
{
    imgapp.image = [UIImage imageNamed:@"tt.png"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
