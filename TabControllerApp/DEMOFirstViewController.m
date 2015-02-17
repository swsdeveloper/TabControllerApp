//
//  DEMOFirstViewController.m
//  SimpleTABAPP
//
//  Created by Aditya on 12/11/13.
//  Copyright (c) 2013 Aditya. All rights reserved.
//

#import "DEMOFirstViewController.h"
#import "DEMOUtilities.h"

@interface DEMOFirstViewController ()

@end

@implementation DEMOFirstViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.title = NSLocalizedString(@"First", @"First");
        //self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        UIImage *image = [UIImage imageNamed:@"oneInRedCircle.jpeg"];
        UIImage *resizedImage = [DEMOUtilities imageWithImage:image scaledToSize:CGSizeMake(30.0,30.0)];
        resizedImage = [resizedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        self.tabBarItem.title = @"First";    // tabBarItem is a property of UIViewController
        self.tabBarItem.image = resizedImage;
        
        counter1 = 0;
        counter2 = 0;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test1" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:) name:@"Test2" object:nil];
    }
    return self;
}

-(void)receiveNotification:(NSNotification *) notification{
    
    // NSNotifications have 3 properties:
    // 1. Name - the name of this notification (used by both poster and receiver)
    // 2. Object - the object that posted this notification
    // 3. UserInfo - a dictionary of useful items provided by the poster
    
    NSLog(@"First View Notification Received: %@", [notification name]);
    
    NSDictionary *extraInfo = [notification userInfo];
    
    if ([[notification name] isEqualToString:@"Test1"]) {
        counter1++;
        txtCounter1.text = [NSString stringWithFormat:@"%@: %d",
                            [extraInfo objectForKey:@"button_name"], counter1];
    }
    else{
        counter2++;
        txtCounter2.text = [NSString stringWithFormat:@"%@: %d",
                             [extraInfo objectForKey:@"button_name"], counter2];
    }
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
    // Removes all the entries specifying a given observer from the receiver’s dispatch table.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
