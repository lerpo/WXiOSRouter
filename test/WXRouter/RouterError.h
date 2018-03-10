//
//  RouterError.h
//  test
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RouterError : NSObject


+(id)sharedInstance;
-(UIViewController *)getErrorController;

@end
