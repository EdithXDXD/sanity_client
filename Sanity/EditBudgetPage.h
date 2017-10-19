//
//  EditBudgetPage.h
//  Sanity
//
//  Created by Ruyin Shao on 10/15/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Budget.h"
#import "EditBudgetController.h"
#import "UIClientConnector.h"

@interface EditBudgetPage : UITableViewController<EditBudgetControllerDelegate>

@property (strong,nonatomic) NSString* budgetName;


- (void) getBudgetInfo:(Budget *)budget;
- (void) deleteCategorySuccess;
- (void) deleteCategoryFail;
- (void) editEntireBudgetSuccess;
- (void) editEntireBudgetFail;

@end
