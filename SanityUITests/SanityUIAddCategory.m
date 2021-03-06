//
//  SanityUIAddCategory.m
//  Sanity
//
//  Created by Ruyin Shao on 10/29/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface SanityUIAddCategory : XCTestCase

@end

@implementation SanityUIAddCategory

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



- (void)testSanityUIAddCategory
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];
    //login
    XCUIElement *emailTextField = app.textFields[@"Email"];
    [emailTextField tap];
    [emailTextField typeText:@"addCate@usc.edu"];
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"addCate"];
    [app.buttons[@"Done"] tap];
    [app.buttons[@"Login In"] tap];

    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.cells[@"addCate, 0/100"] tap];

    
    //go to add category page

    [app.buttons[@"Edit"] tap];
    [app.tables.buttons[@"Add Category"] tap];
    
    XCUIElement *categoryNameTextField = app.textFields[@"cate name"];
    [categoryNameTextField tap];
    [categoryNameTextField typeText:@"addcate1"];
    
    XCUIElement *amountTF = app.textFields[@"amount"];
    [amountTF tap];
    [amountTF typeText:@"100"];
    [app.buttons[@"Done"] tap];
    
    [app.buttons[@"Submit"] tap];

    XCTAssert(app.textFields[@"addcate1"].exists);

}


@end
