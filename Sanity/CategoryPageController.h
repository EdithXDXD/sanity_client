//
//  CategoryPageController.h
//  Sanity
//
//  Created by Tianmu on 10/15/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "MainController.h"

@protocol  CategoryPageControllerDelegate<NSObject>
//add call back function here
- (void) setTexts:(NSArray*) textsArray slices:(NSArray*)slicesArray transactionNames:(NSArray*) names transactionAmounts:(NSArray*) amounts transactionDates:(NSArray*)dates numOfTransactions:(int) number labelColor:(NSString*) color;
@required
@end

@interface CategoryPageController : MainController{
    id <CategoryPageControllerDelegate> _delegate;
}
@property (nonatomic,strong) id delegate;
-(void) requestBudget:(NSString*) name;
-(void) requestCategory:(NSString*) budget category:(NSString*) category;
-(void) requestCategory:(NSString*) budget category:(NSString*) category period:(int)period;



-(void) deleteTransaction: (NSNumber*) amount describe:(NSString*) describe category:(NSString*) category budget:(NSString*)budget date:(NSDateComponents*) date;

@end
