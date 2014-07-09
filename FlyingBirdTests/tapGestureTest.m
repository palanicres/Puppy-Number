//
//  tapGestureTest.m
//  FlyingBird
//
//  Created by bsauniv25 on 01/07/14.
//  Copyright (c) 2014 BSA univ 25. All rights reserved.
//

#import <XCTest/XCTest.h>
#import"ViewController.h"
#import "AppDelegate.h"

@interface tapGestureTest : XCTestCase

@end

@implementation tapGestureTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellEqualsObjects
{
    ViewController *cellCount=[[ViewController alloc]init];
    cellCount.cellCount=10;
    AppDelegate *objCount=[[AppDelegate alloc]init];
    
    NSArray *Objects =[objCount getNumbers];
    
    XCTAssertEqual(cellCount.cellCount, Objects.count, @"Should have matched");

    
}
-(void)testThatTappingInNoteworthyAreaTriggersStuff {
    }

@end
