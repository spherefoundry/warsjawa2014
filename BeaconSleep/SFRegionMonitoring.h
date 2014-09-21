//
//  SFRegionMonitoring.h
//  BeaconSleep
//
//  Created by Antoni Kedracki on 15/09/14.
//  Copyright (c) 2014 Spherefoundry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLRegion;

@interface SFRegionMonitoring : NSObject

- (void)registerToMonitorForRegion:(CLRegion *)region;

- (void)checkPermissions;

@end
