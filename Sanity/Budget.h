//
//  Budget.h
//  Sanity
//
//  Created by Tianmu on 10/8/17.
//  Copyright © 2017 Absolute A. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Budget : NSObject

@property int* limit;
@property int* total;
@property (strong, atomic) NSString* name;
@property (strong, atomic) NSMutableArray* categories;

@end
