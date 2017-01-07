//
//  PlistReadUtil.m
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PlistReadUtil.h"

@implementation PlistReadUtil

+(id)sharedInstanceWithFileName:(NSString *)plistfileName
{
    static dispatch_once_t onceToken;
    static PlistReadUtil * plistUtil;
    dispatch_once(&onceToken,^{
        plistUtil = [[PlistReadUtil alloc] init];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistfileName ofType:@"plist"];
        plistUtil.plistdata = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    });
    return plistUtil;
}


+ (NSString *)plistValueForKey:(NSString *)key
{
    PlistReadUtil *plist =  [PlistReadUtil sharedInstanceWithFileName:@"urlMap"];
    return [plist.plistdata objectForKey:key];
}


@end
