//
//  AddBudgetPage.h
//  Sanity
//
//  Created by Ruyin Shao on 10/13/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Budget.h"
#import "AddBudgetController.h"

@interface AddBudgetPage : UITableViewController<AddBudgetControllerDelegate>

- (void) addBudgetSucceeded;
- (void) addBudgetFailed;

@end
