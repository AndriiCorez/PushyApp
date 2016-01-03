//
//  ViewController.m
//  PushyApp
//
//  Created by Andres on 1/3/16.
//  Copyright (c) 2016 Andres. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)requestPermissionToNotify;

- (void)createNotification:(int)seconds;

@end

@implementation ViewController
- (IBAction)btnTapped:(id)sender {
    [self requestPermissionToNotify];
    [self createNotification:5];
}

- (void)requestPermissionToNotify{
    UIMutableUserNotificationAction *floatAction = [[UIMutableUserNotificationAction alloc] init];
    floatAction.identifier = @"Float action";
    floatAction.activationMode = UIUserNotificationActivationModeBackground;
    floatAction.destructive = YES;
    floatAction.authenticationRequired = NO;
    
    UIMutableUserNotificationAction *stingAction = [[UIMutableUserNotificationAction alloc] init];
    stingAction.identifier = @"sting action";
    stingAction.activationMode = UIUserNotificationActivationModeBackground;
    stingAction.destructive = NO;
    stingAction.authenticationRequired = NO;
    
    UIMutableUserNotificationCategory *responseCategory = [[UIMutableUserNotificationCategory alloc] init];
    responseCategory.identifier = @"Main category";
    [responseCategory setActions:@[floatAction, stingAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:responseCategory, nil];
    
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)createNotification:(int)seconds{
    UILocalNotification *localNtf = [[UILocalNotification alloc] init];
    localNtf.fireDate = [[NSDate date] dateByAddingTimeInterval:seconds];
    localNtf.timeZone = nil;
    localNtf.alertBody = @"body";
    localNtf.alertAction = @"OK";
    localNtf.soundName = UILocalNotificationDefaultSoundName;
    localNtf.applicationIconBadgeNumber = 666;
    localNtf.category = @"MAIN_Category";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNtf];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
