//
//  NSObject+NSManagedObjectContext_Category.m
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 12/2/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import "NSObject+NSManagedObjectContext_Category.h"
#import "AppDelegate.h"

@implementation NSObject (NSManagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext {
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    return delegate.managedObjectContext;
}


@end
