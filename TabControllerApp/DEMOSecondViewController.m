//
//  DEMOSecondViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOSecondViewController.h"
#import "DEMOUtilities.h"

@interface DEMOSecondViewController ()

@end

@implementation DEMOSecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
//        self.tabBarItem.image = [UIImage imageNamed:@"second.png"];
        
        UIImage *image = [UIImage imageNamed:@"twoInBlackCircle.png"];
        UIImage *resizedImage = [DEMOUtilities imageWithImage:image scaledToSize:CGSizeMake(30.0,30.0)];
        resizedImage = [resizedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        self.tabBarItem.title = @"Second";    // tabBarItem is a property of UIViewController
        self.tabBarItem.image = resizedImage;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test1" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test2" object:nil];
    }
    return self;
}

// When each button is pressed, it posts a notification with View 1's Text Box Identifier ("One" or "Two") passed as userInfo
-(IBAction)onePressed:(id)sender
{
    NSDictionary *extraInfo = [NSDictionary dictionaryWithObject:@"One" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test1" object:self userInfo:extraInfo ];
}

-(IBAction)twoPressed:(id)sender
{
    NSDictionary *extraInfo = [NSDictionary dictionaryWithObject:@"Two" forKey:@"button_name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test2" object:self userInfo:extraInfo ];
}


-(void)receiveNotification:(NSNotification *) notification
{
    NSLog(@"Second View Notification Received: %@", [notification name]);

    NSDictionary *extraInfo = [notification userInfo];
    [txtNotify setText:[extraInfo objectForKey:@"button_name"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
