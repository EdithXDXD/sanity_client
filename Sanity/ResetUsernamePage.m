//
//  ResetUsernamePage.m
//  Sanity
//
//  Created by Ruyin Shao on 10/16/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "ResetUsernamePage.h"
#import "ChangeUsernameController.h"
#import "UIClientConnector.h"

@interface ResetUsernamePage ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property ChangeUsernameController *controller;

@end

@implementation ResetUsernamePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitNewUsername:(id)sender {
    if (_usernameTF.text.length < 1) {
        [self getAlerted:@"Required Field" msg:@"You need to fill in username text field to change username"];
    }
    
    _controller = UIClientConnector.myClient.changeUsername;
   UIClientConnector.myClient.changeUsername.delegate = self;
    [_controller changeUsername:_usernameTF.text];
    
}

- (void) resetSuccess{
     [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) resetFailed{
    [self getAlerted:@"Reset Failed" msg:@""];
}

//alert window
- (void) getAlerted: (NSString*) errorTitle msg:(NSString*) errorMessage {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:errorTitle
                                          message:errorMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action){
                                   //set all label to red
                               }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
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
