//
//  SingleBudgetHistoryViewController.h
//  Sanity
//
//  Created by Gu on 10/16/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface SingleBudgetHistoryViewController : UIViewController

@property (weak, nonatomic) IBOutlet XYPieChart *PieChartDisplay;
#warning to be changed to nsarray
@property (nonatomic, strong) NSMutableArray *texts;
@property (nonatomic, strong) NSMutableArray *slices;
@property (nonatomic, strong) NSString * pageTitle;
- (void) setTexts:(NSArray*) textsArray slices:(NSArray*)slicesArray;

@end
