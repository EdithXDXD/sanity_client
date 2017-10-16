//
//  ProfilePage.h
//  SanityTab
//
//  Created by Ruyin Shao on 10/13/17.
//  Copyright © 2017 Ruyin Shao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfilePageController.h"

@interface ProfilePage : UIViewController<ProfilePageControllerDelegate>

- (void) displayProfile:(NSString*)username :(NSString*)email;

@end
