//
//  LoginPage.m
//  Sanity
//
//  Created by Gu on 10/14/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "LoginPage.h"
#import "HomePageTableViewController.h"
#import "UIClientConnector.h"

@interface LoginPage ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;


@end

@implementation LoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    //hide the warning Label
    [self.warningLabel setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginClicked:(id)sender {
    self.password = self.passwordTextField.text;
    self.email = self.emailTextField.text;
    //null check
    if(self.password.length==0 || self.email.length==0)
    {
        self.warningLabel.text = @"Please fill in all required fields!";
        [self.warningLabel setHidden:NO];
        return;
    }
    [self tryLogin];
    
}
- (IBAction)exitKeyboardForEmail:(id)sender {
    //get rid of white space
    self.emailTextField.text = [self.emailTextField.text stringByTrimmingCharactersInSet:
                                [NSCharacterSet whitespaceCharacterSet]];
    [self.emailTextField resignFirstResponder];
}

- (IBAction)exitKeyboardForPassword:(id)sender {
    [self.passwordTextField resignFirstResponder];
}

- (IBAction)backgroundClicked:(id)sender {
    //get rid of white space
    self.emailTextField.text = [self.emailTextField.text stringByTrimmingCharactersInSet:
                                [NSCharacterSet whitespaceCharacterSet]];
    [self.passwordTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
}

- (void) tryLogin{
    self.loginController = UIClientConnector.myClient.login;
    UIClientConnector.myClient.login.delegate = self;
    [self.loginController login:self.email password:self.password];
    
    
    /*
     #warning to be deleted!
     self.budgetArray = @[@"iPhone1", @"iPhone2",@"iPhone3",@"iPhone4",@"iPhone5",@"iTV",@"iNew"];
     self.amountArray = @[@"10/20",@"100/200",@"1000/2000",@"100000/2000000",@"10/90",@"10/100",@"35/253"];
     self.colors = @[@"black",@"black",@"black",@"orange",@"red",@"orange",@"black"];
     [self loginupSucceeded:self.budgetArray withAmount:self.amountArray withColor:self.colors];*/
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"LoginToHomeSegue"]){
        UITabBarController * tabController = (UITabBarController *)segue.destinationViewController;
        UINavigationController *navController = (UINavigationController *)tabController.viewControllers[0];
        HomePageTableViewController *controller = (HomePageTableViewController *)navController.topViewController;
        
        controller.amountArray = self.amountArray;
        controller.budgetArray = self.budgetArray;
        controller.colors = self.colors;
    }
}

- (void) loginSucceeded:(NSArray *) budget withAmount:(NSArray *) amount withColor:(NSArray *) color
{
    self.colors = color;
    self.budgetArray = budget;
    self.amountArray = amount;
    [self performSegueWithIdentifier:@"LoginToHomeSegue" sender:self];
}

- (void) loginFailed:(NSString*) errorMessage{
    self.warningLabel.text = errorMessage;
    [self.warningLabel setHidden:NO];
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
