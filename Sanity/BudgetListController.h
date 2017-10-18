//
//  BudgetListController.h
//  Sanity
//
//  Created by Tianmu on 10/15/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "MainController.h"

@protocol  BudgetListControllerDelegate<NSObject>
//add call back function here
- (void) setBudget:(NSArray*) budget amount:(NSArray*) amount colors:(NSArray*)color;

@required
@end

@interface BudgetListController : MainController{
    id <BudgetListControllerDelegate> _delegate;
}
@property (nonatomic,strong) id delegate;
-(void) requestBudgetList;
-(void) requestBudget:(NSString*) name;
@end
