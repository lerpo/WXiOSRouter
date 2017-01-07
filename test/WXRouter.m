//
//  WXRouter.m
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "WXRouter.h"
#import "webView.h"
#import "RouterError.h"
#import "PlistReadUtil.h"
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)
@implementation WXRouter

+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    static WXRouter * router;
    dispatch_once(&onceToken,^{
        router = [[WXRouter alloc] init];
    });
    return router;
}

-(UIViewController *)controller:(UIViewController *)controller withParam:(NSDictionary *)paramdic andVcname:(NSString *)vcName {
    
    SEL selector = NSSelectorFromString(@"iniViewControllerParam:");
    if(![controller respondsToSelector:selector]){  //如果没定义初始化参数方法，直接返回，没必要在往下做设置参数的方法
        NSLog(@"目标类:%@未定义:%@方法",controller,@"iniViewControllerParam:");
        return controller;
    }
    
    if(paramdic == nil){   //如果参数为空 URLKEY 页面唯一路径标识别
        paramdic = [[NSMutableDictionary alloc] init];
        [paramdic setValue:vcName forKey:@"URLKEY"];
        SuppressPerformSelectorLeakWarning([controller performSelector:selector withObject:paramdic]);
    }else{
        [paramdic setValue:vcName forKey:@"URLKEY"];
    }
    SuppressPerformSelectorLeakWarning( [controller performSelector:selector withObject:paramdic]);
    return controller;
}

-(UIViewController *)getViewController:(NSString *)stringVCName
{
    NSString *viewControllerName = [PlistReadUtil plistValueForKey:stringVCName];
    Class class = NSClassFromString(viewControllerName);
    UIViewController *controller = [[class alloc] init];
    if(controller == nil){  //此处可以跳转到一个错误提示页面
        NSLog(@"未定义此类:%@",viewControllerName);
        return nil;
    }
    return controller;
    
}

-(UIViewController *)getViewController:(NSString *)stringVCName withParam:(NSDictionary *)paramdic
{
    
    UIViewController *controller = [self getViewController:stringVCName];
    if(controller != nil){
        controller = [self controller:controller withParam:paramdic andVcname:stringVCName];
    }else{  //异常处理  可以跳转指定的错误页面
        controller = [[RouterError sharedInstance] getErrorController];
    }
    return controller;
    
}


@end
