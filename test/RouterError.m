//
//  RouterError.m
//  test
//
//  Created by apple on 17/1/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "RouterError.h"
#import "WXRouter.h"
@implementation RouterError

+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    static RouterError * routerError;
    dispatch_once(&onceToken,^{
        routerError = [[RouterError alloc] init];
    });
    return routerError;
}

#pragma mark  自定义错误页面 此页面一定确保能够找到，否则会进入死循环
-(UIViewController *)getErrorController{
    NSDictionary *diction = [[NSMutableDictionary alloc] init];
    [diction setValue:@"https://themeforest.net/item/octopus-error-template/2562783" forKey:@"url"];
    UIViewController *errorController = [[WXRouter sharedInstance] getViewController:@"MSG003" withParam:diction];
    return errorController;
}
@end
