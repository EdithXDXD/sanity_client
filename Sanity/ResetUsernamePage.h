//
//  ResetUsernamePage.h
//  Sanity
//
//  Created by Ruyin Shao on 10/16/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import "ViewController.h"
#import "ChangeUsernameController.h"
#import "UIClientConnector.h"

@interface ResetUsernamePage : ViewController<ChangeUsernameDelegate>

- (void) resetSuccess;
- (void) resetFailed;     

@end
