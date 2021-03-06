//
//  PieChartCategoryViewController.m
//  Sanity
//
//  Created by Gu on 10/15/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "PieChartCategoryViewController.h"
#import "XYPieChart.h"
#import "SingleCategoryTableViewController.h"
#import "UIClientConnector.h"
#import "Currency.h"
#import "MapViewController.h"

@interface PieChartCategoryViewController ()
@property (weak, nonatomic) IBOutlet XYPieChart *PieChartDisplay;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) Currency* sharedModel;

@end

@implementation PieChartCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //initialize arrays
    self.texts = [[NSMutableArray alloc] init];
    self.slices = [[NSMutableArray alloc] init];
    self.transactionNames = [[NSMutableArray alloc] init];
    self.transactionAmounts = [[NSMutableArray alloc] init];
    self.transactionDates = [[NSMutableArray alloc] init];
    self.longtitude =  [[NSMutableArray alloc] init];
    self.latitude =  [[NSMutableArray alloc] init];
    
    //set up page title
    self.navigationItem.title = self.pageTitle;
    
    //set up pie chart
    [self.PieChartDisplay setDelegate:self];
    [self.PieChartDisplay setDataSource:self];
    [self.PieChartDisplay setShowPercentage:NO];
    [self.PieChartDisplay setPieBackgroundColor:[UIColor whiteColor]];
    
    //set up string
    self.detailLabel.text = self.textForPieChart;

    //set up delegate
    self.controller = UIClientConnector.myClient.categoryPage;
    UIClientConnector.myClient.categoryPage.delegate = self;
    if(self.period == 0)
    {
        //NSLog(@"call with %@, %@ ", self.budgetName, self.pageTitle);
        [self.controller requestCategory:self.budgetName category:self.pageTitle];
    }else{
    #warning to be uncommented
        [self.controller requestCategory:self.budgetName category:self.pageTitle period:self.period];
    }
    //set up shared model
    _sharedModel = [Currency sharedModel];
    /*
    //for testing purposers
    self.texts =  @[@"used",@"unused"];
    self.slices = @[@"50",@"130"];
    self.transactionNames = @[@"trans1",@"trans2"];
    self.transactionAmounts = @[@"$100",@"$150"];
    self.transactionDates = @[@"5/10/2017",@"8/10/2017"];
    self.numOfTransactions = 2;
    self.textForPieChart = @"100/200";
    self.pieChartLabelColor = @"red";
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//for displaying pie chart
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.PieChartDisplay reloadData];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


//send parameter to next page by directing changing the values
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ChartCategoryToCategory"]) {
        SingleCategoryTableViewController * destViewController = segue.destinationViewController;
        destViewController.texts = self.texts;
        destViewController.slices = self.slices;
        destViewController.transactionNames = self.transactionNames;
        destViewController.transactionDates = self.transactionDates;
        destViewController.transactionAmounts = self.transactionAmounts;
        destViewController.numOfTransactions = self.numOfTransactions;
        destViewController.textForPieChart = self.textForPieChart;
        destViewController.pieChartLabelColor = self.pieChartLabelColor;
        destViewController.pageTitle = self.pageTitle;
        destViewController.period = self.period;
        destViewController.budgetName = self.budgetName;
        destViewController.categoryName = self.pageTitle;
        destViewController.longtitude = self.longtitude;
        destViewController.latitude = self.latitude;
    }else if ([segue.identifier isEqualToString:@"TransactionToMap"]){
        UINavigationController *navController = [segue destinationViewController];
        MapViewController * view = (MapViewController *)([navController viewControllers][0]);
        view.longtitude = self.longtitude;
        view.latitude = self.latitude;
        view.transactionDates = self.transactionDates;
        view.transactionAmounts = self.transactionAmounts;
        view.transactionNames = self.transactionNames;
    }
}

#pragma mark - XYPieChart Data Source
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index
{
    return [self.texts objectAtIndex:index];
}

//call back function for delegate
- (void) setTexts:(NSMutableArray *) textsArray slices:(NSMutableArray *)slicesArray transactionNames:(NSMutableArray *) names transactionAmounts:(NSMutableArray *) amounts transactionDates:(NSMutableArray *)dates numOfTransactions:(int) number labelColor:(NSString*)color longtitude:(NSMutableArray *)longtitudeArray latitude:(NSMutableArray *)latitudeArray
{
    self.texts = textsArray;
    self.slices = slicesArray;
    self.transactionNames = names;
    self.transactionAmounts = amounts;
    self.transactionDates = dates;
    self.numOfTransactions = number;
    self.pieChartLabelColor = color;
    self.longtitude = longtitudeArray;
    self.latitude = latitudeArray;
    
    if([color isEqualToString:@"red"])
    {
        self.detailLabel.textColor = [UIColor redColor];
    }else if([color isEqualToString:@"black"])
    {
        self.detailLabel.textColor = [UIColor blackColor];
    }
    [self.PieChartDisplay reloadData];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
