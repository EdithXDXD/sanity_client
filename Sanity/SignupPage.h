//
//  SignupPage.h
//  Sanity
//
//  Created by Gu on 10/14/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignupController.h"

@interface SignupPage : UIViewController
@property (strong,nonatomic) NSString * password;
@property (strong,nonatomic) NSString * email;
@property (strong,nonatomic) NSString * username;
@property (strong,nonatomic) SignupController * signupController;

- (void) signupSucceeded:(NSMutableArray *) budget withAmount:(NSMutableArray *) amount withColor:(NSMutableArray *) color;
- (void) signupFailed:(NSString*) errorMessage;

@end
