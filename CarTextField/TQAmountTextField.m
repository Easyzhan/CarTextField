//
//  TQAmountTextField.m
//  TQMall
//
//  Created by Coco on 15/5/6.
//  Copyright (c) 2015年 Hangzhou Xuanchao Technology Co. Ltd. All rights reserved.
//

#import "TQAmountTextField.h"
#import "UIColor+Hex.h"
@implementation TQAmountTextField

+ (instancetype)defaultView
{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.TQTextFiled.rightViewMode = UITextFieldViewModeAlways;
        self.TQTextFiled.leftViewMode = UITextFieldViewModeAlways;
        self.TQTextFiled.rightView = self.addButton;
        self.TQTextFiled.leftView = self.subButton;
        self.TQTextFiled.returnKeyType = UIReturnKeyDone;
        self.TQTextFiled.font = [UIFont systemFontOfSize:14];
        self.TQTextFiled.textColor = [UIColor blackColor];
        self.TQTextFiled.textAlignment = NSTextAlignmentCenter;
        self.TQTextFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.TQTextFiled.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor colorWithHex:0xdddddd].CGColor;
        self.TQTextFiled.delegate = self;
    }
    return self;
}

- (UIButton *)subButton
{
    if (_subButton == nil) {
        UIImage *image = [UIImage imageNamed:@"btn_qty_minus"];
        _subButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [_subButton addTarget:self action:@selector(subButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_subButton setImage:image forState:UIControlStateDisabled];
        [_subButton setImage:[UIImage imageNamed:_decreaseImageName !=nil?_decreaseImageName:@"decrease"] forState:UIControlStateNormal];

//         [_subButton setImage:[UIImage imageNamed:@"btn_qty_minus_click"] forState:UIControlStateNormal];
        [self addSubview:_subButton];
        
        _TQTextFiled = [UITextField new];
        _TQTextFiled.frame = CGRectMake(image.size.width, 0, self.frame.size.width-2*image.size.width, image.size.height);
        [self addSubview:_TQTextFiled];
        
        UIImage *imageAdd = [UIImage imageNamed:@"btn_qty_plus"];
        _addButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_TQTextFiled.frame), 0, image.size.width, image.size.height)];
        [_addButton setImage:imageAdd forState:UIControlStateDisabled];
        [_addButton addTarget:self action:@selector(plusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//         imageAdd = [UIImage imageNamed:@"btn_qty_plus_click"];
//         [_addButton setImage:imageAdd forState:UIControlStateNormal];
                [_addButton setImage:[UIImage imageNamed:_increaseImageName !=nil?_increaseImageName:@"increase"] forState:UIControlStateNormal];

        [self addSubview:_addButton];
        
    }
    return _subButton;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    NSString *newString;
    if ([string isEqualToString:filtered] && newLength <= 4) {
        newString = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    else{
        newString = textField.text;
    }
    if ([_amountDelegate respondsToSelector:@selector(amountTextField:FinishInputWithInteger:)]) {
        [_amountDelegate amountTextField:self FinishInputWithInteger:[newString integerValue]];
    }
    return [string isEqualToString:filtered] && newLength <= 4;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text integerValue] < 1) {
        textField.text = @"0";
        return;
    }
    
    if ([_amountDelegate respondsToSelector:@selector(amountTextField:FinishInputWithInteger:)]) {
        [_amountDelegate amountTextField:self FinishInputWithInteger:[self.TQTextFiled.text integerValue]];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text integerValue] < 1) {
        textField.text = @"0";
        return NO;
    }
    
    [textField resignFirstResponder];
    if ([_amountDelegate respondsToSelector:@selector(amountTextField:FinishInputWithInteger:)]) {
        [_amountDelegate amountTextField:self FinishInputWithInteger:[self.TQTextFiled.text integerValue]];
    }
    
    return YES;
}

- (void)subButtonClick:(UIButton *)btn
{
    [self resignFirstResponder];
    if (self.TQTextFiled.text.integerValue > 0&&self.TQTextFiled.text.integerValue>_buyMinNumber) {
        self.TQTextFiled.text = [NSString stringWithFormat:@"%li",self.TQTextFiled.text.integerValue - _stepLength];
    }
    else{
//        self.text = @"0";
        self.TQTextFiled.text = [NSString stringWithFormat:@"%ld",_buyMinNumber];
    }
    if ([_amountDelegate respondsToSelector:@selector(amountTextField:FinishInputWithInteger:)]) {
        [_amountDelegate amountTextField:self FinishInputWithInteger:[self.TQTextFiled.text integerValue]];
    }
}

- (void)plusButtonClick:(UIButton *)btn
{
    [self resignFirstResponder];
    if (self.TQTextFiled.text.integerValue > 9999) {
        self.TQTextFiled.text = [NSString stringWithFormat:@"9999"];
    }
    else{
        self.TQTextFiled.text = [NSString stringWithFormat:@"%li",self.TQTextFiled.text.integerValue + _stepLength];
    }
    if ([_amountDelegate respondsToSelector:@selector(amountTextField:FinishInputWithInteger:)]) {
        [_amountDelegate amountTextField:self FinishInputWithInteger:[self.TQTextFiled.text integerValue]];
    }
    
}

- (void)awakeFromNib
{
    self.TQTextFiled.rightViewMode = UITextFieldViewModeAlways;
    self.TQTextFiled.leftViewMode = UITextFieldViewModeAlways;
    self.TQTextFiled.rightView = self.addButton;
    self.TQTextFiled.leftView = self.subButton;
    self.TQTextFiled.returnKeyType = UIReturnKeyDone;
    self.TQTextFiled.font = [UIFont systemFontOfSize:14];
    self.TQTextFiled.textColor = [UIColor blackColor];
    self.TQTextFiled.textAlignment = NSTextAlignmentCenter;
    self.TQTextFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.TQTextFiled.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 3;
    self.layer.borderColor = [UIColor colorWithHex:0xdddddd].CGColor;
    self.TQTextFiled.text = @"0";
    self.TQTextFiled.delegate = self;
}



@end
