//
//  HtlMngrTests.m
//  HtlMngrTests
//
//  Created by Francisco Ragland Jr on 11/30/15.
//  Copyright © 2015 Francisco Ragland. All rights reserved.
//
#import "NSObject+NSManagedObjectContext_Category.h"
#import <XCTest/XCTest.h>

@interface HtlMngrTests : XCTestCase

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation HtlMngrTests

- (void)setUp {
    [super setUp];
    [self setContext:[NSManagedObjectContext managerContext]];
}

- (void)tearDown {
    [self setContext:nil];
    [super tearDown];
}

- (void)testContext {
    XCTAssertNotNil(self.context, @"should be a context");
}

@end
