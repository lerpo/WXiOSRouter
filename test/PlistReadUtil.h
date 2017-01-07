//
//  PlistReadUtil.h
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistReadUtil : NSObject

@property(nonatomic,strong) NSMutableDictionary *plistdata;

+(id)sharedInstanceWithFileName:(NSString *)plistfileName;

+(NSString *)plistValueForKey:(NSString *)key;

@end
