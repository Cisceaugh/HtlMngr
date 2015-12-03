//
//  NSObject+NSManagedObjectContext_Category.h
//  HtlMngr
//
//  Created by Francisco Ragland Jr on 12/2/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface NSObject (NSManagedObjectContext_Category)

+ (NSManagedObjectContext *)managerContext;

@end
