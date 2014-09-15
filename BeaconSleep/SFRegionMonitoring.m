//
//  SFRegionMonitoring.m
//  BeaconSleep
//
//  Created by Antoni Kedracki on 15/09/14.
//  Copyright (c) 2014 Spherefoundry. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "SFRegionMonitoring.h"

@interface SFRegionMonitoring () <CLLocationManagerDelegate>
@end

@implementation SFRegionMonitoring {
    CLLocationManager * _manger;
}

- (id)init {
    self = [super init];
    if (self) {
        _manger = [[CLLocationManager alloc] init];
        _manger.delegate = self;
    }

    return self;
}


- (void)registerToMonitorForRegion:(CLRegion *)region {
    if(region.identifier == nil || region.identifier.length == 0){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"each region is required to have a valid identifier" userInfo:nil];
    }

    [_manger startMonitoringForRegion:region];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"didEnterRegion: %@", region);
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"didExitRegion: %@", region);
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    NSLog(@"didDetermineState: %d forRegion: %@", state, region);
}


@end
