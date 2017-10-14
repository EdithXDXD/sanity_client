//
//  ProfilePage.m
//  SanityTab
//
//  Created by Ruyin Shao on 10/13/17.
//  Copyright © 2017 Ruyin Shao. All rights reserved.
//

#import "ProfilePage.h"

@interface ProfilePage ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

@implementation ProfilePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self displayProfile:@"Ruyin Shao" :@"ruyinsha@usc.edu"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) displayProfile:(NSString*)username :(NSString*)email{
    self.nameLabel.text = username;
    self.emailLabel.text = email;
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