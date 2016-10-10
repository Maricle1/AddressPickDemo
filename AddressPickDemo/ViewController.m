//
//  ViewController.m
//  AddressPickDemo
//
//  Created by 张建 on 16/2/19.
//  Copyright © 2016年 连藤网络科技公司. All rights reserved.
//

#import "ViewController.h"
#import "AddressPick/AddressPickView.h"

@interface ViewController ()
@property(nonatomic,strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self _createDisplayLabel];
    
    
}
-(void)_createDisplayLabel
{
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0,150, kScreenWidth, 50)];
    _label.backgroundColor = [UIColor redColor];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"点击显示地址选择器";
    [self.view addSubview:_label];
    
    _label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showAddressPickView)];
    [_label addGestureRecognizer:tap];
    
}
- (void)showAddressPickView
{
    AddressPickView *addressPickView = [AddressPickView shareInstance];
    [self.view addSubview:addressPickView];
    addressPickView.block = ^(NSString *province,NSString *city,NSString *town){
        _label.text = [NSString stringWithFormat:@"%@ %@ %@",province,city,town] ;
        
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
