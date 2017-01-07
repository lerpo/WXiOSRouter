//
//  webView.h
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webView : UIViewController<UIWebViewDelegate>

@property (nonatomic,strong) NSString *url;

@end
