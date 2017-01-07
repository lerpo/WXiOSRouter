//
//  WXRouter.h
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WXRouter : NSObject

+(id)sharedInstance;

-(UIViewController *)getViewController:(NSString *)stringVCName;
-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic;

@end
