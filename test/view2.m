//
//  view2.m
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "view2.h"

@implementation view2

-(void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    lable.text = self.title;
    [self.view addSubview:lable];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    [button setTitle:@"back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

-(void) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)iniViewControllerParam:(NSDictionary *)dic
{
    self.title = [dic objectForKey:@"title"];
}

@end
