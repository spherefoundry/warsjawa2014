//
//  SFAppDelegate.m
//  BeaconSleep
//
//  Created by Antoni Kedracki on 15/09/14.
//  Copyright (c) 2014 Spherefoundry. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "SFAppDelegate.h"
#import "SFRegionMonitoring.h"

@implementation SFAppDelegate {

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
		NSLog(@"application:didFinishLaunchingWithOptions:");
	
    _regionMonitoring = [SFRegionMonitoring new];

    CLBeaconRegion * ourRegion = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"] major:2079 minor:61897 identifier:@"our-region"];
    
    [_regionMonitoring registerToMonitorForRegion:ourRegion];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	NSLog(@"applicationWillResignActive:");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	NSLog(@"applicationDidEnterBackground:");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	NSLog(@"applicationWillEnterForeground:");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	NSLog(@"applicationDidBecomeActive:");
}

- (void)applicationWillTerminate:(UIApplication *)application {
	NSLog(@"applicationWillTerminate:");
}

@end
