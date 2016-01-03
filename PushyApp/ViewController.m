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
    UIUserNotificationType type = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
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
