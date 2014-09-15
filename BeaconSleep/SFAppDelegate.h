//
//  SFAppDelegate.h
//  BeaconSleep
//
//  Created by Antoni Kedracki on 15/09/14.
//  Copyright (c) 2014 Spherefoundry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SFRegionMonitoring;

@interface SFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) SFRegionMonitoring * regionMonitoring;

@end
