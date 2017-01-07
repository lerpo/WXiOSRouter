//
//  view3.m
//  test
//
//  Created by apple on 17/1/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "view3.h"

@interface view3 ()

@end

@implementation view3

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    lable.textColor = [UIColor blueColor];
    lable.text =@"我是view3";
    [self.view addSubview:lable];
    
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
