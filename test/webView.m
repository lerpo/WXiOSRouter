//
//  webView.m
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "webView.h"

@implementation webView


-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIWebView * view = [[UIWebView alloc]initWithFrame:self.view.frame];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:view];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)iniViewControllerParam:(NSDictionary *)dic{
    
    self.url = dic[@"url"];
}

@end
