//
//  ViewController.m
//  CarTextField
//
//  Created by Zin_戦 on 17/2/27.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//

#import "ViewController.h"
#import "TQAmountTextField.h"
@interface ViewController ()
@property(nonatomic, strong) TQAmountTextField   *amountTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self amountTextField];
}

- (TQAmountTextField *)amountTextField
{
    if (_amountTextField == nil) {
        _amountTextField = [TQAmountTextField defaultView];
        _amountTextField.stepLength = 2;//每次加减多少
        _amountTextField.buyMinNumber = 4;//起售价格
        _amountTextField.TQTextFiled.text =[NSString stringWithFormat:@"%d",4];
        _amountTextField.center = CGPointMake(self.view.bounds.size.width/2 - 10 - self.amountTextField.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
        [self.view addSubview:_amountTextField];
    }
    return _amountTextField;
}
@end
