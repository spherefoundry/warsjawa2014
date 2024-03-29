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
	
	[_manger startRangingBeaconsInRegion:(CLBeaconRegion*)region];
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"didExitRegion: %@", region);
	
	[_manger stopRangingBeaconsInRegion:(CLBeaconRegion*)region];
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    NSLog(@"didDetermineState: %d forRegion: %@", state, region);
	
	if(state == CLRegionStateInside){
		[_manger startRangingBeaconsInRegion:(CLBeaconRegion*)region];
	}
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
	NSLog(@"didRangeBeacons: %@ inRegion: %@", beacons, region);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"didChangeAuthorizationStatus: %d", status);
    if(status == kCLAuthorizationStatusAuthorized){
        for(CLRegion * region in _manger.monitoredRegions){
            [_manger requestStateForRegion:region];
        }
    }
}

- (void)checkPermissions {
	CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
	
	if(status == kCLAuthorizationStatusRestricted){
		UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Restrictions"
															 message:@"This application requires permissions to access location services in order to work. Please contact you device administrator to request permissions."
															delegate:nil
												   cancelButtonTitle:@"Got it"
												   otherButtonTitles:nil];
		[alertView show];
	} else if(status == kCLAuthorizationStatusDenied){
		UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Restrictions"
															 message:@"This application requires permissions to access location services in order to work. Please go to settings and enable them."
															delegate:nil
												   cancelButtonTitle:@"Got it"
												   otherButtonTitles:nil];
		[alertView show];
	}
}

@end
