//
//  HobbyCell.h
//  TableViewDynamicStaticCell
//
//  Created by dyw on 2017/5/9.
//  Copyright © 2017年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

/** ID */
#define HobbyCellID @"HobbyCell"
/** height */
#define HobbyCellHeight 50

@interface HobbyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *categoryNameTF;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end
