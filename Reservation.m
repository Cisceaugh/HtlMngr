//
//  Reservation.m
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 11/30/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "Reservation.h"
#import "NSObject+NSManagedObjectContext_Category.h"
#import "Room.h"

@implementation Reservation

+ (NSString *)name {
    return @"Reservation";
}

+ (instancetype)reservationWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate room:(Room *)room {
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:[self name] inManagedObjectContext:[NSManagedObjectContext managerContext]];
    
    reservation.startDate = startDate;
    reservation.endDate = endDate;
    reservation.room = room;
    
    return reservation;
}
@end
